$ErrorActionPreference = 'Stop';

# Install Hosts File Editor

$packageArgs = @{
  packageName   = "hosts-file-editor"
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'MSI'
  url           = 'https://github.com/scottlerch/HostsFileEditor/releases/download/v1.2.0/HostsFileEditorSetup-1.2.0.msi'
  softwareName  = 'HostsFileEditor*'
  checksum      = '52db892868e2094de82690f2825e1cc08187b11e850463daa33d9a829da34753'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ALLUSERS=1" # DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
