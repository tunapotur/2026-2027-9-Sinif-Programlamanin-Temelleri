#import "infografik_ortak.typ": *

= Temel Programlama Yapıları

#v(2pt)

#align(left)[
  #block(width: 86%)[
    #set par(justify: false)
    #text(size: 9pt, fill: rgb("#334155"))[
      Bu bölüm; bilgisayarın donanım temellerinden başlayarak değişkenler, bellek yönetimi, operatörler ve fonksiyonlarla Python programlamanın temel yapı taşlarını ele alır.
    ]
  ]
]

#v(4pt)

#let gorsel(path, w) = block(
  width: w,
  clip: true,
  radius: 3pt,
  stroke: 0.6pt + c_gri.border,
)[
  #image(path, width: w)
]

#let hucre(baslik, ozet, c) = block(
  width: 100%,
  height: 66pt,
  fill: c.light,
  stroke: 0.9pt + c.border,
  radius: 5pt,
  inset: (x: 6pt, y: 5.5pt),
  breakable: false,
)[
  #set par(justify: false)
  #text(weight: "bold", size: 7.7pt, fill: c.dark)[#baslik]
  #v(2.5pt)
  #set text(size: 6.8pt, fill: rgb("#1e293b"))
  #set par(leading: 0.42em)
  #ozet
]

#let satir_baslik(no, baslik, c) = block(
  width: 100%,
  height: 20pt,
  fill: c.main,
  radius: 4pt,
  inset: (x: 8pt, y: 4pt),
)[
  #align(horizon)[
    #text(weight: "bold", size: 10pt, fill: white)[#no #baslik]
  ]
]

#let satir(no, baslik, ozet, c, gorseller, hucreler, ozet_y: 24pt) = {
  satir_baslik(no, baslik, c)
  v(1pt)
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
  v(1pt)
  grid(columns: (1fr,) * 4, gutter: 5pt, ..hucreler)
}

// 1. SATIR
#satir(1, [Bilgisayar Nedir?],
  [Bilgisayarın tanımı ve temel çalışma mimarisi; transistörden bit, ASCII ve makine diline uzanan donanım temelleri ile programlama dillerine giriş.],
  c_mavi,
  [],
  (
  hucre([Bilgisayarın Temel Çalışma Mimarisi],
    [Giriş, bellek, işlemci ve çıkış birimleri; komut ve verilerin aynı bellekte tutulması; veri yolu (BUS) üzerinden veri akışı.], c_mavi),
  hucre([Donanımın Temeli: Transistör ve İkili Sistem],
    [Transistörün akımı geçirip kesmesiyle 1 ve 0; ikili sistem, bit ve byte kavramları; bilgisayarın donanım temeli.], c_mavi),
  hucre([Metin Temsili: 8 Bit = 1 Byte ve ASCII],
    [Karakterlerin ASCII kodlarıyla sayıya dönüştürülmesi;\ 1 karakter = 1 byte = 8 bit; hexadecimal gösterim.], c_mavi),
  hucre([Programlama Dilleri],
    [Makine dili, assembly ve yüksek seviyeli diller; derleyici ve yorumlayıcı; aynı kaynak kodun farklı mimarilerde derlenebilmesi.], c_mavi),
))

#v(4pt)

// 2. SATIR
#satir(2, [Değişkenler ve Bellek (RAM)],
  [Değişkenlerin RAM'de tutulması, veri türleri, bellek yönetimi ve tür dönüşümü; değerlerin bellekte nasıl saklandığı ve güncellendiği.],
  c_turuncu,
  [],
  (
  hucre([Programlama Dillerinde Değişken],
    [Değişkenin RAM'deki adlandırılmış alan olması; değer atama, türün değere göre belirlenmesi ve değişken güncelleme.], c_turuncu),
  hucre([Veri Türleri ve RAM Kullanımı],
    [int, float, bool ve str türleri; türlerin RAM'de kapladığı alan ve verinin hücrelerde saklanma biçimi.], c_turuncu),
  hucre([Bellek Yönetimi, RAM ve İşlemcinin İlişkisi],
    [RAM, CPU ve veri yolu ilişkisi; adresleme, okuma-yazma döngüsü ve bellek yönetiminin program hızına etkisi.], c_turuncu),
  hucre([Tür Dönüşümü (Type Conversion)],
    [Açık ve örtük tür dönüşümü; input()'un metin döndürmesi; int(), float() ve str() ile güvenli dönüşüm.], c_turuncu),
))

#v(4pt)

// 3. SATIR
#satir(3, [Operatörler ve İşlem Önceliği],
  [Atama, aritmetik, karşılaştırma ve mantıksal operatörler; operatörlerin birlikte kullanımı ve işlem önceliği.],
  c_mor,
  [],
  (
  hucre([Atama Operatörleri],
    [`=` atama operatörü; `+=`, `-=`, `*=` gibi bileşik atamalar; atama ile `==` karşılaştırmasının farkı.], c_mor),
  hucre([Aritmetik Operatörler],
    [`+`, `-`, `*`, `/`, `//`, `%`, `**` operatörleri; bölme, kalan ve üs alma; işlem önceliği.], c_mor),
  hucre([Karşılaştırma Operatörleri],
    [==, !=, <, >, <=, >= ile karşılaştırma; sonuçların bool (True/False) olması.], c_mor),
  hucre([Mantıksal Operatörler],
    [and, or, not mantıksal operatörleri; koşulların birleştirilmesi ve işlem önceliği.], c_mor),
))

#v(4pt)

// 4. SATIR
#satir(4, [Fonksiyonların Kullanımı],
  [Fonksiyonların sağladığı avantajlar, input/print kullanımı, f-string biçimlendirme ve type/isinstance ile tür kontrolü.],
  c_yesil,
  [],
  (
  hucre([Fonksiyonları Kullanmanın Yarattığı Fark],
    [Fonksiyonun parametre alıp sonuç döndürmesi; kod tekrarını önleme (DRY) ve yerleşik fonksiyonlar.], c_yesil),
  hucre([input(): Kullanıcıdan Veri Alma],
    [input() ile kullanıcıdan veri alma; dönen değerin her zaman str olduğu ve sayıya dönüştürülmesi.], c_yesil),
  hucre([print() ile Metin ve Değişkenleri Yazdırma],
    [print() ile metin ve değişken yazdırma; sep, end ve f-string ile biçimlendirme.], c_yesil),
  hucre([Python Tür Kontrolü: type() ve isinstance()],
    [type() ve isinstance() ile veri türü kontrolü; tür doğrulama ve güvenli dönüşüm.], c_yesil),
))

#v(4pt)

// 5. SATIR
#satir(5, [Bölüm Kod Uygulamaları],
  [Önceki bölümlerde öğrenilen konuları gerçek hayat problemlerinde birleştiren kod yazma uygulamaları.],
  c_kirmizi,
  [],
  (
  hucre([Vücut Kitle Endeksi (BMI)],
    [Boy ve kilodan `BMI = kilo / boy ** 2` formülüyle vücut kitle endeksini hesaplama; üs alma ve tür dönüşümü.], c_kirmizi),
  hucre([Araç Yakıt Tüketimi],
    [Gidilen yol ve alınan yakıttan 100 km'de harcanan litre ve tutarı hesaplama; oran hesabı ve aritmetik operatörler.], c_kirmizi),
  hucre([Dik Üçgende Hipotenüs],
    [Dik kenarlar `a` ve `b`'den Pisagor bağıntısıyla hipotenüsü hesaplama; üs alma ve karekök.], c_kirmizi),
  hucre([Not Ortalaması],
    [Yazılı ve performans notlarından ağırlıklı ortalamayı hesaplama; geçme ve takdir durumunu `True`/`False` üretme.], c_kirmizi),
))

// #pagebreak()
