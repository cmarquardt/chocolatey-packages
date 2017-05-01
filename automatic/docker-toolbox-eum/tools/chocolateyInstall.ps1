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

  checksum      = '9157ED0DB9CAC984FBD5F308B7CF92F27C449185EFA42E64EAAF3C7A747F5144'
  checksumType  = 'sha256'

  silentArgs    = "/COMPONENTS=`"Docker,DockerMachine,DockerCompose,Kitematic`" /TASKS=`"desktopicon`" /silent /norestart /log=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Update system's PATH variable

Install-ChocolateyPath -PathToInstall "$($env:ProgramFiles)\Docker Toolbox" -PathType 'Machine'
