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
    wsl --distribution Ubuntu-20.04-Base --user rusty -- sudo apt-get install -y zsh    
    wsl --distribution Ubuntu-20.04-Base --user rusty -- curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh' --output ~/oh-my-zsh.install.sh
    wsl --distribution Ubuntu-20.04-Base --user rusty -- chmod +x ~/oh-my-zsh.install.sh
    wsl --distribution Ubuntu-20.04-Base --user rusty -- ~/oh-my-zsh.install.sh --unattended
    wsl --distribution Ubuntu-20.04-Base --user rusty -- chsh -s `$`(which zsh`)
    wsl --distribution Ubuntu-20.04-Base --user rusty -- cd ~/ `&`& git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    wsl --distribution Ubuntu-20.04-Base --user rusty -- sed -i `'s@robbyrussell@powerlevel10k/powerlevel10k@`' ~/.zshrc
}