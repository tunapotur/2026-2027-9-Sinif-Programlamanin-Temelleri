#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

== Liste İşlemleri (Veri Kümeleri ve Döngü Entegrasyonu)

Bir sınıftaki 30 öğrencinin notunu veya bir marketteki 100 ürünün fiyatını saklamak için her biri adına ayrı değişken tanımlamak (`not1`, `not2`, ..., `not30`) hem pratik değildir hem de döngülerle işlenemez. Bunun yerine tüm bu verileri tek bir çatı altında, sıralı biçimde tutan veri yapılarına ihtiyaç duyarız.

=== Liste Kavramı ve Liste Oluşturma

Python programlama dilinde, birden fazla veriyi tek bir değişken ismi altında, belirli bir sıra dâhilinde saklayan ve sonradan değiştirilebilen (*mutable*) dinamik veri yapılarına *liste (`list`)* adı verilir.

Python'da bir liste oluşturulurken veriler köşeli parantez `[ ]` içerisine alınır ve her bir eleman birbirinden virgül (`,`) ile ayrılır. Listelerin en büyük esnekliği, içerilerinde aynı anda farklı veri türlerini (`int`, `float`, `str`, `bool` vb.) barındırabilmeleridir.

#kod-cikti(baslik: "Standart Liste Tanımlama Örnekleri", columns: (31em, auto))[
  ```python
  bos_liste = []
  dersler = ["Matematik", "Bilişim", "Fizik"]
  notlar = [85, 92, 78, 100]
  karma_veri = [150.50, 45, True, "Ayşe"]

  print(dersler)
  print(karma_veri)
  print(type(notlar))
  ```
][
  ```text
  ['Matematik', 'Bilişim', 'Fizik']
  [150.5, 45, True, 'Ayşe']
  <class 'list'>
  ```
]

#not_block(title: "Bilgi:")[
  Listeler *sıralıdır* (elemanların eklendiği sıra korunur), *değiştirilebilir* (eleman eklenebilir, silinebilir, güncellenebilir) ve *tekrarlı elemanlara izin verir* (aynı değer listede birden fazla kez bulunabilir).
]
