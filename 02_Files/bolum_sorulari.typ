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


#block(
  width: 100%,
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 6pt,
  fill: rgb("#f8fafc"),
  inset: (x: 12pt, y: 9.5pt),
  below: 0.75em,
)[
  #align(center)[
    #text(size: 8.5pt, weight: "bold", fill: rgb("#0284c7"), tracking: 1.2pt)[BİLİŞİM TEKNOLOJİLERİ ALANI · 9. SINIF PROGRAMLAMANIN TEMELLERİ] \
    #v(0.25em)
    #text(size: 13.5pt, weight: "bold", fill: rgb("#0f172a"))[BÖLÜM 2 TEMEL PROGRAMLAMA YAPILARI] \
    #v(0.2em)
    #text(size: 10.5pt, weight: "bold", fill: rgb("#0f766e"))[Bölüm Değerlendirme ve Çalışma Soruları] \
    // #v(0.15em)
    // #text(size: 8pt, fill: rgb("#64748b"))[2026 – 2027 Eğitim Öğretim Yılı]
  ]
]

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları

#soru(1, [Bilgisayarlarda elektrik akımını geçirerek veya keserek $1$ ve $0$ değerlerinin oluşmasını sağlayan temel donanım birimi aşağıdakilerden hangisidir?])
#siklar5([Transistör], [Transformatör], [Direnç], [Kondansatör], [Diyot])


#soru(2, [Bir Byte tam olarak kaç bitten oluşur?])
#siklar5([2 bit], [8 bit], [4 bit], [16 bit], [32 bit])

#soru(3, [Onaltılık (Hexadecimal) sayı sisteminde tek bir basamak, ikilik (binary) sistemde kaç bite karşılık gelir?])
#siklar5([2 bit], [8 bit], [16 bit], [32 bit], [4 bit])

#soru(4, [Onaltılık (Hexadecimal) sayı sisteminin makine kodlarının gösteriminde kullanılmasının temel yararı aşağıdakilerden hangisidir?])
#siklar2(
  [Uzun ikili sayı dizilerini daha kısa ve okunabilir göstermesi],
  [RAM kapasitesini iki katına yükseltmesi],
  [İşlemcinin çalışma hızını doğrudan artırması],
  [Programlama dillerini otomatik olarak makine diline çevirmesi],
  [Sabit diskteki verileri otomatik olarak sıkıştırması],
)

#soru(5, [ASCII tablosunun temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Görüntü dosyalarını bellekte sıkıştırmak],
  [İşlemci komutlarının çalışmasını hızlandırmak],
  [Harf ve sembollere sayısal kodlar karşılık getirmek],
  [RAM alanındaki adresleri yönetmek],
  [Python programlama kodlarını makine diline derlemek],
)

#soru(6, [Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi sembolik kısaltmalar (*mnemonics*) kullanan programlama dili hangisidir?])
#siklar5([Makine Dili], [C++], [Python], [Assembly Dili], [Java])

#soru(7, [Assembly dilinin makine koduna göre programcıya sağladığı temel kolaylık aşağıdakilerden hangisidir?])
#siklar2(
  [Komutları yalnızca görsel simgelerle ifade etmesi],
  [Makine komutlarını daha anlaşılır sembolik isimlerle yazma imkânı vermesi],
  [Programın hiçbir çeviriciye ihtiyaç duymadan çalışması],
  [RAM kullanımını tamamen ortadan kaldırması],
  [Yazılan programın tüm işletim sistemlerinde doğrudan çalışması],
)

#soru(8, [Yazdığımız kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılımlara ne ad verilir?])
#siklar5([Derleyici], [Yorumlayıcı], [Assembler], [Editör], [İşletim Sistemi])

#soru(9, [Programlamada değişken kullanmanın temel amacı nedir?])
#siklar2(
  [Bilgisayarın ekran çözünürlüğünü dinamik olarak değiştirmek],
  [Yazılan kaynak kod dosyasının boyutunu küçültmek],
  [İnternet bağlantısını otomatik yönetmek],
  [İşlemcinin saat frekansını artırmak],
  [Program çalışırken kullanılacak verileri bellekte bir isimle tutmak],
)

#soru(10, [Programlama dillerinde değişkenlerle ilgili verilen aşağıdaki ifadelerden hangisi *yanlıştır*?])
#siklar2(
  [Değişkenler verileri RAM'de geçici olarak saklar.],
  [Bir değişkene yeni değer atandığında eski değer silinir.],
  [Değişken tanımlanırken veri türüne uygun bellek alanı ayrılır.],
  [Değişken adları bellekteki fiziksel adrese kolay erişim sağlar.],
  [Değişkenler elektrik kesilse dahi veriyi kalıcı olarak korur.],
)

#soru(11, [Temel veri türleri düşünüldüğünde, yalnızca `True` veya `False` değerlerini saklayan ve RAM'de 1 bayt yer kaplayan mantıksal veri türü hangisidir?])
#siklar5([int], [float], [char], [bool], [str])

#soru(12, [İşlemcinin RAM'deki veriye erişmesiyle ilgili aşağıdaki ifadelerden hangisi *doğrudur*?])
#siklar2(
  [RAM, işlemcinin yapacağı tüm hesaplamaları tek başına tamamlar.],
  [İşlemci, RAM'den veriyi veri yoluyla alıp işledikten sonra sonucu belleğe yazar.],
  [Veri yolu yalnızca görüntü verilerini ekrana taşır.],
  [ALU, bilgisayarın kalıcı depolama birimidir.],
  [İşlemci ile RAM arasında veri iletimi olmadan programlar doğrudan çalışır.],
)

#soru(13, [Python'da klavyeden veri almak için kullanılan `input()` fonksiyonu, kullanıcı rakam girse dahi veriyi hangi türde döndürür?])
#siklar5([int], [float], [None], [bool], [str])

// #pagebreak()
#soru(14, [Python'da `int(85.85)` tür dönüşümü ifadesi çalıştırıldığında üretilen sonuç aşağıdakilerden hangisidir?])
#siklar5([85.85], [86], [85], [Hata verir], ["85"])

#soru(15, [Aşağıdaki değişken adlarından hangisi Python değişken tanımlama kurallarına *aykırıdır*?])
#siklar5([`okul_no`], [`_toplam`], [`ogrenciNotu`], [`1yazili`], [`yas`])

#soru(16, [Aşağıdakilerden hangisi Python'da değişken adı olarak kullanılmaya *uygundur*?])
#siklar5([`ogrenci_no`], [`ogrenci-no`], [`ogrenci no`], [`2ogrenci`], [`class`])

#soru(17, [Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi -= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?])
#siklar5([22], [26], [32], [30], [24])

#soru(18, [Python'da iki değerin birbirine eşit olup olmadığını denetlemek (karşılaştırmak) için hangi operatör kullanılır?])
#siklar5([`=`], [`:=`], [`=>`], [`==`], [`!=`])

#soru(19, [Python'da `2 ** 6` üs alma işleminin sonucu kaçtır?])
#siklar5([36], [512], [64], [18], [12])

#soru(20, [`print("16", "11", "2026", sep="-")` komutunun ekran çıktısı aşağıdakilerden hangisidir?])
#siklar5([16 11 2026], [16112026], [16-11-2026], [16/11/2026], ["16-11-2026"])

#soru(21, [Python'da bir değişkenin veri türünü öğrenmek için aşağıdaki fonksiyonlardan hangisi kullanılır?])
#siklar5([`len()`], [`print()`], [`round()`], [`input()`], [`type()`])

#soru(22, [`isinstance(7.5, (int, float))` ifadesinin çalışma sonucu aşağıdakilerden hangisidir?])
#siklar5([int], [False], [float], [True], [Hata verir])

#soru(23, [Python'da bir tam sayı (`int`) ile bir ondalıklı sayı (`float`) aritmetik işleme girdiğinde sonuç hangi veri türünde olur?])
#siklar5([`float`], [`str`], [`int`], [`bool`], [`char`])

#soru(24, [Python'da tek satırlık açıklama (yorum) belirtmek için satırın başına hangi karakter yazılır?])
#siklar5([`$`], [`&`], [`#`], [`@`], [`!`])

#soru(25, [Aşağıdakilerden hangisi bir aritmetik operatör *değildir*?])
#siklar5([`+`], [`>=`], [`*`], [`/`], [`-`])

#soru(26, [Python'da f-string (`f"..."`) kullanımının temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Kullanıcıdan parola gibi gizli verileri güvenle almak],
  [Yazılan kodların çalışma süresini ölçmek],
  [Kullanılmayan değişkenleri bellekten otomatik silmek],
  [Sayıları arka planda ikilik sisteme dönüştürmek],
  [Metin içinde değişken değerlerini ve ifadeleri `{}` ile doğrudan biçimlendirmek],
)

#block(above: 1em, below: 0.6em)[
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki cümlelerde boş bırakılan yerleri en uygun kavram veya ifadeyle tamamlayınız.]
]
#soru(27, [Bilgisayarda bilginin en küçük temel veri birimine ............... denir.])

#soru(28, [8 bitin yan yana gelmesiyle oluşan veri birimine ............... adı verilir.])

#soru(29, [0–9 rakamları ile A–F harflerini kullanan sayı sistemine ............... sayı sistemi denir.])

#soru(30, [Harf ve sembolleri sayısal kodlarla temsil etmek için kullanılan standart tablonun adı ...............'dir.])

#soru(31, [İşlemci komutlarını sembolik ve hatırlanabilir kısaltmalarla ifade eden alt seviyeli dile ............... denir.])

#soru(32, [Bilgisayar çalışırken programların ve verilerin geçici olarak tutulduğu ana belleğe ............... adı verilir.])

#soru(33, [Python'da ondalıklı sayıları temsil etmek için kullanılan temel veri türü ...............'tır.])

#soru(34, [Python'da doğru ve yanlış değerlerini temsil eden mantıksal veri türü ...............'tur.])

#soru(35, [Python'da klavyeden kullanıcı girdisi almak için ............... fonksiyonu kullanılır.])

#soru(36, [Kullanıcıdan metin biçiminde alınan sayısal bir girdiyi tam sayıya çevirmek için ............... fonksiyonu kullanılır.])

#soru(37, [Python'da hesaplanan sonuçları ekrana çıktı olarak yazdırmak için ............... fonksiyonu kullanılır.])

#block(above: 1em, below: 0.6em)[#text(size: 8.8pt, fill: luma(100))[Aşağıdaki ifadeleri inceleyerek doğru olanların sonuna (D), yanlış olanların sonuna (Y) yazınız.]]
#soru(38, [Bir Byte, bilgisayardaki en küçük veri birimidir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(39, [8 bit bir araya gelerek 1 Byte oluşturur. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(40, [Hexadecimal sayı sisteminde 0–9 rakamları ile A–F harfleri kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(41, [RAM'de tutulan veriler bilgisayar kapatıldığında dahi kalıcı olarak korunur. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(42, [İşlemci, RAM'deki verilere veri yolu üzerinden doğrudan erişebilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(43, [Python'da `input()` fonksiyonu kullanıcıdan aldığı veriyi her zaman `int` türünde döndürür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(44, [Python'da `=` atama operatörü, `==` ise eşitlik karşılaştırma operatörüdür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(45, [`bool` veri türü yalnızca `True` veya `False` mantıksal değerlerinden birini alır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(46, [`float` veri türü bellekte yalnızca tam sayı değerlerini saklamak için kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(47, [Python'da aynı değişkene programın farklı satırlarında farklı türlerde değerler atanabilir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(48, [`type()` fonksiyonu bir değişkenin veya değerin veri türünü öğrenmek için kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])


#soru(49, [Aşağıdaki numaralandırılmış kavramlar ile harflendirilmiş görev tanımlarını eşleştiriniz:])

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
*Cevaplarınız:*  *1* – ..... #h(1.5em) *2* – ..... #h(1.5em) *3* – ..... #h(1.5em) *4* – ..... #h(1.5em) *5* – .....

#soru(50, [Programlamada değişken nedir? Kısaca açıklayınız.])
#cevap-cizgisi(2)

#soru(51, [Bir değişkene yeni bir değer atandığında bellekteki (RAM) eski değere ne olur?])
#cevap-cizgisi(2)

#soru(52, [Python'da `int` ve `float` veri türleri arasındaki temel fark nedir?])
#cevap-cizgisi(2)

#soru(53, [Tüm sayısal verileri `float` olarak saklamak bellek ve işlemci açısından neden uygun değildir?])
#cevap-cizgisi(2)

#soru(54, [Python'da `input()` fonksiyonuyla alınan sayısal bir veri neden doğrudan matematiksel işlemlerde kullanılamaz?])
#cevap-cizgisi(2)

#soru(55, [Metin olarak alınan bir sayıyı matematiksel işleme sokabilmek için hangi fonksiyonlar kullanılır?])
#cevap-cizgisi(2)

#soru(56, [Python'da atama operatörü (`=`) ile eşitlik karşılaştırma operatörü (`==`) arasındaki fark nedir?])
#cevap-cizgisi(2)

#soru(57, [Programlamada fonksiyon kullanmanın sağladığı en önemli fayda nedir?])
#cevap-cizgisi(2)

#soru(58, [Yazılımda *DRY (Don't Repeat Yourself)* ilkesi ne anlama gelir?])
#cevap-cizgisi(2)

#soru(59, [Python'da *`rakam = '5'`* ile *`sayi = 5`* ifadeleri arasındaki temel fark nedir?])
#cevap-cizgisi(2)

#soru(60, [Python'da yazılan *`yas = int(input("Yaşınız: "))`* kod satırında işlemlerin içten dışa çalışma sırasını kısaca açıklayınız.])
#cevap-cizgisi(2)
