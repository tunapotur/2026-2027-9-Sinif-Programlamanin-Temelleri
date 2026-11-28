#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== if (Eğer) Tek Yönlü Karar Mekanizmaları

En temel karar yapısı `if` (eğer) yapısıdır. Belirtilen koşulun mantıksal sonucu `True` (Doğru) ise `if` bloku altında girintilenmiş olan kod satırları çalıştırılır. Koşul `False` (Yanlış) ise bu blok tamamen atlanır ve program `if` blokunun dışındaki ilk satırdan çalışmaya devam eder.

#kod-blok(width: 100%)[
  ```python
  if kosul:
      # Koşul True ise çalışacak kodlar
  ```
]

Tek yönlü karar mekanizmaları, yalnızca belirli bir şart gerçekleştiğinde ek bir işlem yapılmasını istediğimiz durumlarda kullanılır. Örneğin bir hava durumu uygulamasında sıcaklık 0 derecenin altındaysa don uyarısı verilmesi, değilse herhangi bir uyarı verilmemesi tek yönlü bir karardır.

#kod-cikti(baslik: "Koşul Sağlandığında (True)", columns: (30em, auto))[
  ```python
  sicaklik = -3
  if sicaklik < 0:
      print("Dikkat! Don tehlikesi var.")
  print("İyi günler.")
  ```
][
  ```text
  Dikkat! Don tehlikesi var.
  İyi günler.
  ```
]

#kod-cikti(baslik: "Koşul Sağlanmadığında (False)", columns: (30em, auto))[
  ```python
  sicaklik = 12
  if sicaklik < 0:
      print("Dikkat! Don tehlikesi var.")
  print("İyi günler.")
  ```
][
  ```text
  İyi günler.
  ```
]

#not_block(title: "Hatırlatma:")[
  Koşul ifadesinin sonunda mutlaka iki nokta (`:`) işareti bulunmalıdır. `=` atama operatörü, `==` ise eşitlik karşılaştırma operatörüdür; `if` koşullarında eşitlik kontrolü için daima `==` kullanılır.
]
