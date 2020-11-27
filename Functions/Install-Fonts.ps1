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
Function Install-Fonts {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'
    }

    Process {
        Write-Verbose "Getting Fonts from Local Font Folder"
    $fonts = Get-ChildItem ".\Fonts\" -Include "*.ttf", "*.otf" -Recurse | `
        Select-Object -Property Name, FullName, Extension

    Write-Verbose "Installing Fonts:"
    ForEach ($font in $fonts){
        If ($font.Extension -eq '.ttf') { $name = "$($font.Name) (TrueType)" }        
        IF ($font.Extension -eq '.otf') { $name = "$($font.Name) (OpenType)" }
        Write-Verbose "`t$name"
        
        $command = "Copy-Item -Force -Path $font.FullName -Destination `"C:\Windows\Fonts\$($font.Name)`""
        Start-Process powershell -Verb runAs -ArgumentList $command -Wait
        
        $command = "New-ItemProperty -Force -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name $name -Value $font.Name -PropertyType 'String'"
        Start-Process powershell -Verb runAs -ArgumentList $command -Wait
    }
    }
}