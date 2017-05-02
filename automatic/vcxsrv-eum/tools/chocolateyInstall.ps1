# Definitions
# -----------

$packageArgs = @{
  packageName            = 'VcXsrv (EUM)'
  fileType               = 'exe'
  url                    = 'https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.19.2.0/vcxsrv.1.19.2.0.installer.exe'
  url64                  = 'https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.19.2.0/vcxsrv-64.1.19.2.0.installer.exe'
  checksum               = 'e53846ca1fb3c67a274cfe122f23ea9e7c1bf5d2fa0665bf57200b02376a8b60'
  checksum64             = '8a4eb5ebcda927c8c9693b7fbec554bffbc5999af7254fc45d027e41f914f464'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  softwareName           = 'maxima*'
}

# Installer
# ---------

Install-ChocolateyPackage @packageArgs

# Desktop shortcuts
# -----------------

Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:PUBLIC\Desktop\VcXsrv.lnk" `
  -TargetPath "$env:ProgramFiles\VcXsrv\vcxsrv.exe" `
  -Arguments " :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl" `
  -IconLocation "$env:ProgramFiles\VcXsrv\vcxsrv.exe" `
  -Description "VcXsrv"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:PUBLIC\Desktop\XLaunch.lnk" `
  -TargetPath "$env:ProgramFiles\VcXsrv\xlaunch.exe" `
  -Arguments "" `
  -IconLocation "$env:ProgramFiles\VcXsrv\xlaunch.exe" `
  -Description "XLaunch"

# Start menu entries
# ------------------

New-Item -ItemType directory -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv"
Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv\Uninstall VcXsrv.lnk" `
  -TargetPath "$env:ProgramFiles\VcXsrv\uninstall.exe" `
  -Arguments "" `
  -WorkingDirectory "$env:ProgramFiles\VcXsrv" `
  -IconLocation "$env:ProgramFiles\VcXsrv\uninstall.exe" `
  -Description "Uninstall VcXsrv"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv\VcXsrv.lnk" `
  -TargetPath "$env:ProgramFiles\VcXsrv\vcxsrv.exe" `
  -Arguments " :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl" `
  -IconLocation "$env:ProgramFiles\VcXsrv\vcxsrv.exe" `
  -Description "VcXsrv"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VcXsrv\XLaunch.lnk" `
  -TargetPath "$env:ProgramFiles\VcXsrv\xlaunch.exe" `
  -Arguments "" `
  -IconLocation "$env:ProgramFiles\VcXsrv\xlaunch.exe" `
  -Description "XLaunch"
