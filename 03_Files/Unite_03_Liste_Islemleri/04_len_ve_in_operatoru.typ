#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== `len()` Fonksiyonu ve `in` Operatörü

Bir veri kümesi üzerinde işlem yapmadan önce o kümenin içinde kaç eleman bulunduğunu ve aradığımız bir değerin listede yer alıp almadığını bilmemiz gerekir. Python bunun için iki temel araç sunar:

- *`len(liste)` Fonksiyonu:* Listenin toplam eleman sayısını (`int`) döndürür. Boş bir liste için `0` değerini verir. Son elemanın pozitif indisi her zaman `len(liste) - 1`'dir.
- *`in` ve `not in` Operatörleri:* Bir değerin listede bulunup bulunmadığını kontrol eder ve sonuç olarak `True` ya da `False` döndürür. Özellikle `if` karar yapılarıyla birlikte çok sık kullanılır.

#kod-cikti(baslik: "len() ve in Kullanımı", columns: (31em, auto))[
  ```python
  moduller = ["Menü", "Hesaplama", "Raporlama"]
  print(f"Toplam modül sayısı: {len(moduller)}")

  aranan = "Raporlama"
  if aranan in moduller:
      print(f"{aranan} modülü sistemde mevcut.")

  if "Ayarlar" not in moduller:
      print("Ayarlar modülü henüz eklenmemiş.")
  ```
][
  ```text
  Toplam modül sayısı: 3
  Raporlama modülü sistemde mevcut.
  Ayarlar modülü henüz eklenmemiş.
  ```
]
