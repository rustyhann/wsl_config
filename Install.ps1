<#
.SYNOPSIS
    Installs WSL, a base Ubuntu image, and a custom Ubuntu image.
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

    . .\Functions\01-Install-Fonts.ps1
    . .\Functions\02-Install-Wsl.ps1    
    . .\Functions\03-Install-Ubuntu.ps1
    . .\Functions\04-Update-Ubuntu.ps1
    . .\Functions\05-Copy-Ubuntu.ps1
    . .\Functions\06-Set-UbuntuTerminal.ps1
    . .\Functions\07-Install-WindowsTerminal.ps1
}

Process {
    Install-Fonts
    Install-Wsl    
    Install-Ubuntu    
    Update-Ubuntu
    Copy-Ubuntu
    Set-UbuntuTerminal
    Install-WindowsTerminal
}
