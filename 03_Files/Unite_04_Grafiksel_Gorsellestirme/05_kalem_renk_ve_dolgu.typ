#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Kalem, Renk ve Dolgu Ayarları

Çizim yaparken imlecin iz bırakıp bırakmayacağını, çizginin kalınlığını, rengini ve kapalı şekillerin iç dolgusunu kontrol edebiliriz:

- *Kalemi Kaldırma ve İndirme:* `penup()` (`pu()`) komutu kalemi kâğıttan kaldırır; imleç hareket eder ama çizgi çizmez. `pendown()` (`pd()`) komutu kalemi tekrar indirerek çizimi başlatır.
- *Kalem Rengi ve Kalınlığı:* `pencolor("renk")` çizgi rengini, `pensize(kalinlik)` çizgi kalınlığını ayarlar. Renk adı (`"red"`, `"navy"`, `"orange"`) veya HEX kodu (`"#1d4ed8"`) verilebilir.
- *İç Dolgu (Fill):* Bir kapalı şeklin içini boyamak için çizime başlamadan önce `fillcolor("renk")` ve `begin_fill()` yazılır; şekil tamamlandığında `end_fill()` çağrılarak içi doldurulur.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.pensize(3)
  kalem.pencolor("darkblue")
  kalem.fillcolor("gold")

  # İçi sarı, kenarı lacivert kare çizimi
  kalem.begin_fill()
  for _ in range(4):
      kalem.forward(100)
      kalem.right(90)
  kalem.end_fill()

  # Çizmeden sağa kayma
  kalem.penup()
  kalem.goto(150, 0)
  kalem.pendown()
  kalem.circle(40)   # Yarıçapı 40 piksel olan çember

  turtle.done()
  ```
]
