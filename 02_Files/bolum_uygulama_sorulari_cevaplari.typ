#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

== Python Uygulama Soruları: Cevapları
Öğrencilerin değişken adları ve yazım biçimi farklı olabilir, çıktılar aynıysa doğru kabul edilebilir.

=== Tanışma ve yaş hesabı
#iki_hucreli_satir(columns: (auto,auto))[
#kod-blok(width: 100%)[
```python
BU_YIL = 2026
ad = input("Adınız: ")
dogum_yili = int(input("Doğum yılınız: "))
```
]
][
#kod-blok(width: 100%,ilk-satir: 4)[
```python
yas = BU_YIL - dogum_yili

print(f"Merhaba {ad}, {yas} yaşındasın.")
```
]
]

#not_block(title: "Sık hata:")[Kullanıcıdan alınan veri metin (`str`) olduğundan `int()` ile dönüştürülmezse `2026 - "2010"` işlemi `TypeError` hatası verir.]

=== Dikdörtgenin alanı ve çevresi
#iki_hucreli_satir(columns: (auto, auto))[
#kod-blok(width: 100%)[
```python
kisa_kenar = float(input("Kısa kenar (cm): "))
uzun_kenar = float(input("Uzun kenar (cm): "))
alan = kisa_kenar * uzun_kenar
```]
][
#kod-blok(width: 100%, ilk-satir: 4)[
```python
cevre = 2 * (kisa_kenar + uzun_kenar)
print(f"Alan: {alan:.2f} cm²")
print(f"Çevre: {cevre:.2f} cm")
```]
]

#not_block(title: "Sık hata:")[Çevre formülünde parantez unutulursa (`2 * kisa_kenar + uzun_kenar`), işlem önceliğinden dolayı önce çarpma yapılır ve yanlış sonuç bulunur.]

=== Not ortalaması
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok(width: 100%)[
```python
yazili1 = float(input("1. yazılı: "))
yazili2 = float(input("2. yazılı: "))
perf = float(input("Performans notu: "))
ortalama = yazili1 * 0.3
ortalama += yazili2 * 0.3
ortalama += perf * 0.4
```
  ]
][
  #kod-blok(ilk-satir: 7, width: 100%)[
```python
gecti_mi = ortalama >= 50
takdir_mi = ortalama >= 85

print(f"Ortalama: {ortalama:.1f}")
print(f"Geçti mi: {gecti_mi}")
print(f"Takdir mi: {takdir_mi}")
```
  ]
]

#not_block(title: "Sık hata:")[`gecti_mi = ortalama = 50` yazmak (karşılaştırma yerine atama).]

=== Tür dönüşümü
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok(width: 100%)[
```python
veri = input("Bir sayı girin: ")
print(veri, type(veri))

sayi = int(veri)
print(sayi, type(sayi))
```]
][
  #kod-blok(width: 100%, ilk-satir: 6)[
```python
ondalikli = float(sayi)
print(ondalikli, type(ondalikli))

kesilmis = int(85.85)
print(kesilmis, type(kesilmis))
```]
]

#not_block(title: "Vurgulanacak noktalar:")[Klavyeden okunan değer başlangıçta her zaman `str` türündedir. `int()` ve `float()` ile bilinçli (açık) tür dönüşümü yapılır. `int(85.85)` yuvarlama yapmaz, ondalık kısmı atarak tam sayıya (`85`) dönüştürür.]

=== Hatalı kodu düzeltin
#kod-blok(width: 100%)[
```python
etap3_skor = 80
urun_fiyati = 45.5
toplam_puan = etap3_skor + 20
print(toplam_puan)
```
]

#icerik-tablo(
  sutunlar: (auto, auto, auto),
  sutun_basliklari: ("Satır", "Hata nedeni", "Düzeltme"),
  icerik_hizalama: left + horizon,
  boyut: 9pt,
  dikey-bosluk: 7.5pt,
  [`3etap_skor = 80`], [Değişken adı rakamla başlayamaz], [`etap3_skor = 80`],
  [`urun fiyati = 45.5`], [Değişken adında boşluk olamaz], [`urun_fiyati = 45.5`],
  [`Toplam-Puan = 3etap_skor + 20`], [Değişken adında tire (`-`) kullanılamaz; `snake_case` kuralına uyulmalı ve `3etap_skor` adı düzeltilmelidir], [`toplam_puan = etap3_skor + 20`],
  [`print(Toplam-Puan)`], [Tire çıkarma işlemi gibi algılanır; tanımlanan geçerli değişken adı yazılmalıdır], [`print(toplam_puan)`],
)

#not_block(title: "Not:")[Öğrenci değişken adlandırma kurallarını (`snake_case`, rakamla başlamama, boşluk ve tire içermeme) doğru uyguladığı sürece farklı geçerli adlandırmalar da kabul edilebilir.]


=== Kod izleme
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

=== Çıktı biçimlendirme
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

=== Dakikayı gün, saat ve dakikaya çevirme
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




=== Basamaklarına ayırma
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

=== ATM para dağıtımı

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

=== Market fişi
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

=== Sinema bileti

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

=== Sayı ve İsim İstatistiği
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