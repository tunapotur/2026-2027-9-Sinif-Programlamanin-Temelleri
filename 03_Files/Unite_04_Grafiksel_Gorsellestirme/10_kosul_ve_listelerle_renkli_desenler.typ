#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Koşul ve Listelerle Renkli Desenler

Bu bölümde öğrendiğimiz *koşul yapıları (`if-else`)*, *döngüler (`for`)* ve *listeler (`list`)* bir araya getirildiğinde çok daha dinamik görseller üretilebilir.

- *Listelerle Renk Döngüsü:* Renk isimlerini bir listede saklayıp mod (`%`) operatörüyle (`renkler[i % len(renkler)]`) her adımda sıradaki rengi seçebiliriz.
- *Koşullarla Seçimli Boyama:* Örneğin satır ve sütun numaralarının toplamı çiftse siyah, tekse beyaz boyayarak bir *satranç tahtası* veya ızgara deseni oluşturabiliriz.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)

  renkler = ["red", "orange", "gold", "green", "blue", "purple"]

  # Renk listesi kullanarak gökkuşağı spirali
  for adim in range(36):
      secilen_renk = renkler[adim % len(renkler)]
      kalem.pencolor(secilen_renk)
      kalem.forward(adim * 4)
      kalem.right(60)

  turtle.done()
  ```
]

#not_block(title: "Kazanım Özeti:")[
  `renkler[adim % len(renkler)]` ifadesi, `adim` değişkeni liste uzunluğunu aşsa bile indeksi sürekli `0` ile `len(renkler) - 1` arasında döndürerek `IndexError` hatasını önler ve renklerin sırayla tekrarlanmasını sağlar.
]
