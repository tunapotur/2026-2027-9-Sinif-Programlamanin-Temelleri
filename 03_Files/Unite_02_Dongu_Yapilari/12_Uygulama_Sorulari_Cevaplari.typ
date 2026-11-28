#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#pagebreak()
=== Uygulama Soruları Cevapları

*Soru 1: `for` Döngüsü ile Sayı Aralığı Yazdırma*
#kod-blok(width: 100%)[
  ```python
  for i in range(1, 7):
      print(i, end=" ")
  ```
]

*Soru 2: İkişer Artan ve Geriye Sayım*
#kod-blok(width: 100%)[
  ```python
  for i in range(0, 11, 2):
      print(i, end=" ")
  print()
  for i in range(10, 1, -2):
      print(i, end=" ")
  ```
]

*Soru 3: 1'den N'e Kadar Sayıların Toplamı*
#kod-blok(width: 100%)[
  ```python
  n = int(input("Bir sayı giriniz: "))
  toplam = 0
  for i in range(1, n + 1):
      toplam += i
  print(f"1'den {n}'e kadar toplam: {toplam}")
  ```
]

*Soru 4: Metindeki Sesli Harfleri Sayma*
#kod-blok(width: 100%)[
  ```python
  kelime = input("Kelime giriniz: ").lower()
  sesliler = "aeıioöuü"
  sayac = 0
  for harf in kelime:
      if harf in sesliler:
          sayac += 1
  print(f"Sesli harf sayısı: {sayac}")
  ```
]

*Soru 5: `while` ile Geri Sayım*
#kod-blok(width: 100%)[
  ```python
  sayac = int(input("Başlangıç sayısı: "))
  while sayac >= 1:
      print(sayac)
      sayac -= 1
  print("Kalkış!")
  ```
]

*Soru 6: Çıkış Değeri (`-1`) Gelene Kadar Ortalama*
#kod-blok(width: 100%)[
  ```python
  toplam = 0
  adet = 0
  sayi = int(input("Sayı (Çıkış için -1): "))
  while sayi != -1:
      toplam += sayi
      adet += 1
      sayi = int(input("Sayı (Çıkış için -1): "))

  if adet > 0:
      print(f"{adet} sayı girildi, ortalama: {toplam / adet:.1f}")
  else:
      print("Hiç sayı girilmedi.")
  ```
]

*Soru 7: Geçerli Şifre Uzunluğu Kontrolü*
#kod-blok(width: 100%)[
  ```python
  sifre = input("Şifre belirleyiniz: ")
  while len(sifre) < 6:
      print("Hata! Şifre en az 6 karakter olmalıdır.")
      sifre = input("Şifre belirleyiniz: ")
  print("Şifre kabul edildi.")
  ```
]

*Soru 8: `continue` Kullanmadan 3'ün Katlarını Atlama*
#kod-blok(width: 100%)[
  ```python
  for i in range(1, 11):
      if i % 3 != 0:
          print(i, end=" ")
  ```
]

*Soru 9: İç İçe Döngü ile Dikdörtgen Yıldız Deseni*
#kod-blok(width: 100%)[
  ```python
  satir = int(input("Satır sayısı: "))
  sutun = int(input("Sütun sayısı: "))
  for _ in range(satir):
      for _ in range(sutun):
          print("*", end=" ")
      print()
  ```
]

*Soru 10: Sayı Piramidi Deseni*
#kod-blok(width: 100%)[
  ```python
  for i in range(1, 6):
      for _ in range(i):
          print(i, end=" ")
      print()
  ```
]
