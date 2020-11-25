<#
.SYNOPSIS
    
.DESCRIPTION
    
.EXAMPLE
    C:\PS> .\step-08-win-user-install-zsh-ubuntu-20.04-base.ps1
    
.LINK
    
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'
}

Process {
    wsl --distribution Ubuntu-20.04-Base --user rusty -- cd ~/
    wsl --distribution Ubuntu-20.04-Base --user rusty -- ls -la
    wsl --distribution Ubuntu-20.04-Base --user rusty -- sudo apt-get install -y zsh    
    wsl --distribution Ubuntu-20.04-Base --user rusty -- curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh' --output ~/oh-my-zsh.install.sh
    wsl --distribution Ubuntu-20.04-Base --user rusty -- chmod +x ~/oh-my-zsh.install.sh
    wsl --distribution Ubuntu-20.04-Base --user rusty -- ~/oh-my-zsh.install.sh --unattended
    wsl --distribution Ubuntu-20.04-Base --user rusty -- chsh -s $(which zsh)
}