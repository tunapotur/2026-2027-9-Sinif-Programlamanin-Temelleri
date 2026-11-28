#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== İç İçe Koşul mu, Mantıksal Operatör mü?

Birçok problem hem iç içe `if` yapılarıyla hem de `and` / `or` mantıksal operatörleriyle çözülebilir. Hangi yaklaşımın seçileceği, *koşullar başarısız olduğunda farklı hata mesajları verilip verilmeyeceğine* ve *kodun okunabilirliğine* bağlıdır.

- *Mantıksal Operatörler (`and`, `or`) Tercih Edilir:* Tüm şartların aynı anda sağlanması veya sağlanmadığında tek bir ortak mesaj verilmesi yeterliyse, tek satırda `and`/`or` kullanmak kodu sadeleştirir ve gereksiz girinti derinliğini önler.
- *İç İçe Koşul Tercih Edilir:* İlk koşulun sonucuna göre kullanıcıdan *yeni bir veri alınacaksa* veya her aşamanın başarısızlık nedeni kullanıcıya *ayrı ayrı bildirilecekse* iç içe yapı daha uygundur.

#kod-cikti(baslik: "Yöntem A: İç İçe Koşul (Ayrı geri bildirim)", columns: (30em, auto))[
  ```python
  yas = 20
  bakiye = 50
  if yas >= 18:
      if bakiye >= 100:
          print("Sipariş onaylandı.")
      else:
          print("Bakiyeniz yetersiz.")
  else:
      print("18 yaş sınırı vardır.")
  ```
][
  ```text
  Bakiyeniz yetersiz.
  ```
]

#kod-cikti(baslik: "Yöntem B: Mantıksal Operatör (Ortak karar)", columns: (30em, auto))[
  ```python
  yas = 20
  bakiye = 50
  if yas >= 18 and bakiye >= 100:
      print("Sipariş onaylandı.")
  else:
      print("Sipariş şartları sağlanmadı.")
  ```
][
  ```text
  Sipariş şartları sağlanmadı.
  ```
]

#not_block(title: "İpucu:")[
  Temiz kod (clean code) ilkelerine göre, eğer iki farklı koşul için ayrı ayrı mesaj vermeniz gerekmiyorsa iç içe `if` yazmak yerine `and` operatörüyle tek bir `if` satırında birleştirmek her zaman daha okunaklıdır.
]
