<#
.SYNOPSIS
    Installs Windows Subsystem for Linux.
.DESCRIPTION
    Installs Windows Subsystem for Linux and sets the default version to 2.
.EXAMPLE
    C:\PS> .\install-wsl.ps1
    Installs WSL 2 and sets the default version to 2.
.LINK
    https://www.ivaylopavlov.com/setting-up-windows-terminal-wsl-and-oh-my-zsh/#.X7jvqrNMHg7
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'
}

Process {
    Write-Verbose "Installing Windows Subsystem for Linux"
    dism.exe /online /enable-feature `
        /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

    Write-Verbose "Installing Windows Subsystem for Linux V2"
    dism.exe /online /enable-feature `
        /featurename:VirtualMachinePlatform /all /norestart

    Write-Verbose "Setting Default WSL Version to 2"
    wsl --set-default-version 2    
}

