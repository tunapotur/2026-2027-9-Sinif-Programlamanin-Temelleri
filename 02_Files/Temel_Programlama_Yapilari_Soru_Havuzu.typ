// Temel Programlama Yapıları – Ölçme ve Değerlendirme Soru Havuzu
// Kaynak: 02_Temel_Programlama_Yapilari.pdf
// Öğrenci soruları ve öğretmen cevap anahtarı aynı dosyada ayrı bölümlerdedir.

#import "/pageGeneralConfig.typ": *

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

#let soru(no, metin) = [
  *#no.* #metin
]

== Temel Programlama Yapıları Ölçme ve Değerlendirme Soru Havuzu

#align(center)[
  #text(size: 16pt, weight: "bold", fill: rgb("#17365D"))[TEMEL PROGRAMLAMA YAPILARI] \
  #v(0.2em)
  #text(size: 13pt, weight: "bold")[Ölçme ve Değerlendirme Soru Havuzu] \
  #v(0.3em)
  #text(size: 9pt, fill: luma(100))[Teorik sorular • Uygulama gerektirmez]
]
#v(0.5em)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [*Adı Soyadı:* #line(length: 100%, stroke: 0.5pt + gray)],
  [*Sınıfı / Numarası:* #line(length: 100%, stroke: 0.5pt + gray)],
)
#v(0.4em)
*Yönerge:* Soruları dikkatlice okuyunuz. Çoktan seçmeli sorularda yalnızca bir doğru seçenek vardır. Açık uçlu sorularda cevabınızı anlaşılır ve gerekçeli biçimde yazınız.

=== A. Çoktan Seçmeli Sorular

#text(size: 9pt, fill: luma(100))[Her soru 5 seçeneklidir. Doğru olduğunu düşündüğünüz seçeneği işaretleyiniz.]

#set enum(numbering: "A)")

#soru(1, [Bilgisayarlarda elektrik akımını geçirerek veya keserek 1 ve 0 değerlerinin oluşmasını sağlayan temel elektronik bileşen aşağıdakilerden hangisidir?])
+ Transformatör
+ Transistör
+ Direnç
+ Kondansatör
+ Diyot

#soru(2, [Bir Byte kaç bitten oluşur?])
+ 2
+ 4
+ 8
+ 16
+ 32

#soru(3, [Onaltılık (Hexadecimal) sayı sisteminin makine kodlarının gösteriminde kullanılmasının temel yararı aşağıdakilerden hangisidir?])
+ İşlemcinin çalışma hızını doğrudan artırması
+ RAM kapasitesini yükseltmesi
+ Uzun ikili sayı dizilerini daha kısa ve okunabilir biçimde göstermesi
+ Programlama dilini otomatik olarak çevirmesi
+ Bilgisayarın elektrik tüketimini azaltması

#soru(4, [ASCII tablosunun temel amacı aşağıdakilerden hangisidir?])
+ Görüntü dosyalarını sıkıştırmak
+ Harf ve sembollere sayısal kodlar karşılık getirmek
+ İşlemci komutlarını hızlandırmak
+ RAM alanını yönetmek
+ Programlama dillerini makine diline çevirmek

#soru(5, [Assembly dilinin makine koduna göre sağladığı temel kolaylık aşağıdakilerden hangisidir?])
+ Komutları yalnızca grafiklerle göstermesi
+ Makine komutlarını daha anlaşılır sembolik isimlerle ifade etmesi
+ Programın hiçbir çeviriciye ihtiyaç duymaması
+ RAM kullanımını ortadan kaldırması
+ Yalnızca internet bağlantısıyla çalışması

#soru(6, [Ders notunda açıklanan genel ayrımla, derleyici ve yorumlayıcı arasındaki farkı en doğru ifade eden seçenek hangisidir?])
+ Derleyici yalnızca Python'da, yorumlayıcı yalnızca C++'ta kullanılır.
+ Derleyici programı donanıma dönüştürmeden siler.
+ Derleyici kaynak programı bütün olarak çevirirken yorumlayıcı komutları sırayla yorumlayıp çalıştırır.
+ Yorumlayıcı yalnızca değişken adlarını çevirir.
+ İkisi de yalnızca görsel tasarım yapmak için kullanılır.

#soru(7, [Programlamada değişken kullanmanın temel amacı nedir?])
+ Bilgisayarın ekran çözünürlüğünü değiştirmek
+ Program çalışırken kullanılacak verileri bellekte bir isim aracılığıyla tutmak
+ İnternet bağlantısını yönetmek
+ İşlemciyi fiziksel olarak hızlandırmak
+ Program dosyasının uzantısını değiştirmek

#soru(8, [Ders notunda verilen yaygın C++ veri türü boyutları dikkate alındığında aşağıdakilerden hangisi doğrudur?])
+ char 8 Byte, int 1 Byte'tır.
+ float 8 Byte, double 4 Byte'tır.
+ char 1 Byte, int 4 Byte, float 4 Byte, double 8 Byte olarak örneklendirilmiştir.
+ Tüm veri türleri bellekte aynı alanı kaplar.
+ bool her bilgisayarda kesinlikle 8 Byte'tır.

#soru(9, [Yalnızca True veya False değerlerinden birini alabilen veri türü hangisidir?])
+ int
+ float
+ str
+ bool
+ char

#soru(10, [ASCII tablosunda 0–31 aralığındaki değerler ve 127 numaralı değer genel olarak hangi tür karakterleri temsil eder?])
+ Ondalık sayıları
+ Büyük harfleri
+ Kontrol karakterlerini
+ Matematiksel operatörleri
+ Dosya uzantılarını

#soru(11, [İşlemcinin RAM'deki veriye erişmesiyle ilgili aşağıdaki ifadelerden hangisi doğrudur?])
+ RAM, işlemcinin yaptığı tüm hesaplamaları tek başına gerçekleştirir.
+ Veri yolu yalnızca görüntüleri ekrana taşır.
+ İşlemci, RAM'den veriyi veri yolu aracılığıyla alabilir ve işledikten sonra sonucu belleğe yazabilir.
+ ALU, bilgisayarın kalıcı depolama birimidir.
+ İşlemci RAM'e ihtiyaç duymadan tüm program verilerini sürekli içinde saklar.

#soru(12, [Python'da input() fonksiyonunun kullanıcıdan aldığı verinin varsayılan veri türü hangisidir?])
+ int
+ float
+ bool
+ str
+ list

#soru(13, [Aşağıdakilerden hangisi Python'da değişken adı olarak kullanılmaya uygundur?])
+ 2ogrenci
+ ogrenci-numarasi
+ ogrenci numarasi
+ ogrenci_numarasi
+ class

#soru(14, [Python'da iki değerin eşit olup olmadığını karşılaştırmak için hangi operatör kullanılır?])
+ `=`
+ `==`
+ `=>`
+ `:=`
+ `!=`

#soru(15, [Ders notunda verilen işlem önceliği sıralamasına göre aşağıdakilerden hangisi doğrudur?])
+ Mantıksal or, aritmetik işlemlerden önce yapılır.
+ Atama operatörü her zaman ilk sırada çalışır.
+ Parantezler önce, aritmetik işlemler sonra, karşılaştırmalar ve mantıksal işlemler daha sonra değerlendirilir.
+ and operatörü, parantezlerden önce değerlendirilir.
+ Karşılaştırma operatörleri tüm aritmetik işlemlerden önce değerlendirilir.

#soru(16, [print() fonksiyonunda sep parametresinin görevi nedir?])
+ Çıktının yazı tipini değiştirmek
+ Birden fazla değer arasına yerleştirilecek ayırıcıyı belirlemek
+ Çıktının sonuna otomatik olarak sayı eklemek
+ Programı durdurmak
+ Kullanıcıdan veri almak

#soru(17, [Python'daki abs() fonksiyonu temel olarak ne yapar?])
+ Bir sayıyı yuvarlar.
+ Bir sayının veri türünü bulur.
+ Birden fazla sayı arasından en büyüğünü seçer.
+ Bir sayının mutlak değerini verir.
+ Bir metnin karakter sayısını bulur.

#soru(18, [Python'da bir değişkenin veri türünü öğrenmek için hangi fonksiyon kullanılabilir?])
+ len()
+ type()
+ round()
+ input()
+ print()

=== B. Boşluk Doldurma Soruları

*Aşağıdaki cümlelerde boş bırakılan yerleri uygun kavram veya ifadelerle tamamlayınız.*

#set enum(numbering: "1.")

+ Bilgisayarda bilginin en küçük birimine ............... denir.
+ 8 bitin bir araya gelmesiyle ............... oluşur.
+ 0–9 rakamları ile A–F harflerini kullanan sayı sistemine ............... sayı sistemi denir.
+ Harf ve sembolleri sayısal kodlarla temsil etmek için kullanılan standart tablonun adı ...............'dir.
+ Makine komutlarını sembolik ve hatırlanabilir kısaltmalarla ifade eden dile ............... denir.
+ Bilgisayar çalışırken programların ve verilerin geçici olarak tutulduğu ana bellek ............... olarak adlandırılır.
+ İşlemci ile bellek arasında verilerin taşınmasını sağlayan bağlantı yapısına ............... denir.
+ İşlemcinin aritmetik ve mantıksal işlemleri gerçekleştiren birimi ............... olarak adlandırılır.
+ Python'da ondalıklı sayıları temsil etmek için kullanılan temel veri türü ...............'tır.
+ Python'da doğru/yanlış değerlerini temsil eden veri türü ...............'tur.
+ Python'da kullanıcıdan veri almak için ............... fonksiyonu kullanılır.
+ Kullanıcıdan alınan metin biçimindeki bir değeri tam sayıya dönüştürmek için ............... fonksiyonu kullanılabilir.
+ Değişken adlarında kelimelerin alt çizgi ile ayrıldığı yazım biçimine ............... denir.
+ Değeri program boyunca değişmemesi beklenen veriler için kullanılan, genellikle büyük harflerle yazılan isimlendirme yaklaşımı ............... olarak adlandırılır.
+ Python'da açıklama satırı oluşturmak için satırın başına ............... karakteri yazılır.
+ Python'da ekrana çıktı vermek için ............... fonksiyonu kullanılır.

=== C. Eşleştirme Soruları

*1. Aşağıdaki kavramları açıklamalarıyla eşleştiriniz.*

#table(
  columns: (1fr, 2.8fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Kavram*], [*Açıklama*],
  [1. RAM], [A. Makine komutlarını sembolik isimlerle ifade eden dil],
  [2. CPU], [B. Program ve verilerin çalışma sırasında geçici tutulduğu bellek],
  [3. Veri Yolu], [C. Komutları işleyen merkezi işlem birimi],
  [4. ASCII], [D. Karakterlere sayısal kodlar karşılık getiren standart],
  [5. Assembly], [E. Bileşenler arasında veri taşınmasını sağlayan yol],
)
*Cevaplar:* 1–.....  2–.....  3–.....  4–.....  5–.....

#v(0.6em)
*2. Aşağıdaki Python fonksiyonlarını görevleriyle eşleştiriniz.*

#table(
  columns: (1fr, 2.8fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Fonksiyon*], [*Görev*],
  [1. `len()`], [A. Sayıyı belirtilen basamak hassasiyetine göre yuvarlar],
  [2. `abs()`], [B. Bir değerin veri türünü verir],
  [3. `round()`], [C. Sayının mutlak değerini verir],
  [4. `type()`], [D. Bir dizinin veya metnin uzunluğunu verir],
  [5. `max()`], [E. Verilen değerler arasındaki en büyük değeri bulur],
)
*Cevaplar:* 1–.....  2–.....  3–.....  4–.....  5–.....

=== D. Paragrafta Uygun Kavramı Bulma

*1. Aşağıdaki paragrafta boş bırakılan yerlere verilen kavramlardan uygun olanları yerleştiriniz.*

#text(weight: "bold")[Kavram havuzu:] #text(fill: rgb("#1D6B45"))[RAM • İşlemci • Veri Yolu • Oku • İşle • Yaz • ALU]

Bilgisayarda bir program çalışırken ihtiyaç duyulan veriler öncelikle ............... üzerinde tutulur. ............... bu verileri ............... için ............... üzerinden alır. İşlemcinin aritmetik ve mantıksal hesaplamaları gerçekleştiren bölümü ............... olarak adlandırılır. İşlemci veriyi ..............., gerekli hesaplamayı ............... ve elde ettiği sonucu tekrar belleğe ............... .

#v(0.8em)
*2. Aşağıdaki paragrafta boş bırakılan yerlere verilen veri türlerinden uygun olanları yerleştiriniz.*

#text(weight: "bold")[Kavram havuzu:] #text(fill: rgb("#1D6B45"))[`int` • `float` • `bool` • `char` • `str` • ondalıklı • tam • karakter]

Programlamada verinin niteliğine göre farklı veri türleri kullanılır. ............... veri türü tam sayıları, ............... veri türü ............... sayıları temsil eder. ............... veri türü yalnızca doğru veya yanlış değerlerini alabilir. Tek bir ............... saklamak için C++ dilinde ............... veri türü kullanılabilir. Python'da metinleri temsil etmek için ............... veri türünden yararlanılır.

=== E. Açık Uçlu Sorular

*Aşağıdaki soruları kendi cümlelerinizle açıklayınız. Gerektiğinde örnek verebilirsiniz.*

#soru(1, [Makine dili, hexadecimal gösterim ve Assembly dili arasındaki farkları açıklayınız. Assembly dilinin programcıya sağladığı kolaylık nedir?])
#cevap-cizgisi(4)

#soru(2, [RAM, işlemci (CPU) ve veri yolu arasındaki ilişkiyi açıklayınız. Bir program çalışırken bu bileşenler birlikte nasıl görev yapar?])
#cevap-cizgisi(4)

#soru(3, [Programlamada değişken nedir? Bir değişkene yeni bir değer atandığında bellekteki değer açısından ne değişir?])
#cevap-cizgisi(4)

#soru(4, [`int` ve `float` veri türlerini karşılaştırınız. Her sayısal veriyi `float` olarak tutmak neden uygun olmayabilir?])
#cevap-cizgisi(4)

#soru(5, [Python'da `input()` fonksiyonuyla alınan bir değerin neden doğrudan sayısal işlemde kullanılamayabileceğini açıklayınız. `int()` ve `float()` fonksiyonlarının bu konudaki görevleri nelerdir?])
#cevap-cizgisi(4)

#soru(6, [Python'da `=` ve `==` operatörlerinin görevlerini karşılaştırınız. Her biri için ne amaçla kullanıldığını açıklayınız.])
#cevap-cizgisi(4)

#soru(7, [Python'daki `and`, `or` ve `not` mantıksal operatörlerinin görevlerini açıklayınız.])
#cevap-cizgisi(4)

#soru(8, [Fonksiyon kullanmanın kod tekrarını azaltmaya nasıl katkı sağladığını açıklayınız. DRY ilkesinin anlamı nedir?])
#cevap-cizgisi(4)

#soru(9, [print() fonksiyonunda `sep` ve `end` parametrelerinin görevlerini birbirinden ayırarak açıklayınız.])
#cevap-cizgisi(4)

#soru(10, [`type()` ve `isinstance()` fonksiyonlarının veri türü kontrolünde nasıl kullanıldığını açıklayınız.])
#cevap-cizgisi(4)

=== F. Ek Çoktan Seçmeli Sorular

#text(size: 9pt, fill: luma(100))[Bu bölüm, soru havuzunu genişletmek ve kavramlar arasındaki ayrımları ölçmek amacıyla eklenmiştir.]

#set enum(numbering: "A)")

#soru(19, [Python'da bir tam sayı ile bir ondalıklı sayı aritmetik işlemde birlikte kullanıldığında sonuç genellikle hangi türde olur?])
+ `int`
+ `str`
+ `float`
+ `bool`
+ `char`

#soru(20, [Python'da sabit olarak kullanılmak üzere tanımlanan isimler için yaygın yazım geleneği aşağıdakilerden hangisidir?])
+ tumKelimelerKucuk
+ IlkHarfBuyuk
+ PI_SAYISI
+ pi-sayisi
+ 1_PI_SAYISI

#soru(21, [Python'da bir satırın açıklama olduğunu belirtmek için hangi karakter kullanılır?])
+ `$`
+ `&`
+ `#`
+ `@`
+ `!`

#soru(22, [Aşağıdakilerden hangisi aritmetik operatör değildir?])
+ `+`
+ `-`
+ `*`
+ `/`
+ `>=`

#soru(23, [Python'da `//` operatörünün temel görevi nedir?])
+ Üs alma
+ Bölme sonucunun tam sayı tabanlı bölümünü elde etme
+ Kalanı bulma
+ Eşitliği kontrol etme
+ Mantıksal olumsuzlama

#soru(24, [Python'da f-string kullanımının temel amacı nedir?])
+ Kullanıcıdan parola almak
+ Metin içinde değişken değerlerini ve ifadeleri biçimlendirerek göstermek
+ Değişkenleri silmek
+ Sayıları ikili sisteme dönüştürmek
+ Programı derlemek

=== G. Doğru – Yanlış Soruları

*İfadelerin başına doğru ise D, yanlış ise Y yazınız.*

#set enum(numbering: "1.")

+ Bir Byte, bilgisayardaki en küçük veri birimidir. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ 8 bit bir araya gelerek 1 Byte oluşturur. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ Hexadecimal sayı sisteminde 0–9 rakamları ile A–F harfleri kullanılır. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ RAM'de tutulan veriler bilgisayar kapatıldığında kalıcı olarak korunur. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ İşlemci, RAM'deki verilere veri yolu üzerinden erişebilir. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ Python'da `input()` fonksiyonu kullanıcıdan aldığı veriyi her zaman `int` türünde döndürür. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ Python'da `=` atama, `==` karşılaştırma amacıyla kullanılır. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `bool` veri türü `True` veya `False` değerlerinden birini temsil eder. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `float` veri türü yalnızca tam sayıları temsil etmek için kullanılır. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ Python'da bir değişkene programın farklı noktalarında farklı türlerde değerler atanabilir. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `print()` fonksiyonu varsayılan olarak çıktının sonuna yeni satır karakteri ekler. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `print()` fonksiyonundaki `sep` parametresi, birden fazla değer arasına konulacak ayırıcıyı belirler. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `print()` fonksiyonundaki `end` parametresi, çıktının sonunda kullanılacak ifadeyi belirler. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `\n` kaçış dizisi yeni satıra geçişi temsil eder. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)
+ `type()` fonksiyonu bir değerin veri türünü öğrenmek için kullanılabilir. #h(1fr) #line(length: 1.2cm, stroke: 0.5pt + gray)

#pagebreak()
== Ölçme ve Değerlendirme Soru Havuzu: Cevap Anahtarı (Öğretmen Bölümü)

#align(center)[
  #text(size: 15pt, weight: "bold", fill: rgb("#17365D"))[ÖĞRETMEN BÖLÜMÜ] \
  #text(size: 11pt, weight: "bold")[Cevap Anahtarı ve Değerlendirme Ölçütleri] \
  #v(0.2em)
  #text(size: 8.5pt, fill: luma(100))[Bu bölüm sınav öncesinde öğrenci nüshasından ayrılabilir.]
]

=== A. Çoktan Seçmeli Cevap Anahtarı

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  align: center,
  [*Soru*], [*Cevap*], [*Soru*], [*Cevap*], [*Soru*], [*Cevap*],
  [1], [B], [9], [D], [17], [D],
  [2], [C], [10], [C], [18], [B],
  [3], [C], [11], [C], [19], [C],
  [4], [B], [12], [D], [20], [C],
  [5], [B], [13], [D], [21], [C],
  [6], [C], [14], [B], [22], [E],
  [7], [B], [15], [C], [23], [B],
  [8], [C], [16], [B], [24], [B],
)

=== B. Boşluk Doldurma Cevapları

#enum(
  numbering: "1.",
  [Bit],
  [Byte],
  [Hexadecimal / Onaltılık],
  [ASCII],
  [Assembly],
  [RAM],
  [Veri yolu],
  [ALU],
  [`float`],
  [`bool`],
  [`input()`],
  [`int()`],
  [`snake_case`],
  [Sabitler],
  [`#`],
  [`print()`],
)

=== C. Eşleştirme Cevapları

- *C.1:* 1–B, 2–C, 3–E, 4–D, 5–A
- *C.2:* 1–D, 2–C, 3–A, 4–B, 5–E

=== D. Paragraf Tamamlama Cevapları

- *D.1:* RAM – İşlemci – Oku – Veri Yolu – ALU – Oku – İşle – Yaz.
- *D.2:* `int` – `float` – ondalıklı – `bool` – karakter – `char` – `str`.

=== E. Açık Uçlu Sorular İçin Değerlendirme Ölçütü

Her açık uçlu soru 10 puan üzerinden değerlendirilebilir:
- Kavramın doğru açıklanması: 4 puan
- İlgili kavramlar arasındaki ilişkinin kurulması: 3 puan
- Anlatımın açık, anlaşılır ve örnekle desteklenmiş olması: 3 puan

#text(size: 8.5pt, fill: luma(100))[*Öğretmen notu:* Öğrencinin aynı anlamı doğru biçimde ifade eden farklı açıklamaları da kabul edilmelidir.]

=== F. Ek Çoktan Seçmeli Cevapları

- *19:* C
- *20:* C
- *21:* C
- *22:* E
- *23:* B
- *24:* B

=== G. Doğru – Yanlış Cevapları

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  align: center,
  [*1*], [*2*], [*3*], [*4*], [*5*],
  [Y], [D], [D], [Y], [D],
  [*6*], [*7*], [*8*], [*9*], [*10*],
  [Y], [D], [D], [Y], [D],
  [*11*], [*12*], [*13*], [*14*], [*15*],
  [D], [D], [D], [D], [D],
)

=== Sınav Hazırlama Önerisi

100 puanlık örnek bir sınav şu şekilde oluşturulabilir:

#table(
  columns: (2.6fr, 1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Soru türü*], [*Adet / puan*], [*Toplam*],
  [Çoktan seçmeli], [15 × 3], [45],
  [Boşluk doldurma], [10 × 2], [20],
  [Doğru–yanlış], [5 × 1], [5],
  [Açık uçlu], [2 × 10], [20],
  [Paragraf tamamlama], [1 × 10], [10],
  [*Genel toplam*], [], [*100*],
)

*Ölçme açısından özellikle dikkat edilmesi önerilen kavramlar:*
- `=` atama ve `==` karşılaştırma operatörlerinin farkı
- `input()` fonksiyonunun metin türünde veri döndürmesi ve tür dönüşümü
- `int` ve `float` veri türlerinin kullanım alanları
- RAM, işlemci ve veri yolu arasındaki ilişki
- `sep` ve `end` parametrelerinin farklı görevleri

#v(1em)
#align(center)[
  #text(size: 8pt, fill: gray)[Temel Programlama Yapıları • Teorik Soru Havuzu]
]
