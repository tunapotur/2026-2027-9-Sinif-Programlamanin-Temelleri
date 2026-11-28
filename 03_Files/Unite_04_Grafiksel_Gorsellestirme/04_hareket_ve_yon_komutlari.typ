#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Hareket ve Yön Komutları

Turtle imlecini hareket ettirmek için iki temel komut grubu kullanılır: *ileri/geri hareket komutları* ve *dönme (açı) komutları*.

- `forward(px)` / `fd(px)`: İmleci baktığı yöne doğru `px` piksel ilerletir.
- `backward(px)` / `bk(px)`: İmlecin yönünü değiştirmeden geriye doğru `px` piksel taşır.
- `right(aci)` / `rt(aci)`: İmleci bulunduğu yerde saat yönünde `aci` derece döndürür.
- `left(aci)` / `lt(aci)`: İmleci bulunduğu yerde saat yönünün tersine `aci` derece döndürür.
- `speed(hiz)`: Çizim hızını `1` (en yavaş) ile `10` (hızlı) arasında ayarlar; `0` değeri animasyonsuz en hızlı çizimi sağlar.

#kod-blok(width: 100%)[
  ```python
  import turtle

  kalem = turtle.Turtle()
  kalem.speed(3)

  # Döngü kullanmadan basit bir L harfi ve dik açı çizimi
  kalem.forward(100)   # Sağa 100 piksel git
  kalem.left(90)       # Saat yönünün tersine 90 derece dön (yukarı bak)
  kalem.forward(80)    # Yukarı 80 piksel git

  turtle.done()
  ```
]
