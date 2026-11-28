#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== İç İçe Döngülerle Karmaşık Geometrik Desenlerin Üretimi

Tek bir döngüyle düzgün bir çokgen çizerken, bu döngüyü başka bir döngünün içine aldığımızda (iç içe döngü) çok sayıda geometrik şeklin bir araya gelmesinden oluşan sanatsal ve simetrik desenler elde ederiz.

İç içe döngülerde *iç döngü* temel şekli (örneğin bir kareyi veya altıgeni) çizerken, *dış döngü* her şekil tamamlandıktan sonra konumu, açıyı veya boyutu değiştirerek bir sonraki şeklin çizilmesini sağlar.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)

  # İç içe karelerden oluşan tünel deseni
  kenar_uzunlugu = 20
  for _ in range(10):
      for _ in range(4):
          kalem.forward(kenar_uzunlugu)
          kalem.right(90)
      kenar_uzunlugu += 15   # Her karede kenarı 15 piksel büyüt

  turtle.done()
  ```
]
