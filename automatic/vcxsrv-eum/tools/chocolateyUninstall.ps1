$packageName = 'VcXsrv-eum'
$softwareName = 'VcXsrv*'
$installerType = 'EXE'
$silentArgs = '/S' # NSIS
$validExitCodes = @(0)
$uninstalled = $false
$local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

[array]$key = Get-ItemProperty -Path @($machine_key6432,$machine_key, $local_key) `
                        -ErrorAction SilentlyContinue `
         | ? { $_.DisplayName -like "$softwareName" }

if ($key.Count -eq 1) {
  $key | % {

    # Uninstaller
    # -----------
    $file = "$($_.UninstallString)"
    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File "$file"

   # Clean up after uninstaller
   # --------------------------
   # Note: Ugly hack around recursive Remove-Item; ignore error messages
   #       on some font files not being found (they were deinstalled by the
   #       uninstaller).
   If (Test-Path "$env:ProgramFiles\VcXsrv" -pathType container) {
    Get-Childitem "$env:ProgramFiles\VcXsrv" -Recurse | Remove-Item -Force -Recurse
    Remove-Item -Force "$env:ProgramFiles\VcXsrv"
   }

   # Remove shortcuts
   # ----------------
   If (Test-Path "$env:PUBLIC\Desktop\VcXsrv.lnk"){Remove-Item -Force "$env:PUBLIC\Desktop\VcXsrv.lnk"}
   If (Test-Path "$env:PUBLIC\Desktop\XLaunch.lnk"){Remove-Item -Force "$env:PUBLIC\Desktop\XLaunch.lnk"}

   If (Test-Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv" -pathType container){
    Remove-Item -Recurse -Force "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv"
   }

  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
}
