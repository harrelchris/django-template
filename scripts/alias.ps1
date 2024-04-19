<#
.SYNOPSIS
    Script to set persistent aliases in PowerShell profile.

.DESCRIPTION
    This script adds persistent aliases to the PowerShell profile script.
    It creates the PowerShell profile if it doesn't exist and checks
    whether each alias already exists in the profile before adding it.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\alias.ps1
    Sets persistent aliases in the PowerShell profile.

#>

$profilePath = $PROFILE

# Create PowerShell Profile if it doesn't exist
if (-not (Test-Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Function to check if a line exists in the profile script
function LineExistsInProfile($line) {
    $content = Get-Content -Path $profilePath -ErrorAction SilentlyContinue
    if ($content -contains $line) {
        return $true
    } else {
        return $false
    }
}

# Set persistent aliases
$aliases = @(
    "Set-Alias -Name init -Value .\scripts\init.ps1",
    "Set-Alias -Name lint -Value .\scripts\lint.ps1",
    "Set-Alias -Name run -Value .\scripts\run.ps1",
    "Set-Alias -Name test -Value .\scripts\test.ps1"
)

foreach ($alias in $aliases) {
    if (-not (LineExistsInProfile $alias)) {
        Add-Content -Path $profilePath -Value $alias
    }
}

Write-Output "Set persistent aliases"
