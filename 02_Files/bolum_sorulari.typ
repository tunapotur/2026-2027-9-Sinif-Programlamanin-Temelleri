#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları
Aşağıdaki sorular, donanım temelleri, sayı sistemleri, bellek mimarisi, veri türleri, Python dili esasları, operatörler ve fonksiyonlar konularındaki teorik ve kavramsal öğrenmeleri ölçmek amacıyla hazırlanmıştır.

=== A. Çoktan Seçmeli Sorular

#let siklar2(a, b, c, d) = grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [A) #a], [B) #b],
  [C) #c], [D) #d],
)

#let siklar4(a, b, c, d) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d],
)

+ #soru_bilgi[Konu: Transistör ve İkili Sistem]\
  Bilgisayarda elektrik akımının geçmesi ($1$) veya kesilmesi ($0$) durumunu üreterek mantıksal hesaplamaların temelini oluşturan en küçük donanım birimi aşağıdakilerden hangisidir?
  #siklar4([İşlemci], [Transistör], [RAM], [Sabit Disk])

+ #soru_bilgi[Konu: Onaltılık (Hexadecimal) Sayı Sistemi]\
  Onaltılık (Hexadecimal) sayı sisteminde tek bir basamak, ikilik (binary) sistemde tam olarak kaç bite karşılık gelir?
  #siklar4([2 bit], [4 bit], [8 bit], [16 bit])

+ #soru_bilgi[Konu: Assembly ve Çeviriciler]\
  Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi hatırlanması kolay sembolik kısaltmalar (*mnemonics*) kullanan programlama dili aşağıdakilerden hangisidir?
  #siklar4([Makine Dili], [Assembly Dili], [Python], [C++])

+ #soru_bilgi[Konu: Derleyici vs. Yorumlayıcı]\
  Yazdığımız kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılımlara ne ad verilir?
  #siklar4([Yorumlayıcı (Interpreter)], [Derleyici (Compiler)], [Assembler], [Editör])

+ #soru_bilgi[Konu: Değişkenler ve Bellek (RAM)]\
  Programlama dillerinde değişkenlerle ilgili verilen aşağıdaki ifadelerden hangisi *yanlıştır*?
  #siklar2(
    [Değişkenler verileri RAM'de geçici olarak saklar.],
    [Bir değişkene yeni değer atandığında eski değer silinir.],
    [Değişkenler doğrudan elektrik kesilse dahi veriyi kalıcı tutar.],
    [Değişken adları bellekteki adrese kolay erişim sağlar.]
  )

+ #soru_bilgi[Konu: Veri Türleri ve RAM Kullanımı]\
  Temel veri türlerinin bellek kullanımları düşünüldüğünde, yalnızca `True` veya `False` değerlerini saklayan ve RAM'de 1 bayt yer kaplayan mantıksal veri türü hangisidir?
  #siklar4([int], [float], [bool], [char])

+ #soru_bilgi[Konu: input() Fonksiyonu ve Tür Dönüşümü]\
  Python'da klavyeden veri almak için kullanılan `input()` fonksiyonu, kullanıcı rakam girse dahi veriyi hangi türde döndürür?
  #siklar4([int], [float], [str], [bool])

+ #soru_bilgi[Konu: Bilinçli Tür Dönüşümü]\
  Python'da `int(85.85)` ifadesi çalıştırıldığında üretilen sonuç aşağıdakilerden hangisidir?
  #siklar4([85.85], [86], [85], [Hata verir])

+ #soru_bilgi[Konu: Değişken Tanımlama Kuralları]\
  Aşağıdaki değişken adlarından hangisi Python değişken tanımlama kurallarına *aykırıdır*?
  #siklar4([`okul_no`], [`_toplam`], [`1yazili`], [`ogrenciNotu`])

+ #soru_bilgi[Konu: Bileşik Atama Operatörleri]\
  Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi -= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?
  #siklar4([22], [32], [26], [30])

+ #soru_bilgi[Konu: Aritmetik Operatörler ve İşlem Önceliği]\
  Python'da `2 ** 6` işleminin sonucu kaçtır? (İpucu: Üs alma sağdan sola çalışır).
  #siklar4([64], [512], [36], [18])

+ #soru_bilgi[Konu: print() Fonksiyonu Parametreleri]\
  `print("16","11","2026", sep="-")` komutunun ekran çıktısı aşağıdakilerden hangisidir?
  #siklar4([16 11 2026], [16-11-2026], [16112026], [16/11/2026])

+ #soru_bilgi[Konu: Tür Kontrolü (`isinstance`)]\
  `isinstance(7.5, (int, float))` ifadesinin çalışma sonucu nedir?
  #siklar4([True], [False], [float], [int])

+ #soru_bilgi[Konu: Veri Türleri ve Donanım Mantığı]\
  *Soru:* `char rakam = '5';` ifadesi ile `int sayi = 5;` ifadesi arasındaki farkı; bellek kullanımı ve matematiksel işlemlere girebilme açısından açıklayınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: `input()` ve Tür Dönüşümü]\
  *Soru:* Python'da yazılan `yas = int(input("Yaşınız: "))` satırı çalıştırıldığında sürecin *içten dışa* nasıl gerçekleştiğini iki adımda açıklayınız.\
  #v(3.5cm)
