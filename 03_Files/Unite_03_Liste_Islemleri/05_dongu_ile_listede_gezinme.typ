#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Döngü ile Listede Gezinme

Listelerin gerçek gücü, `for` döngüsüyle birleştirildiklerinde ortaya çıkar. Listenin uzunluğu 5 eleman da olsa 5.000 eleman da olsa aynı döngü yapısıyla tüm elemanlar sırayla işlenebilir. Listede gezinmenin iki yaygın yöntemi vardır:

+ *Doğrudan Elemanlar Üzerinde Gezinme:* Yalnızca elemanların değerine ihtiyaç duyulduğunda kullanılır.
+ *İndis (`range(len(liste))`) ile Gezinme:* Hem elemanın sırasına (indisine) ihtiyaç duyulduğunda hem de listedeki elemanların değerini değiştirmek gerektiğinde kullanılır.

#kod-cikti(baslik: "Doğrudan Elemanlarla Gezinme", columns: (30em, auto))[
  ```python
  sehirler = ["Ankara", "İzmir", "Bursa"]
  for sehir in sehirler:
      print(f"Şehir: {sehir}")
  ```
][
  ```text
  Şehir: Ankara
  Şehir: İzmir
  Şehir: Bursa
  ```
]

#kod-cikti(baslik: "İndis ile Gezinme ve Güncelleme", columns: (30em, auto))[
  ```python
  notlar = [60, 70, 80]
  for i in range(len(notlar)):
      notlar[i] += 5
  print(notlar)
  ```
][
  ```text
  [65, 75, 85]
  ```
]

#not_block(title: "Bilgi Kutusu: Sıfır Tabanlı İndeksleme Tasarımı")[
  Günlük hayatta saymaya 1'den başlarken bilgisayar mimarisinde listelerin 0'dan başladığını unutmak, mantıksal hataların en temel kaynağıdır. `range(len(liste))` kullanıldığında `0`'dan `len(liste) - 1`'e kadar olan tüm geçerli indeksler otomatik olarak üretildiği için `IndexError` riski ortadan kalkar.
]
