#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#pagebreak()
=== Uygulama Soruları Cevapları

*Soru 1: Ekran Ayarları ve Koordinatlara Çizgi Çizme*
#kod-blok(width: 100%)[
  ```python
  import turtle

  ekran = turtle.Screen()
  ekran.setup(width=500, height=500)
  ekran.bgcolor("lightcyan")

  kalem = turtle.Turtle()
  kalem.goto(100, 100)
  kalem.goto(-100, 100)
  kalem.goto(0, 0)
  turtle.done()
  ```
]

*Soru 2: Hareket ve Yön Komutlarıyla Merdiven Çizimi*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.forward(40)
  kalem.left(90)
  kalem.forward(40)
  kalem.right(90)
  kalem.forward(40)
  kalem.left(90)
  kalem.forward(40)
  kalem.right(90)
  kalem.forward(40)
  kalem.left(90)
  kalem.forward(40)
  turtle.done()
  ```
]

*Soru 3: Kalem Kaldırma ve İki Ayrı Şekil*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.pensize(4)
  kalem.pencolor("blue")
  kalem.penup()
  kalem.goto(-120, 0)
  kalem.pendown()
  kalem.forward(60)

  kalem.penup()
  kalem.goto(60, 0)
  kalem.pencolor("red")
  kalem.pendown()
  kalem.forward(60)
  turtle.done()
  ```
]

*Soru 4: İçi Boyalı Üçgen (Dolgu Ayarları)*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.pencolor("darkgreen")
  kalem.fillcolor("lightgreen")
  kalem.begin_fill()
  for _ in range(3):
      kalem.forward(120)
      kalem.left(120)
  kalem.end_fill()
  turtle.done()
  ```
]

*Soru 5: Kullanıcı Girdisine Göre Düzgün Çokgen*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kenar = int(input("Kenar sayısı: "))
  uzunluk = int(input("Kenar uzunluğu: "))
  aci = 360 / kenar
  print(f"Dönüş açısı: {aci} derece")

  kalem = turtle.Turtle()
  for _ in range(kenar):
      kalem.forward(uzunluk)
      kalem.right(aci)
  turtle.done()
  ```
]

*Soru 6: İç İçe Büyüyen Altıgenler*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  uzunluk = 20
  for _ in range(6):
      for _ in range(6):
          kalem.forward(uzunluk)
          kalem.right(60)
      uzunluk += 15
  turtle.done()
  ```
]

*Soru 7: Kareyi Döndürerek Çiçek Deseni Oluşturma*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  for _ in range(18):
      for _ in range(4):
          kalem.forward(90)
          kalem.right(90)
      kalem.right(20)
  turtle.done()
  ```
]

*Soru 8: 3×4 Kare Izgara (Satır-Sütun) Deseni*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  for satir in range(3):
      for sutun in range(4):
          kalem.penup()
          kalem.goto(-90 + sutun * 45, 60 - satir * 45)
          kalem.pendown()
          for _ in range(4):
              kalem.forward(30)
              kalem.right(90)
  turtle.done()
  ```
]

*Soru 9: Renk Listesi ile Çokgen Spirali*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  renkler = ["red", "blue", "green", "orange"]

  for i in range(24):
      kalem.pencolor(renkler[i % len(renkler)])
      kalem.forward(i * 5)
      kalem.right(90)
  turtle.done()
  ```
]

*Soru 10: Koşul ile İki Renkli Satranç Tahtası (4×4)*
#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  boyut = 35

  for satir in range(4):
      for sutun in range(4):
          kalem.penup()
          kalem.goto(-70 + sutun * boyut, 70 - satir * boyut)
          kalem.pendown()
          if (satir + sutun) % 2 == 0:
              kalem.fillcolor("black")
          else:
              kalem.fillcolor("white")
          kalem.begin_fill()
          for _ in range(4):
              kalem.forward(boyut)
              kalem.right(90)
          kalem.end_fill()
  turtle.done()
  ```
]
