#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Örnek Uygulamalar

==== Kullanıcıdan Çıkış Değeri Gelene Kadar Tekrar

Kullanıcının kaç adet sayı veya komut gireceği önceden bilinmediğinde, belirlenen özel bir *çıkış (nöbetçi / sentinel) değeri* gelene kadar `while` döngüsü ile veri alınır.

#kod-cikti(baslik: "0 Girilene Kadar Sayıları Toplama", columns: (31em, auto))[
  ```python
  toplam = 0
  sayi = int(input("Sayı giriniz (Çıkış için 0): "))

  while sayi != 0:
      toplam += sayi
      sayi = int(input("Sayı giriniz (Çıkış için 0): "))

  print(f"Girilen sayıların toplamı: {toplam}")
  ```
][
  ```text
  Sayı giriniz (Çıkış için 0): 12
  Sayı giriniz (Çıkış için 0): 8
  Sayı giriniz (Çıkış için 0): 5
  Sayı giriniz (Çıkış için 0): 0
  Girilen sayıların toplamı: 25
  ```
]

==== Geçerli Veri Girilene Kadar Tekrar

Kullanıcıdan alınan verinin beklenen aralıkta veya biçimde olmasını garanti altına almak için *girdi doğrulama (input validation)* yapılır. Kullanıcı hatalı veri girdiği sürece `while` döngüsü uyarı verip yeniden giriş ister.

#kod-cikti(baslik: "0–100 Arası Geçerli Not İsteme", columns: (31em, auto))[
  ```python
  notu = int(input("Sınav notunuzu giriniz (0-100): "))

  while notu < 0 or notu > 100:
      print("Hata! Not 0 ile 100 arasında olmalıdır.")
      notu = int(input("Sınav notunuzu giriniz (0-100): "))

  print(f"Geçerli not kaydedildi: {notu}")
  ```
][
  ```text
  Sınav notunuzu giriniz (0-100): 120
  Hata! Not 0 ile 100 arasında olmalıdır.
  Sınav notunuzu giriniz (0-100): -5
  Hata! Not 0 ile 100 arasında olmalıdır.
  Sınav notunuzu giriniz (0-100): 85
  Geçerli not kaydedildi: 85
  ```
]
