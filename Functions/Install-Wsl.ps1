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
        Write-Verbose "Installing Windows Subsystem for Linux"
        $command = "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
        Start-Process powershell -Verb runAs -ArgumentList $command -Wait

        Write-Verbose "Installing Windows Subsystem for Linux V2"
        $command = "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"
        Start-Process powershell -Verb runAs -ArgumentList $command -Wait

        Write-Verbose "Setting Default WSL Version to 2"
        $command = "wsl --set-default-version 2"
        Start-Process powershell -Verb runAs -ArgumentList $command -Wait   
    }
}