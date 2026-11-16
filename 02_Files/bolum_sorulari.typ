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

// TODO bu soruyu sil
+ #soru_bilgi[Konu: ASCII Karakter Tablosu]\
  ASCII tablosunda $0$ ile $31$ arasındaki karakterler ve $127$ numaralı `DEL` karakteri ekranda görünür bir harf veya sembol üretmez. Bu karakter grubuna ne ad verilir?
  #siklar2([Yazdırılabilir Karakterler], [Kontrol Karakterleri], [Genişletilmiş Karakterler], [Aritmetik Karakterler])

// TODO bu soruyu sil
+ #soru_bilgi[Konu: Veri Büyüklükleri ve Bellek Hesabı]\
  Piyasadan satın alınan 1 TB kapasiteli bir SSD bilgisayara takıldığında işletim sisteminde yaklaşık 931 GB olarak görünür. Bu durumun temel sebebi aşağıdakilerden hangisidir?
  #siklar2(
    [Diskte üretim hatası olması],
    [İşletim sisteminin diskin bir kısmını kendine ayırması],
    [Üreticilerin 1 KB = 1000 Byte, işletim sisteminin 1 KB = 1024 Byte kabul etmesi],
    [SSD'lerin içine yazılım yüklenememesi]
  )

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

// TODO bu soruyu sil
+ #soru_bilgi[Konu: Python Dili Özellikleri]\
  Python programlama dilini C ve Java gibi dillerden ayıran ve kod bloklarını (kapsamları) belirlemek için kullanılan temel söz dizimi kuralı nedir?
  #siklar2(
    [Süslü parantez `{ }` kullanımı],
    [Noktalı virgül `;` ile satır bitirme],
    [Girintiler (Indentation / Tab boşluğu)],
    [Tüm değişkenlerin başına `$` işareti koyma]
  )

+ #soru_bilgi[Konu: input() Fonksiyonu ve Tür Dönüşümü]\
  Python'da klavyeden veri almak için kullanılan `input()` fonksiyonu, kullanıcı rakam girse dahi veriyi hangi türde döndürür?
  #siklar4([int], [float], [str], [bool])

+ #soru_bilgi[Konu: Bilinçli Tür Dönüşümü]\
  Python'da `int(85.85)` ifadesi çalıştırıldığında üretilen sonuç aşağıdakilerden hangisidir?
  #siklar4([85.85], [86], [85], [Hata verir])

+ #soru_bilgi[Konu: Değişken Tanımlama Kuralları]\
  Aşağıdaki değişken adlarından hangisi Python değişken tanımlama kurallarına *aykırıdır*?
  #siklar4([`okul_no`], [`_toplam`], [`1yazili`], [`ogrenciNotu`])

// TODO burada sayi //= 4 yerine başka bir işlem düşün.
+ #soru_bilgi[Konu: Bileşik Atama Operatörleri]\
  Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi //= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?
  #siklar4([7.5], [7], [8], [30])

// TODO bu sorunun cevabı düzeltilecek
+ #soru_bilgi[Konu: Aritmetik Operatörler ve İşlem Önceliği]\
  Python'da `2 ** 6` işleminin sonucu kaçtır? (İpucu: Üs alma sağdan sola çalışır).
  #siklar4([64], [512], [36], [18])

+ #soru_bilgi[Konu: print() Fonksiyonu Parametreleri]\
  `print("16","11","2026", sep="-")` komutunun ekran çıktısı aşağıdakilerden hangisidir?
  #siklar4([16 11 2026], [16-11-2026], [16112026], [16/11/2026])

+ #soru_bilgi[Konu: Tür Kontrolü (`isinstance`)]\
  `isinstance(7.5, (int, float))` ifadesinin çalışma sonucu nedir?
  #siklar4([True], [False], [float], [int])

#pagebreak()
// Bu bölüm komple silinecek
=== B. Boşluk Doldurma Soruları
Aşağıdaki cümlelerde yer alan boşlukları, cümlenin anlamına ve derste öğrenilen kavramlara uygun şekilde doldurunuz.

+ Bilgisayardaki en küçük mantıksal veri birimine #underline[#h(3.5cm)] (kısaltması: bit) denir.
+ Onaltılık (Hexadecimal) sayı sisteminde 10 ile 15 arasındaki sayılar #underline[#h(3.5cm)] harfleriyle temsil edilir.
+ Bilgisayar mimarisinde 8 adet bitin yan yana gelmesiyle oluşan 1 karakterlik veri kümesine #underline[#h(3cm)] denir.
+ Bilişim mimarisinde bellek adreslemesi 2'nin kuvvetleri şeklinde ilerlediği için her büyüklük basamağı bir öncekinin #underline[#h(2.5cm)] katıdır.
+ Assembly dilinde komutların `1011 0000` gibi sayılar yerine `MOV`, `ADD` gibi akılda kalıcı sembolik kelimelerle ifade edilmesine #underline[#h(3cm)] adı verilir.
+ Kaynak kodları satır satır okuyarak anında çalıştıran çevirici yazılımlara #underline[#h(3cm)] denir. Python bu türe örnektir.
+ Bilgisayarın geçici hafızası olan ve program çalışırken değişkenlerin tutulduğu donanım birimine #underline[#h(3cm)] adı verilir.
+ Tek tırnak içinde tanımlanan tek bir karakteri tutan ve bellekte 1 bayt yer kaplayan veri türü #underline[#h(3cm)] veri türüdür.
+ Toplam bellek alanı formülüne göre `"ANKARA"` metni bellekte tam olarak #underline[#h(2.5cm)] bayt yer kaplar.
+ Aynı kodun farklı yerlerde gereksizce tekrar yazılmasını önleme ilkesine yazılım dünyasında #underline[#h(3.5cm)] ilkesi denir.
+ Python'da farklı türler aritmetik işleme girdiğinde (örneğin `int * float`), sonucun otomatik olarak `float` türe dönüşmesine #underline[#h(3.5cm)] dönüşüm denir.
+ Python dilinde değişken ve fonksiyon adlandırmasında kelimelerin küçük harflerle yazılıp alt çizgi ile ayrıldığı standarda #underline[#h(3.5cm)] notasyonu denir.
+ Değeri program boyunca değişmeyen ve tanımlanırken tüm harfleri büyük yazılan değişkenlere #underline[#h(3cm)] denir.
+ Python'da iki sayının bölümünden kalanı (mod) bulmak için #underline[#h(2.5cm)] operatörü kullanılır.
+ `print()` fonksiyonunda yazdırılan değerlerin arasına gelecek ayracı belirlemek için #underline[#h(2.5cm)] parametresi kullanılır.
+ Bir nesnenin veya değişkenin türünü öğrenmek için #underline[#h(2.5cm)] fonksiyonu, belirli bir türe ait olup olmadığını doğrulamak için #underline[#h(3cm)] fonksiyonu kullanılır.


#pagebreak()
=== C. Kısa Cevaplı ve Açık Uçlu Değerlendirme Soruları

+ #soru_bilgi[Konu: Depolama Birimleri Hesabı]\
  *Soru:* Piyasadan satın alınan 1 TB kapasiteli bir harici diski bilgisayarınıza taktığınızda depolama alanı neden yaklaşık 931 GB görünür? Üretici ve işletim sistemi mantığını belirterek açıklayınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: Derleyici ve Yorumlayıcı]\
  *Soru:* Derleyici (*Compiler*) ile Yorumlayıcı (*Interpreter*) arasındaki temel çalışma farkı nedir? Python hangi yöntemi kullanır?\
  #v(3.5cm)

// TODO bu soru kalsın
+ #soru_bilgi[Konu: Veri Türleri ve Donanım Mantığı]\
  *Soru:* `char rakam = '5';` ifadesi ile `int sayi = 5;` ifadesi arasındaki farkı; bellek kullanımı ve matematiksel işlemlere girebilme açısından açıklayınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: Karakter Dizileri ve Bellek]\
  *Soru:* `"KONYA"` kelimesi ile `"KONYA MERKEZ"` kelime grubu bellekte (RAM) kaçar bayt yer kaplar? Boşluk karakterinin durumunu da belirterek hesaplayınız.\
  #v(3.5cm)

#pagebreak()
// TODO bu soru kalsın
+ #soru_bilgi[Konu: `input()` ve Tür Dönüşümü]\
  *Soru:* Python'da yazılan `yas = int(input("Yaşınız: "))` satırı çalıştırıldığında sürecin *içten dışa* nasıl gerçekleştiğini iki adımda açıklayınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: Tür Dönüşümü vs. Yuvarlama]\
  *Soru:* Python'da `int(85.85)` ifadesi ile `round(85.85)` fonksiyonu arasındaki temel fark nedir? Her iki ifadenin üreteceği sonuçları yazınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: Değişken Tanımlama Kuralları]\
  *Soru:* Python'da bir değişken adı tanımlarken uyulması gereken 4 temel kuralı maddeler halinde yazınız.\
  #v(3.5cm)

+ #soru_bilgi[Konu: Tür Kontrolü]\
  *Soru:* `type()` fonksiyonu ile `isinstance()` fonksiyonu arasındaki kullanım amacı farkını kısaca açıklayınız.\
  #v(3.5cm)
