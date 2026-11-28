#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== `range()` Fonksiyonu

`for` döngülerinde ardışık sayısal aralıklar oluşturmak ve döngünün tam olarak istenen miktarda dönmesini sağlamak amacıyla Python'ın yerleşik *`range()`* (aralık) fonksiyonundan yararlanılır. `range()` fonksiyonu, verilen başlangıç, bitiş ve adım bilgilerine göre bir sayı dizisi üretir.

`range()` fonksiyonunun en önemli kuralı şudur: *Başlangıç değeri aralığa dâhildir, ancak bitiş değeri aralığa dâhil edilmez (bitiş - 1'e kadar gider).*

#icerik-tablo(
  tablo_baslik: "range() Fonksiyonunun Kullanım Biçimleri",
  sutunlar: (auto, 1fr, auto),
  sutun_basliklari: ("Kullanım", "Açıklama", "Üretilen Değerler"),
  icerik_hizalama: (left + horizon, left + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon),
  dikey-bosluk: 6pt,
  [`range(bitis)`], [0'dan başlar, 1'er artar, `bitis` hariç durur.], [`range(5)` → `0, 1, 2, 3, 4`],
  [`range(baslangic, bitis)`], [`baslangic`'tan başlar, 1'er artar, `bitis` hariç durur.], [`range(2, 6)` → `2, 3, 4, 5`],
  [`range(baslangic, bitis, adim)`], [`baslangic`'tan başlar, `adim` kadar değişir, `bitis` hariç durur.], [`range(1, 10, 2)` → `1, 3, 5, 7, 9`],
)

`range()` doğrudan ekrana yazdırıldığında tüm sayıları listelemek yerine bir aralık nesnesi gösterir. Ürettiği sayıları tek seferde görmek için `list(range(...))` şeklinde listeye dönüştürülebilir.

#kod-cikti(baslik: "range() Çıktılarının İncelenmesi", columns: (28em, auto))[
  ```python
  print(list(range(5)))
  print(list(range(3, 8)))
  print(list(range(10, 0, -2)))
  ```
][
  ```text
  [0, 1, 2, 3, 4]
  [3, 4, 5, 6, 7]
  [10, 8, 6, 4, 2]
  ```
]
