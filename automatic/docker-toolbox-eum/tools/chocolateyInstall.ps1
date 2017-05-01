$ErrorActionPreference = 'Stop';

$packageName= 'docker-toolbox-eum'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.docker.com/win/stable/DockerToolbox.exe'

# Install Docker-Toolbox

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'docker-toolbox*'

  checksum      = 'A7622B93BA4543EA7DF7B0CC8336A60588CB799E48463A68B9F66AA36509CD34'
  checksumType  = 'sha256'

  silentArgs    = "/TASKS=`"desktopicon`" /silent /norestart /log=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Update system's PATH variable

Install-ChocolateyPath -PathToInstall "$($env:ProgramFiles)\Docker Toolbox" -PathType 'Machine'
