#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Başlangıç, Bitiş ve Adım Değerleri

`range()` fonksiyonunun üç farklı parametre kombinasyonu sayesinde döngü sayacının nereden başlayacağı, nerede duracağı ve kaçar kaçar ilerleyeceği esnek biçimde belirlenebilir.

*1. Tek Parametreli Kullanım: `range(bitis)`*
Sayaç varsayılan olarak `0`'dan başlar ve girilen bitiş değerine kadar (bitiş hariç) birer birer artarak ilerler. `range(3)` çağrısı `0`, `1` ve `2` değerlerini üretir; döngü toplam 3 kez döner.

*2. Çift Parametreli Kullanım: `range(baslangic, bitis)`*
Sayacın sıfırdan değil, belirlenen özel bir sayıdan başlaması istendiğinde kullanılır. `range(5, 8)` çağrısı `5`, `6` ve `7` değerlerini üretir; döngü 3 kez döner.

*3. Üç Parametreli Kullanım: `range(baslangic, bitis, artis_miktari)`*
Sayacın kaçar kaçar artacağını veya azalacağını belirleyen üçüncü bir parametre (adım) eklenir. Eğer artış miktarı negatif seçilirse döngü geriye doğru sayma işlemi gerçekleştirir.

#kod-cikti(baslik: "İkişer İleri Sayma", columns: (30em, auto))[
  ```python
  # 2'den 9'a kadar (9 hariç) 2'şer artır
  for sayi in range(2, 9, 2):
      print(sayi, end=" ")
  ```
][
  ```text
  2 4 6 8
  ```
]

#kod-cikti(baslik: "Geriye Doğru Sayma", columns: (30em, auto))[
  ```python
  # 8'den 2'ye kadar (2 hariç) 2'şer azalt
  for sayi in range(8, 2, -2):
      print(sayi, end=" ")
  ```
][
  ```text
  8 6 4
  ```
]

#not_block(title: "Dikkat:")[
  Geriye doğru sayarken `baslangic` değerinin `bitis` değerinden *büyük* ve adım değerinin *negatif* olması gerekir. Örneğin `range(2, 8, -1)` hiçbir değer üretmez ve döngü hiç çalışmaz. Ayrıca `range()` yalnızca *tam sayılar (`int`)* ile çalışır; ondalıklı adım değeri verilmek istenirse `TypeError` hatası alınır.
]
