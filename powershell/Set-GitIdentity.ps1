# Set-GitIdentity.ps1
# Run this script in PowerShell to configure your Git user name and email

param(
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$true)]
    [string]$Email,

    [switch]$Global,          # Set globally (default)
    [switch]$Local            # Set only for the current repository
)

# Default to global if neither switch is provided
if (-not $Global -and -not $Local) {
    $Global = $true
}

Write-Host "Configuring Git identity..." -ForegroundColor Cyan

if ($Global) {
    Write-Host "Setting global Git config:" -ForegroundColor Green
    git config --global user.name "$Name"
    git config --global user.email "$Email"
    Write-Host "✓ Global user.name  = $Name" -ForegroundColor Green
    Write-Host "✓ Global user.email = $Email" -ForegroundColor Green
}

if ($Local) {
    # Check if we're inside a Git repository
    if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
        Write-Error "Not inside a Git repository. Cannot set local config."
        exit 1
    }

    Write-Host "Setting local Git config (current repository only):" -ForegroundColor Green
    git config user.name "$Name"
    git config user.email "$Email"
    Write-Host "✓ Local user.name  = $Name" -ForegroundColor Green
    Write-Host "✓ Local user.email = $Email" -ForegroundColor Green
}

# Show final configuration
Write-Host "`nCurrent configuration:" -ForegroundColor Cyan
if ($Global) {
    Write-Host "Global config:" -ForegroundColor Yellow
    git config --global user.name
    git config --global user.email
}
if ($Local) {
    Write-Host "Local config:" -ForegroundColor Yellow
    git config user.name
    git config user.email
}

Write-Host "`nGit identity configured successfully!" -ForegroundColor Cyan