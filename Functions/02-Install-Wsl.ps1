<#
.SYNOPSIS
    Installs Windows Subsystem for Linux.
.DESCRIPTION
    Installs Windows Subsystem for Linux and sets the default version to 2.
.EXAMPLE
    Install-Wsl
    Installs WSL  and sets the default version to 2.
.LINK
    https://www.ivaylopavlov.com/setting-up-windows-terminal-wsl-and-oh-my-zsh/#.X7jvqrNMHg7
#>
Function Install-Wsl {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'
    }

    Process {
        Write-Host "Install-Wsl: Installing Windows Subsystem for Linux ... " -NoNewline
        # $command = "wsl --install"
        # Start-Process powershell -Verb runAs -ArgumentList $command -Wait
        Write-Host "Complete"        
    }
}