#Requires -Version 7.0
<#
.SYNOPSIS
    Ralph (Badger) — Content Empire Work Monitor
.DESCRIPTION
    Watches the content-empire repo for stale issues, open PRs,
    and pipeline health. Alerts when content cadence slips.
#>

param(
    [string]$Owner = "tamirdresher",
    [string]$Repo  = "content-empire",
    [int]$StaleDays = 3,
    [switch]$Loop,
    [int]$IntervalMinutes = 60
)

function Get-StaleIssues {
    $cutoff = (Get-Date).AddDays(-$StaleDays).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $issues = gh issue list --repo "$Owner/$Repo" --state open --json number,title,updatedAt,labels 2>$null | ConvertFrom-Json
    $stale = $issues | Where-Object { $_.updatedAt -lt $cutoff }
    return $stale
}

function Get-OpenPRs {
    $prs = gh pr list --repo "$Owner/$Repo" --state open --json number,title,createdAt,author 2>$null | ConvertFrom-Json
    return $prs
}

function Get-ContentCadence {
    # Check if we're meeting our targets
    $sevenDaysAgo = (Get-Date).AddDays(-7).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $recentClosed = gh issue list --repo "$Owner/$Repo" --state closed --json number,title,closedAt,labels 2>$null | ConvertFrom-Json
    $thisWeek = $recentClosed | Where-Object { $_.closedAt -ge $sevenDaysAgo }
    return $thisWeek
}

function Write-Report {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Yellow
    Write-Host "  🦡 RALPH (BADGER) — Content Empire Monitor" -ForegroundColor Yellow
    Write-Host "  $timestamp" -ForegroundColor DarkGray
    Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Yellow

    # Stale issues
    $stale = Get-StaleIssues
    if ($stale.Count -gt 0) {
        Write-Host ""
        Write-Host "  ⚠️  STALE ISSUES ($($stale.Count) items, no update in $StaleDays+ days):" -ForegroundColor Red
        foreach ($issue in $stale) {
            $age = [math]::Round(((Get-Date) - [datetime]$issue.updatedAt).TotalDays)
            Write-Host "    #$($issue.number) — $($issue.title) (${age}d stale)" -ForegroundColor DarkRed
        }
    } else {
        Write-Host ""
        Write-Host "  ✅ No stale issues — all pipelines active" -ForegroundColor Green
    }

    # Open PRs
    $prs = Get-OpenPRs
    if ($prs.Count -gt 0) {
        Write-Host ""
        Write-Host "  📋 OPEN PRs ($($prs.Count)):" -ForegroundColor Cyan
        foreach ($pr in $prs) {
            Write-Host "    #$($pr.number) — $($pr.title) by $($pr.author.login)" -ForegroundColor DarkCyan
        }
    }

    # Weekly cadence
    $completed = Get-ContentCadence
    Write-Host ""
    Write-Host "  📊 WEEKLY CADENCE:" -ForegroundColor Magenta
    Write-Host "    Completed this week: $($completed.Count) items" -ForegroundColor White
    Write-Host "    Target: 2 videos + 3 articles + 1 newsletter = 6 items" -ForegroundColor DarkGray

    if ($completed.Count -lt 6) {
        $deficit = 6 - $completed.Count
        Write-Host "    ⚠️  Behind by $deficit items! Yo, we gotta cook more, man!" -ForegroundColor Red
    } else {
        Write-Host "    ✅ On track! The empire grows." -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Yellow
}

# Main execution
Write-Report

if ($Loop) {
    Write-Host "  🔄 Looping every $IntervalMinutes minutes. Ctrl+C to stop." -ForegroundColor DarkGray
    while ($true) {
        Start-Sleep -Seconds ($IntervalMinutes * 60)
        Write-Report
    }
}
