#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Koşula Bağlı Tekrar: `while` Döngüsü

Döngünün kaç kez çalışacağı başlangıçta bilinmiyorsa ve tekrar süreci tamamen bir mantıksal koşulun doğruluğuna (`True`) bağlıysa *`while` döngüsü* kullanılır. İngilizcede "-ken, ... olduğu sürece" anlamına gelen `while`, koşul ifadesi `True` ürettiği sürece altındaki kod blokunu aralıksız olarak çalıştırmaya devam eder. Koşul `False` değerine döndüğü anda döngü sona erer ve program döngüden sonraki satırdan devam eder.

#kod-blok(width: 100%)[
  ```python
  while kosul:
      # Koşul True olduğu sürece çalışacak kodlar
      # (Koşulu değiştirecek güncelleme adımı unutulmamalıdır!)
  ```
]

Döngü mekanizmalarında bir değişkenin mevcut değerinin üzerine yeni bir sayı eklemek, çıkarmak veya değeri katlamak çok sık yapılan bir işlemdir. Değişkenin kendi değerini güncellediği bu durumlarda `sayac = sayac + 1` yazmak yerine okunabilirliği artıran bileşik atama operatörleri (`+=`, `-=`, `*=`, `/=`) kullanılır.

#kod-cikti(baslik: "while Döngüsü ile Sayaç Kontrolü", columns: (30em, auto))[
  ```python
  sayac = 1

  while sayac <= 3:
      print(f"Mevcut Sayaç Değeri: {sayac}")
      sayac += 1  # Sayaç değeri 1 artırılır (güncelleme adımı)

  print("Döngü tamamlandı.")
  ```
][
  ```text
  Mevcut Sayaç Değeri: 1
  Mevcut Sayaç Değeri: 2
  Mevcut Sayaç Değeri: 3
  Döngü tamamlandı.
  ```
]

Yukarıdaki örnekte `sayac` başlangıçta `1` değerini alır. Her turda `sayac <= 3` koşulu kontrol edilir; koşul `True` olduğu için ekrana yazdırılır ve `sayac += 1` ile değeri artırılır. `sayac` değeri `4` olduğunda `4 <= 3` koşulu `False` olur ve döngü sonlanır.
