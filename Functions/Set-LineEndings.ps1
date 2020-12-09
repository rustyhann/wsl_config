<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE

.LINK

#>
Function Set-LineEndings {
    [CmdletBinding()]
    param()

    Begin {
        $ErrorActionPreference = 'Stop'
    }

    Process {
        $files = Get-ChildItem $PSScriptRoot\..\Shell | `
            Select-Object -ExpandProperty FullName

        ForEach($file in $files){
            ((Get-Content $file) -join "`n") + "`n" | `
                Set-Content -NoNewline $file
        }
    }
}