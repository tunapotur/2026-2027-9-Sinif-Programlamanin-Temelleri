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

#cevap(1, [B], [26 ($20 + 10 = 30$, $30 - 4 = 26$)])

#cevap(2, [D], [`==` (karşılaştırma operatörüdür; `=` ise atama yapar)])

#cevap(3, [C], [64 ($2^6 = 64$)])

#cevap(4, [B], [`>=` (karşılaştırma operatörüdür)])

#cevap(5, [D], [`=` operatörü değişken ataması yaparken, `==` operatörü eşitlik karşılaştırması yapar.])

#cevap-acikUclu(
  6,
  [`=` operatörü bir değişkene değer atamak için kullanılırken, `==` operatörü iki değerin birbirine eşit olup olmadığını denetler (karşılaştırır).],
)

==== Kod izleme
#grid(
  columns: (auto,auto,auto),
  gutter:10pt,
  align: top
)[
#output-box(title: "1-10. Satırlar")[
```text
18
28
2.5
2
2
False
True
```
]
][
#output-box(title: "11-20. Satırlar")[
```text
240
HaHaHa!
```
]
][
#output-box(title: "21-30. Satırlar")[
```text
13
True
3 2
512
-9
3
```
]
]


#not_block(title: "Tartışılacak noktalar:")[
- `a + b * 2` → önce çarpma yapılır: `10 + 8 = 18`.
- `a / b` vs `a // b` → bölme (`/`) her zaman `float` (`2.5`), tam bölme (`//`) ise tam sayı (`2`) üretir.
- `2 ** 3 ** 2` → üs alma sağdan sola çalışır: `2 ** (3 ** 2) = 2 ** 9 = 512`.
- `-3 ** 2` → üs alma eksi işaretinden önceliklidir: `-(3 ** 2) = -9`.
- `10 - 4 - 3` → aynı öncelikli çıkarma işlemleri soldan sağa yapılır: `(10 - 4) - 3 = 3`.
- `not a == 10 or b == 4` → karşılaştırmalar önce yapılır: `(not True) or True` = `False or True` = `True`.
- `bakiye`: `100` → `150` → `120` → `240`.
- `mesaj *= 3` ve `mesaj += "!"` → metinlerle çarpma tekrarlama (`"HaHaHa"`), toplama ise birleştirme yapar.
- `x = 7 + 3 * 2` işleminin sonucu `13`'tür; `13 % 5` değeri `3` olduğundan `x % 5 == 3` karşılaştırması `True` verir.
]

==== Dakikayı gün, saat ve dakikaya çevirme
#iki_hucreli_satir(align: top, columns: (auto,23em))[
#kod-blok(width: 100%)[
```python
toplam_dakika = int(input("Toplam dakika: "))

gun = toplam_dakika // 1440
kalan = toplam_dakika % 1440
saat = kalan // 60
dakika = kalan % 60

print(f"{gun} gün {saat} saat {dakika} dakika")
```
]
][
#not_block(title: "Kontrol:")[4000 = 2 × 1440 + 1120 ve 1120 = 18 × 60 + 40. Ders notundaki "135 dakika → 2 saat 15 dakika" örneğinin bir adım genişletilmiş halidir.]
]

==== Basamaklarına ayırma
#iki_hucreli_satir(align: top, columns: (auto,16em))[
  #kod-blok(width: 100%)[
```python
sayi = int(input("3 basamaklı bir sayı girin: "))

yuzler = sayi // 100
onlar = (sayi // 10) % 10
birler = sayi % 10

basamak_toplami = yuzler + onlar + birler
ters_sayi = birler * 100 + onlar * 10 + yuzler

print(f"Yüzler: {yuzler}, Onlar: {onlar}, Birler: {birler}")
print(f"Basamaklar toplamı: {basamak_toplami}")
print(f"Ters sayı: {ters_sayi}")
```
]
][
#not_block(title: "Not:")[Onlar basamağı için önce `// 10` ile son basamak atılır (487 → 48), sonra `% 10` ile son basamak alınır (8). Alternatif olarak `(sayi % 100) // 10` ifadesi de aynı sonucu verir.]
]

==== ATM para dağıtımı

#iki_hucreli_satir(columns: (28em, auto))[
#kod-blok(width: 100%)[
```python
tutar = int(input("Çekilecek tutar (TL): "))
yuzluk = tutar // 100
kalan = tutar % 100
ellilik = kalan // 50
kalan = kalan % 50
yirmilik = kalan // 20
kalan = kalan % 20
onluk = kalan // 10
kalan = kalan % 10
```
]
][
#kod-blok(width: 100%, ilk-satir: 10)[
```python
beslik = kalan // 5
birlik = kalan % 5

print(f"100 TL: {yuzluk} adet")
print(f"50 TL : {ellilik} adet")
print(f"20 TL : {yirmilik} adet")
print(f"10 TL : {onluk} adet")
print(f"5 TL  : {beslik} adet")
print(f"1 TL  : {birlik} adet")
```
]
]

#not_block(title: "Kontrol:")[2 × 100 + 50 + 20 + 10 + 5 + 2 × 1 = 287. Bu soru, `kalan` değişkeninin her adımda yeniden atanarak güncellendiğini göstermek için iyi bir örnektir.]

==== Sinema bileti

#grid(
  columns: (2fr, 1fr),
  gutter: 10pt,
  align: horizon,
  [
#kod-blok(width: 100%)[
```python
yas = int(input("Yaşınız: "))
ogrenci = input("Öğrenci misiniz? (E/H): ") == "E"

indirimli = yas < 12 or yas >= 65 or ogrenci
tam_fiyat = not indirimli

print(f"{yas=}")
print(f"{ogrenci=}")
print(f"İndirimli bilet: {indirimli}")
print(f"Tam fiyat: {tam_fiyat}")
```
]
  ],
  [
Çıktı öğrencinin girdiği değerlere göre değişir. Üç farklı deneme:

#icerik-tablo(
  sutunlar: (auto, auto, auto, auto),
  sutun_basliklari: ([Yaş], [Öğrenci], [İndirimli\ Bilet], [Tam\ Fiyat]),
  baslik-boyut: 9pt,
  dikey-bosluk: 6pt,
  [16], [E], [True], [False],
  [70], [H], [True], [False],
  [30], [H], [False], [True],
)
  ]
)

#not_block(title: "Not:")[Koşul ifadelerinde `if` kullanmadan mantıksal operatörlerin (`or`, `not`) doğrudan `bool` sonuç üretmesi sağlanmıştır. `input(...) == "E"` karşılaştırması kullanıcı "E" girdiğinde doğrudan `True`, aksi halde `False` üretir.]
