#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== İç İçe Döngüler

Bir döngü blokunun içine başka bir döngünün yerleştirilmesine *iç içe döngü (nested loop)* denir. Satır-sütun yapıları, tablolar, matrisler ve iki boyutlu desenler oluştururken iç içe döngülerden yararlanılır.

==== Dış ve İç Döngünün Çalışma Sırası

İç içe döngülerde temel kural şudur: *Dış döngünün her bir adımı (turu) için, iç döngü başından sonuna kadar tüm turlarını tamamlar.* Örneğin dış döngü 3 kez, iç döngü 4 kez dönüyorsa iç döngüdeki komutlar toplam $3 times 4 = 12$ kez çalışır. Bunu saat üzerindeki akrep ve yelkovan ilişkisine benzetebiliriz: Akrep 1 saat ilerlediğinde yelkovan 60 dakikalık tam turunu tamamlamış olur.

#kod-cikti(baslik: "Dış ve İç Döngü Adımlarının İzlenmesi", columns: (28em, auto))[
  ```python
  for dis in range(1, 3):
      for ic in range(1, 4):
          print(f"Dış: {dis}, İç: {ic}")
  ```
][
  ```text
  Dış: 1, İç: 1
  Dış: 1, İç: 2
  Dış: 1, İç: 3
  Dış: 2, İç: 1
  Dış: 2, İç: 2
  Dış: 2, İç: 3
  ```
]

==== Örnek: Çarpım Tablosu ve Yıldızlarla Desenler

İç içe döngülerin en klasik iki uygulaması çarpım tablosu üretmek ve ekrana yıldız (`*`) karakterleriyle geometrik şekiller çizmektir. Yıldız desenlerinde dış döngü *satır sayısını*, iç döngü ise o satırdaki *sütun (yıldız) sayısını* belirler.

#kod-cikti(baslik: "1–3 Arası Çarpım Tablosu", columns: (30em, auto))[
  ```python
  for i in range(1, 4):
      for j in range(1, 4):
          print(f"{i}x{j}={i*j}", end="\t")
      print() # Her satır bitiminde alt satıra geç
  ```
][
  ```text
  1x1=1   1x2=2   1x3=3
  2x1=2   2x2=4   2x3=6
  3x1=3   3x2=6   3x3=9
  ```
]

#kod-cikti(baslik: "Yıldızlarla Dik Üçgen Deseni", columns: (30em, auto))[
  ```python
  for satir in range(1, 5):
      for sutun in range(satir):
          print("*", end=" ")
      print()
  ```
][
  ```text
  * 
  * * 
  * * * 
  * * * * 
  ```
]
