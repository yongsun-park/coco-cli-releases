$ErrorActionPreference = "Stop"

$Repo = "cubicai/coco-cli-releases"
$InstallDir = "$env:LOCALAPPDATA\Pentacube\coco"
$Artifact = "coco-windows-x64.exe"

Write-Host "Platform: Windows x64"
Write-Host "Artifact: $Artifact"
Write-Host "Install directory: $InstallDir"
Write-Host ""

# 설치 디렉토리 생성
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# 다운로드
Write-Host "Downloading $Artifact..."
$Url = "https://github.com/$Repo/releases/latest/download/$Artifact"
Invoke-WebRequest -Uri $Url -OutFile "$InstallDir\coco.exe"

Write-Host ""
Write-Host "[OK] Installed: $InstallDir\coco.exe" -ForegroundColor Green
Write-Host ""

# PATH 확인
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -notlike "*$InstallDir*") {
    Write-Host "PATH에 추가하려면 (PowerShell 관리자 권한):"
    Write-Host ""
    Write-Host '  $p = [Environment]::GetEnvironmentVariable("Path", "User")'
    Write-Host "  [Environment]::SetEnvironmentVariable(`"Path`", `"`$p;$InstallDir`", `"User`")"
    Write-Host ""
    Write-Host "또는 현재 세션에서만:"
    Write-Host "  `$env:PATH += `";$InstallDir`""
} else {
    Write-Host "coco --help 로 확인하세요."
}
