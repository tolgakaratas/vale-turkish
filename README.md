# Vale Turkish (Türkçe Stil Rehberi) 🇹🇷

![Vale Turkish Banner](assets/banner.svg)

[![Test](https://github.com/tolgakaratas/vale-turkish/actions/workflows/test.yml/badge.svg)](https://github.com/tolgakaratas/vale-turkish/actions/workflows/test.yml)
[![Vale](https://img.shields.io/badge/vale-3.x-blue.svg)](https://vale.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Turkish](https://img.shields.io/badge/lang-T%C3%BCrk%C3%A7e-red.svg)](README.md)
[![GitHub Release](https://img.shields.io/github/v/release/tolgakaratas/vale-turkish)](https://github.com/tolgakaratas/vale-turkish/releases)

**"Birşey" mi yazılır yoksa "bir şey" mi? "Herkez" mi "herkes" mi? Artık dert etmenize gerek yok!**

### 🌟 Dilimize sahip çıkıyoruz!

Türkçe, bin yıllık zengin bir dil. Ama dijital dünyada yazarken hepimizin eli bazen kayıyor: toplantıda "set etmekten", belgede "forwardlamaktan", "herşey"i bitişik yazmaktan... Bu proje, **Türkçemizin dijital dünyadaki koruyucusu** olmak için yola çıktı.

Vale Turkish, yazılarınızın yanında sessizce duran, **7/24 çalışan bir Türkçe öğretmeni** gibidir. Markdown ve metin dosyalarınızdaki yazım hatalarını, Plaza Türkçesini, anlatım bozukluklarını ve teknik terim yanlışlarını otomatik olarak bulur ve nazikçe düzeltme önerir.

### 💡 Size ne fayda sağlar?

*   **Hatasız yazılar:** Önemli bir e-posta gönderirken veya bir rapor hazırlarken "acaba yanlış mı yazdım?" endişesini ortadan kaldırır.
*   **Profesyonel görünüm:** Kurallara uygun, tertemiz bir Türkçe ile yazdığınızda çevrenizde çok daha bilgili ve dikkatli bir izlenim bırakırsınız.
*   **Zaman kazancı:** Yazınızı tekrar tekrar kontrol etmekle vakit kaybetmezsiniz; hataları uygulama sizin yerinize bulur.
*   **Dilimizi koruma:** Her doğru yazılmış kelime, Türkçemizin geleceğine yapılan küçük ama anlamlı bir yatırımdır.

### 📍 Nerelerde kullanabilirsiniz?

*   İş yerinde yöneticinize gönderdiğiniz **e-postalarda**
*   Okul için hazırladığınız **ödev ve tezlerde**
*   İnternet siteniz için yazdığınız **blog yazılarında**
*   Açık kaynak projelerinizin **README ve dokümantasyonunda**
*   Hatta yazdığınız bir **kitap veya makalede**

### 🤖 Vale nedir?

Vale, yazılarınızı kontrol eden açık kaynaklı bir prose linter'dır. Yazılımcılar için linter'lar ne ise (ESLint, Pylint), yazarlar ve teknik dokümantasyon ekipleri için Vale odur. Biz bu akıllı motora Türkçenin kurallarını öğrettik. Yani Vale işin "beyni", vale-turkish ise o beyne neyin doğru neyin yanlış olduğunu söyleyen "bilgi bankasıdır".

[![Videoyu İzle](https://img.youtube.com/vi/MiZyT_zUmm0/maxresdefault.jpg)](https://www.youtube.com/watch?v=MiZyT_zUmm0)

---

## Öğretici: 5 Dakikada Başlayın

> Bu bölüm sizi adım adım yönlendirir. Sonunda çalışan bir Türkçe yazım denetleyiciniz olacak. Kendinize en uygun yolu seçin!

### Yol 1: Pre-commit ile (En Hızlı Yol)

Zaten bir Git projesi üzerinde çalışıyorsanız, en hızlı yol budur. Vale'i ayrıca kurmanıza gerek yoktur; ilk çalıştırmada otomatik olarak indirilir.

**Adım 1.** Pre-commit'i kurun (yoksa):

```bash
pip install pre-commit
```

**Adım 2.** Proje kök dizininize `.pre-commit-config.yaml` dosyası oluşturun ve içine ekleyin:

```yaml
repos:
  - repo: https://github.com/tolgakaratas/vale-turkish
    rev: v1.1.0
    hooks:
      - id: vale-turkish
```

**Adım 3.** Hook'u etkinleştirin:

```bash
pre-commit install
```

**Adım 4.** Deneyin! Bir Markdown dosyası oluşturup bilerek hatalı Türkçe yazın:

```bash
echo "birşey yazmak istiyorum, herşey yolunda" > test.md
git add test.md
git commit -m "test"
```

Çıktınız şöyle olacak:

```
Vale Turkish (Türkçe Yazım Denetimi)....Failed
- hook id: vale-turkish

 test.md
 1:1   error  📝 'bir şey' kullanın ('birşey' yerine)   Turkish.BitisikYazim
 1:27  error  📝 'her şey' kullanın ('herşey' yerine)   Turkish.BitisikYazim
```

Tebrikler! Artık her commit'inizde Türkçe yazım denetimi otomatik çalışıyor. 🎉

### Yol 2: Yerel Vale Kurulumu (Türkçe Dil Paketi Olarak)

Vale'yi bilgisayarınıza kurup, vale-turkish'i üzerine Türkçe dil paketi olarak ekleyebilirsiniz. Bu yol, pre-commit veya CI/CD kullanmadan doğrudan komut satırından çalışmak isteyenler içindir.

#### Adım 1: Vale'i kurun

<details>
<summary><strong>🍎 macOS</strong></summary>

```bash
# Homebrew ile (önerilen)
brew install vale

# Veya MacPorts ile
sudo port install vale
```

Kurulumu doğrulayın:
```bash
vale --version
# vale v3.9.0
```
</details>

<details>
<summary><strong>🐧 Linux</strong></summary>

**Ubuntu / Debian:**
```bash
# Snap ile (en kolay)
sudo snap install vale

# Veya manuel indirme (x86_64)
wget https://github.com/errata-ai/vale/releases/download/v3.9.0/vale_3.9.0_Linux_64-bit.tar.gz
tar -xzf vale_3.9.0_Linux_64-bit.tar.gz
sudo mv vale /usr/local/bin/

# ARM64 (Raspberry Pi, AWS Graviton)
wget https://github.com/errata-ai/vale/releases/download/v3.9.0/vale_3.9.0_Linux_arm64.tar.gz
tar -xzf vale_3.9.0_Linux_arm64.tar.gz
sudo mv vale /usr/local/bin/
```

**Arch Linux:**
```bash
sudo pacman -S vale
```

**Fedora / RHEL:**
```bash
sudo dnf install vale
```

Kurulumu doğrulayın:
```bash
vale --version
```
</details>

<details>
<summary><strong>🪟 Windows</strong></summary>

```powershell
# Chocolatey ile (önerilen)
choco install vale

# Veya Scoop ile
scoop install vale

# Veya Winget ile
winget install vale
```

Kurulumu doğrulayın:
```powershell
vale --version
```
</details>

#### Adım 2: Türkçe dil paketini kurun

```bash
# Projeyi indirin
git clone https://github.com/tolgakaratas/vale-turkish.git
cd vale-turkish
```

<details>
<summary><strong>🍎 macOS / 🐧 Linux — Otomatik Kurulum (Önerilen)</strong></summary>

```bash
./install.sh
```

Bu script şunları yapar:
- `~/.config/vale/styles/` dizinine Turkish stil dosyalarını kopyalar
- Hunspell sözlük dosyalarını yerleştirir
- `.vale.ini` yapılandırma dosyasını oluşturur
- `VALE_CONFIG_PATH` ortam değişkenini ayarlar
</details>

<details>
<summary><strong>🍎 macOS / 🐧 Linux — Manuel Kurulum</strong></summary>

```bash
# Stil dizinini oluşturun
mkdir -p ~/.config/vale/styles

# Türkçe kuralları kopyalayın
cp -r styles/Turkish ~/.config/vale/styles/
cp -r styles/dictionaries ~/.config/vale/styles/
cp -r styles/config ~/.config/vale/styles/

# Yapılandırma dosyasını kopyalayın
cp .vale.ini ~/.config/vale/.vale.ini

# Ortam değişkenini ekleyin (.zshrc veya .bashrc dosyanıza)
echo 'export VALE_CONFIG_PATH="$HOME/.config/vale/.vale.ini"' >> ~/.zshrc
source ~/.zshrc
```
</details>

<details>
<summary><strong>🪟 Windows — PowerShell</strong></summary>

```powershell
# Stil dizinini oluşturun
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.vale\styles"

# Türkçe kuralları kopyalayın
Copy-Item -Recurse styles\Turkish "$env:USERPROFILE\.vale\styles\"
Copy-Item -Recurse styles\dictionaries "$env:USERPROFILE\.vale\styles\"
Copy-Item -Recurse styles\config "$env:USERPROFILE\.vale\styles\"

# Yapılandırma dosyasını kopyalayın
Copy-Item .vale.ini "$env:USERPROFILE\.vale\.vale.ini"

# Ortam değişkenini ayarlayın (kalıcı)
[Environment]::SetEnvironmentVariable("VALE_CONFIG_PATH", "$env:USERPROFILE\.vale\.vale.ini", "User")
```
</details>

#### Adım 3: Deneyin!

```bash
# Tek dosya kontrolü
vale dosya.md

# Bir dizindeki tüm dosyaları kontrol edin
vale docs/

# Sadece hataları gösterin
vale --minAlertLevel=error dosya.md
```

Örnek çıktı:

```
 dosya.md
 3:8   error    📝 'hiçbir' kullanın ('hiç bir' yerine)              Turkish.BitisikYazim
 5:1   warning  🏢 'geri bildirim' kullanın ('Feedback' yerine)      Turkish.Plaza
 7:12  suggestion  ✨ 'bununla birlikte' kullanın ('Mamafih' yerine)  Turkish.Akademik
```

### VS Code Entegrasyonu

Vale'i kurup Türkçe dil paketini yükledikten sonra, VS Code'da gerçek zamanlı uyarılar alabilirsiniz:

1. VS Code'da **"Vale VSCode"** eklentisini yükleyin
2. Ayarlardan `vale.configPath` değerini belirleyin:
   - macOS/Linux: `~/.config/vale/.vale.ini`
   - Windows: `%USERPROFILE%\.vale\.vale.ini`

Artık yazarken hatalar anında altı çizili olarak görünür!

---

## Nasıl Yapılır Rehberleri

> Her rehber belirli bir sorunu çözer. İhtiyacınız olan başlığa atlayın.

### Sadece belirli dizinlerdeki Türkçe dosyaları denetleme

Projenizde hem Türkçe hem İngilizce belgeler varsa, vale-turkish'i yalnızca Türkçe dosyalara uygulayabilirsiniz.

**Pre-commit ile** — `files` parametresiyle regex deseni belirtin:

```yaml
# Yalnızca docs/tr/ altındaki dosyalar
- id: vale-turkish
  files: ^docs/tr/

# Birden fazla dizin veya .tr.md uzantılı dosyalar
- id: vale-turkish
  files: (^docs/tr/|^content/turkce/|\.tr\.md$)
```

**GitHub Actions ile** — `files` girdisini kullanın:

```yaml
- uses: tolgakaratas/vale-turkish@v1.1.0
  with:
    files: 'docs/tr/'
```

**GitLab CI ile** — `VALE_FILES` değişkenini ayarlayın:

```yaml
vale-turkish:
  extends: .vale-turkish
  variables:
    VALE_FILES: "docs/tr/"
```

**Komut satırında** — doğrudan dizin belirtin:

```bash
vale docs/tr/
```

### Uyarı seviyesini özelleştirme

Vale Turkish'in 3 uyarı seviyesi vardır. Hangilerini görmek istediğinizi seçebilirsiniz:

| Seviye | Anlamı | Kullanım Senaryosu |
|--------|--------|-------------------|
| `suggestion` | Öneri niteliğinde iyileştirmeler | Yazınızı en üst düzeye çıkarmak istiyorsanız (varsayılan) |
| `warning` | Dikkat edilmesi gereken sorunlar | Günlük kullanım için ideal denge |
| `error` | Kesin yazım hataları | CI/CD pipeline'larında kapı bekçisi olarak |

```yaml
# Pre-commit
- id: vale-turkish
  args: [--minAlertLevel=error]
```

```bash
# Komut satırı
vale --minAlertLevel=warning dosya.md
```

### Belirli kuralları kapatma

Bir kural çok fazla false positive üretiyorsa kapatabilirsiniz.

**Proje genelinde** — `.vale.ini` dosyasında:

```ini
[*.md]
BasedOnStyles = Turkish
Turkish.Spelling = NO
Turkish.Plaza = NO
```

**Dosya içinde geçici olarak** — HTML yorumları ile:

```markdown
Bu paragrafta Plaza kuralı uygulanır.

<!-- vale Turkish.Plaza = NO -->
Bu paragrafta "deadline" gibi kelimeler uyarı vermez.
<!-- vale Turkish.Plaza = YES -->

Bu paragrafta tekrar uygulanır.
```

### CI/CD pipeline'a ekleme

#### GitHub Actions

`.github/workflows/vale.yml` dosyası oluşturun:

```yaml
name: Türkçe Yazım Denetimi

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  vale-turkish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: tolgakaratas/vale-turkish@v1.1.0
        with:
          files: '.'
          min_alert_level: 'error'
```

#### GitLab CI

`.gitlab-ci.yml` dosyanıza ekleyin:

```yaml
include:
  - remote: 'https://raw.githubusercontent.com/tolgakaratas/vale-turkish/v1.1.0/.gitlab/vale-turkish.yml'

vale-turkish:
  extends: .vale-turkish
  variables:
    VALE_FILES: "docs/"
    MIN_ALERT_LEVEL: "warning"
```

### Özel kelime ekleme

Sözlükte olmayan ama projenizde sık kullandığınız terimleri kabul listesine ekleyerek false positive'leri önleyin:

```bash
# styles/config/vocabularies/Turkish/accept.txt dosyasına ekleyin
echo "Kubernetes" >> styles/config/vocabularies/Turkish/accept.txt
echo "DevOps" >> styles/config/vocabularies/Turkish/accept.txt
```

Her satıra bir kelime yazın. Bu kelimeler artık yazım hatası olarak işaretlenmez.

---

## Başvuru

> Eksiksiz teknik bilgi. Parametreler, kurallar ve yapılandırma seçenekleri.

### Kural listesi

| Kural | Tür | Açıklama | Seviye |
|-------|-----|----------|--------|
| `Turkish.BitisikYazim` | substitution | Ayrı/bitişik yazılması gereken kelimeler | error |
| `Turkish.Buyukharf` | existence | Özel isimlerin büyük harfle yazımı | warning |
| `Turkish.CumleBasi` | capitalization | Cümle başı büyük harf kontrolü | error |
| `Turkish.DeDABaglaci` | existence | de/da bağlacı kontrolü | warning |
| `Turkish.KiEki` | substitution | ki bağlacı kontrolü | warning |
| `Turkish.Noktalama` | existence | Noktalama işaretleri kontrolü | error |
| `Turkish.Spelling` | spelling | Hunspell tabanlı Türkçe yazım denetimi | error |
| `Turkish.Tekrar` | repetition | Kelime tekrarı kontrolü | warning |
| `Turkish.YanlisTurkce` | substitution | Yaygın yazım hataları | error |
| `Turkish.Plaza` | substitution | Plaza Türkçesi (iş dili) sadeleştirme | warning |
| `Turkish.Akademik` | substitution | Akademik dilde duruluk ve sadelik | suggestion |
| `Turkish.Fabrika` | substitution | Üretim sahası ve fabrika jargonu | warning |
| `Turkish.Teknik` | substitution | Teknik terimlerin standart yazımı | error |
| `Turkish.Sadelik` | substitution | Genel anlatım bozuklukları ve sadelik | suggestion |
| `Turkish.Deyimler` | substitution | Deyimlerin doğru kullanımı | error |
| `Turkish.UzunCumle` | existence | 30+ kelimeli uzun cümle uyarısı | warning |

### Pre-commit hook seçenekleri

```yaml
- repo: https://github.com/tolgakaratas/vale-turkish
  rev: v1.1.0
  hooks:
    - id: vale-turkish
      args: [--minAlertLevel=error]   # Vale CLI argümanları
      files: ^docs/tr/                # Regex: hangi dosyalara uygulanacak
      types: [markdown]               # Dosya tipi (varsayılan: markdown)
```

### GitHub Actions girdileri

| Girdi | Varsayılan | Açıklama |
|-------|-----------|----------|
| `files` | `.` | Denetlenecek dosyalar veya dizin |
| `min_alert_level` | `suggestion` | Minimum uyarı seviyesi: `suggestion`, `warning`, `error` |
| `vale_version` | `3.9.0` | Kurulacak Vale sürümü |
| `reporter` | `CLI` | Çıktı formatı: `CLI`, `JSON`, `line` |
| `no_spelling` | `false` | `true` ile yazım denetimini devre dışı bırakır |

### GitLab CI değişkenleri

| Değişken | Varsayılan | Açıklama |
|----------|-----------|----------|
| `VALE_FILES` | `.` | Denetlenecek dosyalar veya dizin |
| `MIN_ALERT_LEVEL` | `suggestion` | Minimum uyarı seviyesi |
| `VALE_VERSION` | `3.9.0` | Vale sürümü |
| `VALE_TURKISH_VERSION` | `v1.1.0` | vale-turkish sürümü |
| `VALE_TURKISH_NO_SPELLING` | `0` | `1` ile yazım denetimini devre dışı bırakır |

### Ortam değişkenleri

| Değişken | Açıklama |
|----------|----------|
| `VALE_VERSION` | İndirilecek Vale sürümü (varsayılan: `3.9.0`) |
| `VALE_TURKISH_NO_SPELLING` | `1` olarak ayarlanırsa Spelling kuralı devre dışı kalır |
| `VALE_CONFIG_PATH` | Vale yapılandırma dosyasının yolu |

### Platform desteği (otomatik indirme)

Pre-commit hook'u çalıştırıldığında, sistemde Vale yoksa otomatik olarak indirilir:

| Platform | Mimari | Kurulum dizini | Not |
|----------|--------|---------------|-----|
| macOS | Intel (x86_64) | `~/.local/bin/vale` | |
| macOS | Apple Silicon (arm64) | `~/.local/bin/vale` | M1/M2/M3/M4 |
| Linux | x86_64 | `~/.local/bin/vale` | Ubuntu, Debian, Fedora, Arch vb. |
| Linux | ARM64 | `~/.local/bin/vale` | Raspberry Pi, AWS Graviton |
| Windows | x86_64 | `%APPDATA%\vale\vale.exe` | Git Bash / MSYS2 / WSL |
| FreeBSD | - | - | `go install` veya Docker kullanın |

### `.vale.ini` yapılandırma dosyası

```ini
StylesPath = styles           # Stil dosyalarının dizini
MinAlertLevel = suggestion    # suggestion | warning | error
Vocab = Turkish               # Kullanılacak kelime listesi

[*.md]                        # Tüm Markdown dosyaları
BasedOnStyles = Turkish       # Uygulanan stil paketleri
Turkish.Spelling = NO         # Belirli kuralı kapatma (opsiyonel)

[*.tr.md]                     # Sadece .tr.md uzantılı dosyalar
BasedOnStyles = Turkish

[turkce/*.md]                 # Belirli dizindeki dosyalar
BasedOnStyles = Turkish
```

### Klasör yapısı

```
vale-turkish/
├── .pre-commit-hooks.yaml          # Pre-commit hook tanımı
├── action.yml                      # GitHub Actions composite action
├── .gitlab/
│   └── vale-turkish.yml            # GitLab CI şablonu
├── hooks/
│   └── vale-turkish.sh             # Wrapper script (Vale otomatik kurulum dahil)
├── .vale.ini                       # Örnek yapılandırma
├── install.sh                      # Kurulum scripti (macOS/Linux)
├── install.ps1                     # Kurulum scripti (Windows)
├── styles/
│   ├── Turkish/                    # 16 kural dosyası (.yml)
│   │   ├── Akademik.yml            # Akademik duruluk kuralları
│   │   ├── BitisikYazim.yml        # Bitişik/ayrı yazım kuralları
│   │   ├── Buyukharf.yml           # Büyük harf kuralları
│   │   ├── DeDABaglaci.yml         # de/da bağlacı
│   │   ├── Deyimler.yml            # Deyimlerin doğru kullanımı
│   │   ├── Fabrika.yml             # Fabrika/üretim jargonu
│   │   ├── KiEki.yml               # ki bağlacı
│   │   ├── Noktalama.yml           # Noktalama işaretleri
│   │   ├── Plaza.yml               # Plaza Türkçesi sadeleştirme
│   │   ├── Sadelik.yml             # Genel sadelik ve duruluk
│   │   ├── Spelling.yml            # Hunspell yazım denetimi
│   │   ├── Teknik.yml              # Teknik terimler
│   │   ├── Tekrar.yml              # Kelime tekrarı
│   │   ├── UzunCumle.yml           # Uzun cümle kontrolü
│   │   └── YanlisTurkce.yml        # Yaygın hatalar
│   ├── dictionaries/               # Hunspell Türkçe sözlük
│   │   ├── tr.aff                  # Ek kuralları (2.2 MB)
│   │   └── tr.dic                  # Kelime listesi (34 MB)
│   └── config/
│       └── vocabularies/
│           └── Turkish/
│               └── accept.txt      # Kabul edilen özel kelimeler
├── fixtures/                       # Test dosyaları
│   ├── clean.md                    # Hatasız örnek (0 hata beklenir)
│   └── dirty.md                    # Hatalı örnek (40+ hata beklenir)
└── examples/
    └── ornek.tr.md                 # Örnek Türkçe dosya
```

---

## Açıklama

> Bu bölüm "neden" sorularını yanıtlar. Arka plan, felsefe ve tasarım kararları.

### Neden Vale Turkish?

Toplantıda "set etmekten", belgede "forwardlamaktan", yazım hatalarını gözden kaçırmaktan yorulmadınız mı?

*   **Sorun:** Türkçe için kapsamlı bir otomatik yazım denetim aracı yoktu. İngilizce için yüzlerce araç varken, Türkçe yazanlar kendi haline bırakılmıştı.
*   **Çözüm:** Vale Turkish, 16 farklı kural dosyasıyla Plaza Türkçesinden bitişik yazıma, teknik terimlerden uzun cümlelere kadar geniş bir yelpazeyi kapsar.
*   **Fayda:** Daha profesyonel, anlaşılır ve Türkçeye saygılı belgeler yazarsınız. Hem kendinize hem de okuyucunuza değer verirsiniz.

### Ne kontrol eder?

Vale Turkish 6 ana kategoride denetim yapar:

*   **Yazım kuralları** — Bitişik/ayrı yazım (`birşey` → `bir şey`), büyük harf (`istanbul` → `İstanbul`), de/da ve ki bağlaçları, noktalama, cümle başı kontrolü
*   **Yazım denetimi** — Hunspell tabanlı Türkçe sözlük ile kelime doğrulaması
*   **Plaza Türkçesi** — İş dünyasının gereksiz yabancı kelimelerini tespit eder (`deadline` → `son teslim tarihi`, `feedback` → `geri bildirim`)
*   **Akademik dil** — Ağdalı akademik ifadeleri sadeleştirir (`mamafih` → `bununla birlikte`)
*   **Teknik terimler** — Teknik terimlerin standart yazımını kontrol eder (`Nextjs` → `Next.js`, `Macos` → `macOS`)
*   **Okunabilirlik** — 30 kelimeyi aşan cümleleri uyarır, kelime tekrarlarını bulur

### Projenin felsefesi

Bu projenin temel ilkesi **ekleyerek zenginleştirmektir:**

*   **Silmiyoruz, ekliyoruz:** Hatalı olanları düzeltmek dışında mevcut kuralları veya kelimeleri silmiyoruz.
*   **Sürekli gelişim:** Her zaman yeni kurallar, kelimeler ve iyileştirmelere açığız.
*   **Nazik ton:** Hata mesajları uyarıcı değil, yol göstericidir. Emojilerle zenginleştirilmiş, nazik bir dil kullanılır.

Detaylı bilgi için [Geliştirici Rehberi (KATKIDA_BULUNMA.md)](KATKIDA_BULUNMA.md) ve [Proje Manifestosu (AGENTS.md)](AGENTS.md) dosyalarına göz atabilirsiniz.

### Neden otomatik Vale kurulumu?

Pre-commit hook'umuz, sistemde Vale kurulu olmasa bile çalışır. Bu tasarım kararının arkasında birkaç neden var:

1. **Sürtünmeyi azaltmak** — Yeni bir geliştirici projeye katıldığında `pre-commit install` yeterli olsun, ek kurulum adımı olmasın.
2. **CI ortamları** — GitHub Actions ve GitLab CI runner'larında Vale önceden kurulu değildir. Wrapper script bunu otomatik halleder.
3. **Platform bağımsızlığı** — Script, çalıştığı platformu algılayıp doğru binary'yi indirir (macOS Intel/ARM, Linux x86/ARM, Windows).

---

## Katkıda Bulunma

Bu proje hepimizin! Türkçemize birlikte sahip çıkıyoruz. Nasıl destek olabileceğinizi öğrenmek için [KATKIDA_BULUNMA.md](KATKIDA_BULUNMA.md) dosyasını okuyun.

Kısaca:
1.  Bu projeyi kendi hesabınıza kopyalayın (Çatallama/Fork).
2.  Yeni bir dal (branch) oluşturun.
3.  Değişikliklerinizi yapın ve test edin.
4.  Bize bir Pull Request gönderin.

### Yeni kural ekleme

`styles/Turkish/` klasörüne yeni bir YAML dosyası ekleyin:

```yaml
extends: substitution
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
- Ve bu projeye katkıda bulunan, Türkçesine değer veren herkese! 🙏
