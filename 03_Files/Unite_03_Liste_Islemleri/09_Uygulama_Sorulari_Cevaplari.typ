#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#pagebreak()
=== Uygulama Soruları Cevapları

*Soru 1: Liste Oluşturma ve İndis Güncelleme*
#kod-blok(width: 100%)[
  ```python
  gunler = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma"]
  print(f"İlk gün: {gunler[0]}, Son gün: {gunler[-1]}")
  gunler[2] = "tatil"
  print("Güncel liste:", gunler)
  ```
]

*Soru 2: Liste Dilimleme (Slicing)*
#kod-blok(width: 100%)[
  ```python
  sayilar = [10, 20, 30, 40, 50, 60, 70]
  print("İlk 3:", sayilar[:3])
  print("Son 2:", sayilar[-2:])
  print("Ters:", sayilar[::-1])
  ```
]

*Soru 3: `len()` ve `in` ile Stok Kontrolü*
#kod-blok(width: 100%)[
  ```python
  depo = ["Klavye", "Fare", "Monitör", "Kulaklık"]
  print(f"Depoda {len(depo)} ürün var.")
  aranan = input("Aranan ürün: ")
  if aranan in depo:
      print(f"{aranan} stokta mevcut.")
  else:
      print(f"{aranan} stokta yok.")
  ```
]

*Soru 4: İndis ile Liste Elemanlarına Zam Yapma*
#kod-blok(width: 100%)[
  ```python
  fiyatlar = [100, 200, 300, 400]
  for i in range(len(fiyatlar)):
      fiyatlar[i] = fiyatlar[i] * 1.10
  print("Zamlı fiyatlar:", fiyatlar)
  ```
]

*Soru 5: Sıcaklık Değerlerinin İstatistikleri*
#kod-blok(width: 100%)[
  ```python
  sicakliklar = [18, 24, 15, 29, 21]
  toplam = 0
  en_yuksek = sicakliklar[0]
  en_dusuk = sicakliklar[0]

  for s in sicakliklar:
      toplam += s
      if s > en_yuksek:
          en_yuksek = s
      if s < en_dusuk:
          en_dusuk = s

  print(f"Ortalama: {toplam / len(sicakliklar):.1f} °C")
  print(f"En yüksek: {en_yuksek} °C, En düşük: {en_dusuk} °C")
  ```
]

*Soru 6: Kullanıcıdan Alınan Verilerle Liste Oluşturma*
#kod-blok(width: 100%)[
  ```python
  isimler = []
  for i in range(1, 5):
      ad = input(f"{i}. öğrenci: ")
      isimler.append(ad)
  print("Sınıf listesi:", isimler)
  ```
]

*Soru 7: Araya Eleman Ekleme ve Liste Birleştirme*
#kod-blok(width: 100%)[
  ```python
  a = [1, 2, 4]
  b = [5, 6]
  a.insert(2, 3)
  a.extend(b)
  print("Sonuç:", a)
  ```
]

*Soru 8: Görev Listesinden Eleman Silme*
#kod-blok(width: 100%)[
  ```python
  gorevler = ["Ödev", "Spor", "Okuma", "Temizlik"]
  gorevler.remove("Spor")
  son = gorevler.pop()
  print("Çıkarılan son görev:", son)
  print("Kalan görevler:", gorevler)
  ```
]

*Soru 9: Sıralama, Sayma ve Konum Bulma*
#kod-blok(width: 100%)[
  ```python
  puanlar = [75, 90, 60, 90, 85]
  print("90 sayısı adedi:", puanlar.count(90))
  puanlar.sort(reverse=True)
  print("Sıralı liste:", puanlar)
  print("85 puanının indisi:", puanlar.index(85))
  ```
]

*Soru 10: Çift Sayıları Filtreleme*
#kod-blok(width: 100%)[
  ```python
  sayilar = [13, 22, 7, 40, 19, 8, 55, 12]
  ciftler = []
  for s in sayilar:
      if s % 2 == 0:
          ciftler.append(s)
  print("Çift sayılar:", ciftler)
  ```
]
