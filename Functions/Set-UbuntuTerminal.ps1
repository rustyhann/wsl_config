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
Function Set-UbuntuTerminal {
    [CmdletBinding()]
    param()
    
    Begin {
        $ErrorActionPreference = 'Stop'
    }
    
    Process {
        wsl --distribution Ubuntu-20.04-Base -- cp ../Shell/set-ubuntu-terminal.sh ~/set-ubuntu-terminal.sh
        wsl --distribution Ubuntu-20.04-Base -- ~/set-ubuntu-terminal.sh
    }
}
