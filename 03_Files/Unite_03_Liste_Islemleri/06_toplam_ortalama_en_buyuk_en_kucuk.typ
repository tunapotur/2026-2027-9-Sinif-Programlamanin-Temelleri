#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Listede Toplam, Ortalama, En Büyük ve En Küçük Değer

Sayısal verilerden oluşan bir listede istatistiksel özetler çıkarmak programlamanın en temel algoritmalarındandır. Python'da bu işlemler için `sum()`, `max()`, `min()` gibi hazır fonksiyonlar bulunsa da algoritmik mantığı kavramak için bu değerlerin döngü ile nasıl hesaplandığını bilmek önemlidir:

- *Toplam ve Ortalama:* `toplam = 0` başlangıç değeri tanımlanır; döngüdeki her eleman `toplam += eleman` ile eklenir. Ortalama ise `toplam / len(liste)` formülüyle bulunur.
- *En Büyük ve En Küçük Değer:* Listenin *ilk elemanı* (`liste[0]`) geçici olarak hem `en_buyuk` hem de `en_kucuk` kabul edilir. Ardından döngü ile diğer elemanlar tek tek karşılaştırılır; daha büyük (veya daha küçük) bir değer bulunduğunda ilgili değişken güncellenir.

#kod-cikti(baslik: "Döngü ile İstatistik Hesaplama", columns: (30em, auto))[
  ```python
  notlar = [72, 95, 58, 84, 66]

  toplam = 0
  en_buyuk = notlar[0]
  en_kucuk = notlar[0]

  for n in notlar:
      toplam += n
      if n > en_buyuk:
          en_buyuk = n
      if n < en_kucuk:
          en_kucuk = n

  ortalama = toplam / len(notlar)
  print(f"Toplam: {toplam}, Ortalama: {ortalama:.1f}")
  print(f"En Büyük: {en_buyuk}, En Küçük: {en_kucuk}")
  ```
][
  ```text
  Toplam: 375, Ortalama: 75.0
  En Büyük: 95, En Küçük: 58
  ```
]

#not_block(title: "Neden en_buyuk = 0 Değil de liste[0]?")[
  Eğer listedeki tüm sayılar negatif olsaydı (örneğin `[-10, -5, -20]`), `en_buyuk = 0` kabul etmek hatalı bir sonuca yol açardı. Listenin ilk elemanını (`liste[0]`) başlangıç kabul etmek her zaman doğru sonucu garanti eder.
]
