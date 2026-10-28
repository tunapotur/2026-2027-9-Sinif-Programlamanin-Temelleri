#import "template.typ": *
#import "qr_code.typ": *


= Temel Programlama Yapıları

== Değişkenler, Sabitler ve Veri Türleri
=== Donanımın Temel Yapı Taşı: Transistör ve İkili Sistem (Binary)
*Transistör* elektrik akımını geçirerek ya da keserek *$1$* veya *$0$* değerini üreten bilgisayarın en temel donanım birimidir. İşlemci, hafıza gibi bilgisayar donanımlarında milyarlarca transistör bulunur.

#align(center)[
#v(1em)
*Bir Transistör Elektrik Akını Geçirir veya Keser*  
#grid(
  columns: (auto, auto),
  gutter: 15pt,
  align: (top),
  [
    #image("02_Files/Transistor On.jpg")
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Var (Açık)],[:],[1 (Bit)])
  ],
  [
    #image("02_Files/Transistor Off.jpg")
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Yok (Kapalı)],[:],[0 (Bit)])
  ]
)
#v(1em)
]

*$1$* ve *$0$* durumun oluşturan en küçük bilgi birimine *Bit (Binary Digit)* denir. Bilgisayar dünyasındaki tüm yazılımlar, videolar, oyunlar ve metinler fiziksel temelde sadece *$1$* ve *$0$*'lardan ibarettir.

Yazılım tarihinin en başında, bilgisayarlara bir iş yaptırmak için işlemcinin tek doğal dili olan Makine Dili (*İkilik Sistem / Binary*) kullanılıyordu. Programcılar, komutları *`1011 0000`* gibi *$0$* ve *$1$* dizileri halinde delikli kartlara veya anahtarlara işliyordu. Ancak bu yöntem insan gözü için son derece yorucuydu ve tek bir rakamın yanlış yazılması tüm programı bozuyordu.

=== Sayı Sistemleri ve Gruplama: 4 Bit ve Onaltılık (Hexadecimal)
4 bit'den oluşan bir sayıyı decimal yani 0-9 rakamları kullanmak yerine 16 karakterden oluşan hexadecimal sayı düzenini kullanmak donanım üzerinde yapılan işlemler için daha pratik bir yöntemdir.

$2^4 = 16$ olduğu için 4 bitlik bir ikili sayı tam olarak bir hexadecimal basamağı karşılık gelir.

#align(center)[
#block(breakable: false)[
#grid(
  columns: (auto, auto),
  gutter: 15pt,
  align: (top),
  [
    #table(
    columns: (2.5cm, 2cm, 2cm),
    rows:(4em, (2.5em)),
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
    [*Hexadecimal\ (16'lık)*], [*Decimal\ (10'luk)*], [*Binary\ (4 Bit)*],

    // Tablo Gövdesi (0 - F)
    [*`0`*], [0],  [`0000`],
    [*`1`*], [1],  [`0001`],
    [*`2`*], [2],  [`0010`],
    [*`3`*], [3],  [`0011`],
    [*`4`*], [4],  [`0100`],
    [*`5`*], [5],  [`0101`],
    [*`6`*], [6],  [`0110`],
    [*`7`*], [7],  [`0111`],
    
  )
  ],
  [
     #table(
    columns: (2.5cm, 2cm, 2cm),
    rows:(4em, (2.5em)),
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
    [*Hexadecimal\ (16'lık)*], [*Decimal\ (10'luk)*], [*Binary\ (4 Bit)*],

    // Tablo Gövdesi (0 - F)
    [*`8`*], [8],  [`1000`],
    [*`9`*], [9],  [`1001`],
    [*`A`*], [10], [`1010`],
    [*`B`*], [11], [`1011`],
    [*`C`*], [12], [`1100`],
    [*`D`*], [13], [`1101`],
    [*`E`*], [14], [`1110`],
    [*`F`*], [15], [`1111`],
  )
  ]
)
  ]
]


#pagebreak()
=== Metin Temsili: 8 Bit = 1 Byte ve ASCII Tablosu
Bir harfi veya sembolü temsil etmek için standart referans tablosu *ASCII (American Standard Code for Information Interchange)* geliştirilmiştir. *ASCII* tablosundaki her sembolün sayısal bir karşılığı bulunur.

- *Karakter ve Boyut İlişkisi:* $8$ bit yan yana getirilerek $1$ Byte oluşturulur. Bilgisayar mimarisinde her temel karakter bellekte $1$ Byte ($8$ bit) yer kaplar. $8$ bit ile $2^8 = 256$ farklı durum ($0$ ile $255$ arası) ifade edilebilir.
- *Değer Aralığı:* Standart ASCII tablosu ilk $128$ karakteri ($0$–$127$) tanımlarken, $128$–$255$ arası değerler genişletilmiş karakter seti (özel semboller, bölgesel harfler) için kullanılır.
- *Kontrol Karakterleri:* Tablodaki $0$ ile $31$ arasındaki ilk $32$ karakter ve $127$ numaralı *`DEL`* karakteri ekranda basılabilir bir harf veya sembol değildir. Bunlar cihazlar arası iletişimi ve imleç hareketlerini yöneten *Kontrol Karakterleri (Control / Non-printable Characters)* olarak adlandırılır.
- *Pratik Bir Deney (Windows Alt Kodları):* Microsoft Windows ortamında herhangi bir metin düzenleyicide *`Alt`* tuşuna basılı tutularak bir karakterin onluk (decimal) kodu girildiğinde o karakter ekrana yazdırılır. Örneğin *`Alt + 65`* tuşlandığında ekranda *`A`* harfi belirir.

#link-box(
  url:"www.ascii-code.com",
  title: "ASCII Code - Karakter Kodlama Tablosu",
  desc: "Tüm standart ve genişletilmiş ASCII karakterleri, onluk (dec), onaltılık (hex) ve ikilik (bin) değerleri ile kontrol karakterlerini incelemek için bu referans tablosunu kullanabilirsiniz."
)

#align(center)[
  #v(0.5em)
  *Temel ASCII Tablosu (32-127 Karakterin Kodu)*
  #text(size:8pt)[

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
     align: (top),
    [
      #table(
  columns: (auto, auto, auto, auto),
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

  [32], [`20`], [`0010 0000`], [_SP_],
  [33], [`21`], [`0010 0001`], [`!`],
  [34], [`22`], [`0010 0010`], [`"`],
  [35], [`23`], [`0010 0011`], [`#`],
  [36], [`24`], [`0010 0100`], [`$`],
  [37], [`25`], [`0010 0101`], [`%`],
  [38], [`26`], [`0010 0110`], [`&`],
  [39], [`27`], [`0010 0111`], [`'`],
  [40], [`28`], [`0010 1000`], [`(`],
  [41], [`29`], [`0010 1001`], [`)`],
  [42], [`2A`], [`0010 1010`], [`*`],
  [43], [`2B`], [`0010 1011`], [`+`],
  [44], [`2C`], [`0010 1100`], [`,`],
  [45], [`2D`], [`0010 1101`], [`-`],
  [46], [`2E`], [`0010 1110`], [`.`],
  [47], [`2F`], [`0010 1111`], [`/`],
  [48], [`30`], [`0011 0000`], [`0`],
  [49], [`31`], [`0011 0001`], [`1`],
  [50], [`32`], [`0011 0010`], [`2`],
  [51], [`33`], [`0011 0011`], [`3`],
  [52], [`34`], [`0011 0100`], [`4`],
  [53], [`35`], [`0011 0101`], [`5`],
  [54], [`36`], [`0011 0110`], [`6`],
  [55], [`37`], [`0011 0111`], [`7`],  
)
    ],
    [
	#table(
  columns: (auto, auto, auto, auto),
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

  [56], [`38`], [`0011 1000`], [`8`],
  [57], [`39`], [`0011 1001`], [`9`],
  [58], [`3A`], [`0011 1010`], [`:`],
  [59], [`3B`], [`0011 1011`], [`;`],
  [60], [`3C`], [`0011 1100`], [`<`],
  [61], [`3D`], [`0011 1101`], [`=`],
  [62], [`3E`], [`0011 1110`], [`>`],
  [63], [`3F`], [`0011 1111`], [`?`],
  [64], [`40`], [`0100 0000`], [`@`],
  [65], [`41`], [`0100 0001`], [`A`],
  [66], [`42`], [`0100 0010`], [`B`],
  [67], [`43`], [`0100 0011`], [`C`],
  [68], [`44`], [`0100 0100`], [`D`],
  [69], [`45`], [`0100 0101`], [`E`],
  [70], [`46`], [`0100 0110`], [`F`],
  [71], [`47`], [`0100 0111`], [`G`],
  [72], [`48`], [`0100 1000`], [`H`],
  [73], [`49`], [`0100 1001`], [`I`],
  [74], [`4A`], [`0100 1010`], [`J`],
  [75], [`4B`], [`0100 1011`], [`K`],
  [76], [`4C`], [`0100 1100`], [`L`],
  [77], [`4D`], [`0100 1101`], [`M`],
  [78], [`4E`], [`0100 1110`], [`N`],
  [79], [`4F`], [`0100 1111`], [`O`],
)
	],
	[
	#table(
  columns: (auto, auto, auto, auto),
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

  [80], [`50`], [`0101 0000`], [`P`],
  [81], [`51`], [`0101 0001`], [`Q`],
  [82], [`52`], [`0101 0010`], [`R`],
  [83], [`53`], [`0101 0011`], [`S`],
  [84], [`54`], [`0101 0100`], [`T`],
  [85], [`55`], [`0101 0101`], [`U`],
  [86], [`56`], [`0101 0110`], [`V`],
  [87], [`57`], [`0101 0111`], [`W`],
  [88], [`58`], [`0101 1000`], [`X`],
  [89], [`59`], [`0101 1001`], [`Y`],
  [90], [`5A`], [`0101 1010`], [`Z`],
  [91], [`5B`], [`0101 1011`], [`[`],
  [92], [`5C`], [`0101 1100`], [`\`],
  [93], [`5D`], [`0101 1101`], [`]`],
  [94], [`5E`], [`0101 1110`], [`^`],
  [95], [`5F`], [`0101 1111`], [`_`],
  [96], [`60`], [`0110 0000`], [``` ` ```],
  [97], [`61`], [`0110 0001`], [`a`],
  [98], [`62`], [`0110 0010`], [`b`],
  [99], [`63`], [`0110 0011`], [`c`],
  [100], [`64`], [`0110 0100`], [`d`],
  [101], [`65`], [`0110 0101`], [`e`],
  [102], [`66`], [`0110 0110`], [`f`],
  [103], [`67`], [`0110 0111`], [`g`],
  
)
	],
  [
      #table(
  columns: (auto, auto, auto, auto),
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

  [104], [`68`], [`0110 1000`], [`h`],
  [105], [`69`], [`0110 1001`], [`i`],
  [106], [`6A`], [`0110 1010`], [`j`],
  [107], [`6B`], [`0110 1011`], [`k`],
  [108], [`6C`], [`0110 1100`], [`l`],
  [109], [`6D`], [`0110 1101`], [`m`],
  [110], [`6E`], [`0110 1110`], [`n`],
  [111], [`6F`], [`0110 1111`], [`o`],
  [112], [`70`], [`0111 0000`], [`p`],
  [113], [`71`], [`0111 0001`], [`q`],
  [114], [`72`], [`0111 0010`], [`r`],
  [115], [`73`], [`0111 0011`], [`s`],
  [116], [`74`], [`0111 0100`], [`t`],
  [117], [`75`], [`0111 0101`], [`u`],
  [118], [`76`], [`0111 0110`], [`v`],
  [119], [`77`], [`0111 0111`], [`w`],
  [120], [`78`], [`0111 1000`], [`x`],
  [121], [`79`], [`0111 1001`], [`y`],
  [122], [`7A`], [`0111 1010`], [`z`],
  [123], [`7B`], [`0111 1011`], [`{`],
  [124], [`7C`], [`0111 1100`], [`|`],
  [125], [`7D`], [`0111 1101`], [`}`],
  [126], [`7E`], [`0111 1110`], [`~`],
  [127], [`7F`], [`0111 1111`], [_DEL_],
  
)
    ],
  )
]
]
  ]

=== Dijital Dünyanın Ölçü Birimi Bit'ten Terabayt'a Veri Büyüklükleri
Bilgisayar dünyasındaki tüm içeriklerin fiziksel temelde sadece *$1$* ve *$0$*'lardan ibaret olduğunu ve *$1$* ve *$0$* durumun oluşturan en küçük bilgi birimine *Bit (Binary Digit)* dendiğini söylemiştik.  

- *Bit (Binary Digit):* Bilgisayardaki en küçük mantıksal veri birimidir. Sadece *0* veya *1* değerini alabilir. Devredeki tek bir transistör lamba anahtarı gibi düşünülebilir: ya kapalıdır (0) ya da açıktır (1).
- *Byte:* 8 adet bitin yan yana gelmesiyle oluşan veri kümesidir.
  $ 8 " Bit" = 1 " Byte" $
  Örneğin *"A"* harfi bellekte *1 Byte* yer kaplar gibi düşünebiliriz.
- Günlük hayatta metrik sistemde birimler onluk sisteme ($10^3$) göre biner biner büyür (1 kg = 1000 g,\ 1 km = 1000 m). Ancak bilgisayarlar *2'lik sayı sistemine (Binary)* göre çalışır. Bilgisayar mimarisinde bellek adreslemesi 2'nin üsleri şeklinde katlanarak ilerler. Onluk sistemdeki 1000 sayısına ikili tabanda en yakın kuvvet: 1024 sayısıdır.
  $ 2^(10) = 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 = 1024 $
Bu nedenle bilişim mimarisinde her bir büyüklük basamağı bir öncekinin *1024 katı* ($2^(10)$) kabul edilir.


#align(center)[
#v(1em)
*Veri Büyüklüğü Basamakları*
#table(
  columns: (auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + horizon, left + horizon, center + horizon, left + horizon),
   rows:(4em, (2.5em)),
  table.header([*Birim*], [*Kapasite*], [*Kısaltma*], [*Somut Karşılığı*]),
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

#v(1em)
#not_block(title: "Donanım Üreticisi vs. İşletim Sistemi Farkı: ")[
Piyasadan satın alınan *1TB* kapasiteli bir SSD veya harici disk bilgisayara takıldığında, depolama alanı genellikle yaklaşık *931 GB* görünür. Bu durum donanım hatası değildir:

Donanım Üreticileri *Onluk* sayı birimini kullanarak $1 " KB" = 10^3 " Byte"$ şeklinde hesap yapar:
  $ 1 " TB" = 1.000.000.000.000 " Byte" $

Fakat işletim sistemleri ikilik sayı sistemine göre ölçüm yaptığı için altta ki bölme işleminin sonucu satın aldığınız diskinizin gerçek boyutu *1TB* altında olacaktır.
  $ frac(1.000.000.000.000, 1024 times 1024 times 1024) approx 931.32 " GB" $

Sizce bu disk üreticilerinin yaptığı bir hile midir?
]


#pagebreak()
=== İlk Bilgisayarlar ve 8 Bitlik Komut Girişleri (Altair 8800)
1970'lerin ortalarında kişisel olarak kullanılabilen *Altair 8800* gibi sistemlerin klavyesi veya ekranı yoktu. Ön panelinde sıra sıra fiziksel anahtarlar (*toggle switches*) ve LED lambalar yer alıyordu. Bu bilgisayar, sadece $1$ ve $0$ değerleri kullanılarak donanıma nasıl komut verildiğini ve hesap yaptırıldığını göstermek için somut bir örnektir.

#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 4pt,
    inset: 12pt,
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

#pagebreak()
=== Assembly Dili
Tahmin edeceğiniz üzere, Altair 8800 gibi erken dönem bilgisayarlarda sürekli `1` ve `0` dizilimleriyle (makine koduyla) işlem yapmak oldukça zahmetliydi ve hataya çok açıktı. Bu nedenle komutları ikili sistemde girmek yerine, işlemci talimatlarını anlamlı sembolik kısaltmalarla (mnemonik) eşleştiren Assembly dili geliştirildi.

*Örneğin:*
- [`1000 1011`] yerine $-->$ *MOV* (Veri Taşı / Kopyala)
- [`0000 0011`] yerine $-->$ *ADD* (Topla)
- [`0010 1011`] yerine $-->$ *SUB* (Çıkar)

#link-box(
  url:"www.youtube.com/watch?v=yWXuG3RLkTE",
  title:"Dillerin Atası | Assembly",
  desc:"Ömer Bektaş'ın kanalında Assembly dili hakkında detaylı bir video bulunmakta."
  )


#align(center)[
  #v(1em)
*x86 Assembly: İki Sayıyı Toplama Örneği*

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
#v(1em)
]

=== Programlama Dilleri
Her ne kadar $1$ ve $0$ ile kodlama yapmaya göre Assembly büyük bir kolaylık sağlasa da projeler büyüdükçe kodları yazmak zorlaşıyordu. İşte bu sorunu çözmek için *Fortran, COBOL ve C* gibi programlama dilleri ortaya çıktı. Bu programlama dillerinin, *derleyici (compiler)* ve *yorumlayıcı (interpreter)* gibi yazılımlar kullanması kod yazma işini büyük ölçüde kolaylaştırdı.

*Derleyici (Compiler):* programcının yazdığı kodun tamamını önce baştan sona okur, yazım hatalarını kontrol eder ve tüm kodu bir bütün olarak makine diline çevirir. Kodun yazımında (söz diziminde) bir hata varsa derleme işlemi tamamlanmaz.

*Yorumlayıcı (Interpreter):* Kodu bir bütün olarak değil satır satır okuyarak anında çalıştırır. Bir satır çevrilip çalıştırıldıktan sonra sıradaki satıra geçilir. Hata tespiti açısından yorumlayıcı, hatanın bulunduğu satıra gelene kadar programı çalıştırır ve o noktada durur. Bu yaklaşım tıpkı bir tercümanın, konuşmacının cümlelerini anlık olarak çevirmesine benzer. *Python ve Ruby*, bu yaklaşımı kullanan dillere örnek gösterilebilir.

#pagebreak()
=== Programlama Dillerinin Seviyeleri
Düşük seviyeli programlama dilleri makine diline yakındır ve insanların anlaması daha zordur; ancak donanıma doğrudan eriştikleri için son derece yüksek performanslı programlar üretirler. *C*, *Rust* düşük seviyeli programlama dillerine örnektir. Yüksek seviyeli diller ise insanlar tarafından kolay anlaşılır ve hızlı yazılır, fakat sundukları soyutlama katmanı nedeniyle görece daha düşük performans gösterirler. *Python*, bu yüksek seviyeli dillere iyi bir örnektir.

Günümüzde bilgisayar donanımları, programlama dillerinin ilk ortaya çıktığı dönemlere kıyasla inanılmaz bir kapasiteye ulaşmıştır. Bu sayede Python gibi dillerin getirdiği çalışma zamanı maliyeti modern donanımlarla büyük ölçüde tolere edilmekte; çoğu uygulama için fazlasıyla yeterli ve pratik bir performans sunmaktadır.

=== Python Dili
Python; yüksek seviyeli, yorumlanan, nesne yönelimli ve geniş bir kütüphane ekosistemine sahip bir programlama dilidir. 1991 yılında Guido van Rossum tarafından geliştirilen bu dil, adını van Rossum'un beğeniyle takip ettiği İngiliz komedi grubu Monty Python’ın Monty Python’s Flying Circus adlı televizyon programından almıştır.

Python, sade söz dizimi ve yüksek okunabilirliği sayesinde web geliştirmeden veri analizine, robotik kontrolden yapay zekâ sistemlerine kadar çok geniş bir alanda tercih edilir. Sunduğu bu esneklik ve zengin kütüphane desteği nedeniyle Python; küresel yazılım dünyasında olduğu gibi Türkiye’deki teknoloji girişimlerinde, akıllı otomasyon sistemlerinde ve Ar-Ge projelerinde de yaygın olarak kullanılmaktadır.

#show raw.line: it => {
  // Satır numarasını gri ve sağa dayalı göster
  box(width: 2em, align(right, text(fill: luma(120), str(it.number))))
  h(1em) // Numara ile kod arasına boşluk bırak
  it.body
}

#show raw.where(block: true): set block(
  fill: rgb("#f6f8fa"),
  inset: 10pt,
  radius: 4pt,
  stroke: 0.5pt + rgb("#d0d7de")
)

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
     
    ],
    [
*Python Dili*

```python
sayi1 = int(input("Birinci sayı: "))
sayi2 = int(input("İkinci sayı: "))

toplam = sayi1 + sayi2
print(f"Toplam: {toplam}")
```
    ]
  
  )
]
]

#pagebreak()
=== Değişkenler ve Temel Veri Türleri

==== Değişken
Programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir. Kullanıcıdan veya harici bir kaynaktan alınan bilgiler bu değişkenlerde saklanır; kod çalıştıkça hesaplamalarda kullanılır ve süreç içinde yeni değerler alabilir. \
Değişkenler yardımıyla bellekte (RAM) saklanan verilere kolayca erişilir; kod çalıştırıldığında bu değişken isimleri çağrılarak temsil ettikleri veriler üzerinde işlemler gerçekleştirilir.

#v(1em)
*Örnek Python Kodu*
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
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
#text(size:8pt)[
+ *Tanımlama:* Kullanıcıdan veri alınır, tam sayıya çevrilir ve *puan* değişkenine atanarak bellekte saklanır.
+ *Çağırma:* *puan* değişkeni kullanılarak RAM'deki veriye erişilir ve ekrana yazdırılır
+ *Değer:* Güncelleme (Mevcut değer hesaplamaya katılır, yeni değer *puan* değişkenine atanır
+ *Çağırma:* *puan* değişkeninin güncel hali tekrar çağrılır
]

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0pt,
     align: (top),
    [
      #image("02_Files/Bellek Kullanımı 01.svg")
    ],
    [
      #image("02_Files/Bellek Kullanımı 02.svg")

    ]
  
  )
]

#pagebreak()
==== Temel Veri Türleri

Bilgisayar belleğine kaydedilecek verilerin nitelikleri, boyutları ve üzerlerinde hangi matematiksel veya mantıksal işlemlerin yapılabileceği veri türü (data type) kavramı ile belirlenir. Python dilinde değişkenlerin veri türleri, türetildikleri anda dinamik olarak yorumlayıcı tarafından atanır.

*Tam Sayı [Integer (int)]:* Kesirli kısmı bulunmayan; pozitif, negatif veya sıfır değerini alabilen sayısal veri
türüdür (örneğin ogrenci_sayisi = 34, hava_sicakligi = -5).

*Ondalıklı Sayı [Floating Point (float)]:* Kesirli veya ondalıklı kısımları bulunan, bilimsel hesaplamalarda
ve hassas ölçümlerde kullanılan sayısal veri türüdür. Python dilinde ondalık kısımlar virgül (,) değil
uluslararası standart gereği nokta (.) karakteriyle (örneğin urun_fiyati = 89.90, pi_sayisi = 3.14159)
ayrılır.

*Metinsel Veri [String (str)]:* Tek tırnak '...' veya çift tırnak "..." işaretleri arasında tanımlanan; alfabetik
karakterler, rakamlar ve özel sembollerden oluşan karakter dizileridir. Rakamlardan oluşsalar dahi string
türündeki verilerle doğrudan aritmetik işlem yapılamaz. Örneğin kullanici_adi = "gok turk_9", okul_numarasi =
"1071"

*Mantıksal Veri [Boolean (bool)]:* Sadece iki farklı durumun kontrolünde kullanılan, mantıksal karar
süreçlerinin temelini oluşturan veri türüdür. Alabileceği değerler yalnızca Doğru veya Yanlış ifadeleridir. Örneğin
sistem_acik_mi = True, bakiye_yeterli_mi = False

==== Python Değişken Tanımlama Kuralları
Yazılan kaynak kodların Python yorumlayıcısı tarafından doğru şekilde işlenebilmesi için değişken adları belirlenirken Python’un söz dizimi (*syntax*) kurallarına uyulması zorunludur.

*Karakter Kısıtlaması:* Değişken isimleri sadece alfabetik karakterler (*A-Z, a-z*), rakamlar (*0-9*) ve alt çizgi (*\_*) karakterini barındırabilir. Bunların dışındaki hiçbir özel sembol (nokta, virgül, soru işareti, tire, boşluk vb.) değişken isminde yer alamaz.

*Başlangıç Kriteri:* Bir değişken ismi kesinlikle bir rakam ile başlayamaz. İsimler ya alfabetik bir karakterle ya da alt çizgi (*\_*) işaretiyle başlamak zorundadır. Örneğin *3etap_skor* hatalı bir söz dizimi iken, *etap_skor_3* veya *\_etap3* kurallara uygundur.

*Büyük-Küçük Harf Duyarlılığı (Case-Sensitivity):* Python dili, büyük ve küçük harfleri farklı karakterler olarak değerlendirir. Bu nedenle aynı harflerden oluşsa bile yazımında büyük-küçük harf farkı bulunan kelimeler, bellekte tutulan verilere erişmek için kullanılan farklı değişken adları olarak kabul edilir. Örneğin *asistan_adi*, *Asistan_Adi* ve *ASISTAN_ADI* ifadeleri Python yorumlayıcısı tarafından birbirinden bağımsız üç farklı değişken adı olarak değerlendirilir.

*Resmî Dil Anahtarları (Reserved Words):* Python dilinin kendi iç mekanizmasını yönetmek ve komutları işletmek adına kendine ayırdığı bazı özel kelimeler (keywords) değişken adı olarak kullanılamaz. Örneğin *if*, *else*, *True*, *False*, *while*, *for* gibi kelimeler Python için özel bir anlam ifade ettiğinden doğrudan değişken ismi yapılamaz.

*Türkçe Karakter Kullanımı: * Kodlama dillerinin ve yazılım araçlarının küresel standardı gereği, değişken isimlendirirken * Türkçe'ye özgü harfleri kullanmaktan kesinlikle kaçınınız!*.

#align(center)[

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    align: (top, top),
    [
      *Türçe Karakterlerin İngilizce Karşılıkları*
  #table(
  columns: (2cm, 2cm, 2cm),
  stroke: table_Stroke,
  inset: 8.5pt,
  table.header(
    table_headerCell[Türkçe Karakter],
    table_headerCell[Doğru Kullanım],
    table_headerCell[İngilizce Karakte],
  ),
  table_dataCell_middle[ç / Ç],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*c / C*],
  
  table_dataCell_middle[ğ / Ğ],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*g / G*],
    
  table_dataCell_middle[ı / İ],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*i / I*],
    
  table_dataCell_middle[ö / Ö],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*o / O*],
    
  table_dataCell_middle[ş / Ş],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*s / S*],
    
  table_dataCell_middle[ü / Ü],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*u / U*],
)

    ],
    [
*Değişken Kullanım Örnekleri*
#table(
  columns: (auto, 2cm, auto),
  stroke: table_Stroke,
  inset: 6pt,
  table.header(
    table_headerCell[Türkçe\ Karakter],
    table_headerCell[Doğru Kullanım],
    table_headerCell[İngilizce\ Karakte],
  ),
  table_dataCell_middle[doğumTarihi],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*dogumTarihi*],
  
  table_dataCell_middle[ürünFiyatı],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*urunFiyati*],
  
  table_dataCell_middle[şubeKodu],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*subeKodu*],
  
  table_dataCell_middle[kayıtDurumu],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*kayitDurumu*],  

  table_dataCell_middle[şifresi],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*sifresi*],

  table_dataCell_middle[öğrenci_yaşı],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*ogrenci_yasi*],
  
  table_dataCell_middle[ücret_miktarı],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*ucret_miktari*],
  
  table_dataCell_middle[ilk_değer],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*ilk_deger*],
)

    ],
  )
]

]

==== Değişken Adlandırma Standartları (Notasyonlar)
*Yılan Gösterimi (snake_case)* 

Tüm harflerin küçük yazıldığı ve kelimelerin birbirine alt çizgi (\_) karakteriyle bağlandığı yöntemdir. Python literatüründe değişken ve fonksiyon isimleri için bu standardın kullanılması (örneğin kullanici_giris_tarihi, asistan_bellek_kapasitesi vb.) kurumsal olarak tavsiye edilir.


*Camel Case (Deve Notasyonu) Kuralı*

Değişken adları tanımlanırken kelimeler arasında **boşluk bırakılamaz**. Birden fazla kelimeden oluşan değişkenleri okunaklı kılmak için dünya çapında standart olan *camelCase* yöntemi kullanılır.\
*Kural:* İlk kelimenin tüm harfleri küçük başlar. Sonraki her kelimenin ilk harfi büyük yazılır (kelimelerin ortasındaki hörgüç görünümü gibi).

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: table_Stroke,
  inset: 6pt,
  table.header(
    table_headerCell[Yanlış Biçim],
    table_headerCell[snake_case],  
    table_headerCell[camelCase],  
  ),
  table_dataCell_middle[#text(fill: red)[personelsayisi]],
  table_dataCell_middle[#text(fill: blue.darken(30%), weight: "extrabold")[personel_sayisi]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[personelSayisi]],
  
  table_dataCell_middle[#text(fill: red)[dogumyil]],
  table_dataCell_middle[#text(fill: blue.darken(30%), weight: "extrabold")[dogum_yil]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[dogumYil]],
  
  table_dataCell_middle[#text(fill: red)[ogrencinotortalamasi]],
  table_dataCell_middle[#text(fill: blue.darken(30%), weight: "extrabold")[ogrenci_not_ortalamasi]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[ogrenciNotOrtalamasi]],
)
]

==== Sabitler
Bir yazılım mimarisinde programın çalışma süresince değiştirilmemesi amaçlanan ve aynı değeri koruması beklenen verilere sabit (constant) adı verilir. Sabit olarak kullanılması amaçlanan isimler, tüm harfleri büyük olacak ve kelimeler alt çizgiyle (\_) ayrılacak biçimde yazılır.

```Python
# Doğru Sabit Kullanım Standardı (BÜYÜK HARF)
PI_SAYISI = 3.14159
MAKSIMUM_DENEME_SAYISI = 3
SISTEM_PORT_NUMARASI = 443
VARSAYILAN_DIL = "TR"
KARSILAMA_MESAJI = " Sisteme Hoş Geldiniz!"
GELISTIRICI_MODU_ACIK = True
```

==== Açıklama Satırı (Comment line)
Yazılım projelerinde, derleyicinin görmezden geldiği ancak yazılımcıların kendileri için veya diğer yazılımcılar için bıraktığı notlara açıklama satarı (comment line) denir. Python'da iki tür açıklama satırı uygulaması vardır.
+ \# ile başlayan tek satırlık açıklama satırı
+ \"\"\"...\"\"\" Çok satırlı açıklama satırları üç adet tırnak ile açılan ve yine üç adet tırnak ile kapanan alan içine yazılan açıklama ifadeleri ile yapılır.

#block(breakable: false)[
  #grid(
    columns: (auto, auto), // İki sütunun eşit veya içeriğe göre olmasını istiyorsanız (auto, auto) da kalabilir
    gutter: 10pt,
    align: top,
    [
      #block(width: 100%)[```Python
# Bu tam satırlık açıklama
x = 10  # satır içi (inline) açıklama
```]

      #v(5pt)

      #block(width: 100%)[```Python
# Bu fonksiyon iki sayıyı toplar,
# ardından sonucu ekrana yazdırır
# ve geriye döndürür.
def topla(a, b):
    return a + b
```]
    ],
    [
      #block(width: 100%)[```Python
"""
Bu teknik olarak bir string değişmezidir,
ancak bir değişkene atanmadığı için
yorum bloğu gibi davranır.
"""
print("Kod çalışıyor")
```]
    ]
  )
]

