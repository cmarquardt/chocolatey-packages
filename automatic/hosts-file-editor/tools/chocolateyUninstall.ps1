﻿$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName    = 'HostsFileEditor'
$softwareName   = 'HostsFileEditor*'
$installerType  = 'MSI'
$silentArgs     = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | % {
    $file = "$($_.UninstallString)"
    if ($installerType -eq 'MSI') {
      $silentArgs = "$($_.PSChildName) $silentArgs"
      $file = ''
    }
    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File "$file"

    #If (Test-Path "$env:ProgramFiles\Hosts File Editor" -pathType container) {
    #                             Get-Childitem "$env:ProgramFiles\Hosts File Editor" -Recurse | Remove-Item -Force -Recurse
    #                             Remove-Item -Force "$env:ProgramFiles\Hosts File Editor"
    #                             }
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
}
