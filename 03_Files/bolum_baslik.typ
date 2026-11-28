#import "infografik_ortak.typ": *

= Karar Yapıları ve Döngüler

#v(2pt)

#align(left)[
  #block(width: 86%)[
    #set par(justify: false)
    #text(size: 9pt, fill: rgb("#334155"))[
      Bu bölüm; program akışını koşullara göre yönlendiren karar yapılarını, tekrarlı işlemleri otomatikleştiren döngüleri, veri kümelerini yöneten listeleri ve Turtle ile grafiksel görselleştirmeyi ele alır.
    ]
  ]
]

#v(6pt)

#let hucre(baslik, ozet, c) = block(
  width: 100%,
  height: 70pt,
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

#let satir(no, baslik, ozet, c, hucreler, ozet_y: 24pt) = {
  satir_baslik(no, baslik, c)
  v(2pt)
  block(
    width: 100%,
    height: ozet_y,
    fill: c.light,
    stroke: 0.7pt + c.border,
    radius: 4pt,
    inset: (x: 7pt, y: 5pt),
  )[
    #set par(justify: false, leading: 0.42em)
    #text(size: 7.4pt, fill: rgb("#334155"))[#ozet]
  ]
  v(2pt)
  grid(columns: (1fr,) * 4, gutter: 5pt, ..hucreler)
}

// 1. SATIR
#satir(1, [Koşul Yapıları],
  [Program akışını mantıksal koşullara göre dallandırma; girinti kuralı, tek/çift/çok kriterli kararlar, iç içe yapılar ve kısa devre mantığı.],
  c_mavi,
  (
  hucre([Akış ve Girinti Kuralı],
    [Sıralı çalışma ile karar verme farkı; `:` sonrası 4 boşlukluk girinti (indentation) ve `IndentationError`.], c_mavi),
  hucre([if, if-else ve if-elif-else],
    [Tek yönlü (`if`), çift yönlü (`if-else`) ve çok kriterli (`if-elif-else`) karar mekanizmaları; koşul sırası.], c_mavi),
  hucre([İç İçe Koşul ve Operatörler],
    [İç içe (nested) karar blokları; karşılaştırma ve mantıksal operatörlerin (`and`, `or`, `not`) birlikte kullanımı.], c_mavi),
  hucre([Uygulamalar ve Kısa Devre],
    [Mod (`%`) ile tek-çift kontrolü, `.lower()`/`.upper()` ile harf duyarlılığı, okunabilirlik ve kısa devre (short-circuit).], c_mavi),
))

#v(6pt)

// 2. SATIR
#satir(2, [Döngü Yapıları ve Liste İşlemleri],
  [Tekrarlı işlemleri otomatikleştirme; `range()`, `for` ve `while` döngüleri, döngü kontrol ifadeleri ve iç içe döngüler.],
  c_turuncu,
  (
  hucre([range() ve for Döngüsü],
    [Belirli sayıda tekrar için `for` döngüsü; `range()` ile başlangıç, bitiş ve adım değerlerinin yönetimi.], c_turuncu),
  hucre([while ve Sonsuz Döngü],
    [Koşula bağlı tekrar için `while`; sayaç güncelleme, sonsuz döngü riski, çıkış ve geçerli veri kontrolü.], c_turuncu),
  hucre([break ve continue],
    [Döngü akışını erken sonlandırma (`break`) veya tur atlama (`continue`); kontrolsüz atlamadan kaçınma yolları.], c_turuncu),
  hucre([İç İçe Döngüler],
    [Dış ve iç döngünün çalışma sırası; çarpım tablosu ve yıldızlarla geometrik desenler üretme.], c_turuncu),
))

#v(6pt)

// 3. SATIR
#satir(3, [Liste İşlemleri],
  [Birden fazla veriyi tek bir değişkende saklama, indeksleme, dilimleme, döngüyle veri işleme ve temel liste metotları.],
  c_yesil,
  (
  hucre([Liste, İndis ve Dilimleme],
    [Köşeli parantez `[ ]` ile liste oluşturma; 0 tabanlı ve negatif indeksleme, `IndexError` ve dilimleme (`[start:stop]`).], c_yesil),
  hucre([len(), in ve Gezinme],
    [`len()` ile eleman sayısı, `in` ile üyelik kontrolü; `for` döngüsüyle liste elemanlarını sırayla işleme.], c_yesil),
  hucre([Temel Hesaplamalar],
    [Döngü kullanarak listedeki elemanların toplamını, ortalamasını, en büyük ve en küçük değerini bulma.], c_yesil),
  hucre([Liste Metotları ve Filtreleme],
    [`append()`, `insert()`, `extend()`, `remove()`, `pop()`, `clear()`, `index()`, `count()`, `sort()`, `reverse()` ve filtreleme.], c_yesil),
))

#v(6pt)

// 4. SATIR
#satir(4, [Grafiksel Görselleştirme],
  [Python'ın `turtle` kütüphanesi ile koordinat düzleminde çizim yapma; döngü, koşul ve listeleri görsel desenlere dönüştürme.],
  c_mor,
  (
  hucre([Turtle ve Koordinat Sistemi],
    [`import turtle`, çizim ekranı ve `(0, 0)` merkezli X-Y kartezyen koordinat düzlemi.], c_mor),
  hucre([Hareket, Kalem ve Renk],
    [`forward()`, `backward()`, `right()`, `left()`, `penup()`, `pendown()`, `pencolor()`, `fillcolor()` ve dolgu.], c_mor),
  hucre([Döngülerle Çokgen ve Desen],
    [Düzgün çokgen çizimi (`360 / kenar`), şekilleri döndürerek tekrarlama ve iç içe döngülerle geometrik desenler.], c_mor),
  hucre([Izgara ve Renkli Desenler],
    [Satır-sütun (ızgara) desenleri oluşturma; koşul yapıları ve renk listeleriyle dinamik görselleştirme.], c_mor),
))
