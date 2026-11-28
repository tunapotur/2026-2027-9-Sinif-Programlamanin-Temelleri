#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Döngülerle Düzgün Çokgen Çizimi

Bir düzgün çokgenin (eşkenar üçgen, kare, beşgen, altıgen vb.) tüm kenar uzunlukları ve dış açıları birbirine eşittir. Kaplumbağa bir çokgenin çevresini dolaşıp başlangıç noktasına döndüğünde toplam *360 derece* dönmüş olur. Bu nedenle $n$ kenarlı bir düzgün çokgen çizerken her köşede dönülecek dış açı:

$ "Dönüş Açısı" = frac(360, "Kenar Sayısı") $

formülüyle hesaplanır. Aynı `forward()` ve `right()` komutlarını `for` döngüsü içinde `kenar_sayisi` kez tekrarlayarak herhangi bir düzgün çokgeni yalnızca 3 satır kodla çizebiliriz.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  # Düzgün Altıgen (6 kenar, 360/6 = 60 derece)
  for _ in range(6):
      kalem.forward(80)
      kalem.right(60)

  turtle.done()
  ```
]

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kenar = int(input("Kenar sayısı (3-12): "))
  aci = 360 / kenar

  for _ in range(kenar):
      kalem.forward(70)
      kalem.right(aci)

  turtle.done()
  ```
]
