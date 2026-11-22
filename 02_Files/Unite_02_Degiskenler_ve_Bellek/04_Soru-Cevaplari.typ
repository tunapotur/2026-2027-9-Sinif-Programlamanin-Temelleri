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

#cevap(1, [E], [Verileri bellekte (RAM) adlandırılmış bir alanda tutmak])

#cevap(2, [E], [RAM geçicidir (uçucu); elektrik kesildiğinde değişkenler silinir.])

#cevap(3, [D], [bool (Boolean)])

#cevap(4, [B], [İşlemci veriyi RAM'den veri yoluyla (bus) alır, işler ve sonucu belleğe yazar.])

#cevap(5, [E], [str (metin katarı)])

#cevap(6, [C], [85 (ondalık kısım kırpılır, yuvarlama yapılmaz)])

#cevap(7, [D], [`1yazili` (değişken adları rakamla başlayamaz)])

#cevap(8, [A], [`ogrenci_no` (harfle başlar, boşluk ve özel karakter içermez)])

#cevap(9, [A], [`float` (tam sayı ile ondalıklı sayı işleminde sonuç float olur)])

#cevap(10, [C], [`#` (diyez karakteri)])

#cevap(11, [RAM (Ana Bellek)], [Çalışmakta olan program ve verilerin geçici olarak tutulduğu birincil bellek.])

#cevap(12, [float], [Python'da virgüllü / kesirli ondalık sayıları temsil eden veri türü.])

#cevap(13, [bool (Boolean)], [Yalnızca `True` veya `False` değerlerini alabilen mantıksal veri türü.])

#cevap(14, [`int()`], [Metin veya ondalıklı sayıları tam sayı veri türüne dönüştüren fonksiyon.])

#cevap(15, [Y], [RAM uçucu (*volatile*) bellektir; bilgisayar kapandığında içerisindeki veriler tamamen silinir.])

#cevap(16, [D], [İşlemci, RAM üzerindeki bellek adreslerine veri ve adres yolları üzerinden doğrudan erişir.])

#cevap(17, [Y], [`input()` fonksiyonu kullanıcı ne girerse girsin daima metin (*str*) türünde döndürür.])

#cevap(18, [D], [`bool` türü yalnızca `True` ve `False` olmak üzere iki mantıksal değer alır.])

#cevap(19, [Y], [`float` türü kesirli/ondalıklı sayıları saklar; tam sayılar için `int` kullanılır.])

#cevap(20, [D], [Python dinamik bir dildir; bir değişkene farklı satırlarda farklı türde değerler atanabilir.])

#cevap-acikUclu(
  21,
  [Değişken; programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir.],
)

#cevap-acikUclu(
  22,
  [Değişkenin bellekteki eski değeri silinir, yerine yeni atanan değer yazılır.],
)

#cevap-acikUclu(
  23,
  [`int` veri türü tam sayıları (ör. 5, -10), `float` veri türü ise kesirli/ondalıklı sayıları (ör. 3.14, 0.5) temsil eder.],
)

#cevap-acikUclu(
  24,
  [`float` sayılar bellekte tam sayılara göre daha fazla yer kaplar ve işlemciyi gereksiz yere daha çok yorar.],
)

#cevap-acikUclu(
  25,
  [Çünkü `input()` fonksiyonu girilen veriyi sayı olsa dahi her zaman metin (`str`) türünde alır; metinlerle doğrudan aritmetik işlem yapılamaz.],
)

#cevap-acikUclu(
  26,
  [Metni tam sayıya dönüştürmek için `int()`, ondalıklı sayıya dönüştürmek için `float()` fonksiyonu kullanılır.],
)

#cevap-acikUclu(
  27,
  [`'5'` tırnak içinde olduğu için metin (`str`) türündedir ve matematiksel işlem yapılamaz. `5` ise tam sayı (`int`) türündedir ve doğrudan matematiksel işlemlerde kullanılır.],
)

#cevap-acikUclu(
  28,
  [Önce içteki `input()` fonksiyonu çalışarak kullanıcıdan metin alır, ardından dıştaki `int()` fonksiyonu bu metni tam sayıya dönüştürerek `yas` değişkenine atar.],
)

==== Tanışma ve yaş hesabı
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

==== Dikdörtgenin alanı ve çevresi
#iki_hucreli_satir(columns: (25.1em, auto))[
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

==== Not ortalaması
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

==== Tür dönüşümü
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

==== Hatalı kodu düzeltin
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
