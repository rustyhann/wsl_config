<#
.SYNOPSIS
    Installs Windows Subsystem for Linux.
.DESCRIPTION
    Installs Windows Subsystem for Linux and sets the default version to 2.
.EXAMPLE
    C:\PS> .\install-wsl.ps1
    Installs WSL 2 and sets the default version to 2.
.LINK
    https://docs.microsoft.com/en-us/windows/wsl/install-manual
    https://www.leeholmes.com/blog/2015/10/30/launching-modern-applications-from-the-command-line/
#>
[CmdletBinding()]
param()

Begin {
    $ErrorActionPreference = 'Stop'

    . ..\Tools\Format-Json.ps1    
}

Process {
    Write-Verbose "Setting Base Path"
    $basePath = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

    Write-Verbose "Copying Background Image"
    $imagePath = "$basePath\gears.jpg"
    Copy-Item -Force -Path "..\WindowsTerminal\gears.jpg" -Destination $imagePath

    Write-Verbose "Getting Settings"
    $settingsPath = "$basePath\settings.json"
    $content = Get-Content -Raw -Path $settingsPath       
    $content = $content -replace '"\$schema":.*?,', ""
    $content = $content -replace '(?m)\s*//.*?$' -replace '(?ms)/\*.*?\*/'
    $content = $content | ConvertFrom-Json
    
    Write-Verbose "Adding Defaults"
    $properties = @{
        backgroundImage = $imagePath
        backgroundImageStretchMode = "uniformToFill"
        backgroundImageOpacity = 0.3
        colorScheme = "Gruvbox-Black"
        fontFace = "MesloLGS NF"
        fontSize = 10
        hidden = $false
    }
    $defaults = New-Object -TypeName psobject -Property $properties
    $content.profiles.defaults = $defaults

    Write-Verbose "Adding Gruvbox-Black"
    $properties = @{        
        background = "#000000"
        black = "#282828"
        blue = "#458588"
        brightBlack = "#928374"
        brightBlue = "#83A598"
        brightCyan = "#8EC07C"
        brightGreen = "#B8BB26"
        brightPurple = "#D3869B"
        brightRed = "#FB4934"
        brightWhite = "#EBDBB2"
        brightYellow = "#FABD2F"
        cyan = "#689D6A"
        foreground = "#EBDBB2"
        green = "#98971A"
        name = "Gruvbox-Black"
        purple = "#B16286"
        red = "#CC241D"
        white = "#A89984"
        yellow = "#D79921"
    }
    $gruvboxBlack = New-Object -TypeName psobject -Property $properties
    $schemes = @($gruvboxBlack)
    $content.schemes = $schemes
    
    Write-Verbose "Writing Settings File"
    $json = $content | ConvertTo-Json -Depth 99 | Format-Json -Indentation 4
    $json | Set-Content -Path $settingsPath
}

End {
    $ProgressPreference = 'Continue'
}