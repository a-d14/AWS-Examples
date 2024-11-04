Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter S3 Bucket Name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not (BucketExists)) {
    Write-Host "Bucket does not exist..."
    New-S3Bucket -BucketName $bucketName -Region $region    
} else {
    Write-Host "Bucket already exists..."
}


# Create a new file

$fileName = 'myFile.txt'
$fileContent = 'Hello World!'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName