function Get-Backups {
    param (
        [parameter(ValueFromRemainingArguments = $true)][Object[]] $ignoredArguments
    )
    . .\settings.ps1
    ForEach ($vcenter in $vcenters) {
        try {
            $VIServer = Connect-VIServer -Server $vcenter.Server -Protocol $vcenter.Protocol -User $vcenter.User -Password $vcenter.Password
            $vcenterPath = Join-Path $backuplocation $VIServer.Name
            $datacenters = Get-Datacenter -Name "*" -Server $VIServer
            ForEach ($datacenter in $datacenters) {
                $datacenterPath = Join-Path $vcenterPath $datacenter.Name
                if(!(Test-Path -Path $datacenterPath)) {
                    New-Item -Path $datacenterPath -ItemType Directory | Out-Null
                }
                $esxihosts = Get-VMHost -Server $VIServer -Location $datacenter -State Connected
                ForEach ($esxihost in $esxihosts) {
                    Get-VMHostFirmware -VMHost $esxihost -BackupConfiguration -DestinationPath $datacenterPath -Server $VIServer | Out-Null
                }
            }
        }
        finally {
            Disconnect-VIServer -Server $vcenter.Server -Confirm:$false -ErrorAction SilentlyContinue 
        }
    }
}