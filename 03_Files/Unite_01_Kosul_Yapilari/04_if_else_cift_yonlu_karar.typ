#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== if-else (Eğer-Değilse) Çift Yönlü Karar Mekanizmaları

Bir koşulun sağlanması durumunda bir işlem, sağlanmaması durumunda ise *farklı bir işlem* yapılması gerektiğinde `if-else` yapısı kullanılır. Bu yapıda iki alternatif yol vardır ve program çalışırken bu iki yoldan *yalnızca biri* yürütülür; ikisinin birden çalışması veya ikisinin birden atlanması mümkün değildir.

#kod-blok(width: 100%)[
  ```python
  if kosul:
      # Koşul True ise çalışacak kodlar
  else:
      # Koşul False ise çalışacak kodlar
  ```
]

`else` anahtar kelimesi "aksi halde / değilse" anlamına gelir ve kendi başına bir koşul almaz; çünkü `if` koşulunun `False` olduğu tüm durumları kapsar. `else:` satırı `if` ile aynı girinti hizasında yazılır.

#kod-cikti(baslik: "Yaş Kontrolü (Reşit / Reşit Değil)", columns: (30em, auto))[
  ```python
  yas = int(input("Yaşınızı giriniz: "))

  if yas >= 18:
      print("Ehliyet başvurusu yapabilirsiniz.")
  else:
      kalan = 18 - yas
      print(f"Başvuru için {kalan} yıl daha beklemelisiniz.")
  ```
][
  ```text
  Yaşınızı giriniz: 15
  Başvuru için 3 yıl daha beklemelisiniz.
  ```
]

Kullanıcı `15` girdiğinde `yas >= 18` ifadesi `False` sonucunu üretir. Bu nedenle `if` bloku atlanır ve doğrudan `else` bloku çalıştırılır.
