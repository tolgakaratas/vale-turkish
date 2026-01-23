#!/bin/bash

# Vale Türkçe Stil Paketi - Kurulum Scripti
# macOS ve Linux için

set -e

echo "Vale Türkçe Stil Paketi Kurulumu"
echo "================================"
echo ""

# Vale kurulu mu kontrol et
if ! command -v vale &> /dev/null; then
    echo "HATA: Vale kurulu değil!"
    echo ""
    echo "Kurulum için:"
    echo "  macOS:  brew install vale"
    echo "  Linux:  snap install vale"
    echo ""
    exit 1
fi

VALE_VERSION=$(vale --version | head -1)
echo "Vale versiyonu: $VALE_VERSION"
echo ""

# Hedef klasörü belirle
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CONFIG_DIR="$HOME/.config/vale"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    CONFIG_DIR="$HOME/.config/vale"
else
    echo "HATA: Desteklenmeyen işletim sistemi: $OSTYPE"
    echo "Windows için install.ps1 scriptini kullanın."
    exit 1
fi

echo "Hedef klasör: $CONFIG_DIR"
echo ""

# Klasör yapısını oluştur
echo "Klasör yapısı oluşturuluyor..."
mkdir -p "$CONFIG_DIR/styles"

# Dosyaları kopyala
echo "Stil dosyaları kopyalanıyor..."
cp -r styles/Turkce "$CONFIG_DIR/styles/"
cp -r styles/dictionaries "$CONFIG_DIR/styles/"

# Konfigürasyon dosyası
if [ -f "$CONFIG_DIR/.vale.ini" ]; then
    echo ""
    echo "UYARI: $CONFIG_DIR/.vale.ini zaten mevcut."
    read -p "Üzerine yazılsın mı? (e/h): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Ee]$ ]]; then
        cp .vale.ini "$CONFIG_DIR/.vale.ini"
        echo "Konfigürasyon dosyası güncellendi."
    else
        echo "Konfigürasyon dosyası atlandı."
        echo "Örnek konfigürasyon: $(pwd)/.vale.ini"
    fi
else
    cp .vale.ini "$CONFIG_DIR/.vale.ini"
    echo "Konfigürasyon dosyası kopyalandı."
fi

# Çevre değişkeni
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q "VALE_CONFIG_PATH" "$SHELL_RC"; then
        echo ""
        read -p "VALE_CONFIG_PATH çevre değişkeni $SHELL_RC dosyasına eklensin mi? (e/h): " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Ee]$ ]]; then
            echo "" >> "$SHELL_RC"
            echo "# Vale Türkçe - sistem çapında konfigürasyon" >> "$SHELL_RC"
            echo "export VALE_CONFIG_PATH=\"\$HOME/.config/vale/.vale.ini\"" >> "$SHELL_RC"
            echo "Çevre değişkeni eklendi. Yeni terminal açın veya 'source $SHELL_RC' çalıştırın."
        fi
    else
        echo "VALE_CONFIG_PATH zaten tanımlı."
    fi
fi

echo ""
echo "========================================"
echo "Kurulum tamamlandı!"
echo "========================================"
echo ""
echo "Kullanım:"
echo "  vale dosya.tr.md    # Türkçe dosya kontrolü"
echo "  vale .              # Klasördeki tüm dosyalar"
echo ""
echo "Test için:"
echo "  echo 'birşey yazmak istiyorum' > test.tr.md"
echo "  vale test.tr.md"
echo ""
