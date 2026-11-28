#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#pagebreak()
=== Uygulama Soruları Cevapları

*Soru 1: Pozitif / Negatif Kontrolü*
#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Bir tam sayı giriniz: "))
  if sayi > 0:
      print("Pozitif sayı girdiniz.")
  print("Program sona erdi.")
  ```
]

*Soru 2: Reşitlik Kontrolü*
#kod-blok(width: 100%)[
  ```python
  yas = int(input("Yaşınız: "))
  if yas >= 18:
      print("Oy kullanabilirsiniz.")
  else:
      print(f"Oy kullanmak için {18 - yas} yıl beklemelisiniz.")
  ```
]

*Soru 3: Tek mi Çift mi?*
#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Sayı giriniz: "))
  if sayi % 2 == 0:
      print(f"{sayi} çift sayıdır.")
  else:
      print(f"{sayi} tek sayıdır.")
  ```
]

*Soru 4: 3 ve 5'e Bölünebilme*
#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Sayı giriniz: "))
  if sayi % 3 == 0 and sayi % 5 == 0:
      print("15'in katıdır.")
  else:
      print("15'in katı değildir.")
  ```
]

*Soru 5: Komut Doğrulama (Büyük/Küçük Harf Duyarsız)*
#kod-blok(width: 100%)[
  ```python
  komut = input("Komut giriniz (baslat/durdur): ")
  if komut.lower() == "baslat":
      print("Sistem başlatılıyor...")
  else:
      print("Sistem durduruldu.")
  ```
]

*Soru 6: Su Sıcaklığına Göre Madde Hâli*
#kod-blok(width: 100%)[
  ```python
  sicaklik = float(input("Sıcaklık (°C): "))
  if sicaklik <= 0:
      print("Suyun hâli: Katı (Buz)")
  elif sicaklik >= 100:
      print("Suyun hâli: Gaz (Buhar)")
  else:
      print("Suyun hâli: Sıvı (Su)")
  ```
]

*Soru 7: Kargo Ücreti Hesaplama*
#kod-blok(width: 100%)[
  ```python
  sepet = float(input("Sepet tutarı (TL): "))
  if sepet >= 500:
      kargo = 0
  elif sepet >= 200:
      kargo = 30
  else:
      kargo = 50
  print(f"Kargo ücreti: {kargo} TL")
  print(f"Toplam ödeme: {sepet + kargo:.2f} TL")
  ```
]

*Soru 8: İç İçe Koşul ile Sinema Bileti*
#kod-blok(width: 100%)[
  ```python
  yas = int(input("Yaşınız: "))
  if yas >= 18:
      print("Bilet ücreti: 150 TL")
  else:
      ogrenci = input("Öğrenci misiniz? (evet/hayır): ")
      if ogrenci.lower() == "evet":
          print("Bilet ücreti: 80 TL")
      else:
          print("Bilet ücreti: 100 TL")
  ```
]

*Soru 9: Üçgen Oluşturma ve Çeşit Belirleme*
#kod-blok(width: 100%)[
  ```python
  a = float(input("1. kenar: "))
  b = float(input("2. kenar: "))
  c = float(input("3. kenar: "))

  if a > 0 and b > 0 and c > 0 and (a + b > c and a + c > b and b + c > a):
      print("Üçgen oluşturulabilir.")
  else:
      print("Üçgen oluşturulamaz.")
  ```
]

*Soru 10: Güvenli Bölme (Kısa Devre Mantığı)*
#kod-blok(width: 100%)[
  ```python
  bolunen = int(input("Bölünen: "))
  bolen = int(input("Bölen: "))

  if bolen != 0 and bolunen / bolen >= 2:
      print(f"Sonuç: {bolunen / bolen}")
  else:
      print("Bölme yapılamadı veya sonuç 2'den küçük.")
  ```
]
