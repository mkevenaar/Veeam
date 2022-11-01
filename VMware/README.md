# Veeam / VMware stuff

In this folder you'll find some scripts that I use in combination with VMware.

## VMware.Backup

This module allows you to export host configurations (HostFirmware) of all your VMHosts in your vCenter environment.

This requires VMware.PowerCLI. Easy to install using [Chocolatey](https://chocolatey.org/install)

````powershell
choco install vmware-powercli-psmodule
````

## example usage

Make changes to `settings.ps1` as required, multiple vCenter servers are supported

````powershell
Import-Module VMware.Backup.psm1
Get-Backups
````
