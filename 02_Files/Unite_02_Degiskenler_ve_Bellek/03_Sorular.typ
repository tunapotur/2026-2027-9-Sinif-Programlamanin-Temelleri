#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap-cizgisi(..args) = {
  let n = if args.pos().len() > 0 {
    args.pos().first()
  } else if "n" in args.named() {
    args.named().at("n")
  } else {
    1
  }
  for _ in range(n) [
    #v(0.25em)
    #line(length: 100%, stroke: 0.45pt + gray)
    #v(0.45em)
  ]
}

#let soru(no, metin) = block(breakable: false, below: 0.65em)[
  *#no.* #metin
]

#let siklar2(a, b, c, d, ..rest) = {
  let e = if rest.pos().len() > 0 { rest.pos().first() } else { none }
  if e != none {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
      grid.cell(colspan: 2)[E) #e],
    )
  } else {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
    )
  }
}

#let siklar4(a, b, c, d) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d],
)

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

=== Bölüm Soruları

#soru(1, [Programlamada değişken kullanmanın temel amacı nedir?])
#siklar2(
  [Bilgisayarın ekran çözünürlüğünü dinamik olarak değiştirmek],
  [Yazılan kaynak kod dosyasının boyutunu küçültmek],
  [İnternet bağlantısını otomatik yönetmek],
  [İşlemcinin saat frekansını artırmak],
  [Program çalışırken kullanılacak verileri bellekte bir isimle tutmak],
)

#soru(2, [Programlama dillerinde değişkenlerle ilgili verilen aşağıdaki ifadelerden hangisi *yanlıştır*?])
#siklar2(
  [Değişkenler verileri RAM'de geçici olarak saklar.],
  [Bir değişkene yeni değer atandığında eski değer silinir.],
  [Değişken tanımlanırken veri türüne uygun bellek alanı ayrılır.],
  [Değişken adları bellekteki fiziksel adrese kolay erişim sağlar.],
  [Değişkenler elektrik kesilse dahi veriyi kalıcı olarak korur.],
)

#soru(3, [Temel veri türleri düşünüldüğünde, yalnızca `True` veya `False` değerlerini saklayan ve RAM'de 1 bayt yer kaplayan mantıksal veri türü hangisidir?])
#siklar5([int], [float], [char], [bool], [str])

#soru(4, [İşlemcinin RAM'deki veriye erişmesiyle ilgili aşağıdaki ifadelerden hangisi *doğrudur*?])
#siklar2(
  [RAM, işlemcinin yapacağı tüm hesaplamaları tek başına tamamlar.],
  [İşlemci, RAM'den veriyi veri yoluyla alıp işledikten sonra sonucu belleğe yazar.],
  [Veri yolu yalnızca görüntü verilerini ekrana taşır.],
  [ALU, bilgisayarın kalıcı depolama birimidir.],
  [İşlemci ile RAM arasında veri iletimi olmadan programlar doğrudan çalışır.],
)

#soru(5, [Python'da klavyeden veri almak için kullanılan `input()` fonksiyonu, kullanıcı rakam girse dahi veriyi hangi türde döndürür?])
#siklar5([int], [float], [None], [bool], [str])

// #pagebreak()

#soru(6, [Python'da `int(85.85)` tür dönüşümü ifadesi çalıştırıldığında üretilen sonuç aşağıdakilerden hangisidir?])
#siklar5([85.85], [86], [85], [Hata verir], ["85"])

#soru(7, [Aşağıdaki değişken adlarından hangisi Python değişken tanımlama kurallarına *aykırıdır*?])
#siklar5([`okul_no`], [`_toplam`], [`ogrenciNotu`], [`1yazili`], [`yas`])

#soru(8, [Aşağıdakilerden hangisi Python'da değişken adı olarak kullanılmaya *uygundur*?])
#siklar5([`ogrenci_no`], [`ogrenci-no`], [`ogrenci no`], [`2ogrenci`], [`class`])

#soru(9, [Python'da bir tam sayı (`int`) ile bir ondalıklı sayı (`float`) aritmetik işleme girdiğinde sonuç hangi veri türünde olur?])
#siklar5([`float`], [`str`], [`int`], [`bool`], [`char`])

#soru(10, [Python'da tek satırlık açıklama (yorum) belirtmek için satırın başına hangi karakter yazılır?])
#siklar5([`$`], [`&`], [`#`], [`@`], [`!`])

#soru(11, [Bilgisayar çalışırken programların ve verilerin geçici olarak tutulduğu ana belleğe ............... adı verilir.])

#soru(12, [Python'da ondalıklı sayıları temsil etmek için kullanılan temel veri türü ...............'tır.])

#soru(13, [Python'da doğru ve yanlış değerlerini temsil eden mantıksal veri türü ...............'tur.])

#soru(14, [Kullanıcıdan metin biçiminde alınan sayısal bir girdiyi tam sayıya çevirmek için ............... fonksiyonu kullanılır.])

#soru(15, [RAM'de tutulan veriler bilgisayar kapatıldığında dahi kalıcı olarak korunur. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(16, [İşlemci, RAM'deki verilere veri yolu üzerinden doğrudan erişebilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(17, [Python'da `input()` fonksiyonu kullanıcıdan aldığı veriyi her zaman `int` türünde döndürür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(18, [`bool` veri türü yalnızca `True` veya `False` mantıksal değerlerinden birini alır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(19, [`float` veri türü bellekte yalnızca tam sayı değerlerini saklamak için kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(20, [Python'da aynı değişkene programın farklı satırlarında farklı türlerde değerler atanabilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(21, [Programlamada değişken nedir? Kısaca açıklayınız.])
#cevap-cizgisi(2)

#soru(22, [Bir değişkene yeni bir değer atandığında bellekteki (RAM) eski değere ne olur?])
#cevap-cizgisi(2)

#soru(23, [Python'da `int` ve `float` veri türleri arasındaki temel fark nedir?])
#cevap-cizgisi(2)

#soru(24, [Tüm sayısal verileri `float` olarak saklamak bellek ve işlemci açısından neden uygun değildir?])
#cevap-cizgisi(2)

#soru(25, [Python'da `input()` fonksiyonuyla alınan sayısal bir veri neden doğrudan matematiksel işlemlerde kullanılamaz?])
#cevap-cizgisi(2)

#soru(26, [Metin olarak alınan bir sayıyı matematiksel işleme sokabilmek için hangi fonksiyonlar kullanılır?])
#cevap-cizgisi(2)

#soru(27, [Python'da *`rakam = '5'`* ile *`sayi = 5`* ifadeleri arasındaki temel fark nedir?])
#cevap-cizgisi(2)

#soru(28, [Python'da yazılan *`yas = int(input("Yaşınız: "))`* kod satırında işlemlerin içten dışa çalışma sırasını kısaca açıklayınız.])
#cevap-cizgisi(2)

#v(1em)

#iki_hucreli_satir[
==== Tanışma ve yaş hesabı
#soru_bilgi[Konu: `input()`, `int()`, sabit, f-string · Zorluk: Kolay]

  Kullanıcıdan adını ve doğum yılını alan, yaşını hesaplayıp ekrana yazan bir program yazın. Programın en üstünde `BU_YIL` adında bir sabit (2026) tanımlayın ve çıktıyı f-string ile yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Adınız: Ayşe
Doğum yılınız: 2010
Merhaba Ayşe, 16 yaşındasın.
```
]
]

#iki_hucreli_satir[
==== Dikdörtgenin alanı ve çevresi
#soru_bilgi[Konu: `float()`, aritmetik operatörler, `:.2f` · Zorluk: Kolay]

  Kullanıcıdan bir dikdörtgenin kısa ve uzun kenar uzunluklarını alın. Alanı ve çevreyi hesaplayıp virgülden sonra 2 basamakla yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Kısa kenar (cm): 4.3
Uzun kenar (cm): 6.5
Alan: 27.95 cm²
Çevre: 21.60 cm
```
]
]

#iki_hucreli_satir[
==== Not ortalaması
#soru_bilgi[Konu: karşılaştırma operatörleri, `bool`, f-string · Zorluk: Kolay]

  Bir dersin ortalaması şöyle hesaplanıyor: 1. yazılı %30, 2. yazılı %30, performans %40. Üç notu kullanıcıdan alın; ortalamayı (virgülden sonra 1 basamak), dersi geçip geçmediğini (ortalama 50 veya üzeri) ve takdir alıp almadığını (ortalama 85 veya üzeri) yazdırın. Geçme ve takdir bilgisi `True` ya da `False` olarak görünmelidir.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
1. yazılı: 70
2. yazılı: 85
Performans notu: 90
Ortalama: 82.5
Geçti mi: True
Takdir mi: False
```
]
]

#iki_hucreli_satir[
==== Tür dönüşümü
#soru_bilgi[Konu: `type()`, `int()`, `float()`, açık tür dönüşümü · Zorluk: Kolay]

  Kullanıcıdan bir tam sayı alın ve her değerin yanına `type()` fonksiyonu ile türünü de göstererek aşağıdaki değerleri sırayla yazdıran bir kod yazın.
  + Girilen değer, `input()`'tan geldiği haliyle
  + Aynı değerin tam sayıya çevrilmiş hali
  + Tam sayının ondalıklı sayıya çevrilmiş hali
  + `85.85` değerinin tam sayıya çevrilmiş hali][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Bir sayı girin: 25
25 <class 'str'>
25 <class 'int'>
25.0 <class 'float'>
85 <class 'int'>
```
]
]

#iki_hucreli_satir(columns: (auto, 18em))[
==== Hatalı kodu düzeltin
#soru_bilgi[Konu: değişken tanımlama kuralları, `snake_case` · Zorluk: Kolay]

Aşağıdaki kodda hatalı 4 satır bulunmaktadır. Değişken adlarını kurallara ve `snake_case` yazımına uygun olacak şekilde düzelterek hataları giderin. Program çalıştığında ekrana `100` yazmalıdır.
][
#kod-blok(width: 100%)[
```python
3etap_skor = 80
urun fiyati = 45.5
Toplam-Puan = 3etap_skor + 20
print(Toplam-Puan)
```
]
]
