<#
.SYNOPSIS
    Installs Windows Subsystem for Linux.
.DESCRIPTION
    Installs Windows Subsystem for Linux and sets the default version to 2.
.EXAMPLE
    C:\PS> .\install-wsl.ps1
    Installs WSL 2 and sets the default version to 2.
.LINK
    https://github.com/powerline/fonts.git
    https://github.com/romkatv/dotfiles-public.git
    https://4sysops.com/archives/install-fonts-with-a-powershell-script
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'
}

Process {
    dism.exe /online /enable-feature `
        /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

    dism.exe /online /enable-feature `
        /featurename:VirtualMachinePlatform /all /norestart

    wsl --set-default-version 2

    New-Item -Path 'C:\WslImages' -ItemType Directory

    Set-Location -Path 'C:\WslImages'

    $ubuntu2004 = 'https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-wsl.rootfs.tar.gz'

    curl.exe $ubuntu2004 --output 'Ubuntu2004.tar.gz'

    wsl --import 'Ubuntu-20.04' 'C:\WslImages' 'Ubuntu2004.tar.gz' --version 2
}

