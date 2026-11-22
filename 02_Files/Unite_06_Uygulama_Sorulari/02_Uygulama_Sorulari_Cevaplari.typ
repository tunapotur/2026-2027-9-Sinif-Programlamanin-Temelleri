#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

==== Soru 35: Çemberin çevresi ve alanı

#kod-blok(width: 100%)[
  ```python
  PI = 3.14159

  yaricap = float(input("Yarıçap (cm): "))

  cevre = 2 * PI * yaricap
  alan = PI * yaricap ** 2

  print(f"Çevre: {cevre:.2f} cm")
  print(f"Alan: {alan:.2f} cm²")
  ```
]

==== Soru 36: Vücut kitle endeksi (BMI)

#kod-blok(width: 100%)[
  ```python
  boy = float(input("Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):"))
  kilo = int(input("Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):"))

  bmi = kilo / boy ** 2

  print("Vücut Kitle Endeksiniz (BMI):", bmi)
  ```
]

==== Soru 37: Araç yakıt tüketimi

#kod-blok(width: 100%)[
  ```python
  print("Araç Kullanım Bilgileri Giriş Ekranı")

  yol = float(input("Gidilen Yol(km):"))
  yakit = float(input("Aldığınız Yakıt Miktarı(lt):"))
  tutar = float(input("Alınan Yakıt Tutarı:"))

  yuz_km_litre = yakit / yol * 100
  yuz_km_tutar = tutar / yol * 100

  print("100km 'de Harcanan Yakıtın Litresi:", yuz_km_litre)
  print("100km 'de Harcanan Yakıtın Tutarı:", yuz_km_tutar)
  ```
]

==== Soru 38: Sayıyı iki katının beş fazlasına güncelleme

#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: "))

  sayi = sayi * 2 + 5

  print("Girilen sayının değeri 2 katının 5 fazlası kadar arttırıldı")
  print("Sayının Yeni Değeri :", sayi)
  ```
]

==== Soru 39: Dik üçgende hipotenüs

#kod-blok(width: 100%)[
  ```python
  a = float(input("a Kenarının Uzunluğu: "))
  b = float(input("b Kenarının Uzunluğu: "))

  c = (a ** 2 + b ** 2) ** 0.5

  print("c Kenarının Uzunluğu(Hipotenüs): ", c)
  ```
]

