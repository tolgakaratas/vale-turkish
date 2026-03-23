# PROJE BİLGİ BANKASI VE MANİFESTOSU

**Oluşturulma Tarihi:** 23 Ocak 2026
**Son Güncelleme:** 23 Ocak 2026
**Proje:** Vale Turkish (Türkçe Stil Rehberi)
**Konum:** Kök Dizin

## 🌟 PROJENİN RUHU
Biz sadece kod yazmıyoruz; **Türkçenin dijital dünyadaki saygınlığını koruyoruz.**
Amacımız, yazılımcıların ve içerik üreticilerinin dilimizi **doğru, duru ve estetik** bir şekilde kullanmasına yardımcı olmaktır. Bu proje, "hata bulan bir robot" değil, "yardımsever bir editör" gibi davranmalıdır.

**Mottomuz:** *"Yasaklama, doğrusunu göster. Robot gibi konuşma, insan gibi öner."*

### 💎 Ana Geliştirme İlkesi (KIRMIZI ÇİZGİ)
Bu projenin en önemli kuralı şudur: **Sadece ekleyerek zenginleştiriyoruz.**
1.  Hatalı olan bir kuralı düzeltmek dışında **hiçbir veriyi silmiyoruz.**
2.  Mevcut yapıyı budamak yerine, yeni kurallar ve kelimeler ekleyerek sürekli büyüyoruz.
3.  Proje her zaman yeni geliştirmelere açıktır; amaç her gün daha kapsamlı bir bilgi bankası oluşturmaktır.
4.  Geliştiricilerin bu kurala uyması zorunludur. Detaylar için: [KATKIDA_BULUNMA.md](KATKIDA_BULUNMA.md)

## 📁 YAPI
```text
vale-turkish/
├── .github/                # CI/CD İş Akışları (Test ve Release)
├── fixtures/               # Test Dosyaları (Temiz ve Hatalı örnekler)
├── gelistirme-notlari/     # Geliştiriciler için ek teknik rehberler
├── styles/
│   ├── Turkish/            # Ana Stil Kuralları (YAML)
│   ├── dictionaries/       # Hunspell Sözlükleri (tr.dic, tr.aff)
│   └── config/             # Vocab (Özel kelime listeleri)
├── library.json            # Vale Registry Kaydı
├── PRD.md                  # Ürün Gereksinim Dokümanı
├── README.md               # Kullanım Kılavuzu
├── KATKIDA_BULUNMA.md      # Katkı Rehberi
├── install.sh              # macOS/Linux Kurulum Scripti
└── install.ps1             # Windows Kurulum Scripti
```

## 🧠 ÖĞRENİLEN DERSLER (POST-MORTEM)
*Bu projeyi geliştiren ajanların (ve insanların) mutlaka okuması gereken teknik hafıza.*

### 1. Hunspell ve Türkçe Fiil Çekimleri
*   **Sorun:** 36 MB'lık devasa Hunspell sözlüğü bile "geliyorum", "gidersin" gibi temel çekimleri tanıyamadı.
*   **Çözüm:** `accept.txt`'ye binlerce kelime eklemek yerine, `Spelling.yml` içinde **akıllı regex filtreleri** kullandık.
*   **Ders:** Hunspell yetersiz kaldığında, `ignore` listesine manuel ekleme yapmak yerine **desen (pattern) tabanlı çözüm** üretin.

### 2. Vale Mesaj Formatı (Ters Köşe)
*   **Sorun:** `substitution` kuralında mesaj formatı `'Doğru' yerine 'Yanlış' kullanın` şeklinde ters çalıştı.
*   **Gerçek:** Vale'nin `%s` parametreleri: 1. `Öneri` (Doğru), 2. `Eşleşen` (Yanlış).
*   **Doğru Format:** `message: "'%s' kullanın ('%s' yerine)"`

### 3. Kapsam (Scope) Tuzakları
*   **Sorun:** `capitalization` kuralı hem başlıkları hem listeleri karıştırdı.
*   **Çözüm:** Tek bir devasa kural yerine, her kapsam için ayrı kural dosyası oluşturduk (`HeadingCapitalization.yml`, `ListCapitalization.yml`).
*   **Ders:** Karmaşıklığı yönetmek için kuralları **böl ve yönet**.

## ⚖️ KARAR ÇERÇEVESİ VE İŞ AKIŞI
Bir ikilemde kaldığında veya yeni bir geliştirme yaparken şu sırayı takip et:

1.  **Kalite:** Kuralı kapatmak YOK. Sorunu çözmek VAR.
2.  **Kullanıcı Deneyimi:** Hata mesajı insanı azarlamamalı, gülümsetmeli (Emoji kullan).
3.  **Performans:** Regex'ler optimize edilmeli, tüm dosyayı taramaktan kaçınılmalı.

### 🔄 Zorunlu Geliştirme Döngüsü (Test Odaklı)
Bu projedeki her geliştirme, şu adımları otomaitk bir refleks olarak takip etmelidir:
1.  **Ön Kontrol:** Mevcut durumu görmek için testleri çalıştır (`vale fixtures/dirty.md`).
2.  **Zenginleştirme:** [💎 Ana Geliştirme İlkesi](#-ana-gelistirme-ilkesi-kirmizi-cizgi) uyarınca yeni verileri ekle.
3.  **Doğrulama:** Yeni eklenen kuralın çalıştığını `fixtures/dirty.md` üzerinden kanıtla.
4.  **Sıfır Hata:** Yapılan değişikliğin yan etki yaratmadığını `fixtures/clean.md` üzerinden doğrula.

> ⚠️ **KRİTİK KURAL:** Asla test etmeden kod gönderme (commit/push). Her seferinde işe başlamadan önce ve bitirdikten sonra testler mutlaka çalıştırılmalıdır.

## 🛠️ KONVANSİYONLAR
*   **Dil:** Her şey **TÜRKÇE**.
*   **Dosya Adı:** `PascalCase.yml` (Örn: `BitisikYazim.yml`).
*   **Mesajlar:** Emoji ile başla, nazik ol. (`📝`, `⚠️`, `💡`)
*   **Teknik Detaylar:** Daha fazla bilgi için [KATKIDA_BULUNMA.md](KATKIDA_BULUNMA.md) dosyasına bakın.

### 🚦 Yayınlama Kapısı (Release Gate)
Testlerden geçmeyen hiçbir değişiklik asla yayınlanamaz. Bu kural istisnasızdır.

1.  **CI zorunluluğu:** `test`, `test-precommit` ve `test-action` job'larının üçü de yeşil olmadan release workflow tetiklenmez.
2.  **Tag kuralı:** Release tag'i (`vX.Y.Z`) ancak main branch'te tüm testler geçtikten sonra oluşturulabilir.
3.  **Manuel release yasağı:** Release sürecini CI dışında manuel yürütmek yasaktır. Tüm release'ler GitHub Actions üzerinden otomatik yapılır.
4.  **Floating tag'ler:** Her release'de `v1` (major) floating tag'i güncel release'e taşınır.

> ⛔ **KESİN KURAL:** Testlerden geçmeyen hiçbir şey release edilemez. Bu kural hiçbir koşulda esnetilemez.

## 🚫 ANTİ-DESENLER
*   **ASLA** "testleri geçsin diye" `Turkish.Spelling = NO` yapma.
*   **ASLA** kullanıcıya "Yanlış yaptın!" deme; "Şöyle yapsak daha iyi olur" de.
*   **ASLA** `accept.txt` dosyasını `dirty.md` testini geçmek için kullanma. O dosya sadece `clean.md` içindir.
*   **ASLA** "test etmeden göndermek" gibi bir hataya düşme.

## ⌨️ KOMUTLAR
Aşağıdaki komutlar geliştirme döngüsünün ayrılmaz bir parçasıdır:
```bash
# İş akışı başlangıcı ve sonu için test çalıştırma
vale --config=.vale.ini fixtures/clean.md
vale --config=.vale.ini fixtures/dirty.md

# Yeni sürüm yayınlama
git tag vX.Y.Z && git push origin vX.Y.Z
```
