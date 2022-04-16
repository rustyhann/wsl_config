<#
.SYNOPSIS
    Updates the base Ubuntu install.
.DESCRIPTION
    Updates the base Ubuntu install using apt and apt-get.
.EXAMPLE
    C:\PS> .\step-03-win-user-install-ubuntu.ps1
    Installs WSL 2 and sets the default version to 2.
.LINK
    https://docs.microsoft.com/en-us/windows/wsl/install-manual
    https://www.leeholmes.com/blog/2015/10/30/launching-modern-applications-from-the-command-line/
#>
Function Update-Ubuntu {
    [CmdletBinding()]
    param()
    
    Begin {
        $ErrorActionPreference = 'Stop'
    }
    
    Process {
        Write-Host "Update-Ubuntu: Copying shell script ... " -NoNewLine
        wsl --distribution Ubuntu --user root -- cp ./Shell/update-ubuntu.sh ~/update-ubuntu.sh
        Write-Host "Complete"

        Write-Host "Update-Ubuntu: Updating ... " -NoNewLine
        wsl --distribution Ubuntu --user root -- ~/update-ubuntu.sh
        Write-Host "Complete"
    }
}
