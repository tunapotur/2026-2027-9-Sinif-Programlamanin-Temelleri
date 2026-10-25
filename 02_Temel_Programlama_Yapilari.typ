#import "template.typ": *
#import "qr_code.typ": *


= Temel Programlama Yapıları

== Değişkenler, Sabitler ve Veri Türleri
=== Donanımın Temel Yapı Taşı: Transistör ve İkili Sistem (Binary)
Transistör elektrik akımını geçirerek ya da keserek 1 veya 0 değerini üreten bilgisayarın en temel donanım birimidir. İşlemci, hafıza gibi bilgisayar donanımlarında milyarlarca transistör bulunur.


- Bir transistör elektrik akını geçirir veya keser:
  - Elektrik akımı var (Açık): 1 (Bit)
  - Elektrik akımı yok (Kapalı): 0 (Bit)

  *$1$* ve *$0$* durumun oluşturan en küçük bilgi birimine *Bit(Binary Digit* denir. Bilgisayar dünyasındaki tüm yazılımlar, videolar, oyunlar ve metinler fiziksel temelde sadece *$1$* ve *$0$*'lardan ibarettir.

=== Sayı Sistemleri ve Gruplama: 4 Bit ve Onaltılık (Hexadecimal)
4 bit'den oluşan bir sayıyı decimal yani 0-9 rakamları kullanmak yerine 16 karakterden oluşan hexadecimal sayı düzenini kullanmak daha pratik bir yöntemdir.

$2^4 = 16$ olduğu için 4 bitlik bir ikili sayı tam olarak bir hexadecimal basamağı karşılık gelir.

#align(center)[
  #table(
    columns: (3cm, 3cm, 3cm),
    align: (center, center, center),
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

#pagebreak()
=== Metin Temsili: 8 Bit = 1 Byte ve ASCII Tablosu

Bir harfi veya sembolü temsil etmek için $4$ bit ($2^4 = 16$ olasılık) yeterli değildir; alfabedeki büyük/küçük harfler, rakamlar ve noktalama işaretleri daha geniş bir değer aralığı gerektirir. Bilgisayarların bu sayısal değerleri anlamlı karakterlere dönüştürebilmesi için standart bir referans tablosu geliştirilmiştir: *ASCII (American Standard Code for Information Interchange)*. ASCII tablosundaki her sembolün sayısal bir karşılığı bulunur.

- Karakter ve Boyut İlişkisi:** $8$ bit yan yana getirilerek $1$ Byte oluşturulur. Modern bilgisayar mimarisinde metin dosyalarındaki her temel karakter bellekte $1$ Byte ($8$ bit) yer kaplar.
- Değer Aralığı:** $8$ bit ile $2^8 = 256$ farklı durum ($0$ ile $255$ arası) ifade edilebilir. Standart ASCII tablosu ilk $128$ karakteri ($0$–$127$) tanımlarken, $128$–$255$ arası değerler genişletilmiş karakter seti (özel semboller, bölgesel harfler) için kullanılır.
- Pratik Bir Deney (Windows Alt Kodları):** Microsoft Windows ortamında (Command Prompt veya herhangi bir metin düzenleyicide) `Alt` tuşuna basılı tutularak sağdaki sayısal tuş takımından (Numpad) bir karakterin onluk (decimal) kodu girildiğinde o karakter ekrana yazdırılır. Örneğin `Alt + 65` tuşlandığında ekranda *A* harfi belirir.
- Kontrol Karakterleri:** Tablodaki $0$ ile $31$ arasındaki ilk 32 karakter (ve $127$ numaralı *DEL* karakteri) ekranda basılabilir bir harf veya sembol değildir. Bunlar cihazlar arası iletişimi ve imleç hareketlerini yöneten *Kontrol Karakterleri (Control / Non-printable Characters)* olarak adlandırılır.

#align(center)[
  #v(0.5em)
  *Temel ASCII Tablosu*
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

=== İlk Bilgisayarlar ve 8 Bitlik Komut Girişleri (Altair 8800)
1970'lerin ortalarında kişisel bilgisayar devrimini başlatan *Altair 8800* gibi sistemlerin klavyesi veya ekranı yoktu. Ön panelinde sıra sıra fiziksel anahtarlar (*toggle switches*) ve LED lambalar yer alıyordu. Bu bilgisayar, sadece $1$ ve $0$ değerleri kullanılarak donanıma nasıl komut verildiğini ve hesap yaptırıldığını göstermek için somut bir örnektir.

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

#block(breakable: false)[
  #v(2em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Tarihi Eser Bilgisayarı Programladım | Altair 8800*

      Ömer Bektaş'ın kanalında Altair 8800 hakkında detaylı bir video bulunmakta.
     
    ],
    kare-kod-hucresi([Altair 8800 Video], "https://www.youtube.com/watch?v=1zwTRA0yaYo", "youtube.com/@merbekta"),
  )
]

#block(breakable: false)[
  #v(2em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Tarihi Eser Bilgisayarı Programladım | Altair 8800*

      Altair 8800 cihazını denemek istiyorsanız tarayıcınızda kullanabileceğiniz Altair 8800 Emulator linki.
     
    ],
    kare-kod-hucresi([Altair 8800 Emulator], "https://www.s2js.com/altair/sim.html", "www.s2js.com/altair/sim.html"),
  )
]

#pagebreak()
=== Assembly Dili
Komutları $0$ ve $1$ olarak girmek yerine, işlemci komutlarını anlamlı kelimelerle eşleştiren ilk adım Assembly dile ile atıldı.

- [`1000 1011`] yerine $-->$ *MOV* (Veri Taşı / Kopyala)
- [`0000 0011`] yerine $-->$ *ADD* (Topla)
- [`0010 1011`] yerine $-->$ *SUB* (Çıkar)

Assembly, işlemci mimarisiyle birebir konuşan doğal dildir. Programlar derlendiğinde bilgisayarınızda Assembly kodu halinde bulunur.

#block(breakable: false)[
  #v(2em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Dillerin Atası | Assembly*

      Ömer Bektaş'ın kanalında Assembly dili hakkında detaylı bir video bulunmakta.
     
    ],
    kare-kod-hucresi([Altair 8800 Video], "https://www.youtube.com/watch?v=yWXuG3RLkTE", "youtube.com/@merbekta"),
  )
]
#align(center)[
  #v(0.5em)
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
]

=== Programlama Dilleri
Her ne kadar $1$ ve $0$ ile kodlama yapmaya göre Assembly büyük bir kolaylık sağlasa da projeler büyüdükçe kodları yazmak zorlaşıyordu. İşte bu sorunu çözmek için *Fortran, COBOL ve C* gibi programlama dilleri ortaya çıktı. Bu programlama dilleri, *derleyici (compiler)* ve *yorumlayıcı (interpreter)* gibi yazılımlar kullanarak kod yazma işini büyük ölçüde kolaylaştırdı.

*Derleyici (Compiler):* programcının yazdığı kodun tamamını önce baştan sona okur, yazım hatalarını kontrol eder ve tüm kodu bir bütün olarak makine diline çevirir. Kodun yazımında (söz diziminde) bir hata varsa derleme işlemi tamamlanmaz.

*Yorumlayıcı (Interpreter):* Kodu bir bütün olarak değil satır satır okuyarak anında çalıştırır. Bir satır çevrilip çalıştırıldıktan sonra sıradaki satıra geçilir. Hata tespiti açısından yorumlayıcı, hatanın bulunduğu satıra gelene kadar programı çalıştırır ve o noktada durur. Bu yaklaşım tıpkı bir tercümanın, konuşmacının cümlelerini anlık olarak çevirmesine benzer. *Python ve Ruby*, bu yaklaşımı kullanan dillere örnek gösterilebilir.

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

*Değişken* \
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



