param(

    [string]$Version,

    [string]$ArtifactoryUrl,

    [string]$User,

    [string]$Password

)

$buildFolder = ".\build"

if (!(Test-Path $buildFolder))
{
    New-Item -ItemType Directory -Path $buildFolder | Out-Null
}

$zipFile = "$buildFolder\Demo-$Version.zip"

Compress-Archive `
    -Path ".\output\Demo.exe" `
    -DestinationPath $zipFile `
    -Force

Write-Host "ZIP Created."

$uploadUrl = "$ArtifactoryUrl/Demo-$Version.zip"

Write-Host "Uploading..."

Invoke-WebRequest `
    -Uri $uploadUrl `
    -Method Put `
    -InFile $zipFile `
    -Credential (New-Object PSCredential(
        $User,
        (ConvertTo-SecureString $Password -AsPlainText -Force)
    ))

Write-Host "Upload Completed."