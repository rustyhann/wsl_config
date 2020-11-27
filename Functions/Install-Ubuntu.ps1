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
Function Install-Ubuntu {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'
        
        $ProgressPreference = 'SilentlyContinue'
        
        $existingInstall = Get-AppxPackage | Where-Object { 
            $_.Name -eq 'CanonicalGroupLimited.Ubuntu20.04onWindows' 
        }

        If ($null -ne $existingInstall) { Return }
    }

    Process {
        Write-Verbose "Downloading Ubuntu-20.04"
        Invoke-WebRequest -Uri 'https://aka.ms/wslubuntu2004' `
            -OutFile '.\wslubuntu2004.appx' `
            -UseBasicParsing

        Write-Verbose "Adding Ubuntu AppxPackage"
        Add-AppxPackage '.\wslubuntu2004.appx'

        Write-Verbose "Removing Ubuntu AppxPackage Download"
        Remove-Item '.\wslubuntu2004.appx'

        Write-Verbose "Launching Ubuntu"
        $package = Get-AppxPackage | Where-Object { $_.Name -match 'Ubuntu' }
        $manifest = (Get-AppxPackageManifest -Package $package)    
        $appId = $manifest.Package.Applications.Application.Id
        $shell = "shell:AppsFolder\$($package.PackageFamilyName)!$appId"
        Start-Process -FilePath 'explorer.exe' -ArgumentList $shell -Wait

        Wait-Process -Name "ubuntu2004" -ErrorAction SilentlyContinue
    }

    End {
        $ProgressPreference = 'Continue'
    }
}