# Vale Türkçe Stil Rehberi

[![Vale](https://img.shields.io/badge/vale-3.x-blue.svg)](https://vale.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Turkish](https://img.shields.io/badge/lang-T%C3%BCrk%C3%A7e-red.svg)](README.md)

Türkçe metinler için Vale linter stil kuralları. Bu paket, Türkçe yazım ve dilbilgisi hatalarını otomatik olarak tespit eder.

## Özellikler

- **Bitişik/Ayrı Yazım**: `birşey` → `bir şey`, `herşey` → `her şey`
- **Büyük Harf Kontrolü**: `türkiye` → `Türkiye`, `istanbul` → `İstanbul`
- **de/da Bağlacı**: Bağlacın ayrı yazılması gereken durumları tespit eder
- **ki Bağlacı**: `demekki` → `demek ki`, `öyleki` → `öyle ki`
- **Noktalama İşaretleri**: Noktalama öncesi boşluk kontrolü
- **Yazım Denetimi**: Hunspell tabanlı Türkçe sözlük desteği
- **Kelime Tekrarı**: Art arda tekrarlanan kelimeleri tespit eder
- **Yaygın Hatalar**: `yanlız` → `yalnız`, `teşekürler` → `teşekkürler`

## Kurulum

### Ön Gereksinimler

Vale'nin sisteminizde kurulu olması gerekmektedir.

#### macOS

```bash
brew install vale
```

#### Linux (Debian/Ubuntu)

```bash
# Snap ile
sudo snap install vale

# Veya manuel indirme
wget https://github.com/errata-ai/vale/releases/download/v3.9.0/vale_3.9.0_Linux_64-bit.tar.gz
tar -xvzf vale_3.9.0_Linux_64-bit.tar.gz
sudo mv vale /usr/local/bin/
```

#### Linux (Arch)

```bash
sudo pacman -S vale
```

#### Windows

```powershell
# Chocolatey ile
choco install vale

# Veya Scoop ile
scoop install vale
```

### Türkçe Stil Paketinin Kurulumu

#### Otomatik Kurulum (Önerilen)

```bash
# Repo'yu klonlayın
git clone https://github.com/tolgakaratas/vale-turkce-ayarlar.git

# Kurulum scriptini çalıştırın
cd vale-turkce-ayarlar
./install.sh
```

#### Manuel Kurulum

##### macOS / Linux

```bash
# Stil klasörünü oluşturun
mkdir -p ~/.config/vale/styles

# Dosyaları kopyalayın
cp -r styles/Turkce ~/.config/vale/styles/
cp -r styles/dictionaries ~/.config/vale/styles/

# Örnek konfigürasyonu kopyalayın
cp .vale.ini ~/.config/vale/.vale.ini

# Çevre değişkenini ekleyin (.zshrc veya .bashrc dosyanıza)
echo 'export VALE_CONFIG_PATH="$HOME/.config/vale/.vale.ini"' >> ~/.zshrc
source ~/.zshrc
```

##### Windows (PowerShell)

```powershell
# Stil klasörünü oluşturun
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.vale\styles"

# Dosyaları kopyalayın
Copy-Item -Recurse styles\Turkce "$env:USERPROFILE\.vale\styles\"
Copy-Item -Recurse styles\dictionaries "$env:USERPROFILE\.vale\styles\"

# Konfigürasyon dosyasını kopyalayın
Copy-Item .vale.ini "$env:USERPROFILE\.vale\.vale.ini"

# Çevre değişkenini ayarlayın (kalıcı)
[Environment]::SetEnvironmentVariable("VALE_CONFIG_PATH", "$env:USERPROFILE\.vale\.vale.ini", "User")
```

## Kullanım

### Temel Kullanım

```bash
# Tek dosya kontrolü
vale dosya.md

# Klasördeki tüm dosyaları kontrol et
vale .

# Sadece hataları göster
vale --minAlertLevel=error dosya.md
```

### Türkçe Dosyalar için

Konfigürasyon dosyasında `.tr.md` uzantılı dosyalar otomatik olarak Türkçe kurallarla kontrol edilir:

```bash
# Türkçe dosya oluşturun
echo "birşey yazmak istiyorum" > test.tr.md

# Kontrol edin
vale test.tr.md
```

Çıktı:
```
 test.tr.md
 1:1  error  'bir şey' ayrı yazılmalı: 'birşey'  Turkce.BitisikYazim
```

### VS Code Entegrasyonu

1. VS Code'da "Vale" eklentisini yükleyin
2. Ayarlardan `vale.configPath` değerini belirleyin:
   - macOS/Linux: `~/.config/vale/.vale.ini`
   - Windows: `%USERPROFILE%\.vale\.vale.ini`

## Kural Listesi

| Kural | Açıklama | Seviye |
|-------|----------|--------|
| `Turkce.BitisikYazim` | Ayrı yazılması gereken kelimeler | error |
| `Turkce.Buyukharf` | Özel isimlerin büyük harfle yazımı | warning |
| `Turkce.CumleBasi` | Cümle başı büyük harf kontrolü | error |
| `Turkce.DeDABaglaci` | de/da bağlacı kontrolü | warning |
| `Turkce.KiEki` | ki bağlacı kontrolü | warning |
| `Turkce.Noktalama` | Noktalama işaretleri kontrolü | error |
| `Turkce.Spelling` | Türkçe yazım denetimi | error |
| `Turkce.Tekrar` | Kelime tekrarı kontrolü | warning |
| `Turkce.YanlisTurkce` | Yaygın yazım hataları | error |

## Konfigürasyon

### Örnek `.vale.ini`

```ini
StylesPath = styles
MinAlertLevel = suggestion
Vocab = Custom

# Türkçe dosyalar için
[*.tr.md]
BasedOnStyles = Turkce

# veya tüm markdown dosyaları için
[*.md]
BasedOnStyles = Turkce
```

### Belirli Kuralları Kapatma

```ini
[*.tr.md]
BasedOnStyles = Turkce
# Yazım denetimini kapat (false positive çok olursa)
Turkce.Spelling = NO
```

### Özel Kelime Ekleme

Kabul edilen kelimeleri eklemek için `styles/config/vocabularies/Custom/accept.txt` dosyasını düzenleyin:

```
KelimenizBurada
BaşkaBirKelime
```

## Klasör Yapısı

```
vale-turkce-ayarlar/
├── README.md
├── LICENSE
├── .vale.ini                    # Örnek konfigürasyon
├── install.sh                   # Kurulum scripti (macOS/Linux)
├── install.ps1                  # Kurulum scripti (Windows)
├── styles/
│   ├── Turkce/
│   │   ├── BitisikYazim.yml    # Bitişik/ayrı yazım kuralları
│   │   ├── Buyukharf.yml       # Büyük harf kuralları
│   │   ├── CumleBasi.yml       # Cümle başı kontrolü
│   │   ├── DeDABaglaci.yml     # de/da bağlacı
│   │   ├── KiEki.yml           # ki bağlacı
│   │   ├── Noktalama.yml       # Noktalama işaretleri
│   │   ├── Spelling.yml        # Yazım denetimi
│   │   ├── Tekrar.yml          # Kelime tekrarı
│   │   └── YanlisTurkce.yml    # Yaygın hatalar
│   └── dictionaries/
│       ├── tr.aff              # Hunspell affix dosyası
│       └── tr.dic              # Hunspell sözlük dosyası
└── examples/
    └── ornek.tr.md             # Örnek Türkçe dosya
```

## Katkıda Bulunma

Katkılarınızı bekliyoruz! Yeni kurallar eklemek veya mevcut kuralları iyileştirmek için:

1. Bu repoyu fork edin
2. Yeni bir branch oluşturun (`git checkout -b yeni-kural`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni kural eklendi'`)
4. Branch'inizi push edin (`git push origin yeni-kural`)
5. Pull Request açın

### Yeni Kural Ekleme

`styles/Turkce/` klasörüne yeni bir YAML dosyası ekleyin:

```yaml
extends: substitution
message: "'%s' yerine '%s' kullanın"
level: error
ignorecase: true
swap:
  yanlis_kelime: dogru_kelime
```

## Kaynaklar

- [Vale Resmi Dokümantasyonu](https://vale.sh/docs/)
- [TDK Yazım Kılavuzu](https://www.tdk.gov.tr/icerik/yazim-kurallari/)
- [Hunspell Türkçe Sözlük](https://github.com/wooorm/dictionaries)

## Lisans

MIT License - Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## Teşekkürler

- [Vale](https://vale.sh) - Açık kaynak prose linter
- [wooorm/dictionaries](https://github.com/wooorm/dictionaries) - Hunspell sözlükleri
- TDK - Türkçe yazım kuralları referansı
