# Definitions
# -----------

$packageName = 'VcXsrv (EUM)'
$installerType = 'exe'
$silentArgs = '/S'
$version = '1.19.2.0'
$url = "https://sourceforge.net/projects/vcxsrv/files/vcxsrv/${version}/vcxsrv.${version}.installer.exe/download"
$url64 = "https://sourceforge.net/projects/vcxsrv/files/vcxsrv/${version}/vcxsrv-64.${version}.installer.exe/download"
$checksum = '714478b04b6ab38377eb40af50f17e1a0769f906a972a0175b2e1ec515a4ea8e22ac90bcbbc3d555067152816c2cbe451611a5b6cb41d8e963c5fc01b7b01ee9'
$checksum64 = 'eabcd619e89dedb1983e3c554de547fe6e98dfb33a2cba4fc657d042a8b1763a5c33a7c1e08ac807385cf815ac62ef72db0b15e0619eb49e5d22f074d12064a8'
$checksumType = 'SHA512'

# Installer
# ---------

Install-ChocolateyPackage $packageName $installerType $silentArgs $url $url64 `
  -Checksum $checksum -Checksum64 $checksum64 `
  -ChecksumType $checksumType

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
