#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Çizim Ekranı ve Koordinat Sistemi

Turtle çizim ekranı, tam ortası *(0, 0) başlangıç noktası (orijin)* olan iki boyutlu bir kartezyen koordinat sistemidir. Kaplumbağa program ilk açıldığında `(0, 0)` noktasında bulunur ve yüzü doğuya (sağa, `0°` açısına) dönüktür.

- *X Ekseni (Yatay):* Sağa gidildikçe X değeri artar (`+x`), sola gidildikçe azalır (`-x`).
- *Y Ekseni (Düşey):* Yukarı çıkıldıkça Y değeri artar (`+y`), aşağı inildikçe azalır (`-y`).

Çizim penceresinin boyutunu, başlığını ve arka plan rengini `Screen()` nesnesi üzerinden ayarlayabiliriz; kaplumbağayı doğrudan belirli bir `(x, y)` noktasına taşımak için ise `goto(x, y)` komutu kullanılır.

#kod-blok(width: 100%)[
  ```python
  import turtle

  ekran = turtle.Screen()
  ekran.setup(width=600, height=400)   # Pencere boyutunu 600x400 piksel yap
  ekran.title("Koordinat Düzlemi")     # Pencere başlığı
  ekran.bgcolor("lightyellow")         # Arka plan rengi

  kalem = turtle.Turtle()
  kalem.goto(100, 50)                  # (0, 0)'dan (100, 50) noktasına git
  kalem.goto(-100, -50)                # (-100, -50) noktasına git
  kalem.home()                         # Başlangıç noktası (0, 0)'a dön

  turtle.done()
  ```
]
