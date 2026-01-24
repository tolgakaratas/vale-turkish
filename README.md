# Vale Turkish (Türkçe Stil Rehberi)

![Vale Turkish Banner](assets/banner.svg)

[![Vale](https://img.shields.io/badge/vale-3.x-blue.svg)](https://vale.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Turkish](https://img.shields.io/badge/lang-T%C3%BCrk%C3%A7e-red.svg)](README.md)

**"Birşey" mi yazılır yoksa "bir şey" mi? "Herkez" mi "herkes" mi? Artık dert etmenize gerek yok!**

### 🌟 Bu uygulama ne işe yarar?
Bu araç, bilgisayarda yazı yazarken yanınızda duran **uzman bir editör** gibidir. Siz yazınızı yazarsınız, o da arka planda sessizce okur. Eğer gözünüzden kaçan bir yazım hatası, yanlış yazılmış bir kelime veya Türkçeye uygun olmayan bir kullanım varsa, sizi nazikçe uyarır ve doğrusunu gösterir.

### 💡 Size ne fayda sağlar?
*   **Hatasız Yazılar:** Önemli bir e-posta gönderirken veya bir rapor hazırlarken "acaba yanlış mı yazdım?" endişesini ortadan kaldırır.
*   **Profesyonel Görünüm:** Kurallara uygun, tertemiz bir Türkçe ile yazdığınızda çevrenizde çok daha bilgili ve dikkatli bir izlenim bırakırsınız.
*   **Zaman Kazancı:** Yazınızı tekrar tekrar kontrol etmekle vakit kaybetmezsiniz; hataları uygulama sizin yerinize bulur.

### 📍 Nerelerde kullanabilirsiniz?
*   İş yerinde yöneticinize gönderdiğiniz **e-postalarda**,
*   Okul için hazırladığınız **ödev ve tezlerde**,
*   İnternet siteniz için yazdığınız **blog yazılarında**,
*   Hatta yazdığınız bir **kitap veya makalede**.

### 🤖 "Vale" nedir?
"Vale", yazılarınızı kontrol eden akıllı bir **motor (makine)** gibidir. Biz bu akıllı makineye Türkçenin kurallarını öğrettik. Yani Vale işin "beyni", bu uygulama ise o beyne neyin doğru neyin yanlış olduğunu söyleyen "bilgi bankasıdır".

### 🚀 Hayatınıza ne gibi kolaylıklar gelir?
Eskiden yazdığınız bir metni birine kontrol ettirmek için beklerdiniz veya sözlüğe bakardınız. Şimdi bu uygulama sayesinde, sanki **7/24 yanınızda bir Türkçe öğretmeni varmış gibi** güvenle yazabilirsiniz. Yazılarınızın kalitesi artar, dilimiz korunur ve siz sadece anlatmak istediklerinize odaklanırsınız.

[![Videoyu İzle](https://img.youtube.com/vi/MiZyT_zUmm0/maxresdefault.jpg)](https://www.youtube.com/watch?v=MiZyT_zUmm0)

## Neden Vale Turkish?

*   **😖 Acı:** Toplantı "set etmekten", dökümanı "forwardlamaktan", yazım hatalarını gözden kaçırmaktan yorulmadınız mı?
*   **✅ Çözüm:** Vale Turkish, metinlerinizi saniyeler içinde tarar; Plaza Türkçesi, yazım hataları, anlatım bozuklukları ve teknik terim yanlışlarını bulur.
*   **🚀 Fayda:** Daha profesyonel, anlaşılır ve Türkçeye saygılı dokümanlar yazın. Hem kendinize hem de okuyucunuza değer verin.

## Özellikler

- **Bitişik/Ayrı Yazım**: `birşey` → `bir şey`, `herşey` → `her şey`
- **Büyük Harf Kontrolü**: `türkiye` → `Türkiye`, `istanbul` → `İstanbul`
- **de/da Bağlacı**: Bağlacın ayrı yazılması gereken durumları tespit eder
- **ki Bağlacı**: `demekki` → `demek ki`, `öyleki` → `öyle ki`
- **Noktalama İşaretleri**: Noktalama öncesi boşluk kontrolü
- **Yazım Denetimi**: Hunspell tabanlı Türkçe sözlük desteği
- **Kelime Tekrarı**: Art arda tekrarlanan kelimeleri tespit eder
- **Yaygın Hatalar**: `yanlız` → `yalnız`, `teşekürler` → `teşekkürler`

## 🛠 Kurulum (Yükleme)

> **Not:** Eğer teknik konularda kendinizi rahat hissetmiyorsanız, aşağıdaki adımlar için bir arkadaşınızdan yardım isteyebilirsiniz. Bir kez kurulduktan sonra kullanımı çok kolaydır!

### 1. Ön Hazırlık (Motorun Kurulması)
Öncelikle "Vale" dediğimiz akıllı motorun bilgisayarınıza kurulması gerekir:

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
# Projeyi kendi bilgisayarınıza indirin (Klonlayın)
git clone https://github.com/tolgakaratas/vale-turkish.git

# Kurulum scriptini çalıştırın
cd vale-turkish
./install.sh
```

#### Manuel Kurulum

##### macOS / Linux

```bash
# Stil klasörünü oluşturun
mkdir -p ~/.config/vale/styles

# Dosyaları kopyalayın
cp -r styles/Turkish ~/.config/vale/styles/
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
Copy-Item -Recurse styles\Turkish "$env:USERPROFILE\.vale\styles\"
Copy-Item -Recurse styles\dictionaries "$env:USERPROFILE\.vale\styles\"

# Konfigürasyon dosyası kopyalama
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
 1:1  error  'bir şey' ayrı yazılmalı: 'birşey'  Turkish.BitisikYazim
```

### VS Code Entegrasyonu

1. VS Code'da "Vale" eklentisini yükleyin
2. Ayarlardan `vale.configPath` değerini belirleyin:
   - macOS/Linux: `~/.config/vale/.vale.ini`
   - Windows: `%USERPROFILE%\.vale\.vale.ini`

## Kural Listesi

| Kural | Açıklama | Seviye |
|-------|----------|--------|
| `Turkish.BitisikYazim` | Ayrı yazılması gereken kelimeler | error |
| `Turkish.Buyukharf` | Özel isimlerin büyük harfle yazımı | warning |
| `Turkish.CumleBasi` | Cümle başı büyük harf kontrolü | error |
| `Turkish.DeDABaglaci` | de/da bağlacı kontrolü | warning |
| `Turkish.KiEki` | ki bağlacı kontrolü | warning |
| `Turkish.Noktalama` | Noktalama işaretleri kontrolü | error |
| `Turkish.Spelling` | Türkçe yazım denetimi | error |
| `Turkish.Tekrar` | Kelime tekrarı kontrolü | warning |
| `Turkish.YanlisTurkce` | Yaygın yazım hataları | error |

## Konfigürasyon

### Örnek `.vale.ini`

```ini
StylesPath = styles
MinAlertLevel = suggestion
Vocab = Custom

# Türkçe dosyalar için
[*.tr.md]
BasedOnStyles = Turkish

# veya tüm markdown dosyaları için
[*.md]
BasedOnStyles = Turkish
```

### Belirli Kuralları Kapatma

```ini
[*.tr.md]
BasedOnStyles = Turkish
# Yazım denetimini kapat (false positive çok olursa)
Turkish.Spelling = NO
```

### Özel Kelime Ekleme

Kabul edilen kelimeleri eklemek için `styles/config/vocabularies/Custom/accept.txt` dosyasını düzenleyin:

```
KelimenizBurada
BaşkaBirKelime
```

## Klasör Yapısı

```
vale-turkish/
├── README.md
├── LICENSE
├── .vale.ini                    # Örnek konfigürasyon
├── install.sh                   # Kurulum scripti (macOS/Linux)
├── install.ps1                  # Kurulum scripti (Windows)
├── styles/
│   ├── Turkish/
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

Bu proje hepimizin! Katkılarınızı bekliyoruz. Nasıl destek olabileceğinizi öğrenmek için lütfen [KATKIDA_BULUNMA.md](KATKIDA_BULUNMA.md) dosyasını okuyun.

Kısaca:
1.  Bu projeyi kendi hesabınıza kopyalayın (Çatallama/Fork).
2.  Yeni bir dal (branch) oluşturun.
3.  Değişikliklerinizi yapın ve test edin.
4.  Bize bir Pull Request gönderin.

### Yeni Kural Ekleme

`styles/Turkish/` klasörüne yeni bir YAML dosyası ekleyin:

```yaml
extends: substitution
# Emoji ve nazik dil kullanımı önemlidir
message: "🇹🇷 Türkçemizi koruyalım: '%s' kullanın ('%s' yerine)"
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
