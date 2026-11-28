#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Turtle Kütüphanesini Projeye Dahil Etme

`turtle`, Python kurulumuyla birlikte hazır gelen yerleşik bir modüldür; ancak `print()` veya `range()` gibi doğrudan kullanılmaz. Kodumuzda kullanabilmek için önce `import` anahtar kelimesiyle projeye dâhil edilmelidir.

İki yaygın kullanım biçimi vardır:
+ *Modül adıyla içe aktarma (`import turtle`):* Komutlar `turtle.forward(100)` şeklinde çağrılır veya `kalem = turtle.Turtle()` ile bir çizim nesnesi oluşturulur. Büyük projelerde isim çakışmasını önlediği için en güvenli yöntemdir.
+ *Kısa adla içe aktarma (`import turtle as t`):* Her defasında `turtle` yazmak yerine `t.forward(100)` gibi kısa yazım sağlar.

#kod-blok(width: 100%)[
  ```python
  import turtle

  ekran = turtle.Screen()     # Çizim penceresini oluştur
  kalem = turtle.Turtle()     # Çizim yapacak kaplumbağa nesnesini oluştur
  kalem.shape("turtle")       # İmlecin görünümünü kaplumbağa yap

  kalem.forward(100)          # 100 piksel ileri çiz

  turtle.done()               # Pencerenin hemen kapanmasını önle
  ```
]

#not_block(title: "Dikkat:")[
  Dosyanıza asla `turtle.py` adını vermeyin! Aksi hâlde Python gerçek `turtle` kütüphanesi yerine sizin kendi dosyanızı içe aktarmaya çalışır ve `AttributeError` hatası alırsınız. Ayrıca çizimin ekranda kalması için programın en sonuna `turtle.done()` (veya `ekran.mainloop()`) eklenmelidir.
]
