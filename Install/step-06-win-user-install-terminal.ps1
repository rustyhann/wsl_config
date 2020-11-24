<#
.SYNOPSIS
    Installs Windows Subsystem for Linux.
.DESCRIPTION
    Installs Windows Subsystem for Linux and sets the default version to 2.
.EXAMPLE
    C:\PS> .\install-wsl.ps1
    Installs WSL 2 and sets the default version to 2.
.LINK
    https://docs.microsoft.com/en-us/windows/wsl/install-manual
    https://www.leeholmes.com/blog/2015/10/30/launching-modern-applications-from-the-command-line/
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'

    $ProgressPreference = 'SilentlyContinue'

    $existingInstall = Get-AppxPackage | Where-Object { 
        $_.Name -eq 'Microsoft.WindowsTerminal' 
    }

    If ($null -ne $existingInstall) { Return }
}

Process {
    $uri = "https://github.com/microsoft/terminal/releases/download/v1.4.3243.0/Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle"

    Write-Verbose "Downloading Windows Terminal"
    Invoke-WebRequest -Uri $uri `
        -OutFile '.\terminal.appx' `
        -UseBasicParsing

    Write-Verbose "Adding Ubuntu AppxPackage"
    Add-AppxPackage '.\terminal.appx'

    Write-Verbose "Removing Ubuntu AppxPackage Download"
    Remove-Item '.\terminal.appx'

    Write-Verbose "Launching Ubuntu"
    $package = Get-AppxPackage | Where-Object { $_.Name -match 'WindowsTerminal' }
    $manifest = (Get-AppxPackageManifest -Package $package)    
    $appId = $manifest.Package.Applications.Application.Id
    $shell = "shell:AppsFolder\$($package.PackageFamilyName)!$appId"
    Start-Process -FilePath 'explorer.exe' -ArgumentList $shell
}

End {
    $ProgressPreference = 'Continue'
}