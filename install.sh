#!/bin/bash

# Vale Türkçe Stil Paketi - Kurulum Scripti
# macOS ve Linux için

set -e

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ASCII Art
echo -e "${CYAN}"
cat << "EOF"
__     __    _        _____           _    _     _     
\ \   / /   | |      |_   _|         | |  (_)   | |    
 \ \_/ /__ _| | ___    | |_   _ _ __ | | ___ ___| |__  
  \   // _` | |/ _ \   | | | | | '__|| |/ / / __| '_ \ 
   | || (_| | |  __/   | | |_| | |   |   <| \__ \ | | |
   |_| \__,_|_|\___|   \_/\__,_|_|   |_|\_\_|___/_| |_|
                                                       
EOF
echo -e "${NC}"
echo -e "${GREEN}>>> Vale Türkçe Stil Paketi Kurulumuna Hoş Geldiniz! 🚀${NC}"
echo ""

# Vale kurulu mu kontrol et
echo -e "${YELLOW}🔍 Vale kurulumu kontrol ediliyor...${NC}"
if ! command -v vale &> /dev/null; then
    echo -e "${RED}HATA: Vale kurulu değil!${NC}"
    echo ""
    echo "Lütfen önce Vale'yi kurun:"
    echo "  macOS:  brew install vale"
    echo "  Linux:  snap install vale"
    echo ""
    exit 1
fi

VALE_VERSION=$(vale --version | head -1)
echo -e "${GREEN}✔ Vale bulundu: $VALE_VERSION${NC}"
echo ""

# Hedef klasörü belirle
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CONFIG_DIR="$HOME/.config/vale"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    CONFIG_DIR="$HOME/.config/vale"
else
    echo -e "${RED}HATA: Desteklenmeyen işletim sistemi: $OSTYPE${NC}"
    echo "Windows için install.ps1 scriptini kullanın."
    exit 1
fi

echo -e "📂 Hedef klasör: ${CYAN}$CONFIG_DIR${NC}"
echo ""

# Klasör yapısını oluştur
echo -e "${YELLOW}🛠 Klasör yapısı oluşturuluyor...${NC}"
mkdir -p "$CONFIG_DIR/styles"

# Dosyaları kopyala
echo -e "${YELLOW}📦 Stil dosyaları kopyalanıyor...${NC}"
cp -r styles/Turkish "$CONFIG_DIR/styles/"
cp -r styles/dictionaries "$CONFIG_DIR/styles/"

# Konfigürasyon dosyası
if [ -f "$CONFIG_DIR/.vale.ini" ]; then
    echo ""
    echo -e "${YELLOW}⚠️ UYARI: $CONFIG_DIR/.vale.ini zaten mevcut.${NC}"
    read -p "Üzerine yazılsın mı? (e/h): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Ee]$ ]]; then
        cp .vale.ini "$CONFIG_DIR/.vale.ini"
        echo -e "${GREEN}✔ Konfigürasyon dosyası güncellendi.${NC}"
    else
        echo "Konfigürasyon dosyası atlandı."
        echo "Örnek konfigürasyon: $(pwd)/.vale.ini"
    fi
else
    cp .vale.ini "$CONFIG_DIR/.vale.ini"
    echo -e "${GREEN}✔ Konfigürasyon dosyası kopyalandı.${NC}"
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
        echo -e "${YELLOW}⚙ Çevre değişkeni (VALE_CONFIG_PATH) ayarlanmalı.${NC}"
        read -p "$SHELL_RC dosyasına eklensin mi? (e/h): " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Ee]$ ]]; then
            echo "" >> "$SHELL_RC"
            echo "# Vale Türkçe - sistem çapında konfigürasyon" >> "$SHELL_RC"
            echo "export VALE_CONFIG_PATH=\"\$HOME/.config/vale/.vale.ini\"" >> "$SHELL_RC"
            echo -e "${GREEN}✔ Çevre değişkeni eklendi.${NC}"
            echo "Not: Değişikliğin etkili olması için yeni terminal açın veya 'source $SHELL_RC' çalıştırın."
        fi
    else
        echo -e "${GREEN}✔ VALE_CONFIG_PATH zaten tanımlı.${NC}"
    fi
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✨ KURULUM TAMAMLANDI! ✨${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Kullanım:"
echo -e "  ${CYAN}vale dosya.tr.md${NC}    # Türkçe dosya kontrolü"
echo -e "  ${CYAN}vale .${NC}              # Klasördeki tüm dosyalar"
echo ""
echo "Test için:"
echo "  echo 'birşey yazmak istiyorum' > test.tr.md"
echo "  vale test.tr.md"
echo ""
