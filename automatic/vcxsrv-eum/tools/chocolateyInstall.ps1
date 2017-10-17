# Definitions
# -----------

$packageArgs = @{
  packageName            = 'VcXsrv (EUM)'
  fileType               = 'exe'
  url                    = 'https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.19.3.3/vcxsrv.1.19.3.3.installer.exe'
  url64                  = 'https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.19.3.3/vcxsrv-64.1.19.3.3.installer.exe'
  checksum               = '73e16c4acb02119dba3f6649028e988d5bf61744299fb289ddfda8468f0d34d8'
  checksum64             = '1cfd8065bc9ac4c5f64075267eb0ee423e72de331cfb437d1ab46a2138867cdb'
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
