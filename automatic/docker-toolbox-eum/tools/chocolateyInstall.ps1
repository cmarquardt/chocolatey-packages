$ErrorActionPreference = 'Stop';

# Install Docker-Toolbox

$packageArgs = @{
  packageName   = "docker-toolbox-eum"
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = "exe"
  url           = 'https://github.com/docker/toolbox/releases/download/v17.10.0-ce/DockerToolbox-17.10.0-ce.exe'

  softwareName  = "docker-toolbox*"

  checksum      = '348fe4b50926b5d790a190970c95de240172daf956b67b8f0a7d2306cd00e352'
  checksumType  = 'sha256'

  silentArgs    = "/COMPONENTS=`"Docker,DockerMachine,DockerCompose,Kitematic`" /TASKS=`"desktopicon`" /silent /norestart /log=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Update system's PATH variable
#
# Note: Docker-Toolbox only updates the PATH variable for the installing user (e.g., localadmin),
#       so we updated it globally here, after having disabled the installers handling of the
#       PATH environment variables above.

Install-ChocolateyPath -PathToInstall "$($env:ProgramFiles)\Docker Toolbox" -PathType 'Machine'

# Add a DOCKER_TOOLBOX_INSTALL_PATH to the system-wide environment (for ConEmu)
#
# Note: Docker-Toolbox only sets this variable for the installing user (e.g., localadmin),
#       so we set it globally here, and remove the user specific version.

Install-ChocolateyEnvironmentVariable -VariableName "DOCKER_TOOLBOX_INSTALL_PATH" -VariableValue "$($env:ProgramFiles)\Docker Toolbox" -VariableType 'Machine'
Install-ChocolateyEnvironmentVariable -VariableName "DOCKER_TOOLBOX_INSTALL_PATH" -VariableValue $null
