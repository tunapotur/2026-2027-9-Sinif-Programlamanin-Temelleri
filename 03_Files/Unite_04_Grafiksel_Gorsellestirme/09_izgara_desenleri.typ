#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Izgara (Satır-Sütun) Desenleri

Satır ve sütunlardan oluşan ızgara (grid) desenleri çizmek için dış döngü *satırları* (Y ekseni), iç döngü ise *sütunları* (X ekseni) kontrol eder. Her hücreye geçerken kalem kaldırılır (`penup()`), yeni koordinata gidilir (`goto(x, y)`), kalem indirilir (`pendown()`) ve o hücrenin şekli çizilir.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)

  boyut = 30
  aralik = 40

  for satir in range(4):          # 4 satır
      for sutun in range(5):      # Her satırda 5 sütun
          x = -100 + sutun * aralik
          y = 80 - satir * aralik

          kalem.penup()
          kalem.goto(x, y)
          kalem.pendown()

          for _ in range(4):      # Her hücreye 30x30 kare çiz
              kalem.forward(boyut)
              kalem.right(90)

  turtle.done()
  ```
]
