import-module au
#. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://github.com/docker/toolbox/releases/latest'

function global:au_SearchReplace() {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

#function global:au_BeforeUpdate { Get-RemoteFiles -Purge }
#function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest() {
    $download_page = Invoke-WebRequest -Uri $releases

    $re      = '/DockerToolbox-(.+?).exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $version = $Matches[1] -replace '-.+$'
    @{
        URL64        = 'https://github.com' + $url
        Version      = $version
        ReleaseNotes = "https://github.com/docker/toolbox/releases/tag/${version}"
    }
}


update -NoCheckChocoVersion
