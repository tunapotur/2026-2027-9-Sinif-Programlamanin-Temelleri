#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Kod Blokları ve Girinti (Indentation) Kuralı

C++, Java, C\# veya JavaScript gibi dillerde bir kod blokunun hangi koşula veya döngüye ait olduğunu belirtmek için süslü parantezler (`{ }`) kullanılır. Python dil mimarisinde ise bu işlem, kod satırlarının başına konulan *girinti (indentation)* ile gerçekleştirilir.

Python yorumlayıcısı, bir kontrol yapısının (`if`, `elif`, `else`, `for`, `while`) başladığını belirten iki nokta (`:`) sembolünü gördüğü andan itibaren bir sonraki satırın içe doğru kaydırılmasını bekler. Standart olarak *4 boşluk* (veya editörde 1 `Tab` tuşu) kullanılır. Aynı girinti seviyesinde bulunan ardışık tüm satırlar, tek bir mantıksal blok olarak kabul edilir.

#kod-cikti(baslik: "Doğru Girinti Kullanımı", columns: (30em, auto))[
  ```python
  puan = 85
  if puan >= 50:
      print("Tebrikler!")
      print("Dersi geçtiniz.")
  print("Kontrol tamamlandı.")
  ```
][
  ```text
  Tebrikler!
  Dersi geçtiniz.
  Kontrol tamamlandı.
  ```
]

#kod-cikti(baslik: "Hatalı Girinti (IndentationError)", columns: (30em, auto))[
  ```python
  puan = 85
  if puan >= 50:
  print("Tebrikler!")
  ```
][
  ```text
  IndentationError: expected an indented block
  ```
]

Yukarıdaki doğru örnekte `print("Tebrikler!")` ve `print("Dersi geçtiniz.")` satırları 4 boşluk içeriden yazıldığı için `if` blokuna aittir ve yalnızca koşul `True` olduğunda çalışır. En alttaki `print("Kontrol tamamlandı.")` satırı ise girintisiz olduğu için `if` blokunun dışındadır; koşul sağlansa da sağlanmasa da her durumda çalışır.

#not_block(title: "Dikkat:")[
  Aynı blok içindeki satırlarda boşluk ve `Tab` karakterini karıştırmamak gerekir. Girinti kuralının ihlal edilmesi veya tutarsız boşluk bırakılması durumunda Python `IndentationError` (Girinti Hatası) vererek programı durdurur.
]
