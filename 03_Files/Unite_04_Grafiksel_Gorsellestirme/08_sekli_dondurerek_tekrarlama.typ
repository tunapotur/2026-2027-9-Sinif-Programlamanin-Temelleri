#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Bir Şekli Döndürerek Tekrarlama

Mandala veya çiçek benzeri dairesel desenler oluşturmanın en pratik yolu, tek bir geometrik şekli merkez etrafında belirli bir açıyla döndürerek tekrar etmektir. Şekil toplam $N$ kez döndürülüp tam bir daire ($360°$) tamamlanacaksa, her şekil sonrasında dönülecek açı `360 / N` olmalıdır.

Örneğin 12 adet kareyi her seferinde $360 / 12 = 30°$ döndürerek çizersek simetrik bir yıldız/çiçek deseni ortaya çıkar.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(0)
  kalem.pencolor("purple")

  tekrar = 12
  for _ in range(tekrar):
      # İç döngü: Bir adet kare çizer
      for _ in range(4):
          kalem.forward(100)
          kalem.right(90)
      # Dış döngü: Bir sonraki kare için açıyı kaydırır
      kalem.right(360 / tekrar)

  turtle.done()
  ```
]
