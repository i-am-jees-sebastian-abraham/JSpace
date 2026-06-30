param(
    [string]$Version
)

$outputFolder = ".\output"

if (!(Test-Path $outputFolder))
{
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

$content = @"
Demo Application

Build Version : $Version

Build Date : $(Get-Date)

Created by Jenkins
"@

$content | Set-Content "$outputFolder\Demo.exe"

Write-Host "Demo.exe created successfully."