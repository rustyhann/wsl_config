<#
.SYNOPSIS
    Installs the provided fonts. These fonts support PowerLevel10k in Windows
    Subsystem for Linux.
.DESCRIPTION
    Copies the provided fonts into C:\Windows\Fonts and sets the appropriate
    registery keys in HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts.
.EXAMPLE
    C:\PS> .\install-fonts.ps1
    Installs all the fonts located in the Fonts folder.
.LINK
    https://github.com/powerline/fonts.git
    https://github.com/romkatv/dotfiles-public.git
    https://4sysops.com/archives/install-fonts-with-a-powershell-script
    https://www.ivaylopavlov.com/setting-up-windows-terminal-wsl-and-oh-my-zsh/#.X7jvqrNMHg7
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'
    . .\Functions\Install-Wsl.ps1
    . .\Functions\Install-Fonts.ps1
}

Process {
    #Install-Wsl
    #Install-Fonts
}
