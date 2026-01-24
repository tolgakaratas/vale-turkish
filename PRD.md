# Product Requirements Document (PRD): Vale Turkish

| Versiyon | Tarih       | Durum    | Yazar           |
| :---     | :---        | :---     | :---            |
| v1.0     | 23.01.2026  | Taslak   | Antigravity     |
| v1.1     | 23.01.2026  | Revize   | Antigravity     |

## 1. Ürün Vizyonu
**Vale Turkish**, Türkçe teknik dokümantasyon, blog yazıları ve kurumsal iletişim metinleri için oluşturulmuş, açık kaynaklı, "kur ve unut" (plug-and-play) mantığında çalışan bir stil denetleyicisidir.

Amacımız, yazılımcıların ve içerik üreticilerinin **"Plaza Türkçesi"**, **anlatım bozuklukları** ve **yazım hatalarını** efor sarf etmeden, kod yazar gibi (linter) düzeltebilmesini sağlamaktır.

## 2. Hedef Kitle
*   **Yazılım Geliştiriciler:** README, PR açıklamaları ve teknik doküman yazanlar.
*   **Teknik Yazarlar:** Ürün dokümantasyonu hazırlayan profesyoneller.
*   **Blog Yazarları:** Teknoloji ve iş dünyası üzerine içerik üretenler.
*   **Kurumsal Şirketler:** Marka dili tutarlılığı sağlamak isteyen ekipler.

## 3. Problem Tanımı
Türkçe içerik üretiminde yazım, dilbilgisi ve stil tutarlılığını sağlamak zordur. Özellikle yazılım ve teknoloji sektöründe, İngilizce terimlerin yoğun kullanımı "Plaza Türkçesi" gibi hibrit bir dil yapısı oluşturmaktadır. Mevcut araçlar (yazım denetleyicileri) genellikle genel dilbilgisi kurallarına odaklanırken, sektöre özgü ve stilistik sorunları çözmede yetersiz kalmaktadır. Bu durum, dokümantasyon kalitesini düşürmekte, yanlış anlaşılmalara yol açmakta ve marka imajını zayıflatmaktadır.

## 4. İsimlendirme Standartları
*   **GitHub Repo Adı:** `vale-turkish`
*   **Vale Paket Adı:** `Turkish`
*   **Konfigürasyon Kullanımı:** `Packages = Turkish` (meta.json dosyasında tanımlanan isim)

## 5. Yol Haritası (Roadmap)

### Faz 1: Temel Atma (Tamamlandı ✅)
*   Temel yazım kuralları (ayrı/bitişik yazım).
*   Hunspell tabanlı Türkçe sözlük entegrasyonu.
*   Büyük/küçük harf ve noktalama kontrolleri.
*   macOS, Linux ve Windows kurulum scriptleri.

### Faz 2: İçerik Zenginleştirme (Şu anki Odak 🚧)
Bu fazda repoyu "basit bir yazım denetleyicisi" olmaktan çıkarıp "stil rehberi"ne dönüştüreceğiz.
*   **Plaza Türkçesi Temizliği:** `deploy etmek` -> `yayına almak`, `meeting` -> `toplantı`. (Kural: `Turkish.Plaza`)
*   **Sadelik (Simplification):** Gereksiz, uzun ve karmaşık ifadelerin sadeleştirilmesi. (Kural: `Turkish.Sadelik` veya `Turkish.Simplicity`)
*   **Teknik Terim Standartları:** `Backend`, `Front-end` vb. terimlerin tutarlı yazımı. (Kural: `Turkish.Teknik` veya `Turkish.TechTerms`)
*   **Kapsayıcı Dil (Inclusivity):** Cinsiyetçi veya ayrıştırıcı dilden arındırma. (Kural: `Turkish.KapsayiciDil` veya `Turkish.Inclusive`)

### Faz 3: Ürünleşme ve Otomasyon
*   **Vale Package Format:** `library.json` dosyası oluşturularak Vale'nin resmi paket sistemine uyum ve sürüm kontrolü.
*   **GitHub Releases:** `Turkish.zip` olarak paketlenmiş sürümlerin (tag'e göre) otomatik oluşturulması ve yayınlanması.
*   **CI/CD Pipeline:** Her Pull Request'te kuralların `fixtures` (test cümleleri) ile otomatik test edilmesi ve testlerin yeşil kalması.
*   **Otomatik Test Kapsamı:** En az %80 kural kapsama oranı (`fixtures` üzerinden).

### Faz 4: Topluluk ve Yaygınlaştırma
*   Logo ve Kurumsal Kimlik tasarımı.
*   Hacktoberfest katılımı için `CONTRIBUTING.md` hazırlanması (katkı rehberi).
*   VS Code ve Obsidian için eklenti/entegrasyon rehberleri.
*   Tanıtım blog yazıları ve sosyal medya duyuruları.

### Faz 5: Ekosistem Genişletme ve Otomasyon (Yeni Vizyon 🚀)
Bu fazda projeyi bir yazılım aracından çıkarıp, Türkçenin dijital ekosistemine dönüştüreceğiz.
*   **Sektörel Stil Paketleri:** Hukuk (Ağır terminoloji sadeleştirme), Akademik (Makale/Tez yazım standartları) ve Kamu dili için özel modüllerin eklenmesi.
*   **`vale-turkish fix` CLI:** Bariz yazım hatalarını döküman genelinde tek komutla otomatik düzelten bir araç/script geliştirilmesi.
*   **Eğitici Bilgi Kartları:** Kural mesajlarının TDK veya dilbilim kaynaklı açıklayıcı linklerle zenginleştirilerek projeye eğitim kimliği kazandırılması.
*   **Web ve Tarayıcı Entegrasyonu:** Geliştirici olmayanlar için çevrimiçi metin editörü ve Chrome/Firefox eklentisi (LinkedIn, Gmail desteği) geliştirilmesi.
*   **Kalite Rozeti (Badge):** Projelerin Türkçe hassasiyetini ödüllendiren ve README dosyalarına eklenebilen dinamik "Turkish Quality" rozetleri.

## 6. Kapsam / Kapsam Dışı
*   **Kapsam:** Vale'nin temel kural tipleri (`substitution`, `existence`, `occurrence`, `repetition`, `capitalization`, `spelling`) kullanılarak Türkçe yazım, dilbilgisi ve stil denetimi. GitHub Actions ile otomatik test ve release süreçleri.
*   **Kapsam Dışı:** Doğal Dil İşleme (NLP) tabanlı, ileri seviye dilbilgisi çözümlemeleri (morfolojik analiz, sentaks analizi gibi karmaşık dilbilgisi kuralları). Bu tür özellikler, Vale'nin mevcut altyapısıyla verimli bir şekilde uygulanamaz ve projenin kapsamını gereksiz yere şişirir.

## 7. Teknik Mimari

### Klasör Yapısı (Hedef)
```text
vale-turkish/
├── .github/                # GitHub Actions Workflows
│   ├── workflows/
│   │   ├── test.yml        # CI testleri
│   │   └── release.yml     # Release otomasyonu
├── styles/
│   ├── Turkish/            # Ana Stil Paketi (Vale tarafından 'Turkish' olarak tanınacak)
│   │   ├── meta.json       # Paket metadata (name: Turkish)
│   │   ├── BitisikYazim.yml
│   │   ├── Buyukharf.yml
│   │   ├── CumleBasi.yml
│   │   ├── DeDABaglaci.yml
│   │   ├── KiEki.yml
│   │   ├── Noktalama.yml
│   │   ├── Plaza.yml       # Plaza dili kuralları
│   │   ├── Spelling.yml    # Hunspell tabanlı yazım denetimi
│   │   ├── Teknik.yml      # Teknik terimler
│   │   ├── Tekrar.yml
│   │   └── YanlisTurkce.yml
│   ├── dictionaries/       # Hunspell sözlük dosyaları
│   │   ├── tr.aff
│   │   └── tr.dic
│   └── config/
│       └── vocabularies/
│           └── Turkish/    # Kullanıcı özel kelime haznesi (Vocab = Turkish)
│               └── accept.txt
├── fixtures/               # Otomatik testler için örnek hatalı/doğru metinler
│   ├── clean.md            # Sıfır hata beklenen dosya
│   └── dirty.md            # Hata beklenen dosya
├── library.json            # Vale Package Registry kayıt dosyası
├── PRD.md                  # Ürün Gereksinim Dokümanı
├── README.md               # Proje açıklaması ve kurulum rehberi
├── install.sh              # macOS/Linux kurulum scripti
└── install.ps1             # Windows kurulum scripti
```

### Kural Kategorileri
Paket modüler yapıda olacak, kullanıcılar isterse sadece belirli modülleri açabilecek. `.vale.ini` dosyasında `BasedOnStyles = Turkish` kullanıldığında tüm kurallar aktif olacak. Tek tek açmak/kapatmak için: `Turkish.RuleName = NO/suggestion/warning/error`.
*   `Turkish.Spelling` (Yazım Denetimi - Hunspell tabanlı)
*   `Turkish.Plaza` (Plaza Dili - Substitution)
*   `Turkish.Teknik` (Teknik Terimler - Substitution)
*   `Turkish.BitisikYazim` (Yazım - Substitution)
*   `Turkish.Buyukharf` (Yazım - Capitalization)
*   `Turkish.CumleBasi` (Yazım - Capitalization)
*   `Turkish.DeDABaglaci` (Dilbilgisi - Existence)
*   `Turkish.KiEki` (Dilbilgisi - Substitution)
*   `Turkish.Noktalama` (Yazım - Existence)
*   `Turkish.Tekrar` (Stil - Repetition)
*   `Turkish.YanlisTurkce` (Yazım - Substitution)

### Test Stratejisi
*   Her kural için `fixtures/dirty.md` içinde en az bir "hatalı" örnek.
*   Her kural için `fixtures/clean.md` içinde "hatasız" örnekler.
*   CI Pipeline'da (`test.yml`) hem `clean.md`'nin sıfır hata verdiğini, hem de `dirty.md`'nin beklenen hataları tespit ettiğini doğrula.

## 8. Başarı Kriterleri (Ölçülebilir Metrikler)
*   **Kural Kapsamı:** Tüm temel yazım ve dilbilgisi kuralları için en az 1 "error" seviyesinde kural, 1 "warning" seviyesinde kural ve 1 "suggestion" seviyesinde kural (`Faz 2` sonunda).
*   **Test Kapsamı:** `fixtures/clean.md` için %0 hata, `fixtures/dirty.md` için en az 10 farklı kural ihlali tespiti.
*   **CI Geçiş Oranı:** GitHub Actions `test.yml` iş akışının %100 başarıyla tamamlanması.
*   **Kurulum Kolaylığı:** Kullanıcıların `vale sync` ile paketi sorunsuz kurabilmesi.
*   **Yanlış Pozitif Oranı:** `clean.md` üzerinde %0 yanlış pozitif (Vale'nin Vocab/IgnoredWords/IgnoredClasses gibi mekanizmaları kullanılarak).
*   **Vale Resmi Paket Listesi:** Vale'nin merkezi paket listesinde yer almak.
*   **GitHub Popülerliği:** 100+ Star ve 10+ aktif katılımcı.
*   **Geriye Uyumluluk:** Her ana sürüm (`vX.0.0`) güncellemesinde geriye uyumluluğun korunması.

## 9. Varsayımlar ve Bağımlılıklar
*   Kullanıcıların Vale'yi manuel olarak kurduğu varsayılır.
*   Hunspell Türkçe sözlüğünün güncelliği ve kapsayıcılığı üzerinde doğrudan kontrolümüz yoktur. Yanlış pozitifler için `accept.txt` kullanımı esastır.
*   Vale'nin temel kural tipleri (`substitution`, `existence`, `repetition`, `capitalization`) Türkçe dil yapısı için yeterli olacaktır.
*   Vale'nin resmi paket listesine kabul için gereken tüm metadata ve test standartları karşılanacaktır.

## 10. Riskler
*   **Hunspell Doğruluğu:** Türkçe'nin eklemeli yapısı nedeniyle Hunspell'in tüm kelime türevlerini doğru algılayamaması, yüksek yanlış pozitif oranına yol açabilir. Çözüm: Kapsamlı `accept.txt` yönetimi.
*   **Vale Kural Kısıtlamaları:** Vale'nin mevcut kural motorunun, Türkçe'nin bazı karmaşık dilbilgisi kurallarını (örn. öge dizilişi, tamlamalar) yakalamakta yetersiz kalması. Çözüm: Faz 2'nin kapsam dışı bırakılan NLP kısıtlamalarına uymak.
*   **Topluluk Katılımı:** Katılımcı olmaması durumunda kural seti geliştirme hızının yavaşlaması. Çözüm: Hacktoberfest gibi etkinliklerle katkı teşviki.
*   **Sürdürülebilirlik:** Projenin uzun vadeli bakımının ve güncelliğinin sağlanması. Çözüm: Net bir katkı rehberi ve düzenli yayın süreçleri.
