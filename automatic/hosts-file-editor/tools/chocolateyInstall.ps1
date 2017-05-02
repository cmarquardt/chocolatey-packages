$ErrorActionPreference = 'Stop';

# Install Hosts File Editor

$packageArgs = @{
  packageName   = "hosts-file-editor"
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'MSI'
  url           = 'https://github.com/scottlerch/HostsFileEditor/releases/download/v1.0.0/HostsFileEditorSetup-1.0.0.msi'
  softwareName  = 'HostsFileEditor*'
  checksum      = '52DB892868E2094DE82690F2825E1CC08187B11E850463DAA33D9A829DA34753'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ALLUSERS=1" # DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
