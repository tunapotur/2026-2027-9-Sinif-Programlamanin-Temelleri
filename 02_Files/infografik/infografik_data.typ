#import "../../template.typ": *
#import "../../qr_code.typ"

#show: conf

#set document(title: "2026-2027 9. Sınıf Programlamanın Temelleri")
#set page(numbering: "1")

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
    #image("../Transistor On.jpg")
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Var (Açık)],[:],[1 (Bit)])
  ],
  [
    #image("../Transistor Off.jpg")
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Yok (Kapalı)],[:],[0 (Bit)])
  ]
)
#v(1em)
]

*$1$* ve *$0$* durumunu oluşturan en küçük bilgi birimine *Bit (Binary Digit)* denir. Bilgisayar dünyasındaki tüm yazılımlar, videolar, oyunlar ve metinler fiziksel temelde sadece *$1$* ve *$0$*'lardan ibarettir.

Yazılım tarihinin en başında, bilgisayarlara bir iş yaptırmak için işlemcinin tek doğal dili olan Makine Dili (*İkilik Sistem / Binary*) kullanılıyordu. Programcılar, komutları *`1011 0000`* gibi *$0$* ve *$1$* dizileri halinde delikli kartlara veya anahtarlara işliyordu. Ancak bu yöntem insan gözü için son derece yorucuydu ve tek bir rakamın yanlış yazılması tüm programı bozuyordu.

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

=== Sayı Sistemleri ve Gruplama: 4 Bit ve Onaltılık (Hexadecimal)
İkilik Sistemde oluşan zorlukları aşmak için *Onaltılık (Hexadecimal)* Sayı Sistemi kullanılmaya başlandı. Dört adet ikilik (binary) basamağın tek bir hexadecimal karaktere (0-9 ve A-F arası) karşılık gelmesi sayesinde, *`1011 0000`*, *`0110 0001`* gibi karmaşık bir makine kodu *`B0`*, *`61`* şeklinde çok daha kısa ve okunabilir bir biçimde ifade edildi. Bu yöntem yazımı kısaltıp hata payını azaltsa da, programcıların hâlâ hangi sayı kodunun hangi işlemi yaptığını ezbere bilmesi gerekiyordu.\ $2^4 = 16$ olduğu için 4 bitlik bir binary sayı tam olarak bir hexadecimal basamağı karşılık gelir.

#align(center)[
  #block(breakable: false)[
    #v(1em)
    *4-Bit İkilik (Binary) ve Onaltılık (Hexadecimal) Karşılıklar Tablosu*
    // Ortak tablo şablonu (Stil değişikliklerini tek yerden yapmak için)
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

    #set text(size: 9pt) // 4 sütunda taşmayı önlemek için ideal boyut
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

=== Metin Temsili: 8 Bit = 1 Byte ve ASCII Tablosu
Bir harfi veya sembolü sayılarla temsil etmek için standart referans tablosu #text(weight: "semibold")[ASCII (American Standard Code for Information Interchange)] geliştirilmiştir. Böylelikle en temel düzeyde gerekli olan karakterlere için *ASCII* tablosundaki karakterin sayısal bir karşılığı oluşturuldu.
- Bilgisayar mimarisinin temelinde $1$ karakter $1$ Byte ($8$ bit) yer kaplar. ASCII tablosunda $256$ karakter bulunmasının sebebi $8$ bit'in yan yana getirilerek $1$ Byte oluşturmasıdır. $1$ Byte aynı zamanda iki hexadecimal karakterle de kolaylıkla ifade edilebilir.
- *Kontrol Karakterleri:* Tablodaki $0$ ile $31$ arasındaki ilk $32$ karakter ve $127$ numaralı *`DEL`* karakteri ekranda basılabilir bir harf veya sembol değildir. Bunlar cihazlar arası iletişimi ve imleç hareketlerini yöneten #text(weight: "semibold")[Kontrol Karakterleri (Control / Non-printable Characters)] olarak adlandırılır.


#align(center)[
  *Temel ASCII Tablosu (32-127 Karakterin Kodu)*
  #text(size:7pt)[

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
     align: (top),
    [
      #table(
  columns: (auto, auto, auto, auto),
  inset: 3pt,
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
  inset: 3pt,
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
  inset: 3pt,
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
  inset: 3pt,
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

=== Makine Kodundan Assembly Diline
Altair 8800 gibi erken dönem bilgisayarlarda, işlemciye komut vermek için sürekli #text(weight: "bold")[`1` ve `0`] dizilimlerinden oluşan makine kodlarını kullanmak oldukça zahmetliydi ve hatalara açıktı. Makine kodlarını daha kısa ve okunabilir biçimde ifade etmek için #text(weight: "semibold")[Onaltılık (Hexadecimal) sayı sistemi] kullanılmaya başlandı. Ancak hexadecimal gösterim, makine kodunu daha kolay yazmayı sağlasa da komutların anlamını doğrudan açıklamıyordu.

Bu nedenle makine kodundaki komutları daha kolay hatırlayabilmek ve yazabilmek için İngilizce kelimelerin kısaltmalarından oluşan sembolik isimler (#text(weight: "bold")[Mnemonic]) kullanılmaya başlandı. Bu sembolik komutları kullanan dile #text(weight: "bold")[Assembly dili] adı verildi. Böylece programcılar, yalnızca `1` ve `0` dizilimleriyle uğraşmak yerine, daha anlaşılır ve hatırlanması kolay komutlarla program yazabilir hâle geldi.

#align(center)[
#v(1em)
*Hexadecimal Yerine Assembly Kullanımı Örneği*
#table(
  columns: (auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (center + horizon, center + horizon, center + horizon, left + horizon),
   rows:(4em, (2.5em)),
  table.header([*Hexadecimal*], [*Yerine*], [*Assembly*], [#align(center)[*Açıklama*]]),
  [`B0 61`], [$-->$], [`MOV AL, 61H`], [AL yazmacına *`61H`* verisi taşındı.],
  [`04 05`], [$-->$], [`ADD AL, 05H`], [AL yazmacındaki değere *`05H`* eklendi.],
  [`2C 02`], [$-->$], [`SUB AL, 02H`], [AL yazmacındaki değerden *`02H`* çıkarıldı.],
)
]

Bu sembolik komutlarla yazılan programlar, #text(weight: "bold")[Assembler (Çevirici)] adı verilen bir program aracılığıyla işlemcinin anlayabileceği makine koduna dönüştürüldü.

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
Her ne kadar $1$, $0$ veya hexadecimal sayılar ile kodlama yapmaya göre Assembly dili büyük bir kolaylık sağlasa da projeler büyüdükçe kodları yazmak zorlaşıyordu. İşte bu sorunu çözmek için *Fortran, COBOL ve C* gibi programlama dilleri ortaya çıktı. Artık iki sayıyı toplamak için işlemci yazmaçlarıyla uğraşmak yerine doğrudan #text(weight: "bold")[`sonuc = a + b`] yazmak yeterli hale geldi. Programlama dilleri ile yazılan kodlar, *Derleyici (Compiler)* veya *Yorumlayıcı (Interpreter)* adı verilen araçlarla arka planda tekrar makine koduna çevrilerek işlemci üzerinde çalıştırılmaktadır.

*Derleyici (Compiler):* Programcının yazdığı kodun tamamını önce baştan sona okur, yazım hatalarını kontrol eder ve tüm kodu bir bütün olarak makine diline çevirir. Kodun yazımında (söz diziminde) bir hata varsa derleme işlemi tamamlanmaz.

*Yorumlayıcı (Interpreter):* Kodu bir bütün olarak değil satır satır okuyarak anında çalıştırır. Bir satır çevrilip çalıştırıldıktan sonra sıradaki satıra geçilir. Hata tespiti açısından yorumlayıcı, hatanın bulunduğu satıra gelene kadar programı çalıştırır ve o noktada durur. Bu yaklaşım tıpkı bir tercümanın, konuşmacının cümlelerini anlık olarak çevirmesine benzer. *Python ve Ruby*, bu yaklaşımı kullanan dillere örnek gösterilebilir.

#align(center)[
  #block(breakable: false, width: 100%)[
    #set text(size: 9.5pt)
    #table(
      columns: (3.2cm, 2.8cm, 3.2cm, 1fr, 1fr),
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
      [İşlemci hiçbir çeviriye ihtiyaç duymadan doğrudan çalıştırır.],
      [İnsan tarafından okunması ve yazılması çok zordur.],

      // 2. Satır
      [*2. Hexadecimal\ (16'lık Sistem)*],
      [`0-9` ve `A-F` karakterleri],
      [`B0 61`],
      [Uzun 0 ve 1 dizilerini 4'lü gruplar halinde kısaltarak yazım kolaylığı sağlar.],
      [Komutların sayısal karşılıklarını akılda tutmak gerekiyordu.],

      // 3. Satır
      [*3. Assembly Dili\ (Sembolik Dil)*],
      [Sembolik kısaltmalar\ _(Mnemonics)_],
      [`MOV AL, 61h`],
      [Komutlar (`MOV`, `ADD`, `SUB`) anlamlı kelimelerle ifade edilir.],
      [Her işlemci mimarisi için farklıdır; büyük projelerde kod çok uzar.],

      // 4. Satır
      [*4. Yüksek Seviyeli Diller*],
      [Günlük dil ve matematiksel ifadeler],
      [`int a = 97;`],
      [Öğrenmesi kolaydır, donanımdan bağımsızdır ve hızlı yazılım geliştirmeyi sağlar.],
      [İşlemcide çalışabilmesi için derleyici veya yorumlayıcı ile çevrilmesi gerekir.],
    )
  ]
]

