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
Function Install-WindowsTerminal {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'

        $ProgressPreference = 'SilentlyContinue'

        $existingInstall = Get-AppxPackage | Where-Object { 
            $_.Name -eq 'Microsoft.WindowsTerminal' 
        }

        If ($null -ne $existingInstall) { Return }

        . $PSScriptRoot\Format-Json.ps1
    }

    Process {
        $uri = "https://github.com/microsoft/terminal/releases/download/v1.4.3243.0/Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle"

        Write-Host "Downloading Windows Terminal ... " -NoNewLine
        # Invoke-WebRequest -Uri $uri `
        #     -OutFile '.\terminal.appx' `
        #     -UseBasicParsing
        Write-Host "Complete"

        Write-Host "Adding Windows Terminal AppxPackage ... " -NoNewLine
        # Add-AppxPackage '.\terminal.appx'
        Write-Host "Complete"

        Write-Host "Removing Windows Terminal AppxPackage Download ... " -NoNewLine
        # Remove-Item '.\terminal.appx'
        Write-Host "Complete"

        Write-Host "Launching Windows Terminal ... " -NoNewLine
        # $package = Get-AppxPackage | Where-Object { $_.Name -match 'WindowsTerminal' }
        # $manifest = (Get-AppxPackageManifest -Package $package)    
        # $appId = $manifest.Package.Applications.Application.Id
        # $shell = "shell:AppsFolder\$($package.PackageFamilyName)!$appId"
        # Start-Process -FilePath 'explorer.exe' -ArgumentList $shell
        Write-Host "Complete"

        Write-Host "Generating Windows Terminal Settings File ... " -NoNewLine
        # Start-Sleep -Seconds 3
        Write-Host "Complete"

        Write-Host "Setting Base Path ... " -NoNewLine
        $basePath = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
        Write-Host "Complete"

        Write-Host "Copying Background Image ... " -NoNewLine
        $imagePath = "$basePath\gears.jpg"
        Copy-Item -Force -Path "..\WindowsTerminal\gears.jpg" -Destination $imagePath
        Write-Host "Complete"

        Write-Host "Getting Settings ... " -NoNewLine
        $settingsPath = "$basePath\settings.json"
        $content = Get-Content -Raw -Path $settingsPath       
        $content = $content -replace '"\$schema":.*?,', ""
        $content = $content -replace '(?m)\s*//.*?$' -replace '(?ms)/\*.*?\*/'
        $content = $content | ConvertFrom-Json
        Write-Host "Complete"
        
        Write-Host "Adding Defaults ... " -NoNewLine
        $properties = @{
            backgroundImage            = $imagePath
            backgroundImageStretchMode = "uniformToFill"
            backgroundImageOpacity     = 0.3
            colorScheme                = "Gruvbox-Black"
            fontFace                   = "MesloLGS NF"
            fontSize                   = 10
            hidden                     = $false
        }
        $defaults = New-Object -TypeName psobject -Property $properties
        $content.profiles.defaults = $defaults
        Write-Host "Complete"

        Write-Host "Adding Gruvbox-Black ... " -NoNewLine
        $properties = @{        
            background   = "#000000"
            black        = "#282828"
            blue         = "#458588"
            brightBlack  = "#928374"
            brightBlue   = "#83A598"
            brightCyan   = "#8EC07C"
            brightGreen  = "#B8BB26"
            brightPurple = "#D3869B"
            brightRed    = "#FB4934"
            brightWhite  = "#EBDBB2"
            brightYellow = "#FABD2F"
            cyan         = "#689D6A"
            foreground   = "#EBDBB2"
            green        = "#98971A"
            name         = "Gruvbox-Black"
            purple       = "#B16286"
            red          = "#CC241D"
            white        = "#A89984"
            yellow       = "#D79921"
        }
        $gruvboxBlack = New-Object -TypeName psobject -Property $properties
        $schemes = @($gruvboxBlack)
        $content.schemes = $schemes
        Write-Host "Complete"
        
        Write-Host "Writing Settings File ... " -NoNewLine
        # $json = $content | ConvertTo-Json -Depth 99 | Format-Json -Indentation 4
        # $json | Set-Content -Path $settingsPath
        Write-Host "Complete"
    }

    End {
        $ProgressPreference = 'Continue'
    }
}