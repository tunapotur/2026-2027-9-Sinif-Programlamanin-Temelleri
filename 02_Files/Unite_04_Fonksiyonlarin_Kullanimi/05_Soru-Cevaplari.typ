#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap(no, cevap, aciklama) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt, weight: "semibold")[#underline(stroke: 1.25pt, offset: 1.25pt)[(#cevap)]]
  #text(size:10pt)[#aciklama]
]

#let cevap-acikUclu(no, cevap) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt)[#cevap]
]

#let ara-baslik(baslik) = block(
  breakable: false,
  width: 100%,
  above: 1em,
  below: 0.7em
)[
  #text(weight: "bold", size: 10pt)[#baslik]
]

=== Bölüm Soruları: Cevap Anahtarı

#cevap(1, [C], [16-11-2026 (sep parametresi araya tire ekler)])

#cevap(2, [E], [`type()`])

#cevap(3, [D], [True (7.5 bir float türüdür)])

#cevap(4, [E], [Metin içinde değişken ve ifadeleri `{}` ile doğrudan biçimlendirmek])

#ara-baslik([Boşluk Doldurma Soruları Cevap Anahtarı])

#cevap(5, [`input()`], [Kullanıcının klavyeden metin girişi yapmasını sağlayan standart fonksiyon.])

#cevap(6, [`print()`], [Ekrana veya konsola çıktı yazdırmak için kullanılan temel Python fonksiyonu.])

#ara-baslik([Doğru – Yanlış Soruları Cevap Anahtarı])

#cevap(7, [D], [`type()` fonksiyonu parametre olarak verilen değişkenin veri türünü döndürür.])

#ara-baslik([*Açık Uçlu ve Klasik Sorular Model Cevapları*])

#cevap-acikUclu(
  8,
  [Aynı kodları tekrar tekrar yazmayı önler (kod tekrarını azaltır) ve programın daha düzenli, bakımı kolay olmasını sağlar.],
)

#cevap-acikUclu(
  9,
  ["Kendini Tekrar Etme" anlamına gelir; aynı kodun veya mantığın program içinde defalarca yazılmaması gerektiğini ifade eder.],
)

==== Çıktı biçimlendirme
#iki_hucreli_satir(columns: (30em,auto))[
#kod-blok(width: 100%)[
```python
gun = input("Gün: ")
ay = input("Ay: ")
yil = input("Yıl: ")

print(gun, ay, yil, sep="/", end=" <- tarih biçimi\n")
```
]
][
#kod-blok(width: 100%, ilk-satir: 6)[
```python
print("Yükleniyor", end="...")
print("Tamam")
print("Ad:\tAli")
print("Yol: C:\\Okul")
print("O \"evet\" dedi")
```
]
]




#not_block(title: "Not:")[`end` verilmezse her `print()` alt satıra geçer; `sep` yalnızca virgülle ayrılan değerlerin arasını etkiler. Ters eğik çizgiyi yazdırmak için `\\`, çift tırnağı yazdırmak için `\"` gerekir.]

==== Market fişi
#iki_hucreli_satir(columns: (20.3em,auto),gutter: 4pt)[
#kod-blok(width: 100%)[
```python
KDV_ORANI = 0.20

urun = input("Ürün adı: ")
fiyat = float(input("Birim fiyat: "))
adet = int(input("Adet: "))

ara_toplam = fiyat * adet
kdv = ara_toplam * KDV_ORANI
genel_toplam = ara_toplam + kdv
```
]
][
#kod-blok(width: 100%, ilk-satir: 10)[
```python
print("-" * 28)

print(f"{urun:<12}{adet:>3} x {fiyat:>7.2f}")
print(f"{'Ara toplam':<14}{ara_toplam:>9.2f} TL")

print(f"{'KDV (%20)':<14}{kdv:>9.2f} TL")
print(f"{'GENEL TOPLAM':<14}{genel_toplam:>9.2f} TL")

print("-" * 28)
```
]
]

#not_block(title: "Not:")[f-string içinde `<` sola yaslama, `>` sağa yaslama, `:.2f` ise ondalık sayıyı virgülden sonra 2 basamakla göstermeyi sağlar. `"-" * 28` ifadesi 28 adet tire karakterini art arda yazdırır.]

==== Sayı ve İsim İstatistiği
#iki_hucreli_satir(columns: (auto, auto))[
#kod-blok(width: 100%)[
```python
isim = input("İsminizi girin: ")
sayi1 = float(input("1. Sayı: "))
sayi2 = float(input("2. Sayı: "))

harf_sayisi = len(isim)
en_buyuk = max(sayi1, sayi2)
```
]
][
#kod-blok(width: 100%, ilk-satir: 7)[
```python
en_kucuk = min(sayi1, sayi2)
ortalama = round((sayi1 + sayi2) / 2, 2)
mutlak_fark = round(abs(sayi1 - sayi2), 2)

print(f"İsminiz {harf_sayisi} harflidir.")
print(f"En büyük: {en_buyuk}")
print(f"En küçük: {en_kucuk}")
print(f"Ortalama: {ortalama}")
print(f"Mutlak fark: {mutlak_fark}")
```
]
]

#not_block(title: "Not:")[
`len()` fonksiyonu metnin karakter (harf) sayısını, `max()` ve `min()` en büyük ve en küçük sayıyı, `abs()` mutlak farkı, `round()` ise ondalıklı sayıyı istenen basamak sayısına (örnekte 2 basamak) yuvarlamayı sağlar.
]
