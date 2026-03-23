# Değişiklik Günlüğü (Changelog)

Bu proje, [Semantik Versiyonlama](https://semver.org/lang/tr/) kurallarına uymaya çalışır.

## v1.1.0

### 🔌 Entegrasyonlar
*   **Pre-commit Desteği:** `.pre-commit-config.yaml` ile tek satırda Türkçe yazım denetimi entegrasyonu.
*   **GitHub Actions:** Tekrar kullanılabilir composite action (`action.yml`) ile CI/CD entegrasyonu.
*   **GitLab CI:** Include edilebilir CI şablonu (`.gitlab/vale-turkish.yml`).
*   **Wrapper Script:** Tüm entegrasyonların temelini oluşturan `hooks/vale-turkish.sh` scripti.
*   **Otomatik Vale Kurulumu:** Sistemde Vale yoksa wrapper script otomatik olarak indirir (`~/.local/bin/vale`).

### 🚀 Yeni Özellikler
*   **Sadelik Modülü:** Karmaşık ve eski ifadeler yerine duru Türkçe önerileri (`Sadelik.yml`).
*   **Gelişmiş Teknik Terimler:** AWS, Azure, GCP ve modern framework'leri içeren kapsamlı liste (`Teknik.yml`).
*   **Akıllı Yazım Denetimi:** Hunspell'in eksiklerini kapatan fiil çekimi regex filtresi (`Spelling.yml`).
*   **Uzun Cümle Kontrolü:** 30 kelimeyi geçen cümleler için okunabilirlik uyarısı (`UzunCumle.yml`).
*   **Kullanıcı Dostu Mesajlar:** Tüm hata mesajları emojilerle zenginleştirildi ve nazik bir tona kavuşturuldu.

### 📊 Görsel CI Raporlama
*   **GitHub Actions Step Summary:** Markdown tablo ile hata/uyarı/öneri sayaçları ve collapsible detay.
*   **GitHub Annotations:** PR diff'inde inline `::error` ve `::warning` gösterimi.
*   **GitLab JUnit:** Vale sonuçları MR'da "Tests" sekmesinde gösteriliyor (`junit.xml`).
*   **GitLab CodeClimate:** Code Quality widget'ında sorunlar gösteriliyor (`gl-code-quality-report.json`).

### 🏗️ Altyapı
*   **Çoklu Platform:** GitHub Actions action.yml artık Linux, macOS (Intel/ARM) ve Windows runner'larını destekliyor.
*   **Release Kapısı:** Tüm testler geçmeden release yapılamaz (`needs: test`).
*   **Floating Tag:** Her release'de `v1` major tag'i otomatik güncelleniyor.
*   **Dependabot:** GitHub Actions bağımlılıkları haftalık otomatik güncelleme.
*   **CODEOWNERS:** Tüm dosyalar için code review sorumlusu tanımlandı.
*   **Issue Template'leri:** Hata raporu ve kural önerisi formları (Türkçe YAML form).
*   **PR Template:** Test kontrol listesi ve AGENTS.md uygunluk checklist'i.
*   **EditorConfig:** YAML/MD dosyaları için tutarlı dosya formatı.

### 🐛 Düzeltmeler
*   **Fiil Çekimleri:** "Geliyorum", "gidersin" gibi kelimelerdeki yanlış pozitif hatalar giderildi.
*   **Başlık Büyük Harf:** Başlıkların yanlışlıkla cümle başı kuralına takılması önlendi (`HeadingCapitalization.yml`).
*   **Hata Mesajları:** `substitution` kurallarındaki ters mesaj formatı (Doğru/Yanlış sırası) düzeltildi.
*   **action.yml Heredoc:** YAML girintisi `.vale.ini` içine taşınıyordu, `echo` ile düzeltildi.
*   **action.yml Path:** `github.action_path` `./` kalıntısı `realpath` ile temizlendi.
*   **GitLab CI Shell Executor:** `apk` yerine platform algılama ile `~/.local/bin` fallback'i.
*   **Spelling False Positive:** `sonucunda`, `Bununla`, `listesini`, `yeniden` kelimeler accept.txt'ye eklendi.

### 📚 Dokümantasyon
*   **Diátaxis Yapısı:** README Öğretici/Nasıl Yapılır/Başvuru/Açıklama kadranlarına göre yeniden yazıldı.
*   **Platform Kurulumları:** macOS, Linux (Ubuntu/Debian/Arch/Fedora), Windows detaylı kurulum rehberleri.
*   **CI Badge'leri:** Test durumu ve release versiyonu badge'leri README'ye eklendi.
*   **Tam Türkçe:** Tüm proje dokümantasyonu ve kod içi yorumlar Türkçeleştirildi.
*   **Katkı Rehberi:** `KATKIDA_BULUNMA.md` dosyası eklendi.
*   **VS Code:** Önerilen eklentiler yapılandırması eklendi.
*   **AGENTS.md:** Proje manifestosu, Yayınlama Kapısı kuralı ve teknik hafıza güncellendi.

## v1.0.0 (Geri Alındı)
*   İlk deneme sürümü. GitHub Actions izin sorunu nedeniyle geri çekildi.
