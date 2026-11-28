#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Liste Metotları

Listeler dinamik veri yapıları olduğu için üzerlerinde eleman ekleme, silme, arama, sıralama gibi işlemleri kolaylaştıran yerleşik *metotlara* sahiptir. Metotlar `liste_adi.metot_adi()` biçiminde nokta (`.`) operatörüyle çağrılır ve çoğunlukla mevcut listeyi doğrudan günceller.

==== Eleman Ekleme: `append()`, `insert()`, `extend()`

- *`.append(deger)`:* Verilen tek bir elemanı listenin *en sonuna* ekler.
- *`.insert(indis, deger)`:* Belirtilen `indis` konumuna yeni bir eleman ekler; o konumdan sonraki tüm elemanları birer sıra sağa kaydırır.
- *`.extend(diger_liste)`:* Başka bir listenin (veya sıralı yapının) tüm elemanlarını mevcut listenin sonuna tek tek ekler.

#kod-cikti(baslik: "Eleman Ekleme Metotları", columns: (30em, auto))[
  ```python
  takim = ["Ali", "Veli"]
  takim.append("Ayşe")           # Sona ekle
  takim.insert(1, "Zeynep")      # 1. indise araya ekle
  takim.extend(["Can", "Ece"])   # Başka listeyi birleştir
  print(takim)
  ```
][
  ```text
  ['Ali', 'Zeynep', 'Veli', 'Ayşe', 'Can', 'Ece']
  ```
]

==== Eleman Silme: `remove()`, `pop()`, `clear()`

- *`.remove(deger)`:* İndise bakmaksızın, listede belirtilen değere sahip *ilk* elemanı bulup siler. Değer listede yoksa `ValueError` hatası verir.
- *`.pop(indis)`:* Belirtilen indisteki elemanı listeden çıkarır ve çıkardığı elemanı *geri döndürür*. İndis verilmezse (`pop()`) en son elemanı siler.
- *`.clear()`:* Listedeki tüm elemanları silerek listeyi tamamen boşaltır (`[]`).

#kod-cikti(baslik: "Eleman Silme Metotları", columns: (30em, auto))[
  ```python
  urunler = ["Kalem", "Defter", "Silgi", "Cetvel"]
  urunler.remove("Silgi")        # Değere göre sil
  cikarilan = urunler.pop(1)     # 1. indisi sil ve al
  print("Çıkarılan:", cikarilan)
  print("Kalanlar:", urunler)

  urunler.clear()                # Tümünü temizle
  print("Temiz liste:", urunler)
  ```
][
  ```text
  Çıkarılan: Defter
  Kalanlar: ['Kalem', 'Cetvel']
  Temiz liste: []
  ```
]

==== Arama ve Sayma: `index()`, `count()`

- *`.index(deger)`:* Aranan elemanın listede ilk geçtiği *indis numarasını* döndürür. Eleman listede yoksa `ValueError` oluşur (bu nedenle öncesinde `in` ile kontrol edilmesi önerilir).
- *`.count(deger)`:* Belirtilen elemanın listede *kaç kez* tekrarlandığını döndürür; yoksa `0` verir.

#kod-cikti(baslik: "Arama ve Sayma Metotları", columns: (30em, auto))[
  ```python
  notlar = [70, 85, 90, 85, 100]
  print("85 sayısı adedi:", notlar.count(85))
  print("90'ın indisi:", notlar.index(90))
  ```
][
  ```text
  85 sayısı adedi: 2
  90'ın indisi: 2
  ```
]

==== Sıralama ve Ters Çevirme: `sort()`, `reverse()`

- *`.sort()`:* Liste elemanlarını küçükten büyüğe (veya alfabetik A→Z) sıralar. Büyükten küçüğe sıralamak için `sort(reverse=True)` kullanılır.
- *`.reverse()`:* Listenin mevcut sırasını baştan sona tersine çevirir (sıralama yapmaz, yalnızca sırayı tersler).

#kod-cikti(baslik: "Sıralama ve Ters Çevirme", columns: (30em, auto))[
  ```python
  puanlar = [45, 90, 60, 75]
  puanlar.sort()
  print("Küçükten büyüğe:", puanlar)

  puanlar.sort(reverse=True)
  print("Büyükten küçüğe:", puanlar)

  harfler = ["a", "b", "c"]
  harfler.reverse()
  print("Ters:", harfler)
  ```
][
  ```text
  Küçükten büyüğe: [45, 60, 75, 90]
  Büyükten küçüğe: [90, 75, 60, 45]
  Ters: ['c', 'b', 'a']
  ```
]

==== Listede Filtreleme

Bir listedeki elemanların tamamı yerine yalnızca belirli bir koşulu sağlayanları seçip *yeni bir listeye* aktarmaya *filtreleme (filtering)* denir. Bu işlem; boş bir sonuç listesi oluşturup, `for` döngüsü ve `if` koşuluyla uygun elemanları `.append()` ederek gerçekleştirilir.

#kod-cikti(baslik: "Geçer Notları Filtreleme (50 ve Üzeri)", columns: (30em, auto))[
  ```python
  tum_notlar = [35, 78, 42, 90, 50, 25, 84]
  gecenler = []

  for notu in tum_notlar:
      if notu >= 50:
          gecenler.append(notu)

  print("Geçen Notlar:", gecenler)
  ```
][
  ```text
  Geçen Notlar: [78, 90, 50, 84]
  ```
]
