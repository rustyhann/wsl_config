<#
.SYNOPSIS
    Installs the p rovided fonts. These fonts support PowerLevel10k in Windows
    Subsystem for Linux.
.DESCRIPTION
    Copies the provided fonts into C:\Windows\Fonts and sets the appropriate
    registery keys in HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts.
.EXAMPLE
    C:\PS> .\install-fonts.ps1
    Installs all the fonts located in the Fonts folder.
.LINK
    https://www.ivaylopavlov.com/setting-up-windows-terminal-wsl-and-oh-my-zsh/#.X7jvqrNMHg7
#>
Function Copy-Ubuntu {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'

        If ($false -eq (Test-Path -Path '~\WSL\')){
            New-Item -Path "$HOME\WSL\" -ItemType Directory
        }
            
        Set-Location -Path "$HOME\WSL"
    }

    Process {
        Write-Verbose "Exporting Ubuntu-20.04"
        wsl --export 'Ubuntu-20.04' 'ubuntu2004.tar'
        
        Write-Verbose "Importing Ubuntu-20.04 as Ubuntu-20.04-Base"
        wsl --import 'Ubuntu-20.04-Base' '.\Ubuntu-20.04-Base' 'ubuntu2004.tar'

        Write-Verbose "Removing ubuntu2004.tar"
        Remove-Item .\ubuntu2004.tar

        Write-Verbose "Getting WSL Registry Keys"
        $key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss'
        $existingIds = Get-ChildItem -Path "Registry::$key" | `
            Select-Object -ExpandProperty 'Name'
        
        Write-Verbose "Setting Default User to 1000 for:"
        ForEach ($id in $existingIds){
            $property = Get-ItemProperty -Path "Registry::$id"    
            
            If ($property.DefaultUid -ne "1000"){
                Write-Verbose "`t$($propery.DistributionName)"
                Set-ItemProperty -Path "Registry::$id" `
                    -Name "DefaultUid" `
                    -Value "1000" `
                    -Type "DWord"                
            }
        }
    }

    End {
        Set-Location -Path $PSScriptRoot
    }
}