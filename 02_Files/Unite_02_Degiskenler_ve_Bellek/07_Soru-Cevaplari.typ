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
