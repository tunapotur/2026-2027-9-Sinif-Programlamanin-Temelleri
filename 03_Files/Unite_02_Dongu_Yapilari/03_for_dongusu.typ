#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Belirli Sayıda Tekrar: `for` Döngüsü

Bir kod blokunun tam olarak kaç kez çalıştırılacağının başlangıçta net olarak bilindiği senaryolarda *`for` döngüsü* tercih edilir. `for` döngüsü; `range()` ile üretilen sayı aralıkları, metinsel ifadeler (`str`) veya listeler (`list`) gibi sıralı bir veri yapısının (*iterable*) her bir elemanını sırayla döngü değişkenine atayarak blok içindeki komutları çalıştırır.

#kod-blok(width: 100%)[
  ```python
  for degisken in siralı_veri_yapisi:
      # Her eleman için tekrarlanacak kod bloku (4 boşluk girintili)
  ```
]

Döngü her adımında (iterasyonunda) sıradaki elemanı `degisken` içine koyar ve girintili bloku baştan sona çalıştırır. Tüm elemanlar bittiğinde döngü kendiliğinden sona erer.

#kod-cikti(baslik: "range() ile Sayma", columns: (30em, auto))[
  ```python
  for i in range(4):
      print(f"Adım: {i}")
  ```
][
  ```text
  Adım: 0
  Adım: 1
  Adım: 2
  Adım: 3
  ```
]

#kod-cikti(baslik: "Metin (str) Üzerinde Gezinme", columns: (30em, auto))[
  ```python
  kelime = "KOD"
  for harf in kelime:
      print(harf)
  ```
][
  ```text
  K
  O
  D
  ```
]

#not_block(title: "İpucu:")[
  Döngü değişkeninin adını (`i`, `sayi`, `harf` vb.) yaptığınız işe uygun seçmek kodun anlaşılmasını kolaylaştırır. Sayaç değerini kod içinde hiç kullanmayacak, yalnızca bir işlemi `n` kez tekrar edeceksek değişken adı olarak alt çizgi (`_`) kullanmak yaygın bir Python alışkanlığıdır: `for _ in range(5):`.
]
