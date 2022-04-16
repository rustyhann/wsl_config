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

        If ($false -eq (Test-Path -Path '~\WSL\')) {
            New-Item -Path "$HOME\WSL\" -ItemType Directory
        }
            
        Set-Location -Path "$HOME\WSL"
    }

    Process {
        Write-Host "Copy-Ubuntu: Exporting Ubuntu as ubuntu.tar ... " -NoNewLine
        wsl --export 'Ubuntu' 'ubuntu.tar'
        Write-Host "Complete"
        
        Write-Host "Copy-Ubuntu: Importing Ubuntu as Ubuntu-Base ... " -NoNewLine
        wsl --import 'Ubuntu-Base' '.\Ubuntu-Base' 'ubuntu.tar'
        Write-Host "Complete"

        Write-Host "Copy-Ubuntu: Removing ubuntu.tar ... " -NoNewLine
        Remove-Item .\ubuntu.tar
        Write-Host "Complete"

        Write-Host "Copy-Ubuntu: Getting WSL Registry Keys ... " -NoNewLine
        $key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss'
        $existingIds = Get-ChildItem -Path "Registry::$key" | Select-Object -ExpandProperty 'Name'
        Write-Host "Complete"
        
        ForEach ($id in $existingIds) {
            $property = Get-ItemProperty -Path "Registry::$id"    
            
            If ($property.DefaultUid -ne "1000") {
                Write-Host "Copy-Ubuntu: Setting Default User to 1000 for $($propery.DistributionName) ... " -NoNewLine
                Set-ItemProperty -Path "Registry::$id" `
                    -Name "DefaultUid" `
                    -Value "1000" `
                    -Type "DWord"         
                Write-Host "Complete"
            }
        }
    }

    End {
        Set-Location -Path $PSScriptRoot
    }
}