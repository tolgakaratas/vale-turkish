# Vale Türkçe Stil Paketi - Kurulum Scripti
# Windows PowerShell için

$ErrorActionPreference = "Stop"

Write-Host "Vale Türkçe Stil Paketi Kurulumu" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Vale kurulu mu kontrol et
try {
    $valeVersion = vale --version 2>&1
    Write-Host "Vale versiyonu: $valeVersion" -ForegroundColor Green
} catch {
    Write-Host "HATA: Vale kurulu değil!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Kurulum için:" -ForegroundColor Yellow
    Write-Host "  choco install vale" -ForegroundColor White
    Write-Host "  veya" -ForegroundColor Gray
    Write-Host "  scoop install vale" -ForegroundColor White
    Write-Host ""
    exit 1
}

Write-Host ""

# Hedef klasör
$ConfigDir = "$env:USERPROFILE\.vale"
Write-Host "Hedef klasör: $ConfigDir" -ForegroundColor Cyan
Write-Host ""

# Klasör yapısını oluştur
Write-Host "Klasör yapısı oluşturuluyor..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path "$ConfigDir\styles" | Out-Null

# Dosyaları kopyala
Write-Host "Stil dosyaları kopyalanıyor..." -ForegroundColor Yellow
Copy-Item -Recurse -Force "styles\Turkce" "$ConfigDir\styles\"
Copy-Item -Recurse -Force "styles\dictionaries" "$ConfigDir\styles\"

# Konfigürasyon dosyası
$ConfigFile = "$ConfigDir\.vale.ini"
if (Test-Path $ConfigFile) {
    Write-Host ""
    Write-Host "UYARI: $ConfigFile zaten mevcut." -ForegroundColor Yellow
    $response = Read-Host "Üzerine yazılsın mı? (e/h)"
    if ($response -eq "e" -or $response -eq "E") {
        Copy-Item -Force ".vale.ini" $ConfigFile
        Write-Host "Konfigürasyon dosyası güncellendi." -ForegroundColor Green
    } else {
        Write-Host "Konfigürasyon dosyası atlandı." -ForegroundColor Gray
    }
} else {
    Copy-Item ".vale.ini" $ConfigFile
    Write-Host "Konfigürasyon dosyası kopyalandı." -ForegroundColor Green
}

# Çevre değişkeni
Write-Host ""
$currentPath = [Environment]::GetEnvironmentVariable("VALE_CONFIG_PATH", "User")
if (-not $currentPath) {
    $response = Read-Host "VALE_CONFIG_PATH çevre değişkeni ayarlansın mı? (e/h)"
    if ($response -eq "e" -or $response -eq "E") {
        [Environment]::SetEnvironmentVariable("VALE_CONFIG_PATH", "$ConfigDir\.vale.ini", "User")
        Write-Host "Çevre değişkeni ayarlandı. Yeni terminal penceresi açın." -ForegroundColor Green
    }
} else {
    Write-Host "VALE_CONFIG_PATH zaten tanımlı: $currentPath" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Kurulum tamamlandı!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Kullanım:" -ForegroundColor Cyan
Write-Host "  vale dosya.tr.md    # Türkçe dosya kontrolü" -ForegroundColor White
Write-Host "  vale .              # Klasördeki tüm dosyalar" -ForegroundColor White
Write-Host ""
Write-Host "Test için:" -ForegroundColor Cyan
Write-Host "  'birşey yazmak istiyorum' | Out-File test.tr.md" -ForegroundColor White
Write-Host "  vale test.tr.md" -ForegroundColor White
Write-Host ""
