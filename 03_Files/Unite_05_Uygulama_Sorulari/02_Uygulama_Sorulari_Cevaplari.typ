#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#pagebreak()
=== Genel Uygulama Soruları Cevapları

*Soru 1: Elektrik Faturası Kademe Hesabı*
#kod-blok(width: 100%)[
  ```python
  tuketim = float(input("Aylık tüketim (kWh): "))
  if tuketim <= 150:
      birim = 1.50
  elif tuketim <= 300:
      birim = 2.20
  else:
      birim = 3.00

  print(f"Birim fiyat: {birim:.2f} TL")
  print(f"Fatura tutarı: {tuketim * birim:.2f} TL")
  ```
]

*Soru 2: İndirim Kuponu ve Üyelik Kontrolü*
#kod-blok(width: 100%)[
  ```python
  tutar = float(input("Alışveriş tutarı (TL): "))
  kupon = input("Kupon kodu: ")

  if kupon.upper() == "INDIRIM20" and tutar >= 250:
      odeme = tutar * 0.80
      print(f"İndirim uygulandı! Ödenecek tutar: {odeme:.2f} TL")
  else:
      print(f"Ödenecek tutar: {tutar:.2f} TL")
  ```
]

*Soru 3: Artık Yıl (Leap Year) Kontrolü*
#kod-blok(width: 100%)[
  ```python
  yil = int(input("Yıl giriniz: "))
  if (yil % 4 == 0 and yil % 100 != 0) or (yil % 400 == 0):
      print(f"{yil} bir artık yıldır.")
  else:
      print(f"{yil} artık yıl değildir.")
  ```
]

*Soru 4: Faktöriyel Hesaplama*
#kod-blok(width: 100%)[
  ```python
  n = int(input("Faktöriyeli hesaplanacak sayı: "))
  faktoriyel = 1
  for i in range(1, n + 1):
      faktoriyel *= i
  print(f"{n}! = {faktoriyel}")
  ```
]

*Soru 5: Sayı Tahmin Hakkı (3 Hak)*
#kod-blok(width: 100%)[
  ```python
  gizli = 42
  hak = 3
  bildi = False

  while hak > 0 and not bildi:
      tahmin = int(input(f"Tahmininiz (Kalan hak {hak}): "))
      if tahmin == gizli:
          bildi = True
      else:
          hak -= 1

  if bildi:
      print("Tebrikler, bildiniz!")
  else:
      print(f"Hakkınız bitti, sayı {gizli} idi.")
  ```
]

*Soru 6: İç İçe Döngü ile Ters Yıldız Üçgeni*
#kod-blok(width: 100%)[
  ```python
  for satir in range(5, 0, -1):
      for _ in range(satir):
          print("*", end=" ")
      print()
  ```
]

*Soru 7: Alışveriş Sepeti Yönetimi*
#kod-blok(width: 100%)[
  ```python
  sepet = ["Ekmek", "Süt", "Yumurta"]
  sepet.append("Peynir")
  sepet.remove("Süt")
  print("Güncel sepet:", sepet)
  print("Sepetteki ürün sayısı:", len(sepet))
  ```
]

*Soru 8: En Yüksek 3 Notu Bulma*
#kod-blok(width: 100%)[
  ```python
  notlar = [55, 92, 74, 88, 63, 98, 70]
  notlar.sort(reverse=True)
  print("En yüksek 3 not:", notlar[:3])
  ```
]

*Soru 9: Tekrar Eden Kelimeyi Sayma*
#kod-blok(width: 100%)[
  ```python
  kelimeler = ["python", "kod", "python", "veri", "python", "döngü"]
  print(f"'python' kelimesi {kelimeler.count('python')} kez geçiyor.")
  print(f"İlk bulunduğu indis: {kelimeler.index('python')}")
  ```
]

*Soru 10: Turtle ile Hedef Tahtası (İç İçe Daireler)*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  for yaricap in [30, 60, 90]:
      kalem.penup()
      kalem.goto(0, -yaricap)
      kalem.pendown()
      kalem.circle(yaricap)
  turtle.done()
  ```
]

*Soru 11: Turtle ile Beşgen Yıldız Deseni*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.fillcolor("gold")
  kalem.begin_fill()
  for _ in range(5):
      kalem.forward(120)
      kalem.right(144)
  kalem.end_fill()
  turtle.done()
  ```
]

*Soru 12: Turtle ile Dönen Üçgenler*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  for _ in range(10):
      for _ in range(3):
          kalem.forward(100)
          kalem.right(120)
      kalem.right(36)
  turtle.done()
  ```
]

*Soru 13: Dinamik Not Girişi ve Geçen/Kalan Analizi*
#kod-blok(width: 100%)[
  ```python
  notlar = []
  girdi = input("Not giriniz (Çıkış için q): ")

  while girdi.lower() != "q":
      puan = int(girdi)
      if 0 <= puan <= 100:
          notlar.append(puan)
      else:
          print("Geçersiz not! 0-100 arası giriniz.")
      girdi = input("Not giriniz (Çıkış için q): ")

  if len(notlar) > 0:
      toplam = 0
      gecenler = []
      for n in notlar:
          toplam += n
          if n >= 50:
              gecenler.append(n)
      print(f"Toplam geçerli not: {len(notlar)}, Ortalama: {toplam / len(notlar):.1f}")
      print("Geçen notlar:", gecenler)
  ```
]

*Soru 14: Tek ve Çift Sayıları Ayırma ve Sıralama*
#kod-blok(width: 100%)[
  ```python
  sayilar = [45, 12, 7, 28, 33, 4, 19, 60]
  ciftler = []
  tekler = []

  for s in sayilar:
      if s % 2 == 0:
          ciftler.append(s)
      else:
          tekler.append(s)

  ciftler.sort()
  tekler.sort()
  print("Çiftler:", ciftler)
  print("Tekler:", tekler)
  ```
]

*Soru 15: Günlük Harcama Takibi ve Bütçe Uyarısı*
#kod-blok(width: 100%)[
  ```python
  harcamalar = []
  for gun in range(1, 6):
      tutar = float(input(f"{gun}. gün harcaması: "))
      harcamalar.append(tutar)

  toplam = 0
  en_yuksek = harcamalar[0]
  en_yuksek_gun = 1

  for i in range(len(harcamalar)):
      toplam += harcamalar[i]
      if harcamalar[i] > en_yuksek:
          en_yuksek = harcamalar[i]
          en_yuksek_gun = i + 1

  print(f"Toplam harcama: {toplam:.1f} TL")
  print(f"En yüksek harcama: {en_yuksek_gun}. gün ({en_yuksek:.1f} TL)")
  if toplam > 1000:
      print("Bütçe aşıldı!")
  else:
      print("Bütçe kontrol altında.")
  ```
]

*Soru 16: Etkileşimli Yapılacaklar Listesi Menüsü*
#kod-blok(width: 100%)[
  ```python
  gorevler = []
  secim = input("1-Ekle, 2-Sil, 3-Listele, 4-Çıkış: ")

  while secim != "4":
      if secim == "1":
          yeni = input("Eklenecek görev: ")
          gorevler.append(yeni)
      elif secim == "2":
          silinecek = input("Silinecek görev: ")
          if silinecek in gorevler:
              gorevler.remove(silinecek)
          else:
              print("Görev listede bulunamadı.")
      elif secim == "3":
          print("Görevler:", gorevler)
      else:
          print("Geçersiz seçim!")
      secim = input("1-Ekle, 2-Sil, 3-Listele, 4-Çıkış: ")

  print("Programdan çıkılıyor.")
  ```
]

*Soru 17: Kullanıcı Listesinden Çokgen Çizimi*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kenarlar = []
  k = int(input("Kenar sayısı (3-10, Çıkış 0): "))
  while k != 0:
      if 3 <= k <= 10:
          kenarlar.append(k)
      else:
          print("Lütfen 3 ile 10 arasında bir sayı giriniz.")
      k = int(input("Kenar sayısı (3-10, Çıkış 0): "))

  kalem = turtle.Turtle()
  kalem.speed(0)
  for i in range(len(kenarlar)):
      kalem.penup()
      kalem.goto(-200 + i * 110, 0)
      kalem.pendown()
      aci = 360 / kenarlar[i]
      for _ in range(kenarlar[i]):
          kalem.forward(40)
          kalem.right(aci)
  turtle.done()
  ```
]

*Soru 18: Veri Listesinden Renkli Sütun Grafiği*
#kod-blok(width: 100%)[
  ```python
  import turtle

  veriler = [45, 85, 30, 95, 60]
  kalem = turtle.Turtle()
  kalem.speed(0)

  for i in range(len(veriler)):
      deger = veriler[i]
      kalem.penup()
      kalem.goto(-150 + i * 60, -100)
      kalem.pendown()

      if deger >= 50:
          kalem.fillcolor("green")
      else:
          kalem.fillcolor("red")

      kalem.begin_fill()
      for _ in range(2):
          kalem.forward(40)
          kalem.left(90)
          kalem.forward(deger * 2)
          kalem.left(90)
      kalem.end_fill()
  turtle.done()
  ```
]

*Soru 19: Koordinat Listesi ve Koşullu Renkli Noktalar*
#kod-blok(width: 100%)[
  ```python
  import turtle

  noktalar = [[-120, 60], [80, 90], [-50, -70], [110, -40], [0, 50]]
  kalem = turtle.Turtle()

  for nokta in noktalar:
      x = nokta[0]
      y = nokta[1]
      kalem.penup()
      kalem.goto(x, y)
      if x >= 0:
          kalem.dot(16, "blue")
      else:
          kalem.dot(16, "orange")
  turtle.done()
  ```
]

*Soru 20: Renk Listesiyle Koşullu Spiral Matris*
#kod-blok(width: 100%)[
  ```python
  import turtle

  renkler = ["crimson", "royalblue", "forestgreen", "gold"]
  kalem = turtle.Turtle()
  kalem.speed(0)

  for satir in range(5):
      for sutun in range(5):
          kalem.penup()
          kalem.goto(-100 + sutun * 45, 100 - satir * 45)
          kalem.pendown()

          if satir == sutun:
              kalem.fillcolor("black")
              kalem.begin_fill()
              for _ in range(4):
                  kalem.forward(24)
                  kalem.right(90)
              kalem.end_fill()
          else:
              renk = renkler[(satir + sutun) % len(renkler)]
              kalem.pencolor(renk)
              kalem.circle(12)
  turtle.done()
  ```
]
