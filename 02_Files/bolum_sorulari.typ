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

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları
=== A. Çoktan Seçmeli Sorular
#soru(1, [Bilgisayarlarda elektrik akımını geçirerek veya keserek $1$ ve $0$ değerlerinin oluşmasını sağlayan temel donanım birimi aşağıdakilerden hangisidir?])
#siklar5([Transformatör], [Transistör], [Direnç], [Kondansatör], [Diyot])

#soru(2, [Bir Byte tam olarak kaç bitten oluşur?])
#siklar5([2 bit], [4 bit], [8 bit], [16 bit], [32 bit])

#soru(3, [Onaltılık (Hexadecimal) sayı sisteminde tek bir basamak, ikilik (binary) sistemde kaç bite karşılık gelir?])
#siklar5([2 bit], [4 bit], [8 bit], [16 bit], [32 bit])

#soru(4, [Onaltılık (Hexadecimal) sayı sisteminin makine kodlarının gösteriminde kullanılmasının temel yararı aşağıdakilerden hangisidir?])
#siklar2(
  [İşlemcinin çalışma hızını doğrudan artırması],
  [RAM kapasitesini iki katına yükseltmesi],
  [Uzun ikili sayı dizilerini daha kısa ve okunabilir göstermesi],
  [Programlama dillerini otomatik olarak makine diline çevirmesi],
  [Sabit diskteki verileri otomatik olarak sıkıştırması],
)

#soru(5, [ASCII tablosunun temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Görüntü dosyalarını bellekte sıkıştırmak],
  [Harf ve sembollere sayısal kodlar karşılık getirmek],
  [İşlemci komutlarının çalışmasını hızlandırmak],
  [RAM alanındaki adresleri yönetmek],
  [Python programlama kodlarını makine diline derlemek],
)

#soru(6, [Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi sembolik kısaltmalar (*mnemonics*) kullanan programlama dili hangisidir?])
#siklar5([Makine Dili], [Assembly Dili], [Python], [C++], [Java])

#soru(7, [Assembly dilinin makine koduna göre programcıya sağladığı temel kolaylık aşağıdakilerden hangisidir?])
#siklar2(
  [Komutları yalnızca görsel simgelerle ifade etmesi],
  [Makine komutlarını daha anlaşılır sembolik isimlerle yazma imkânı vermesi],
  [Programın hiçbir çeviriciye ihtiyaç duymadan çalışması],
  [RAM kullanımını tamamen ortadan kaldırması],
  [Yazılan programın tüm işletim sistemlerinde doğrudan çalışması],
)

#soru(8, [Yazdığımız kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılımlara ne ad verilir?])
#siklar5([Yorumlayıcı], [Derleyici], [Assembler], [Editör], [İşletim Sistemi])

#soru(9, [Programlamada değişken kullanmanın temel amacı nedir?])
#siklar2(
  [Bilgisayarın ekran çözünürlüğünü dinamik olarak değiştirmek],
  [Program çalışırken kullanılacak verileri bellekte bir isimle tutmak],
  [İnternet bağlantısını otomatik yönetmek],
  [İşlemcinin saat frekansını artırmak],
  [Yazılan kaynak kod dosyasının boyutunu küçültmek],
)

#soru(10, [Programlama dillerinde değişkenlerle ilgili verilen aşağıdaki ifadelerden hangisi *yanlıştır*?])
#siklar2(
  [Değişkenler verileri RAM'de geçici olarak saklar.],
  [Bir değişkene yeni değer atandığında eski değer silinir.],
  [Değişkenler elektrik kesilse dahi veriyi kalıcı olarak korur.],
  [Değişken adları bellekteki fiziksel adrese kolay erişim sağlar.],
  [Değişken tanımlanırken veri türüne uygun bellek alanı ayrılır.],
)

#soru(11, [Temel veri türleri düşünüldüğünde, yalnızca `True` veya `False` değerlerini saklayan ve RAM'de 1 bayt yer kaplayan mantıksal veri türü hangisidir?])
#siklar5([int], [float], [bool], [char], [str])

#soru(12, [İşlemcinin RAM'deki veriye erişmesiyle ilgili aşağıdaki ifadelerden hangisi *doğrudur*?])
#siklar2(
  [RAM, işlemcinin yapacağı tüm hesaplamaları tek başına tamamlar.],
  [Veri yolu yalnızca görüntü verilerini ekrana taşır.],
  [İşlemci, RAM'den veriyi veri yoluyla alıp işledikten sonra sonucu belleğe yazar.],
  [ALU, bilgisayarın kalıcı depolama birimidir.],
  [İşlemci ile RAM arasında veri iletimi olmadan programlar doğrudan çalışır.],
)

#soru(13, [Python'da klavyeden veri almak için kullanılan `input()` fonksiyonu, kullanıcı rakam girse dahi veriyi hangi türde döndürür?])
#siklar5([int], [float], [str], [bool], [None])

#pagebreak()
#soru(14, [Python'da `int(85.85)` tür dönüşümü ifadesi çalıştırıldığında üretilen sonuç aşağıdakilerden hangisidir?])
#siklar5([85.85], [86], [85], [Hata verir], ["85"])

#soru(15, [Aşağıdaki değişken adlarından hangisi Python değişken tanımlama kurallarına *aykırıdır*?])
#siklar5([`okul_no`], [`_toplam`], [`1yazili`], [`ogrenciNotu`], [`yas`])

#soru(16, [Aşağıdakilerden hangisi Python'da değişken adı olarak kullanılmaya *uygundur*?])
#siklar5([`2ogrenci`], [`ogrenci-no`], [`ogrenci no`], [`ogrenci_no`], [`class`])

#soru(17, [Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi -= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?])
#siklar5([22], [32], [26], [30], [24])

#soru(18, [Python'da iki değerin birbirine eşit olup olmadığını denetlemek (karşılaştırmak) için hangi operatör kullanılır?])
#siklar5([`=`], [`==`], [`=>`], [`:=`], [`!=`])

#soru(19, [Python'da `2 ** 6` üs alma işleminin sonucu kaçtır?])
#siklar5([64], [512], [36], [18], [12])

#soru(20, [`print("16", "11", "2026", sep="-")` komutunun ekran çıktısı aşağıdakilerden hangisidir?])
#siklar5([16 11 2026], [16-11-2026], [16112026], [16/11/2026], ["16-11-2026"])

#soru(21, [Python'da bir değişkenin veri türünü öğrenmek için aşağıdaki fonksiyonlardan hangisi kullanılır?])
#siklar5([`len()`], [`type()`], [`round()`], [`input()`], [`print()`])

#soru(22, [`isinstance(7.5, (int, float))` ifadesinin çalışma sonucu aşağıdakilerden hangisidir?])
#siklar5([True], [False], [float], [int], [Hata verir])

#soru(23, [Python'da bir tam sayı (`int`) ile bir ondalıklı sayı (`float`) aritmetik işleme girdiğinde sonuç hangi veri türünde olur?])
#siklar5([`int`], [`str`], [`float`], [`bool`], [`char`])

#soru(24, [Python'da tek satırlık açıklama (yorum) belirtmek için satırın başına hangi karakter yazılır?])
#siklar5([`$`], [`&`], [`#`], [`@`], [`!`])

#soru(25, [Aşağıdakilerden hangisi bir aritmetik operatör *değildir*?])
#siklar5([`+`], [`-`], [`*`], [`/`], [`>=`])

#soru(26, [Python'da f-string (`f"..."`) kullanımının temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Kullanıcıdan parola gibi gizli verileri güvenle almak],
  [Metin içinde değişken değerlerini ve ifadeleri `{}` ile doğrudan biçimlendirmek],
  [Kullanılmayan değişkenleri bellekten otomatik silmek],
  [Sayıları arka planda ikilik sisteme dönüştürmek],
  [Yazılan kodların çalışma süresini ölçmek],
)

#v(0.5em)

=== B. Boşluk Doldurma Soruları
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki cümlelerde boş bırakılan yerleri en uygun kavram veya ifadeyle tamamlayınız.]

#soru(27, [Bilgisayarda bilginin en küçük temel veri birimine ............... denir.])

#soru(28, [8 bitin yan yana gelmesiyle oluşan veri birimine ............... adı verilir.])

#soru(29, [0–9 rakamları ile A–F harflerini kullanan sayı sistemine ............... sayı sistemi denir.])

#soru(30, [Harf ve sembolleri sayısal kodlarla temsil etmek için kullanılan standart tablonun adı ...............'dir.])

#soru(31, [Makine komutlarını sembolik ve hatırlanabilir kısaltmalarla ifade eden alt seviyeli dile ............... denir.])

#soru(32, [Bilgisayar çalışırken programların ve verilerin geçici olarak tutulduğu ana belleğe ............... adı verilir.])

#soru(33, [Python'da ondalıklı sayıları temsil etmek için kullanılan temel veri türü ...............'tır.])

#soru(34, [Python'da doğru ve yanlış değerlerini temsil eden mantıksal veri türü ...............'tur.])

#soru(35, [Python'da klavyeden kullanıcı girdisi almak için ............... fonksiyonu kullanılır.])

#soru(36, [Kullanıcıdan metin biçiminde alınan sayısal bir girdiyi tam sayıya çevirmek için ............... fonksiyonu kullanılır.])

#soru(37, [Python'da hesaplanan sonuçları ekrana çıktı olarak yazdırmak için ............... fonksiyonu kullanılır.])

#v(0.5em)

=== C. Eşleştirme Soruları
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki temel kavramları doğru açıklamalarıyla eşleştiriniz.]

#soru(38, [Aşağıdaki numaralandırılmış kavramlar ile harflendirilmiş görev tanımlarını eşleştiriniz:])

#table(
  columns: (1fr, 3fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Kavram*], [*Açıklama / Görev*],
  [1. RAM], [A. Makine komutlarını sembolik kısaltmalarla ifade eden programlama dili],
  [2. CPU], [B. Program ve verilerin çalışma sırasında geçici tutulduğu birincil bellek],
  [3. Veri Yolu (Bus)], [C. Komutları yorumlayıp çalıştıran merkezi işlem birimi],
  [4. ASCII], [D. Karakter ve sembollere standart sayısal kodlar atayan tablo],
  [5. Assembly], [E. Donanım bileşenleri arasında veri taşınmasını sağlayan iletim hattı],
)
#v(0.2em)
*Cevaplarınız:*  *1* – ..... #h(1.5em) *2* – ..... #h(1.5em) *3* – ..... #h(1.5em) *4* – ..... #h(1.5em) *5* – .....

#v(0.5em)

=== D. Doğru – Yanlış Soruları
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki ifadeleri inceleyerek doğru olanların sonuna (D), yanlış olanların sonuna (Y) yazınız.]

#soru(39, [Bir Byte, bilgisayardaki en küçük veri birimidir. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(40, [8 bit bir araya gelerek 1 Byte oluşturur. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(41, [Hexadecimal sayı sisteminde 0–9 rakamları ile A–F harfleri kullanılır. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(42, [RAM'de tutulan veriler bilgisayar kapatıldığında dahi kalıcı olarak korunur. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(43, [İşlemci, RAM'deki verilere veri yolu üzerinden doğrudan erişebilir. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(44, [Python'da `input()` fonksiyonu kullanıcıdan aldığı veriyi her zaman `int` türünde döndürür. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(45, [Python'da `=` atama operatörü, `==` ise eşitlik karşılaştırma operatörüdür. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(46, [`bool` veri türü yalnızca `True` veya `False` mantıksal değerlerinden birini alır. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(47, [`float` veri türü bellekte yalnızca tam sayı değerlerini saklamak için kullanılır. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(48, [Python'da aynı değişkene programın farklı satırlarında farklı türlerde değerler atanabilir. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(49, [`type()` fonksiyonu bir değişkenin veya değerin veri türünü öğrenmek için kullanılır. #h(1fr) #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#v(0.5em)

=== E. Açık Uçlu ve Klasik Sorular
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki soruları kendi cümlelerinizle, kavramsal nedenlerini belirterek açıklayınız.]

#soru(50, [Programlamada değişken nedir? Bir değişkene yeni bir değer atandığında bellekteki (RAM) değer ve adres açısından ne değişir?])
#cevap-cizgisi(4)

#soru(51, [`int` ve `float` veri türlerini karşılaştırınız. Tüm sayısal verileri `float` olarak saklamak bellek ve işlemci açısından neden uygun değildir?])
#cevap-cizgisi(4)

#soru(52, [Python'da `input()` fonksiyonuyla alınan bir verinin doğrudan matematiksel işlemde kullanılamama nedenini açıklayınız. `int()` ve `float()` fonksiyonlarının bu süreçteki rolü nedir?])
#cevap-cizgisi(4)

#soru(53, [Python'da `=` ile `==` operatörlerinin görevlerini karşılaştırınız. Her iki operatörün kullanım amacını birer örnekle açıklayınız.])
#cevap-cizgisi(4)

#soru(54, [Fonksiyon kullanmanın kod tekrarını azaltmaya ve program bakımına katkısını açıklayınız. Yazılımda *DRY (Don't Repeat Yourself)* ilkesi ne anlama gelir?])
#cevap-cizgisi(4)

#soru(55, [`char rakam = '5';` ifadesi ile `int sayi = 5;` ifadesi arasındaki farkı; bellek kullanımı ve matematiksel işlemlere girebilme açısından karşılaştırınız.])
#cevap-cizgisi(4)

#soru(56, [Python'da yazılan `yas = int(input("Yaşınız: "))` satırı çalıştırıldığında işletim sürecinin *içten dışa* nasıl gerçekleştiğini iki adımda açıklayınız.])
#cevap-cizgisi(4)
