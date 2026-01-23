# Örnek Türkçe Belge

Bu dosya Vale Türkçe stil kurallarını test etmek için kullanılabilir.

## Doğru Kullanımlar

- Bir şey yazmak istiyorum.
- Her şey yolunda gidiyor.
- Türkiye'de yaşıyorum.
- İstanbul güzel bir şehir.
- Yalnız ben değil, herkes bunu biliyor.

## Hatalı Kullanımlar (Vale bunları yakalar)

Aşağıdaki satırlarda bilerek hatalar bırakılmıştır:

- birşey yazmak istiyorum (hata: bitişik yazım)
- herşey karışık (hata: bitişik yazım)
- yanlız sen varsın (hata: yalnız olmalı)
- demekki bu doğru (hata: demek ki olmalı)
- teşekürler yardımın için (hata: teşekkürler olmalı)
- türkiye'ye gideceğim (hata: büyük harfle yazılmalı)
- istanbul çok kalabalık (hata: büyük harfle yazılmalı)

## Test Komutları

```bash
# Bu dosyayı kontrol etmek için:
vale ornek.tr.md

# Sadece hataları görmek için:
vale --minAlertLevel=error ornek.tr.md
```
