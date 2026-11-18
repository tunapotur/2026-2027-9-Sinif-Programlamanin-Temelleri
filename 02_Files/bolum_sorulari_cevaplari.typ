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

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları: Cevap Anahtarı

#ara-baslik([Çoktan Seçmeli Sorular Cevap Anahtarı])
#cevap(1, [A], [Transistör])
#cevap(2, [B], [8 bit = 1 Byte ($2^8 = 256$ farklı kombinasyon)])
#cevap(3, [E], [4 bit ($16 = 2^4$, 1 nibble)])
#cevap(4, [A], [Uzun ikili (binary) bit dizilerini daha kısa ve okunabilir göstermesi])
#cevap(5, [C], [Harf ve sembollere standart sayısal kodlar karşılık getirmek])
#cevap(6, [D], [Assembly Dili])
#cevap(7, [B], [Makine komutlarını sembolik kısaltmalarla (mnemonics) yazma imkânı vermesi])
#cevap(8, [A], [Derleyici (Compiler)])
#cevap(9, [E], [Verileri bellekte (RAM) adlandırılmış bir alanda tutmak])
#cevap(10, [E], [RAM geçicidir (uçucu); elektrik kesildiğinde değişkenler silinir.])
#cevap(11, [D], [bool (Boolean)])
#cevap(12, [B], [İşlemci veriyi RAM'den veri yoluyla (bus) alır, işler ve sonucu belleğe yazar.])
#cevap(13, [E], [str (metin katarı)])
#cevap(14, [C], [85 (ondalık kısım kırpılır, yuvarlama yapılmaz)])
#cevap(15, [D], [`1yazili` (değişken adları rakamla başlayamaz)])
#cevap(16, [A], [`ogrenci_no` (harfle başlar, boşluk ve özel karakter içermez)])
#cevap(17, [B], [26 ($20 + 10 = 30$, $30 - 4 = 26$)])
#cevap(18, [D], [`==` (karşılaştırma operatörüdür; `=` ise atama yapar)])
#cevap(19, [C], [64 ($2^6 = 64$)])
#cevap(20, [C], [16-11-2026 (sep parametresi araya tire ekler)])
#cevap(21, [E], [`type()`])
#cevap(22, [D], [True (7.5 bir float türüdür)])
#cevap(23, [A], [`float` (tam sayı ile ondalıklı sayı işleminde sonuç float olur)])
#cevap(24, [C], [`#` (diyez karakteri)])
#cevap(25, [B], [`>=` (karşılaştırma operatörüdür)])
#cevap(26, [E], [Metin içinde değişken ve ifadeleri `{}` ile doğrudan biçimlendirmek])

#ara-baslik([Boşluk Doldurma Soruları Cevap Anahtarı])
#cevap(27, [Bit], [İkilik sayı sisteminde $0$ veya $1$ değerini alabilen en temel mantıksal veri birimi.])
#cevap(28, [Byte (Bayt)], [8 bitin birleşmesiyle oluşan ve 1 karakter saklamaya yeten veri birimi.])
#cevap(29, [Hexadecimal (Onaltılık)], [0–9 rakamları ile A–F harflerini kullanan 16 tabanlı sayı sistemi.])
#cevap(30, [ASCII], [Karakter ve sembolleri standart sayısal kodlarla eşleştiren kodlama tablosu.])
#cevap(31, [Assembly], [İşlemci komutlarını kısaltmalarla ifade eden alt seviyeli programlama dili.])
#cevap(32, [RAM (Ana Bellek)], [Çalışmakta olan program ve verilerin geçici olarak tutulduğu birincil bellek.])
#cevap(33, [float], [Python'da virgüllü / kesirli ondalık sayıları temsil eden veri türü.])
#cevap(34, [bool (Boolean)], [Yalnızca `True` veya `False` değerlerini alabilen mantıksal veri türü.])
#cevap(35, [`input()`], [Kullanıcının klavyeden metin girişi yapmasını sağlayan standart fonksiyon.])
#cevap(36, [`int()`], [Metin veya ondalıklı sayıları tam sayı veri türüne dönüştüren fonksiyon.])
#cevap(37, [`print()`], [Ekrana veya konsola çıktı yazdırmak için kullanılan temel Python fonksiyonu.])

#ara-baslik([Doğru – Yanlış Soruları Cevap Anahtarı])
#cevap(38, [Y], [Bilgisayardaki en küçük veri birimi Byte değil, *bittir* (1 Byte = 8 bit).])
#cevap(39, [D], [8 bit bir araya gelerek 1 Byte'lık veri büyüklüğünü meydana getirir.])
#cevap(40, [D], [Hexadecimal sistemde 0–9 rakamları ile A–F arasındaki 6 harf (toplam 16 sembol) kullanılır.])
#cevap(41, [Y], [RAM uçucu (*volatile*) bellektir; bilgisayar kapandığında içerisindeki veriler tamamen silinir.])
#cevap(42, [D], [İşlemci, RAM üzerindeki bellek adreslerine veri ve adres yolları üzerinden doğrudan erişir.])
#cevap(43, [Y], [`input()` fonksiyonu kullanıcı ne girerse girsin daima metin (*str*) türünde döndürür.])
#cevap(44, [D], [`=` operatörü değişken ataması yaparken, `==` operatörü eşitlik karşılaştırması yapar.])
#cevap(45, [D], [`bool` türü yalnızca `True` ve `False` olmak üzere iki mantıksal değer alır.])
#cevap(46, [Y], [`float` türü kesirli/ondalıklı sayıları saklar; tam sayılar için `int` kullanılır.])
#cevap(47, [D], [Python dinamik bir dildir; bir değişkene farklı satırlarda farklı türde değerler atanabilir.])
#cevap(48, [D], [`type()` fonksiyonu parametre olarak verilen değişkenin veri türünü döndürür.])

#ara-baslik([#text(weight: "bold", size: 9pt)[Soru 49.] Eşleştirme Sorusu Cevap Anahtarı : *1* – *B* #h(1.5em) *2* – *C* #h(1.5em) *3* – *E* #h(1.5em) *4* – *D* #h(1.5em) *5* – *A*])

#text(weight: "semibold")[1) RAM $arrow.r$ B :] Program ve verilerin çalışma sırasında geçici tutulduğu birincil bellek \
#text(weight: "semibold")[2) CPU $arrow.r$ C :] Komutları yorumlayıp çalıştıran merkezi işlem birimi \
#text(weight: "semibold")[3) Veri Yolu (Bus) $arrow.r$ E :] Donanım bileşenleri arasında veri taşınmasını sağlayan iletim hattı \
#text(weight: "semibold")[4) ASCII $arrow.r$ D :] Karakter ve sembollere standart sayısal kodlar atayan tablo \
#text(weight: "semibold")[5) Assembly $arrow.r$ A :] Makine komutlarını sembolik kısaltmalarla ifade eden programlama dili

#ara-baslik([*Açık Uçlu ve Klasik Sorular Model Cevapları*])
#cevap-acikUclu(
  50,
  [Değişken; programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir.],
)

#cevap-acikUclu(
  51,
  [Değişkenin bellekteki eski değeri silinir, yerine yeni atanan değer yazılır.],
)

#cevap-acikUclu(
  52,
  [`int` veri türü tam sayıları (ör. 5, -10), `float` veri türü ise kesirli/ondalıklı sayıları (ör. 3.14, 0.5) temsil eder.],
)

#cevap-acikUclu(
  53,
  [`float` sayılar bellekte tam sayılara göre daha fazla yer kaplar ve işlemciyi gereksiz yere daha çok yorar.],
)

#cevap-acikUclu(
  54,
  [Çünkü `input()` fonksiyonu girilen veriyi sayı olsa dahi her zaman metin (`str`) türünde alır; metinlerle doğrudan aritmetik işlem yapılamaz.],
)

#cevap-acikUclu(
  55,
  [Metni tam sayıya dönüştürmek için `int()`, ondalıklı sayıya dönüştürmek için `float()` fonksiyonu kullanılır.],
)

#cevap-acikUclu(
  56,
  [`=` operatörü bir değişkene değer atamak için kullanılırken, `==` operatörü iki değerin birbirine eşit olup olmadığını denetler (karşılaştırır).],
)

#cevap-acikUclu(
  57,
  [Aynı kodları tekrar tekrar yazmayı önler (kod tekrarını azaltır) ve programın daha düzenli, bakımı kolay olmasını sağlar.],
)

#cevap-acikUclu(
  58,
  ["Kendini Tekrar Etme" anlamına gelir; aynı kodun veya mantığın program içinde defalarca yazılmaması gerektiğini ifade eder.],
)

#cevap-acikUclu(
  59,
  [`'5'` tırnak içinde olduğu için metin (`str`) türündedir ve matematiksel işlem yapılamaz. `5` ise tam sayı (`int`) türündedir ve doğrudan matematiksel işlemlerde kullanılır.],
)

#cevap-acikUclu(
  60,
  [Önce içteki `input()` fonksiyonu çalışarak kullanıcıdan metin alır, ardından dıştaki `int()` fonksiyonu bu metni tam sayıya dönüştürerek `yas` değişkenine atar.],
)
