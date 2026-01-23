#!/bin/bash

# Vale Turkish Otomatik Kural Test Scripti
# Bu script, testler/ klasöründeki senaryoları çalıştırır.

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Başlangıç
echo -e "${CYAN}"
echo "========================================"
echo "🧪 Vale Turkish Kural Testleri Başlıyor"
echo "========================================"
echo -e "${NC}"

TEST_DIR="testler"
BASARILI=0
BASARISIZ=0

# Test klasörlerini gez
for kural_klasoru in "$TEST_DIR"/*; do
    if [ -d "$kural_klasoru" ]; then
        kural_adi=$(basename "$kural_klasoru")
        echo -e "${YELLOW}👉 Test Edilen Kural: $kural_adi${NC}"

        # Kural adını belirle (Klasör adı ile Vale kural adı eşleşmeli)
        # Örn: Klasör 'Plaza' -> Kural 'Turkish.Plaza'
        hedef_kural="Turkish.$kural_adi"

        # 1. Hatalı Dosya Testi (Hata vermesi beklenir)
        hatali_dosya="$kural_klasoru/hatali.md"
        if [ -f "$hatali_dosya" ]; then
            echo -n "   - Hatalı Senaryo ($hatali_dosya): "
            # Vale çıktısını al
            cikti=$(vale --config=.vale.ini --minAlertLevel=suggestion "$hatali_dosya" 2>&1)
            
            # Çıktıda HEDEF KURAL hatası var mı?
            if [[ "$cikti" == *"$hedef_kural"* ]]; then
                echo -e "${GREEN}BAŞARILI (Hata yakalandı) ✅${NC}"
                ((BASARILI++))
            else
                echo -e "${RED}BAŞARISIZ (Hata yakalanmadı!) ❌${NC}"
                echo "     Beklenen Kural: $hedef_kural"
                echo "     Vale Çıktısı: $cikti"
                ((BASARISIZ++))
            fi
        else
            echo -e "${RED}Eksik Dosya: hatali.md${NC}"
        fi

        # 2. Doğru Dosya Testi (Hata vermemesi beklenir)
        dogru_dosya="$kural_klasoru/dogru.md"
        if [ -f "$dogru_dosya" ]; then
            echo -n "   - Doğru Senaryo ($dogru_dosya): "
            cikti=$(vale --config=.vale.ini --minAlertLevel=suggestion "$dogru_dosya" 2>&1)
            
            # Çıktıda HEDEF KURAL hatası VAR MI? (Varsa başarısız)
            if [[ "$cikti" == *"$hedef_kural"* ]]; then
                 echo -e "${RED}BAŞARISIZ (Yanlış pozitif!) ❌${NC}"
                 echo "     Beklenmeyen Hata: $hedef_kural"
                 echo "     Vale Çıktısı: $cikti"
                 ((BASARISIZ++))
            else
                 echo -e "${GREEN}BAŞARILI (Temiz) ✅${NC}"
                 ((BASARILI++))
            fi
        else
            echo -e "${RED}Eksik Dosya: dogru.md${NC}"
        fi
        echo ""
    fi
done

# Sonuç Raporu
echo "========================================"
echo -e "Test Tamamlandı."
echo -e "Toplam Başarılı: ${GREEN}$BASARILI${NC}"
echo -e "Toplam Başarısız: ${RED}$BASARISIZ${NC}"

if [ $BASARISIZ -eq 0 ]; then
    echo -e "${GREEN}🎉 MÜKEMMEL! Tüm kurallar doğru çalışıyor.${NC}"
    exit 0
else
    echo -e "${RED}⚠️ Bazı kurallarda sorun var. Lütfen kontrol edin.${NC}"
    exit 1
fi
