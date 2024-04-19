<#
.SYNOPSIS
    Script to run the application server.

.DESCRIPTION
    This script starts the application server.

.PARAMETER lan
    If specified, the server will listen on all network interfaces.

.EXAMPLE
    .\scripts\run.ps1 -lan
    Start the server and listen on all network interfaces.

.EXAMPLE
    .\scripts\run.ps1
    Start the server and listen only on localhost.

#>

param(
    [switch]$lan
)

# Function to get the IPv4 address of the specified network interface
function Get-LocalIPAddress {
    $InterfaceAliases = @('Ethernet', 'Wi-Fi')

    foreach ($InterfaceAlias in $InterfaceAliases) {
        $IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias $InterfaceAlias | Where-Object { $_.AddressState -eq 'Preferred' }).IPAddress
        if ($IPAddress) {
            return $IPAddress
        }
    }

    Write-Warning "Unable to determine IP address. Please check your network connection."
    return $null
}

.venv\Scripts\activate

if ($lan) {
    $IPAddress = Get-LocalIPAddress
    if ($IPAddress) {
        Write-Host "Server is accessible at IP address: http://$IPAddress/"
        python app\manage.py runserver 0.0.0.0:80
    } else {
        Write-Host "Failed to start the server due to network connection issues."
    }
} else {
    python app\manage.py runserver localhost:80
}
