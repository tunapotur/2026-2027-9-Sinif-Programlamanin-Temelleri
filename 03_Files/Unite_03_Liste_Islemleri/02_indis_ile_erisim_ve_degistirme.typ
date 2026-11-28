#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== İndis ile Elemanlara Erişme ve Eleman Değiştirme

Bir listenin içerisindeki belirli bir elemana doğrudan ulaşmak veya onu güncellemek için elemanın listedeki konum numarası kullanılır. Bu konum numarasına *indis (indeks / index)* adı verilir.

Python'da indeksleme iki şekilde yapılabilir:
- *Pozitif İndeksleme (Soldan Sağa):* Daima *`0`*'dan başlar. İlk eleman `0`, ikinci eleman `1`, $n$ elemanlı bir listenin son elemanı ise `n - 1` indeksindedir.
- *Negatif İndeksleme (Sondan Başa):* Listenin en sonundaki elemana `-1`, sondan ikinci elemana `-2` indeksi ile doğrudan ulaşılır.

#icerik-tablo(
  tablo_baslik: "meyveler = [\"Elma\", \"Armut\", \"Muz\", \"Çilek\"] İndis Yapısı",
  sutunlar: (auto, 1fr, 1fr, 1fr, 1fr),
  sutun_basliklari: ("İndeks Türü", "Eleman 1", "Eleman 2", "Eleman 3", "Eleman 4"),
  icerik_hizalama: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  dikey-bosluk: 5pt,
  [*Pozitif İndis*], [`0`], [`1`], [`2`], [`3`],
  [*Değer*], [`"Elma"`], [`"Armut"`], [`"Muz"`], [`"Çilek"`],
  [*Negatif İndis*], [`-4`], [`-3`], [`-2`], [`-1`],
)

Listeler değiştirilebilir yapıda olduğu için belirli bir indisteki elemana atama operatörü (`=`) ile yeni bir değer yazılabilir.

#kod-cikti(baslik: "Eleman Erişimi ve Güncelleme", columns: (30em, auto))[
  ```python
  meyveler = ["Elma", "Armut", "Muz", "Çilek"]
  print(meyveler[0])    # İlk eleman
  print(meyveler[-1])   # Son eleman

  meyveler[1] = "Kiraz" # 1. indisteki eleman değiştirildi
  print(meyveler)
  ```
][
  ```text
  Elma
  Çilek
  ['Elma', 'Kiraz', 'Muz', 'Çilek']
  ```
]

#not_block(title: "Dikkat (IndexError):")[
  Dört elemanlı bir listede geçerli pozitif indeksler `0, 1, 2, 3`'tür. Olmayan bir indekse (örneğin `meyveler[4]`) erişmeye çalışmak `IndexError: list index out of range` (liste indeksi aralık dışında) hatasına yol açar ve programı durdurur.
]
