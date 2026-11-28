#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Sonsuz Döngü

`while` döngüsünde koşul ifadesi hiçbir zaman `False` durumuna düşmezse döngü durmaksızın çalışmaya devam eder. Bu duruma *sonsuz döngü (infinite loop)* denir. Sonsuz döngüler çoğunlukla yazılımcının sayaç değişkenini güncellemeyi unutması veya yanlış bir koşul yazması sonucu ortaya çıkan mantıksal bir hatadır.

#kod-blok(width: 100%)[
  ```python
  # HATA: sayac hiç artırılmadığı için sayac <= 5 her zaman True kalır!
  sayac = 1
  while sayac <= 5:
      print(sayac)
  ```
]

#kod-cikti(baslik: "DOĞRU: sayac her adımda güncellenir", columns: (30em, auto))[
  ```python
  sayac = 1
  while sayac <= 5:
      print(sayac)
      sayac += 1
  ```
][
  ```text
  1
  2
  3
  4
  5
  ```
]

Bazen de sunucu dinleme, oyun döngüsü veya ana menü ekranları gibi durumlarda programın kullanıcı çıkmak isteyene kadar sürekli çalışması bilinçli olarak istenir. Bu tür senaryolarda `while True:` yapısı tercih edilebilir; ancak döngü içinde mutlaka bir çıkış koşulu (örneğin bir bayrak değişkeni veya `break`) bulunmalıdır.

#not_block(title: "Dikkat:")[
  Programınız yanlışlıkla sonsuz döngüye girdiğinde terminal veya editör donmuş gibi görünür ve sürekli çıktı üretir. Böyle bir durumda terminalde *`Ctrl + C`* tuş bileşimine basarak çalışan programı durdurabilirsiniz.
]
