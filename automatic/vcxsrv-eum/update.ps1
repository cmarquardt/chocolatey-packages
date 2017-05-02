import-module au

$releases = 'https://sourceforge.net/projects/vcxsrv/files/vcxsrv/'

## These were in the example, but I don't need them...
##"(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
##"(?i)(^\s*softwareName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)*'"

function global:au_SearchReplace {
   @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

# DL: https://sourceforge.net/projects/vcxsrv/files/latest/download?source=files

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    #$version = ($download_page.Links | ? InnerText -match 'Windows' | % InnerText) -replace '-Windows'
    #$version = $version | ? { [version]::TryParse($_, [ref]($__)) } | measure -Maximum | % Maximum

    $re      = '/projects/vcxsrv/files/vcxsrv/(.+?)/'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $version = $Matches[1] -replace '-.+$'

    @{
        Version      = $version
        URL32        = "https://sourceforge.net/projects/vcxsrv/files/vcxsrv/${version}/vcxsrv.${version}.installer.exe"
        URL64        = "https://sourceforge.net/projects/vcxsrv/files/vcxsrv/${version}/vcxsrv-64.${version}.installer.exe"
        ReleaseNotes = "https://sourceforge.net/projects/vcxsrv/files/vcxsrv/${version}/releasenote_${version}.txt"
    }
}

try {
    update
} catch {
    $ignore = "Unable to connect to the remote server|Not Found.*win64\.exe"
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' } else { throw $_ }
}
