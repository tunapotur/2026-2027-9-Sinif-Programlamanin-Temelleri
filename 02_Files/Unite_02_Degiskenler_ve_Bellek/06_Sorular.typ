#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ":*

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

#pagebreak()
#soru(8, [Aşağıdakilerden hangisi Python'da değişken adı olarak kullanılmaya *uygundur*?])
#siklar5([`ogrenci_no`], [`ogrenci-no`], [`ogrenci no`], [`2ogrenci`], [`class`])

#soru(9, [Python'da bir tam sayı (`int`) ile bir ondalıklı sayı (`float`) aritmetik işleme girdiğinde sonuç hangi veri türünde olur?])
#siklar5([`float`], [`str`], [`int`], [`bool`], [`char`])

#soru(10, [Python'da tek satırlık açıklama (yorum) belirtmek için satırın başına hangi karakter yazılır?])
#siklar5([`$`], [`&`], [`#`], [`@`], [`!`])

#v(1em)
#soru(11, [Bilgisayar çalışırken programların ve verilerin geçici olarak tutulduğu ana belleğe ............... adı verilir.])

#soru(12, [Python'da ondalıklı sayıları temsil etmek için kullanılan temel veri türü ...............'tır.])

#soru(13, [Python'da doğru ve yanlış değerlerini temsil eden mantıksal veri türü ...............'tur.])

#soru(14, [Kullanıcıdan metin biçiminde alınan sayısal bir girdiyi tam sayıya çevirmek için ............... fonksiyonu kullanılır.])

#v(1em)
#soru(15, [RAM'de tutulan veriler bilgisayar kapatıldığında dahi kalıcı olarak korunur. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(16, [İşlemci, RAM'deki verilere veri yolu üzerinden doğrudan erişebilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(17, [Python'da `input()` fonksiyonu kullanıcıdan aldığı veriyi her zaman `int` türünde döndürür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(18, [`bool` veri türü yalnızca `True` veya `False` mantıksal değerlerinden birini alır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(19, [`float` veri türü bellekte yalnızca tam sayı değerlerini saklamak için kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(20, [Python'da aynı değişkene programın farklı satırlarında farklı türlerde değerler atanabilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#v(1em)
#soru(21, [Programlamada değişken nedir? Kısaca açıklayınız.])
#cevap-cizgisi(3)

#soru(22, [Bir değişkene yeni bir değer atandığında bellekteki (RAM) eski değere ne olur?])
#cevap-cizgisi()

#soru(23, [Python'da `int` ve `float` veri türleri arasındaki temel fark nedir?])
#cevap-cizgisi(3)

#soru(24, [Tüm sayısal verileri `float` olarak saklamak bellek ve işlemci açısından neden uygun değildir?])
#cevap-cizgisi(3)

#soru(25, [Python'da `input()` fonksiyonuyla alınan sayısal bir veri neden doğrudan matematiksel işlemlerde kullanılamaz?])
#cevap-cizgisi(3)

#soru(26, [Metin olarak alınan bir sayıyı matematiksel işleme sokabilmek için hangi fonksiyonlar kullanılır?])
#cevap-cizgisi(3)

#soru(27, [Python'da *`rakam = '5'`* ile *`sayi = 5`* ifadeleri arasındaki temel fark nedir?])
#cevap-cizgisi(2)

#soru(28, [Python'da yazılan *`yas = int(input("Yaşınız: "))`* kod satırında işlemlerin içten dışa çalışma sırasını kısaca açıklayınız.])
#cevap-cizgisi(3)

