$ErrorActionPreference = "Stop"
Set-Location (Split-Path -Parent $PSScriptRoot)

Write-Host "Aguardando Docker Desktop..."
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -ErrorAction SilentlyContinue

$deadline = (Get-Date).AddMinutes(10)
do {
    Start-Sleep -Seconds 5
    docker info 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Docker pronto."
        break
    }
    Write-Host ("aguardando " + (Get-Date -Format HH:mm:ss))
} while ((Get-Date) -lt $deadline)

if ($LASTEXITCODE -ne 0) {
    Write-Error "Docker nao ficou pronto. Abra o Docker Desktop manualmente e rode .\scripts\start.ps1"
}

docker compose up -d
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host "n8n em execucao: http://localhost:5678"
