#import "infografik_ortak.typ": *

= Temel Programlama Yapıları

#v(5pt)

#align(center)[
  #block(width: 86%)[
    #set par(justify: false)
    #text(size: 9pt, fill: rgb("#334155"))[
      Bu bölüm; bilgisayarın donanım temellerinden başlayarak değişkenler, bellek yönetimi, operatörler ve fonksiyonlarla Python programlamanın temel yapı taşlarını ele alır. Her ünitede kavramlar kısa özetler, görseller ve örneklerle desteklenir.
    ]
  ]
]

#v(7pt)

#let gorsel(path, w) = block(
  width: w,
  clip: true,
  radius: 3pt,
  stroke: 0.6pt + c_gri.border,
)[
  #image(path, width: w)
]

#let hucre(no, baslik, ozet, c) = block(
  width: 100%,
  height: 82pt,
  fill: c.light,
  stroke: 0.9pt + c.border,
  radius: 5pt,
  inset: (x: 6pt, y: 5.5pt),
  breakable: false,
)[
  #set par(justify: false)
  #text(weight: "bold", size: 7.7pt, fill: c.dark)[#no #baslik]
  #v(2.5pt)
  #set text(size: 6.8pt, fill: rgb("#1e293b"))
  #set par(leading: 0.42em)
  #ozet
]

#let satir_baslik(no, baslik, c) = block(
  width: 100%,
  fill: c.main,
  radius: 4pt,
  inset: (x: 8pt, y: 4pt),
)[
  #text(weight: "bold", size: 10pt, fill: white)[#no #baslik]
]

#let satir(no, baslik, ozet, c, gorseller, hucreler, ozet_y: 40pt) = {
  satir_baslik(no, baslik, c)
  v(2pt)
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    align: horizon,
    block(
      width: 100%,
      height: ozet_y,
      fill: c.light,
      stroke: 0.7pt + c.border,
      radius: 4pt,
      inset: (x: 7pt, y: 5pt),
    )[
      #set par(justify: false, leading: 0.42em)
      #text(size: 7.2pt, fill: rgb("#334155"))[#ozet]
    ],
    gorseller,
  )
  v(4pt)
  grid(columns: (1fr,) * 4, gutter: 5pt, ..hucreler)
}

// 1. SATIR
#satir(1, [Bilgisayar Nedir?],
  [Bilgisayarın tanımı ve temel çalışma mimarisi; transistörden bit, ASCII ve makine diline uzanan donanım temelleri ile programlama dillerine giriş.],
  c_mavi,
  grid(
    columns: (auto, auto), gutter: 4pt,
    gorsel("Unite_01_Bilgisayar_Nedir/images/transistor-acik.svg", 44pt),
    gorsel("Unite_01_Bilgisayar_Nedir/images/transistor-kapali.svg", 44pt),
  ),
  (
  hucre("1.1.", [Bilgisayarın Temel Çalışma Mimarisi],
    [Giriş, bellek, işlemci ve çıkış birimleri; komut ve verilerin aynı bellekte tutulması; veri yolu (BUS) üzerinden veri akışı.], c_mavi),
  hucre("1.2.", [Donanımın Temeli: Transistör ve İkili Sistem],
    [Transistörün akımı geçirip kesmesiyle 1 ve 0; ikili sistem, bit ve byte kavramları; bilgisayarın donanım temeli.], c_mavi),
  hucre("1.3.", [Metin Temsili: 8 Bit = 1 Byte ve ASCII],
    [Karakterlerin ASCII kodlarıyla sayıya dönüştürülmesi; 1 karakter = 1 byte = 8 bit; hexadecimal gösterim.], c_mavi),
  hucre("1.4.", [Programlama Dilleri],
    [Makine dili, assembly ve yüksek seviyeli diller; derleyici ve yorumlayıcı; aynı kaynak kodun farklı mimarilerde derlenebilmesi.], c_mavi),
), ozet_y: 52pt)

#v(7pt)

// 2. SATIR
#satir(2, [Değişkenler ve Bellek (RAM)],
  [Değişkenlerin RAM'de tutulması, veri türleri, bellek yönetimi ve tür dönüşümü; değerlerin bellekte nasıl saklandığı ve güncellendiği.],
  c_turuncu,
  gorsel("Unite_02_Degiskenler_ve_Bellek/images/01-Deger-Atama-RAM.jpg", 88pt),
  (
  hucre("2.1.", [Programlama Dillerinde Değişken],
    [Değişkenin RAM'deki adlandırılmış alan olması; değer atama, türün değere göre belirlenmesi ve değişken güncelleme.], c_turuncu),
  hucre("2.2.", [Veri Türleri ve RAM Kullanımı],
    [int, float, bool ve str türleri; türlerin RAM'de kapladığı alan ve verinin hücrelerde saklanma biçimi.], c_turuncu),
  hucre("2.3.", [Bellek Yönetimi, RAM ve İşlemcinin İlişkisi],
    [RAM, CPU ve veri yolu ilişkisi; adresleme, okuma-yazma döngüsü ve bellek yönetiminin program hızına etkisi.], c_turuncu),
  hucre("2.4.", [Tür Dönüşümü (Type Conversion)],
    [Açık ve örtük tür dönüşümü; input()'un metin döndürmesi; int(), float() ve str() ile güvenli dönüşüm.], c_turuncu),
), ozet_y: 92pt)

#v(7pt)

// 3. SATIR
#satir(3, [Operatörler ve İşlem Önceliği],
  [Atama, aritmetik, karşılaştırma ve mantıksal operatörler; operatörlerin birlikte kullanımı ve işlem önceliği.],
  c_mor,
  [],
  (
  hucre("3.1.", [Atama Operatörleri],
    [`=` atama operatörü; `+=`, `-=`, `*=` gibi bileşik atamalar; atama ile `==` karşılaştırmasının farkı.], c_mor),
  hucre("3.2.", [Aritmetik Operatörler],
    [`+`, `-`, `*`, `/`, `//`, `%`, `**` operatörleri; bölme, kalan ve üs alma; işlem önceliği.], c_mor),
  hucre("3.3.", [Karşılaştırma Operatörleri],
    [==, !=, <, >, <=, >= ile karşılaştırma; sonuçların bool (True/False) olması.], c_mor),
  hucre("3.4.", [Mantıksal Operatörler],
    [and, or, not mantıksal operatörleri; koşulların birleştirilmesi ve işlem önceliği.], c_mor),
))

#v(7pt)

// 4. SATIR
#satir(4, [Fonksiyonların Kullanımı],
  [Fonksiyonların sağladığı avantajlar, input/print kullanımı, f-string biçimlendirme ve type/isinstance ile tür kontrolü.],
  c_yesil,
  [],
  (
  hucre("4.1.", [Fonksiyonları Kullanmanın Yarattığı Fark],
    [Fonksiyonun parametre alıp sonuç döndürmesi; kod tekrarını önleme (DRY) ve yerleşik fonksiyonlar.], c_yesil),
  hucre("4.2.", [input(): Kullanıcıdan Veri Alma],
    [input() ile kullanıcıdan veri alma; dönen değerin her zaman str olduğu ve sayıya dönüştürülmesi.], c_yesil),
  hucre("4.3.", [print() ile Metin ve Değişkenleri Yazdırma],
    [print() ile metin ve değişken yazdırma; sep, end ve f-string ile biçimlendirme.], c_yesil),
  hucre("4.4.", [Python Tür Kontrolü: type() ve isinstance()],
    [type() ve isinstance() ile veri türü kontrolü; tür doğrulama ve güvenli dönüşüm.], c_yesil),
))

#pagebreak()
