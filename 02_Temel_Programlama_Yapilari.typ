#import "template.typ": *
#import "qr_code.typ": *


= Temel Programlama Yapıları
== Donanımın Temeli: Transistör ve İkili Sistem (Binary)
*Transistör* elektrik akımını geçirerek ya da keserek *$1$* veya *$0$* değerini üreten bilgisayarın en temel donanım birimidir. İşlemci, hafıza gibi bilgisayar donanımlarında milyarlarca transistör bulunur.

#align(center)[
#v(1em)
*Bir Transistör Elektrik Akını Geçirir veya Keser*  
#grid(
  columns: (auto, auto),
  gutter: 15pt,
  align: (top),
  [
    #image("02_Files/Transistor On.jpg",width: 80%)
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Var (Açık)],[:],[1 (Bit)])
  ],
  [
    #image("02_Files/Transistor Off.jpg",width: 80%)
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Yok (Kapalı)],[:],[0 (Bit)])
  ]
)
// #v(1em)
]

*$1$* ve *$0$* durumunu oluşturan en küçük bilgi birimine *Bit (Binary Digit)* denir. Bilgisayar dünyasındaki tüm yazılımlar, videolar, oyunlar ve metinler fiziksel temelde sadece *$1$* ve *$0$*'lardan ibarettir.

Yazılım tarihinin en başında, bilgisayarlara bir iş yaptırmak için işlemcinin tek doğal dili olan Makine Dili (*İkilik Sistem / Binary*) kullanılıyordu. Programcılar, komutları *`1011 0000`* gibi *$0$* ve *$1$* dizileri halinde delikli kartlara veya anahtarlara işliyordu. Ancak bu yöntem insan gözü için son derece yorucuydu ve tek bir rakamın yanlış yazılması tüm programı bozuyordu.

== İlk Bilgisayarlar ve 8 Bitlik Komut Girişleri (Altair 8800)
Erken dönem *Altair 8800* gibi bilgisayarların klavyesi veya ekranı yoktu. Ön panelinde sıra sıra fiziksel anahtarlar (*toggle switches*) ve LED lambalar yer alıyordu. Bu bilgisayar, sadece $1$ ve $0$ değerleri kullanılarak donanıma nasıl komut verildiğine ve hesap yaptırıldığına somut bir örnektir.

#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 4pt,
    inset: 8pt,
  )[
    #set text(font: "Courier New", size: 9pt)
    ```text
    +-------------------------------------------------------------+
    |                  ALTAIR 8800 ÖN PANELİ                      |
    |                                                             |
    |   LED'ler (Çıkış):    (O) (X) (O) (O)   (X) (X) (O) (X)     |
    |                        0   1   0   0     1   1   0   1      |
    |                                                             |
    |   Anahtarlar (Giriş): [v] [^] [v] [v]   [^] [^] [v] [^]     |
    |                        0   1   0   0     1   1   0   1      |
    +-------------------------------------------------------------+
    ```
  ]
]

- Programcılar her bir $8$ bitlik komutu anahtarları tek tek yukarı ($1$) ve aşağı ($0$) indirerek belleğe elle yüklüyordu.
- İki sayıyı toplamak için bile onlarca $8$ bitlik komutu hatasız girmek gerekiyordu. Bu süreç son derece yavaş, zihinsel olarak yorucu ve hata yapmaya açıktı.

#v(1em)
#link-box(
url: "www.youtube.com/watch?v=1zwTRA0yaYo",
title:"Tarihi Eser Bilgisayarı Programladım | Altair 8800",
desc:"Ömer Bektaş'ın kanalında Altair 8800 hakkında detaylı bir video bulunmakta."
)

#link-box(
url: "www.s2js.com/altair/sim.html",
title:"Altair 8800 Emulatorü",
desc:"Altair 8800 cihazını denemek istiyorsanız tarayıcınızda kullanabileceğiniz Altair 8800 Emulator linki."
)

#link-box(
url: "www.youtube.com/@merbekta",
title:"Ömer Bektaş'ın Youtube Kanalı",
desc:"Ömer Bektaş, bilişim dünyasına yönelik çok faydalı içerikler üreten bir YouTube içerik üreticisidir. Bu kanalı takip etmeniz sizin için çok faydalı olacaktır."
)

== Onaltılık Sayı Sistemi (Hexadecimal)
İkilik Sistemde oluşan zorlukları aşmak için *Onaltılık (Hexadecimal)* Sayı Sistemi kullanılmaya başlandı. Dört adet ikilik (binary) basamağın tek bir hexadecimal karaktere (0-9 ve A-F arası) karşılık gelmesi sayesinde, *`1011 0000`*, *`0110 0001`* gibi karmaşık bir makine kodu *`B0`*, *`61`* şeklinde çok daha kısa ve okunabilir bir biçimde ifade edildi. Bu yöntem yazımı kısaltıp hata payını azaltsa da, programcıların hâlâ hangi sayı kodunun hangi işlemi yaptığını ezbere bilmesi gerekiyordu.\ $2^4 = 16$ olduğu için 4 bitlik bir binary sayı tam olarak bir hexadecimal basamağı karşılık gelir.

#align(center)[
  #block(breakable: false)[
    #v(1em)
    *4-Bit İkilik (Binary) ve Onaltılık (Hexadecimal) Karşılıklar Tablosu*
    #let hex-tablo(..veriler) = table(
      columns: (auto, auto, auto), // 4 tablonun A4'e yan yana sığması için optimize edildi
      rows: (2.2em, 2.2em),
      inset: 4pt,
      align: center + horizon,
      stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rgb("#2d3748")) } else { (bottom: 0.5pt + rgb("#e2e8f0")) },
      fill: (col, row) => {
        if row == 0 {
          rgb("#edf2f7") // Başlık satırı
        } else if calc.even(row) {
          rgb("#f8fafc") // Zebra deseni (çift satırlar)
        } else {
          none
        }
      },
      // Tablo Başlıkları
      [*Hex*], [*Dec*], [*Binary*],
      ..veriler
    )

    #set text(size: 9pt) 
    #grid(
      columns: (auto, auto, auto, auto),
      gutter: 8pt,
      align: top,
      
      // 1. Sütun (0 - 3)
      hex-tablo(
        [*`0`*], [`0`], [`0000`],
        [*`1`*], [`1`], [`0001`],
        [*`2`*], [`2`], [`0010`],
        [*`3`*], [`3`], [`0011`],
      ),
      
      // 2. Sütun (4 - 7)
      hex-tablo(
        [*`4`*], [`4`], [`0100`],
        [*`5`*], [`5`], [`0101`],
        [*`6`*], [`6`], [`0110`],
        [*`7`*], [`7`], [`0111`],
      ),
      
      // 3. Sütun (8 - B)
      hex-tablo(
        [*`8`*], [`8`],  [`1000`],
        [*`9`*], [`9`],  [`1001`],
        [*`A`*], [`10`], [`1010`],
        [*`B`*], [`11`], [`1011`],
      ),
      
      // 4. Sütun (C - F)
      hex-tablo(
        [*`C`*], [`12`], [`1100`],
        [*`D`*], [`13`], [`1101`],
        [*`E`*], [`14`], [`1110`],
        [*`F`*], [`15`], [`1111`],
      )
    )  
    #align(center)[
    *Hex:* Hexadecimal(16'lık), *Dec:* Decimal(10'luk), *Binary:* Binary(4 Bit),
    ]
  ]
]

== Metin Temsili: 8 Bit = 1 Byte ve ASCII Tablosu
Bir harfi veya sembolü sayılarla temsil etmek için standart referans tablosu #text(weight: "semibold")[ASCII (American Standard Code for Information Interchange)] geliştirilmiştir. Böylelikle en temel düzeyde gerekli olan karakterlere için *ASCII* tablosundaki karakterin sayısal bir karşılığı oluşturuldu.
- Bilgisayar mimarisinin temelinde $1$ karakter $1$ Byte ($8$ bit) yer kaplar. ASCII tablosunda $256$ karakter bulunmasının sebebi $8$ bit'in yan yana getirilerek $1$ Byte oluşturmasıdır. $1$ Byte aynı zamanda iki hexadecimal karakterle de kolaylıkla ifade edilebilir.
- *Kontrol Karakterleri:* Tablodaki $0$ ile $31$ arasındaki ilk $32$ karakter ve $127$ numaralı *`DEL`* karakteri ekranda basılabilir bir harf veya sembol değildir. Bunlar cihazlar arası iletişimi ve imleç hareketlerini yöneten #text(weight: "semibold")[Kontrol Karakterleri (Control / Non-printable Characters)] olarak adlandırılır.

#link-box(
  url:"www.ascii-code.com",
  title: "ASCII Code - Karakter Kodlama Tablosu",
  desc: "Tüm ASCII karakterlerini incelemek için bu referans tablosunu kullanabilirsiniz."
)

#pagebreak()
#align(center)[
  #v(0.5em)
  *Temel ASCII Tablosu (32-127 Karakterin Kodu)*
  #text(size:8pt)[

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 4pt,
     align: (top),
    [#table(
  columns: (auto, auto, auto, auto),
  inset: 4pt,
  align: (center + horizon),
  stroke: (x, y) => if y == 0 { (bottom: 1.2pt + rgb("#334155")) } else { (bottom: 0.3pt + rgb("#e2e8f0")) },
  fill: (col, row) => {
    if row == 0 {
      rgb("#f1f5f9")
    } else if calc.even(row) {
      rgb("#f8fafc")
    } else {
      none
    }
  },

  // Başlık Satırı
  [*Dec*], [*Hex*], [*Binary*], [*Chr*],

  [`32`], [`20`], [`0010 0000`], [_SP_],
  [`33`], [`21`], [`0010 0001`], [`!`],
  [`34`], [`22`], [`0010 0010`], [`"`],
  [`35`], [`23`], [`0010 0011`], [`#`],
  [`36`], [`24`], [`0010 0100`], [`$`],
  [`37`], [`25`], [`0010 0101`], [`%`],
  [`38`], [`26`], [`0010 0110`], [`&`],
  [`39`], [`27`], [`0010 0111`], [`'`],
  [`40`], [`28`], [`0010 1000`], [`(`],
  [`41`], [`29`], [`0010 1001`], [`)`],
  [`42`], [`2A`], [`0010 1010`], [`*`],
  [`43`], [`2B`], [`0010 1011`], [`+`],
  [`44`], [`2C`], [`0010 1100`], [`,`],
  [`45`], [`2D`], [`0010 1101`], [`-`],
  [`46`], [`2E`], [`0010 1110`], [`.`],
  [`47`], [`2F`], [`0010 1111`], [`/`],
  [`48`], [`30`], [`0011 0000`], [`0`],
  [`49`], [`31`], [`0011 0001`], [`1`],
  [`50`], [`32`], [`0011 0010`], [`2`],
  [`51`], [`33`], [`0011 0011`], [`3`],
  [`52`], [`34`], [`0011 0100`], [`4`],
  [`53`], [`35`], [`0011 0101`], [`5`],
  [`54`], [`36`], [`0011 0110`], [`6`],
  [`55`], [`37`], [`0011 0111`], [`7`],  
)
    ],
    [#table(
  columns: (auto, auto, auto, auto),
  inset: 4pt,
  align: (center + horizon),
  stroke: (x, y) => if y == 0 { (bottom: 1.2pt + rgb("#334155")) } else { (bottom: 0.3pt + rgb("#e2e8f0")) },
  fill: (col, row) => {
    if row == 0 {
      rgb("#f1f5f9")
    } else if calc.even(row) {
      rgb("#f8fafc")
    } else {
      none
    }
  },

  // Başlık Satırı
  [*Dec*], [*Hex*], [*Binary*], [*Chr*],

  [`56`], [`38`], [`0011 1000`], [`8`],
  [`57`], [`39`], [`0011 1001`], [`9`],
  [`58`], [`3A`], [`0011 1010`], [`:`],
  [`59`], [`3B`], [`0011 1011`], [`;`],
  [`60`], [`3C`], [`0011 1100`], [`<`],
  [`61`], [`3D`], [`0011 1101`], [`=`],
  [`62`], [`3E`], [`0011 1110`], [`>`],
  [`63`], [`3F`], [`0011 1111`], [`?`],
  [`64`], [`40`], [`0100 0000`], [`@`],
  [`65`], [`41`], [`0100 0001`], [`A`],
  [`66`], [`42`], [`0100 0010`], [`B`],
  [`67`], [`43`], [`0100 0011`], [`C`],
  [`68`], [`44`], [`0100 0100`], [`D`],
  [`69`], [`45`], [`0100 0101`], [`E`],
  [`70`], [`46`], [`0100 0110`], [`F`],
  [`71`], [`47`], [`0100 0111`], [`G`],
  [`72`], [`48`], [`0100 1000`], [`H`],
  [`73`], [`49`], [`0100 1001`], [`I`],
  [`74`], [`4A`], [`0100 1010`], [`J`],
  [`75`], [`4B`], [`0100 1011`], [`K`],
  [`76`], [`4C`], [`0100 1100`], [`L`],
  [`77`], [`4D`], [`0100 1101`], [`M`],
  [`78`], [`4E`], [`0100 1110`], [`N`],
  [`79`], [`4F`], [`0100 1111`], [`O`],
)
	],
	  [#table(
  columns: (auto, auto, auto, auto),
  align: (center + horizon),
  inset: 4pt,
  stroke: (x, y) => if y == 0 { (bottom: 1.2pt + rgb("#334155")) } else { (bottom: 0.3pt + rgb("#e2e8f0")) },
  fill: (col, row) => {
    if row == 0 {
      rgb("#f1f5f9")
    } else if calc.even(row) {
      rgb("#f8fafc")
    } else {
      none
    }
  },

  // Başlık Satırı
  [*Dec*], [*Hex*], [*Binary*], [*Chr*],

  [`80`], [`50`], [`0101 0000`], [`P`],
  [`81`], [`51`], [`0101 0001`], [`Q`],
  [`82`], [`52`], [`0101 0010`], [`R`],
  [`83`], [`53`], [`0101 0011`], [`S`],
  [`84`], [`54`], [`0101 0100`], [`T`],
  [`85`], [`55`], [`0101 0101`], [`U`],
  [`86`], [`56`], [`0101 0110`], [`V`],
  [`87`], [`57`], [`0101 0111`], [`W`],
  [`88`], [`58`], [`0101 1000`], [`X`],
  [`89`], [`59`], [`0101 1001`], [`Y`],
  [`90`], [`5A`], [`0101 1010`], [`Z`],
  [`91`], [`5B`], [`0101 1011`], [`[`],
  [`92`], [`5C`], [`0101 1100`], [`\`],
  [`93`], [`5D`], [`0101 1101`], [`]`],
  [`94`], [`5E`], [`0101 1110`], [`^`],
  [`95`], [`5F`], [`0101 1111`], [`_`],
  [`96`], [`60`], [`0110 0000`], [``` ` ```],
  [`97`], [`61`], [`0110 0001`], [`a`],
  [`98`], [`62`], [`0110 0010`], [`b`],
  [`99`], [`63`], [`0110 0011`], [`c`],
  [`100`], [`64`], [`0110 0100`], [`d`],
  [`101`], [`65`], [`0110 0101`], [`e`],
  [`102`], [`66`], [`0110 0110`], [`f`],
  [`103`], [`67`], [`0110 0111`], [`g`],
  
)
	],
    [#table(
  columns: (auto, auto, auto, auto),
  inset: 4pt,
  align: (center + horizon),
  stroke: (x, y) => if y == 0 { (bottom: 1.2pt + rgb("#334155")) } else { (bottom: 0.3pt + rgb("#e2e8f0")) },
  fill: (col, row) => {
    if row == 0 {
      rgb("#f1f5f9")
    } else if calc.even(row) {
      rgb("#f8fafc")
    } else {
      none
    }
  },

  // Başlık Satırı
  [*Dec*], [*Hex*], [*Binary*], [*Chr*],

  [`104`], [`68`], [`0110 1000`], [`h`],
  [`105`], [`69`], [`0110 1001`], [`i`],
  [`106`], [`6A`], [`0110 1010`], [`j`],
  [`107`], [`6B`], [`0110 1011`], [`k`],
  [`108`], [`6C`], [`0110 1100`], [`l`],
  [`109`], [`6D`], [`0110 1101`], [`m`],
  [`110`], [`6E`], [`0110 1110`], [`n`],
  [`111`], [`6F`], [`0110 1111`], [`o`],
  [`112`], [`70`], [`0111 0000`], [`p`],
  [`113`], [`71`], [`0111 0001`], [`q`],
  [`114`], [`72`], [`0111 0010`], [`r`],
  [`115`], [`73`], [`0111 0011`], [`s`],
  [`116`], [`74`], [`0111 0100`], [`t`],
  [`117`], [`75`], [`0111 0101`], [`u`],
  [`118`], [`76`], [`0111 0110`], [`v`],
  [`119`], [`77`], [`0111 0111`], [`w`],
  [`120`], [`78`], [`0111 1000`], [`x`],
  [`121`], [`79`], [`0111 1001`], [`y`],
  [`122`], [`7A`], [`0111 1010`], [`z`],
  [`123`], [`7B`], [`0111 1011`], [`{`],
  [`124`], [`7C`], [`0111 1100`], [`|`],
  [`125`], [`7D`], [`0111 1101`], [`}`],
  [`126`], [`7E`], [`0111 1110`], [`~`],
  [`127`], [`7F`], [`0111 1111`], [_DEL_],
  
)
    ],
  )
]
]
  ]

== Bit'ten Terabayt'a Veri Büyüklükleri
Bilgisayar dünyasındaki tüm içeriklerin fiziksel temelde sadece *$1$* ve *$0$*'lardan ibaret olduğunu ve *$1$* ve *$0$* durumun oluşturan en küçük bilgi birimine *Bit (Binary Digit)* dendiğini söylemiştik.  

- *Bit (Binary Digit):* Bilgisayardaki en küçük mantıksal veri birimidir. Sadece *0* veya *1* değerini alabilir. Devredeki tek bir transistör lamba anahtarı gibi düşünülebilir: ya kapalıdır (0) ya da açıktır (1).
- *Byte:* 8 adet bitin yan yana gelmesiyle oluşan veri kümesidir. $8 "Bit" = 1 "Byte"$\ 
Örneğin *"A"* harfi bellekte *1 Byte* yer kaplar gibi düşünebiliriz.
- Günlük hayatta metrik sistemde birimler onluk sisteme ($10^3$) göre biner biner büyür (1 kg = 1000 g,\ 1 km = 1000 m). Ancak bilgisayarlar *2'lik sayı sistemine (Binary)* göre çalışır. Bilgisayar mimarisinde bellek adreslemesi 2'nin üsleri şeklinde katlanarak ilerler. Onluk sistemdeki 1000 sayısına ikili tabanda en yakın kuvvet: 1024 sayısıdır ($2^(10) = 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 = 1024$).\
  Bu nedenle bilişim mimarisinde her bir büyüklük basamağı bir öncekinin *1024 katı* ($2^(10)$) kabul edilir.
#align(center)[
#block(breakable: false)[
#text(size:8pt)[
*Veri Büyüklüğü Basamakları*
#table(
  columns: (auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + horizon, left + horizon, center + horizon, left + horizon),
   rows:(2.25em, (2.5em)),
  table.header([*Birim*], [*Kapasite*], [*Kısaltma*], [#align(center)[*Somut Karşılığı*]]),
  [Bit], [$0$ veya $1$], [*b*], [Tek bir transistör / elektrik sinyali],
  [Byte], [$8 " Bit"$], [*B*], [Tek bir karakter (harf, rakam, sembol)],
  [Kilobyte], [$1024 " Byte"$], [*KB*], [Düz metinden oluşan 1 sayfalık belge],
  [Megabyte], [$1024 " KB"$], [*MB*], [1 dakikalık MP3 ses kaydı veya telefon fotoğrafı],
  [Gigabyte], [$1024 " MB"$], [*GB*], [Yaklaşık 1 saatlik HD kalitede film],
  [Terabyte], [$1024 " GB"$], [*TB*], [Geniş harici yedekleme diski, çok sayıda büyük oyun],
  [Petabyte], [$1024 " TB"$], [*PB*], [Büyük veri merkezleri veya bulut sunucu havuzları],
  [Exabyte], [$1024 " PB"$], [*EB*], [Küresel internet trafiğinin aylık ölçekteki hacmi],
)
]
]
]

#not_block(title: "Donanım Üreticisi vs. İşletim Sistemi Farkı: ")[
Piyasadan satın alınan *1TB* kapasiteli bir SSD veya harici disk bilgisayara takıldığında, depolama alanı genellikle yaklaşık *931 GB* görünür. Bu durum donanım hatası değildir:

Donanım Üreticileri *Onluk* sayı birimini kullanarak $1 " KB" = 10^3 " Byte"$ şeklinde hesap yapar:
  $ 1 " TB" = 1.000.000.000.000 " Byte" $

Fakat işletim sistemleri ikilik sayı sistemine göre ölçüm yaptığı için altta ki bölme işleminin sonucu satın aldığınız diskinizin gerçek boyutu *1TB* altında olacaktır.
  $ frac(1.000.000.000.000, 1024 times 1024 times 1024) approx 931.32 " GB" $

Sizce bu disk üreticilerinin yaptığı bir hile midir?
]

== Makine Kodundan Assembly Diline
Altair 8800 gibi erken dönem bilgisayarlarda, işlemciye komut vermek için sürekli #text(weight: "semibold")[`1` ve `0`] dizilimlerinden oluşan makine kodlarını kullanmak oldukça zahmetliydi ve hatalara açıktı. Makine kodlarını daha kısa ve okunabilir biçimde ifade etmek için #text(weight: "semibold")[Onaltılık (Hexadecimal) sayı sistemi] kullanılmaya başlandı. Ancak hexadecimal gösterim, makine kodunu daha kolay yazmayı sağlasa da komutların anlamını doğrudan açıklamıyordu.

Bu nedenle makine kodundaki komutları daha kolay hatırlayabilmek ve yazabilmek için İngilizce kelimelerin kısaltmalarından oluşan sembolik isimler (#text(weight: "bold")[Mnemonic]) kullanılmaya başlandı. Bu sembolik komutları kullanan dile #text(weight: "bold")[Assembly dili] adı verildi. Böylece programcılar, yalnızca #text(weight: "semibold")[`1` ve `0`] dizilimleriyle uğraşmak yerine, daha anlaşılır ve hatırlanması kolay komutlarla program yazabilir hâle geldi.

#align(center)[
#v(1em)
*Hexadecimal Yerine Assembly Kullanımı Örneği*
#table(
  columns: (auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (center + horizon, center + horizon, center + horizon, left + horizon),
   rows:(2.5em, (2em)),
  table.header([*Hexadecimal*], [*Yerine*], [*Assembly*], [#align(center)[*Açıklama*]]),
  [`B0 61`], [$-->$], [`MOV AL, 61H`], [AL yazmacına *`61H`* verisi taşındı.],
  [`04 05`], [$-->$], [`ADD AL, 05H`], [AL yazmacındaki değere *`05H`* eklendi.],
  [`2C 02`], [$-->$], [`SUB AL, 02H`], [AL yazmacındaki değerden *`02H`* çıkarıldı.],
)
]

Bu sembolik komutlarla yazılan programlar, #text(weight: "bold")[Assembler (Çevirici)] adı verilen bir program aracılığıyla işlemcinin anlayabileceği makine koduna dönüştürüldü.

#align(center)[
*x86 Assembly: İki Sayıyı Toplama Örneği*
#text(size:9pt)[
```x86asm
section .text
global _start

_start:
    mov eax, 5          ; ilk sayı
    mov ebx, 7          ; ikinci sayı
    add eax, ebx        ; eax = eax + ebx  (5 + 7 = 12)

    mov ebx, eax        ; sonucu ebx'e al (exit kodu ebx'ten okunur)
    mov eax, 1          ; sys_exit sistem çağrısı numarası
    int 0x80            ; çekirdeği çağır
```
]
]

#link-box(
  url:"www.youtube.com/watch?v=yWXuG3RLkTE",
  title:"Dillerin Atası | Assembly",
  desc:"Ömer Bektaş'ın kanalında Assembly dili hakkında detaylı bir video bulunmakta."
  )
== Programlama Dilleri
Her ne kadar #text(weight: "semibold")[`1` ve `0`] veya #text(weight: "semibold")[hexadecimal sayılar] ile kodlama yapmaya göre #text(weight: "semibold")[Assembly] dili büyük bir kolaylık sağlasa da projeler büyüdükçe kodları yazmak zorlaşıyordu. Ayrıca Assembly kodları işlemciden işlemciye farklılık gösteriyor, bu da her yeni işlemci için kodların yeniden yazılması zorunluluğunu doğuruyordu. Bu duruma #text(weight: "semibold")[donanım bağımlılığı] deniyordu.

İşte bu sorunu çözmek için *Fortran, COBOL ve C* gibi programlama dilleri ortaya çıktı. Artık iki sayıyı toplamak için işlemci yazmaçlarıyla uğraşmak yerine doğrudan #text(weight: "bold")[`sonuc = a + b`] yazmak yeterli hale geldi. Programlama dilleri ile yazılan kodlar, *Derleyici (Compiler)* veya *Yorumlayıcı (Interpreter)* adı verilen araçlarla makine koduna çevrilerek işlemci üzerinde çalıştırılmaktadır. Ayrıca programlama dili ile yazılan tek bir kodun hedef bilgisayarda derlenmesiyle #text(weight: "semibold")[donanım bağımlılığı] sorunu çözüldü ve aynı kodların farklı işlemci mimarilerinde çalışabilmesi sağlandı.

*Derleyici (Compiler):* Programcının yazdığı kodun tamamını önce baştan sona okur, yazım hatalarını kontrol eder ve tüm kodu bir bütün olarak makine diline çevirir. Kodun yazımında (söz diziminde) bir hata varsa derleme işlemi tamamlanmaz.

*Yorumlayıcı (Interpreter):* Kodu bir bütün olarak değil satır satır okuyarak anında çalıştırır. Bir satır çevrilip çalıştırıldıktan sonra sıradaki satıra geçilir. Hata tespiti açısından yorumlayıcı, hatanın bulunduğu satıra gelene kadar programı çalıştırır ve o noktada durur. Bu yaklaşım tıpkı bir tercümanın, konuşmacının cümlelerini anlık olarak çevirmesine benzer. *Python ve Ruby*, bu yaklaşımı kullanan dillere örnek gösterilebilir.

#v(1em)
#align(center)[
  #block(breakable: false, width: 100%)[
    #set text(size: 9pt)
    #table(
      columns: (3cm, 2.7cm, 2.3cm, 1fr, 1fr),
      inset: 7pt,
      align: (col, row) => if row == 0 {
        center + horizon
      } else if col == 2 {
        center + horizon // Örnek kod sütununu ortala
      } else {
        left + horizon
      },
      stroke: (x, y) => if y == 0 {
        (bottom: 1.5pt + rgb("#2d3748"))
      } else {
        (bottom: 0.5pt + rgb("#e2e8f0"))
      },
      fill: (col, row) => {
        if row == 0 {
          rgb("#edf2f7") // Başlık satırı
        } else if calc.even(row) {
          rgb("#f8fafc") // Zebra deseni (çift satırlar)
        } else {
          none
        }
      },

      // Tablo Başlıkları
      [*Evrim Aşaması*], [*Temsil Biçimi*], [*Örnek Kod*], [*Temel Avantajı*], [*Temel Zorluğu*],

      // 1. Satır
      [*1. Makine Dili\ (Binary)*],
      [`0` ve `1` dizileri],
      [`1011 0000`\ `0110 0001`],
      [#text(size:8pt)[İşlemci hiçbir çeviriye ihtiyaç duymadan doğrudan çalıştırır.]],
      [#text(size:8pt)[İnsan tarafından okunması ve yazılması çok zordur.]],

      // 2. Satır
      [*2. Hexadecimal\ (16'lık Sistem)*],
      [`0-9` ve `A-F` karakterleri],
      [`B0 61`],
      [#text(size:8pt)[Uzun 0 ve 1 dizilerini 4'lü gruplar halinde kısaltarak yazım kolaylığı sağlar.]],
      [#text(size:8pt)[Komutların sayısal karşılıklarını akılda tutmak gerekiyordu.]],

      // 3. Satır
      [*3. Assembly Dili\ (Sembolik Dil)*],
      [Sembolik kısaltmalar\ _(Mnemonics)_],
      [`MOV AL, 61h`],
      [#text(size:8pt)[Komutlar (`MOV`, `ADD`, `SUB`) anlamlı kelimelerle ifade edilir.]],
      [#text(size:8pt)[Her işlemci mimarisi için farklıdır; büyük projelerde kod çok uzar.]],

      // 4. Satır
      [*4. Yüksek Seviyeli Diller*],
      [Günlük dil ve matematiksel ifadeler],
      [`int a = 97;`],
      [#text(size:8pt)[Öğrenmesi kolaydır, donanımdan bağımsızdır ve hızlı yazılım geliştirmeyi sağlar.]],
      [#text(size:8pt)[İşlemcide çalışabilmesi için derleyici veya yorumlayıcı ile çevrilmesi gerekir.]],
    )
  ]
]

#v(1em)
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
     align: (top),
    [
      *Örnek Python Kodu*

      Kullanıcıdan bir değer alıp bu değere 25 ekleyerek sonucu ekrana yazdıran kod örneği.
      
```Python
puan = int(input("Puan Giriniz: "))
print("Puanı:", puan)
puan = puan + 25
print("Güncellenmiş Puan:", puan)
```
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
Puan Giriniz: 50 \
Puanı: 50 \
Güncellenmiş Puan: 75
]

    ]
  
  )
]

#include "02_Files/TemelProgramlamaYapilariInfografik/Claude3.typ"

#pagebreak()
== Değişkenler ve Bellek(RAM)
Değişken; programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir. Kullanıcıdan veya harici bir kaynaktan alınan bilgiler bu değişkenlerde saklanır; kod çalıştıkça hesaplamalarda kullanılır ve süreç içinde yeni değerler alabilir. \
Değişkenler yardımıyla bellekte (RAM) saklanan verilere kolayca erişilir; kod çalıştırıldığında bu değişken isimleri çağrılarak temsil ettikleri veriler üzerinde işlemler gerçekleştirilir.
#v(1em)
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
     align: (horizon),
    [
      *Örnek Python Kodu*
      Kullanıcıdan alınan tam sayı değerine 25 ekleyerek sonucu ekrana yazdıran kod örneği
      #kod-blok[
          ```Python
          puan = int(input("Puan Giriniz: "))
          print("Puanı:", puan)
          puan = puan + 25
          print("Güncellenmiş Puan:", puan)
          ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        #v(1em)
Puan Giriniz: 50 \
Puanı: 50 \
Güncellenmiş Puan: 75
]

    ]
  
  )
]


#let mini-ekran-ciktisi(icerik) = {
  block(
    fill: rgb("#eff6ff"),
    stroke: (left: 3pt + rgb("#3b82f6")),
    inset: (x: 10pt, y: 8pt),
    radius: (right: 3pt),
    width: 100%,
  )[
    #text(font: "DejaVu Sans Mono", size: 0.8em)[#icerik]
  ]
}

#let kutu(icerik,yukseklik:10.5em) = block(
  stroke: 1pt + gray,
  inset: 8pt,
  radius: 4pt, // Köşe yuvarlatma miktarı
  width: 100%,
  height: yukseklik,
  icerik
)

#v(1em)
#block(breakable: false)[
  #grid(
    columns: (18em, auto),
    gutter: 10pt,
     align: (left + horizon, center + horizon),
    [#kutu[
  *1. Değer Atama*\ Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.
    #mini-ekran-ciktisi[Puan Giriniz: 50]
    ]
    
    ],
    [#kutu[#image("02_Files/Bellek Kullanımı 01.png")]
    ]
  
  )
]


#block(breakable: false)[
  #grid(
     columns: (18em, auto),
    gutter: 10pt,
     align: (left + horizon, center + horizon),
    [#kutu[
      *2. Hafızadan Çağırma*\ *puan* değişkeni RAM'deki adresinden çağrılarak *50* değeri ekrana yazdırılır.
    #mini-ekran-ciktisi[Puanı: 50]
      
    ]
    ],
    [
      #kutu[

      #image("02_Files/Bellek Kullanımı 02.png")
      ]
    ]
  
  )
]


#block(breakable: false)[
  #grid(
     columns: (18em, auto),
    gutter: 10pt,
     align: (left + horizon, center + horizon),
    [#kutu[
      *3. Değer Güncelleme*\ Mevcut *50* değeri hafızadan alınır, *25* eklenir ve elde edilen yeni *75* değeri tekrar *puan* değişkenine atanır.
    ]
    ],
    [
      #kutu[
      #image("02_Files/Bellek Kullanımı 03.png")
      ]
    ]
  
  )
]

#block(breakable: false)[
  #grid(
     columns: (18em, auto),
    gutter: 10pt,
     align: (left + horizon, center + horizon),   
    [#kutu[
      *4. Güncel Hali Çağırma*\ Güncellenen *puan* değişkeni hafızadan çağrılarak ekrana yazdırılır.
    #mini-ekran-ciktisi[Güncellenmiş Puan: 75]
    ]
    ],
    [#kutu[
      #image("02_Files/Bellek Kullanımı 04.png",height: 8em)
    ]
    ]
  )
]

#image("02_Files/DegiskenVeBellek.jpg")
#include "/02_Files/degiskenler_bellek.typ"

#pagebreak()
== Temel Veri Türleri
Bilgisayar programları verileri RAM (bellek) üzerinde saklar. RAM’i, üst üste dizilmiş çok sayıda küçük kutu gibi düşünebiliriz. Her kutunun boyutu 1 bayt’tır (1 bayt = 8 bit; bit yalnızca 0 ya da 1 tutabilir).
- Bu veri *ne tür* bir veri? (sayı mı, karakter mi, doğru/yanlış mı?)
- Bu yüzden RAM’de *kaç kutu (bayt)* ayrılmalı ve bu veriyle *hangi işlemler* yapılabilir?

#not_block(title: "")[Temel veri türleri konusunu anlatmak için C++ dili ve 16-bit sistemler (Arduino Uno, Turbo C) esas alınmıştır. Bu tercih, veri türlerinin donanımsal mantığının daha rahat anlaşılması amacıyla yapılmıştır. Derslerimizde ise Python programlama dili kullanılacak olup, Python'da veri türleri ve bellek yapısı farklı şekilde işlemektedir.
]

=== Boolean (bool): doğru / yanlış
#block(breakable: false)[
  #grid(
    columns: (auto, auto),
    gutter: 10pt,
     align: (horizon),
    [
      - RAM’de en az yer kaplayan veri türüdür: *1 bayt*.
      - Yalnızca iki değer alabilir: *true* (doğru, 1) veya *false* (yanlış, 0).
      - Karar verme (if, while) işlemlerinde kullanılır.

    ],
    [
      #kod-blok[
  ```cpp
  bool kapiAcik = true;
  bool sinavGecti = false;
  ```
]

    ]
  
  )
]

#ram-goster(
  "bool",
  "bool kapiAcik = true;",
  "00000001",
  aciklama: "true değeri 1, olarak saklanır.",
)

#ram-goster(
  "bool",
  "bool sinavGecti = false;",
  "00000000",
  aciklama: "false değeri 0 olarak saklanır.",
)

#not_block(title: "")[Aslında doğru/yanlış bilgisi tek bir bit ile saklanabilir; ancak RAM’e ulaşım bayt bayt yapıldığı için bilgisayar bool için de 1 tam bayt ayırır.
]

=== Karakter (char)
- RAM’de 1 bayt yer kaplar.
- Tek bir karakter tutar: harf, rakam karakteri, noktalama işareti. Tek tırnak içinde yazılır: 'A'.
- Bilgisayar karakterleri ASCII tablosundaki sayı karşılığı ile saklar (örneğin 'A' karakteri 65). 
- 1 bayt,ASCII tablosundaki 256 karakter için yeterlidir.
- Karakterler metin için kullanılır, matematiksel işlemlere girmez. '5' karakteri ile 5 sayısı aynı şey değildir.

#kod-blok(width: 100%)[
  ```cpp
char harf = 'A';
char rakamKarakteri = '5'; // bu bir sayı değil, karakterdir
  ```
]

#ram-goster(
  "char",
  "char harf = 'A';",
  "01000001",
  aciklama: "'A' karakterinin ASCII kodu 65'tir.",
)

#ram-goster(
  "char",
  "char karakter = '5';",
  "00110101",
  aciklama: "'5' karakterinin ASCII kodu 53'tür (Sayısal 5 değeri değildir). Bellekte 1 byte kaplar.",
)

=== Tam Sayı (int)
- RAM’de 2 bayt (16 bit) yer kaplar.
- $16$ bit ile $2^16=65536$ farklı değer saklanabilir. Negatif sayılar da dahil olduğu için aralık: $−32768$ ile $+32767$ arasındadır.
- Virgüllü kısmı yoktur; yalnızca tam sayıları tutar.
- Toplama, çıkarma, çarpma, bölme ve mod (kalan) işlemlerinde kullanılır.

#kod-blok(width: 100%)[
    ```cpp
int a = 7;
int b = 2;
int sonuc = a / b; // sonuc = 3 (3.5 değil!)
int kalan = a % b; // kalan = 1
  ```
]

#ram-goster(
  "int",
  "int puan = 50;",
  "00000000 00110010",
  aciklama: "50 = 32 + 16 + 2 olduğu için son byte 00110010 olur. İlk byte'ın tamamı 0'dır.",
)

=== Ondalıklı Sayı (float)
- RAM’de 4 bayt (32 bit) yer kaplar; yani int’ten 2 kat fazla alan ister.
- Virgüllü sayıları tutar. Yazılımlar bu sayıyı virgülden önceki ve virgülden sonraki kısım olarak ayrı ayrı değerlendirir. Kodda nokta ile yazılır: $3.14$.
- Çok daha geniş bir aralıkta ve küsuratlı değerler için kullanılabilir.
- Tüm matematiksel işlemlerde kullanılabilir. Bölmenin sonucu da küsuratlı çıkar.

#kod-blok(width: 100%)[
  ```cpp
float a = 7;
float b = 2;
float sonuc = a / b; // sonuc = 3.5
  ```
]

#ram-goster(
  "float",
  "float pi = 3.14;",
  "01000000 01001000 11110101 11000011",
  aciklama: "Ondalıklı sayılar IEEE 754 biçiminde saklanır ve 4 byte yer kaplar.",
)

#not_block(title: "Ne zaman int, ne zaman float?")[
  \ float her işlemde kullanılabilir; ancak hem daha fazla RAM kaplar hem de işlemciyi daha çok yorar. Bu yüzden *gerekmedikçe* *int* yerine *float* kullanılmamalıdır. Küsurat gerekiyorsa (ortalama, not, fiiyat, sıcaklık gibi) float tercih edilir.
]

=== RAM Kullanımı ile İşlemci İlişkisi
Bilgisayarların ilk geliştirildiği yıllarda kullanılan RAM ve işlemci donanımları, günümüz mimarilerine kıyasla oldukça sınırlı kapasiteye sahipti. O dönemin donanımlarıyla işlemleri gerçekleştirebilmek için bellek kullanımının çok iyi planlanması gerekiyordu; veri türleri de tam bu noktada etkin bir bellek yönetimi sağlıyordu. Ayrıca işlemci, RAM'den aldığı veriyi işleyip tekrar RAM'e yazan bir birim olduğu için bellekte tutulan verinin boyutu sistem performansını doğrudan etkiler. Veri boyutu ne kadar büyükse (daha fazla bayt), veri yollarında o kadar çok bilgi taşınır ve işlemcinin bu veriyi işlemesi o kadar uzun sürer. #text(weight: "semibold")[Özetle; büyük veri türleri hem RAM’de daha fazla yer kaplar hem de işlemciyi daha fazla meşgul eder.]
#image("02_Files/ram_islemci_iliskisi.jpg")

=== Tür Dönüşümü (Type Conversion / Type Casting)
Bilgisayarlar bellekteki verileri türlerine göre farklı formatlarda saklandığını gördük. Bir verinin türünü başka bir türe çevirme işlemine tür dönüşümü denir. Tür dönüşümü programlamada iki temel senaryoda zorunlu hale gelir:

==== Kullanıcı Girişlerinin Sayıya Dönüştürülmesi (Metin $->$ Sayı)
Klavyeden girilen veya bir metin dosyasından okunan tüm veriler, sisteme ilk olarak karakter dizisi (metin / string) biçiminde ulaşır.

- Kullanıcı ekrana 25 yazdığında bilgisayar bunu sayısal 25 olarak değil; yan yana duran *'2'*(ASCII: 50) ve *'5'*(ASCII: 53) karakterleri olarak algılar.
- Karakter tabanlı bir veriyle matematiksel işlem yapılamaz. Örneğin iki metinsel veri toplanmak istendiğinde matematiksel toplama ($25 + 10 = 35$) yerine metin birleştirme ("25" + "10" = "2510") gerçekleşir veya derleyici hata verir.
- Bu değerlerin matematiksel işlemlere girebilmesi için metin biçiminden uygun sayı türüne (int veya float) dönüştürülmesi (parse/cast edilmesi) şarttır.

#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
     align: (horizon),
    [
      *Örnek Python Kodu*
      Kullanıcıdan alınan tam sayı değerine 25 ekleyerek sonucu ekrana yazdıran kod örneği
      #kod-blok[
          ```Python
          puan = int(input("Puan Giriniz: "))
          print("Puanı:", puan)
          puan = puan + 25
          print("Güncellenmiş Puan:", puan)
          ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        #v(1em)
Puan Giriniz: 50 \
Puanı: 50 \
Güncellenmiş Puan: 75
]

    ]
  
  )
]

Verilen Python örneğini kullanıcı girişi açısından ele alalım: 
#kod-satiri(no:1, size:12pt,weight: "semibold")[
           ```Python
          puan = int(input("Puan Giriniz: "))
          ```
]
Program, kullanıcıdan "Puan Giriniz:" iletisiyle bir tam sayı değeri beklemektedir. Python'da input() fonksiyonu klavyeden veri almak için kullanılır. Ancak daha önce belirttiğimiz gibi, input() fonksiyonu girilen veriyi ne olursa olsun her zaman bir metin (string) olarak okur. Bu metinsel değerin matematiksel hesaplamalarda veya karşılaştırmalarda kullanılabilmesi için int() fonksiyonu ile tam sayıya dönüştürülmesi şarttır.
      #kod-blok[
    ```Python
veri = input("Puan Giriniz: ")  # 1. Aşama: Metin olarak alındı ("50")
puan = int(veri)                # 2. Aşama: Tam sayıya dönüştürüldü (50)
    ```
]

Dileyenler bu işlemi tek satırda iç içe yapmak yerine, önce veriyi bir değişkene metin olarak alıp ardından ikinci bir satırda int() fonksiyonuyla sayıya dönüştürerek iki aşamada da gerçekleştirebilir. Fakat bu tek satır kod yazmaya göre daha uzundur.

==== Hesaplamalarda Tür Dönüşümü (int $<-->$ float)
Tür dönüşümü yalnızca kullanıcı girişlerinde değil; tam sayılar (*int*) ile ondalıklı sayılar (*float*) arasındaki matematiksel işlemlerde de sıkça kullanılır. Bu dönüşüm iki şekilde gerçekleşir:

===== Otomatik (Örtük / Implicit) Dönüşüm:
Farklı türler aynı matematiksel işleme girdiğinde, veri kaybını önlemek için küçük tür otomatik olarak daha geniş ve kapsayıcı olan türe yükseltilir:

  #text(size: 12pt, weight: "semibold")[
  #not_block(title: "", width: 100%)[
    #align(center)[
      #grid(
        columns: (auto, auto, auto, auto),
        gutter: 0pt,
        align: horizon + center,
        inset: (x: 8pt, y: 3pt),
        // Sadece iç sütunların soluna ince dikey ayırıcı çizgi ekler
        stroke: (x, y) => if x > 0 { (left: 0.5pt + luma(180)) },
        [int + float $->$ float],
        [int - float $->$ float],
        [int \* float $->$ float],
        [int \/ float $->$ float],
      )
    ]
  ]
]

#kod-blok()[
  ```Python
adet = 5           # int türünde
birim_fiyat = 2.5   # float türünde

# Python arka planda 'adet' değerini 5.0 yapar
toplam_tutar = adet * birim_fiyat  # 5.0 * 2.5 = 12.5 (float)

print(toplam_tutar) # Çıktı: 12.5
  ```
]


===== Bilinçli (Açık / Explicit) Dönüşüm:
Programcının veri kaybını göze alarak veya işlemi yönlendirmek için türü zorla değiştirmesidir.

*Hassasiyeti Korumak İçin Tam Sayıyı Kesrli Sayıya Çevirmek (int $-->$ float):*\
Daha hassas değerler gerektiğinde tam sayı değerleri kasten kesirli değerlere dönüştürülebilir.

#kod-blok()[
  ```Python
puan = 100
ondalikli_puan = float(puan)  # 100 -> 100.0

print(ondalikli_puan)  # Çıktı: 100.0
  ```
]

*Ondalık Kısmı Atmak İçin (float $-->$ int):*\
Ondalıklı bir sayının virgülden sonraki kısmını silip yalnızca tam kısmını elde etmek gerektiğinde bu dönüşümden yararlanılır.
#kod-blok()[
  ```Python
ortalama = 85.85
tam_not = int(ortalama)  # Virgülden sonrası silinir, tam_not = 85 olur

print(tam_not)  # Çıktı: 85
  ```
]

=== Karakterden Metne
Tek bir *char* verisi bellekte tam *1 Bayt* yer kaplar. Dolayısıyla birden fazla karakterden oluşan bir kelimeyi veya metni bellekte tutmak istediğimizde altta ki formül ile her bir harf için RAM üzerinde art arda gelen (bitişik) 1 baytlık çekmeceler tahsis edilir.

#align(left)[
#text(size: 11pt, weight: "regular")[
  #not_block(title: "", width: auto)[
      Toplam Bellek Alanı = Karakter Sayısı x 1 Byte
  ]
]
]

#v(1em)
#align(center)[*Ada Lovelace metni Girildiğinde RAM üzerinde nasıl saklanır?*]
#ram-goster(
  "char",
  "char tam_isim[12] = {'A', 'd', 'a', ' ', 'L', 'o', 'v', 'e', 'l', 'a', 'c', 'e'};",
  "01000001 01100100 01100001 00100000 01001100 01101111 01110110 01100101 01101100 01100001 01100011 01100101",
  aciklama: "Boşluk karakteri (' ') de bellekte 1 byte yer kaplar (ASCII: 32). Toplam 12 karakter = 12 byte.",
)

== Değişken Tanımlama Kuralları
Yazılan kaynak kodların Python yorumlayıcısı tarafından doğru şekilde işlenebilmesi için değişken adları belirlenirken Python’un söz dizimi (*syntax*) kurallarına uyulması zorunludur.

*Karakter Kısıtlaması:* Değişken isimleri sadece alfabetik karakterler (*A-Z, a-z*), rakamlar (*0-9*) ve alt çizgi (*\_*) karakterini barındırabilir. Bunların dışındaki hiçbir özel sembol (nokta, virgül, soru işareti, tire, boşluk vb.) değişken isminde yer alamaz.

*Başlangıç Kriteri:* Bir değişken ismi kesinlikle bir rakam ile başlayamaz. İsimler ya alfabetik bir karakterle ya da alt çizgi (*\_*) işaretiyle başlamak zorundadır. Örneğin #text(weight: "semibold", red)[3etap_skor] hatalı bir söz dizimi iken, *etap_skor_3* veya *\_etap3* kurallara uygundur.

*Büyük-Küçük Harf Duyarlılığı (Case-Sensitivity):* Python dili, büyük ve küçük harfleri farklı karakterler olarak değerlendirir. Bu nedenle aynı harflerden oluşsa bile yazımında büyük-küçük harf farkı bulunan kelimeler, bellekte tutulan verilere erişmek için kullanılan farklı değişken adları olarak kabul edilir. Örneğin *asistan_adi*, *Asistan_Adi* ve *ASISTAN_ADI* ifadeleri Python yorumlayıcısı tarafından birbirinden bağımsız üç farklı değişken adı olarak değerlendirilir.

*Resmî Dil Anahtarları (Reserved Words):* Python dilinin kendi iç mekanizmasını yönetmek ve komutları işletmek adına kendine ayırdığı bazı özel kelimeler (keywords) değişken adı olarak kullanılamaz. Örneğin *if*, *else*, *True*, *False*, *while*, *for* gibi kelimeler Python için özel bir anlam ifade ettiğinden doğrudan değişken ismi yapılamaz.

*Türkçe Karakter Kullanımı: * Kodlama dillerinin ve yazılım araçlarının küresel standardı gereği, değişken isimlendirirken * Türkçe'ye özgü harfleri kullanmaktan kesinlikle kaçınınız!*.

#align(center)[
  #block(breakable: false, width: 100%)[
    #grid(
      columns: (1fr, 1.2fr),
      gutter: 14pt,
      align: (top, top),
      [
        #v(1em)
        *Türkçe Karakterlerin İngilizce Karşılıkları*
        #table(
          columns: (auto, auto, auto),
          fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: (center + horizon, center + horizon, center + horizon),
          rows: (2.5em, 2.6em),
          table.header([*Türkçe*], [*Dönüşüm*], [*İngilizce*]),
          [ç / Ç], [#text(weight: "bold",size: 14pt)[$-->$]], [*c / C*],
          [ğ / Ğ], [#text(weight: "bold",size: 14pt)[$-->$]], [*g / G*],
          [ı / İ], [#text(weight: "bold",size: 14pt)[$-->$]], [*i / I*],
          [ö / Ö], [#text(weight: "bold",size: 14pt)[$-->$]], [*o / O*],
          [ş / Ş], [#text(weight: "bold",size: 14pt)[$-->$]], [*s / S*],
          [ü / Ü], [#text(weight: "bold",size: 14pt)[$-->$]], [*u / U*],
        )
      ],
      [
        #v(1em)
        *Değişken Kullanım Örnekleri*
        #table(
          columns: (auto, auto, auto),
          fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: (left + horizon, center + horizon, left + horizon),
          rows: (2.5em, 2em),
          table.header([*Hatalı Kullanım*], [*Dönüşüm*], [*Doğru Kullanım*]),
          [`doğumTarihi`],  [$-->$], [`dogumTarihi`],
          [`ürünFiyatı`],    [$-->$], [`urunFiyati`],
          [`şubeKodu`],      [$-->$], [`subeKodu`],
          [`kayıtDurumu`],   [$-->$], [`kayitDurumu`],
          [`şifresi`],       [$-->$], [`sifresi`],
          [`öğrenci_yaşı`],  [$-->$], [`ogrenci_yasi`],
          [`ücret_miktarı`], [$-->$], [`ucret_miktari`],
          [`ilk_değer`],     [$-->$], [`ilk_deger`],
        )
      ]
    )
  ]
]

=== Değişken Adlandırma Standartları (Notasyonlar)
==== Yılan Gösterimi (snake_case)
Tüm harflerin küçük yazıldığı ve kelimelerin birbirine alt çizgi (\_) karakteriyle bağlandığı yöntemdir. Python literatüründe değişken ve fonksiyon isimleri için bu standardın kullanılması (örneğin kullanici_giris_tarihi, asistan_bellek_kapasitesi vb.) kurumsal olarak tavsiye edilir.


==== Camel Case (Deve Notasyonu) Kuralı
Değişken adları tanımlanırken kelimeler arasında **boşluk bırakılamaz**. Birden fazla kelimeden oluşan değişkenleri okunaklı kılmak için dünya çapında standart olan *camelCase* yöntemi kullanılır.\
*Kural:* İlk kelimenin tüm harfleri küçük başlar. Sonraki her kelimenin ilk harfi büyük yazılır (kelimelerin ortasındaki hörgüç görünümü gibi).

#align(center)[
  #v(1em)
  *Değişken Adlandırma Kuralları (Naming Conventions)*
  #table(
    columns: (auto, auto, auto),
    fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e1"),
    align: (center + horizon, center + horizon, center + horizon),
    rows: (2.5em, 2em),
    table.header([*Yanlış / Zor Okunan Biçim*], [*snake_case (Python)*], [*camelCase*]),
    
    text(fill: rgb("#dc2626"))[`personelsayisi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`personel_sayisi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`personelSayisi`],

    text(fill: rgb("#dc2626"))[`dogumyil`],
    text(fill: rgb("#2563eb"), weight: "bold")[`dogum_yil`],
    text(fill: rgb("#16a34a"), weight: "bold")[`dogumYil`],

    text(fill: rgb("#dc2626"))[`ogrencinotortalamasi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`ogrenci_not_ortalamasi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`ogrenciNotOrtalamasi`],
  )
]

==== Sabitler
Bir yazılım mimarisinde programın çalışma süresince değiştirilmemesi amaçlanan ve aynı değeri koruması beklenen verilere sabit (constant) adı verilir. Sabit olarak kullanılması amaçlanan isimler, tüm harfleri büyük olacak ve kelimeler alt çizgiyle (\_) ayrılacak biçimde yazılır.

#kod-blok()[
```Python
# Doğru Sabit Kullanım Standardı (BÜYÜK HARF)
PI_SAYISI = 3.14159
MAKSIMUM_DENEME_SAYISI = 3
SISTEM_PORT_NUMARASI = 443
VARSAYILAN_DIL = "TR"
KARSILAMA_MESAJI = " Sisteme Hoş Geldiniz!"
GELISTIRICI_MODU_ACIK = True
```
]


==== Açıklama Satırı (Comment line)
Yazılım projelerinde, derleyicinin görmezden geldiği ancak yazılımcıların kendileri için veya diğer yazılımcılar için bıraktığı notlara açıklama satarı (comment line) denir. Python'da iki tür açıklama satırı uygulaması vardır.
+ \# ile başlayan tek satırlık açıklama satırı
+ \"\"\"...\"\"\" Çok satırlı açıklama satırları üç adet tırnak ile açılan ve yine üç adet tırnak ile kapanan alan içine yazılan açıklama ifadeleri ile yapılır.

#kod-blok(width: 100%)[
        ```Python
# Bu tam satırlık açıklama
x = 10  # satır içi (inline) açıklama
```]

      #v(5pt)

#block(breakable: false)[
  #grid(
    columns: (auto, auto), // İki sütunun eşit veya içeriğe göre olmasını istiyorsanız (auto, auto) da kalabilir
    gutter: 10pt,
    align: top,
    [
#kod-blok(width: 100%)[
  ```Python
# Bu fonksiyon iki sayıyı toplar,
# ardından sonucu ekrana yazdırır
# ve geriye döndürür.
def topla(a, b):
    return a + b
# fonksiyon sonlandırıldı
```
]
    ],
    [
      #kod-blok(width: 100%)[
        ```Python
"""
Bu teknik olarak bir string değişmezidir,
ancak bir değişkene atanmadığı için
yorum bloğu gibi davranır.
"""
print("Kod çalışıyor")
```  
      ]
      
    ]
  )
]

=== Python Dili
*Python*; yüksek seviyeli, yorumlanan, nesne yönelimli ve geniş bir kütüphane ekosistemine sahip bir programlama dilidir. 1991 yılında Guido van Rossum tarafından geliştirilen bu dil, adını van Rossum'un beğeniyle takip ettiği İngiliz komedi grubu Monty Python’ın Monty Python’s Flying Circus adlı televizyon programından almıştır.

Python, sade söz dizimi ve yüksek okunabilirliği sayesinde web geliştirmeden veri analizine, robotik kontrolden yapay zekâ sistemlerine kadar çok geniş bir alanda tercih edilir. Sunduğu bu esneklik ve zengin kütüphane desteği nedeniyle Python; küresel yazılım dünyasında olduğu gibi Türkiye’deki teknoloji girişimlerinde, akıllı otomasyon sistemlerinde ve Ar-Ge projelerinde de yaygın olarak kullanılmaktadır.

Günümüzde bilgisayar donanımları, programlama dillerinin ilk ortaya çıktığı dönemlere kıyasla inanılmaz bir kapasiteye ulaşmıştır. Bu sayede Python gibi dillerin getirdiği çalışma zamanı maliyeti modern donanımlarla büyük ölçüde tolere edilmekte; çoğu uygulama için fazlasıyla yeterli ve pratik bir performans sunmaktadır.

#v(1em)
#align(center)[
*İki Sayının Toplamını Alan Kod Örneği*
#v(1em)
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *C Dili*
      #kod-blok[
          ```c
          #include <stdio.h>

          int main() {
              int sayi1, sayi2, toplam;

              printf("Birinci sayi: ");
              scanf("%d", &sayi1);

              printf("Ikinci sayi: ");
              scanf("%d", &sayi2);

              toplam = sayi1 + sayi2;
              printf("Toplam: %d\n", toplam);

              return 0;
          }
          ```
      ]
    ],
    [
*Python Dili*
#kod-blok[
    ```python
    sayi1 = int(input("Birinci sayı: "))
    sayi2 = int(input("İkinci sayı: "))

    toplam = sayi1 + sayi2
    print(f"Toplam: {toplam}")
    ```
]

    ]
  
  )
]
]
