#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Liste Dilimleme

Bir listenin tek bir elemanını değil, belirli bir aralıktaki *alt bölümünü (parçasını)* almak için *liste dilimleme (slicing)* kullanılır. Dilimleme işlemi `liste[baslangic:bitis:adim]` söz dizimiyle yapılır.

Tıpkı `range()` fonksiyonunda olduğu gibi `baslangic` indeksi dilime dâhil edilir, `bitis` indeksi ise *dâhil edilmez*. Dilimleme işlemi orijinal listeyi bozmaz; seçilen elemanlardan oluşan *yeni bir liste* döndürür.

#kod-cikti(baslik: "Liste Dilimleme Örnekleri", columns: (31em, auto))[
  ```python
  sayilar = [10, 20, 30, 40, 50, 60]

  print(sayilar[1:4])   # 1, 2, 3. indisler (4 hariç)
  print(sayilar[:3])    # Baştan 3. indise kadar
  print(sayilar[3:])    # 3. indisten sona kadar
  print(sayilar[::2])   # Baştan sona 2'şer atlayarak
  print(sayilar[::-1])  # Listeyi tersten dilimleme
  ```
][
  ```text
  [20, 30, 40]
  [10, 20, 30]
  [40, 50, 60]
  [10, 30, 50]
  [60, 50, 40, 30, 20, 10]
  ```
]

#not_block(title: "İpucu:")[
  Dilimlemede başlangıç veya bitiş değeri boş bırakılırsa Python başlangıcı `0`, bitişi ise listenin sonu olarak kabul eder. `sayilar[::-1]` yazımı, listeyi değiştirmeden ters çevrilmiş yeni bir kopyasını elde etmenin en kısa yoludur.
]
