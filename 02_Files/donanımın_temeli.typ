#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *

// #show: conf

= Temel Programlama Yapıları
== Donanımın Temeli: Transistör ve İkili Sistem (Binary)
*Transistör* elektrik akımını geçirerek ya da keserek *$1$* veya *$0$* değerini üreten bilgisayarın en temel donanım birimidir. İşlemci, hafıza gibi bilgisayar donanımlarında milyarlarca transistör bulunur.

#align(center)[
*Bir Transistör Elektrik Akını Geçirir veya Keser*  
#grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: (top),
  [
    #image("/02_Files/images/Transistor On.jpg",width: 90%)
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Var (Açık)],[:],[1 (Bit)])
  ],
  [
    #image("/02_Files/images/Transistor Off.jpg",width: 90%)
    #grid(columns: (auto, auto, auto),gutter: 5pt,align: (top),[- Elektrik Akımı Yok (Kapalı)],[:],[0 (Bit)])
  ]
)

]

*$1$* ve *$0$* durumunu oluşturan en küçük bilgi birimine *Bit (Binary Digit)* denir. Bilgisayar dünyasındaki tüm yazılımlar, videolar, oyunlar ve metinler fiziksel temelde sadece *$1$* ve *$0$*'lardan ibarettir.

Yazılım tarihinin en başında, bilgisayarlara bir iş yaptırmak için işlemcinin tek doğal dili olan Makine Dili (*İkilik Sistem / Binary*) kullanılıyordu. Programcılar, komutları *`1011 0000`* gibi *$0$* ve *$1$* dizileri halinde delikli kartlara veya anahtarlara işliyordu. Ancak bu yöntem insan gözü için son derece yorucuydu ve tek bir rakamın yanlış yazılması tüm programı bozuyordu.

== İlk Bilgisayarlar ve 8 Bitlik Komut Girişleri (Altair 8800)
Erken dönem *Altair 8800* gibi bilgisayarların klavyesi veya ekranı yoktu. Ön panelinde sıra sıra fiziksel anahtarlar (*toggle switches*) ve LED lambalar yer alıyordu. Bu bilgisayar, sadece $1$ ve $0$ değerleri kullanılarak donanıma nasıl komut verildiğine ve hesap yaptırıldığına somut bir örnektir.

#grid(
  columns: (30em, auto),
  gutter: 5pt,
  align: horizon,
  [
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
  ],
  [
- Programcılar her bir $8$ bitlik komutu anahtarları tek tek yukarı ($1$) ve aşağı ($0$) indirerek belleğe elle yüklüyordu.
- İki sayıyı toplamak için bile onlarca $8$ bitlik komutu hatasız girmek gerekiyordu. Bu süreç son derece yavaş, zihinsel olarak yorucu ve hata yapmaya açıktı.
  ]
)

#link-box(
url: "www.youtube.com/watch?v=1zwTRA0yaYo",
title:"Tarihi Eser Bilgisayarı Programladım | Altair 8800",
desc:"Ömer Bektaş'ın kanalında Altair 8800 hakkında detaylı bir video bulunmakta."
)

#link-box(
url: "www.s2js.com/altair/sim.html",
title:"Altair 8800 Emulatorü",
desc:"Altair 8800 cihazını denemek istiyorsanız Altair 8800 Emulator linki."
)

#link-box(
url: "www.youtube.com/@merbekta",
title:"Ömer Bektaş'ın Youtube Kanalı",
desc:"Ömer Bektaş'ın YouTube kanalı. Takip etmenizi öneririm."
)

== Onaltılık Sayı Sistemi (Hexadecimal)
İkilik Sistemde oluşan zorlukları aşmak için *Onaltılık (Hexadecimal)* Sayı Sistemi kullanılmaya başlandı. Dört adet ikilik (binary) basamağın tek bir hexadecimal karaktere (0-9 ve A-F arası) karşılık gelmesi sayesinde, *`1011 0000`*, *`0110 0001`* gibi karmaşık bir makine kodu *`B0`*, *`61`* şeklinde çok daha kısa ve okunabilir bir biçimde ifade edildi. Bu yöntem yazımı kısaltıp hata payını azaltsa da, programcıların hâlâ hangi sayı kodunun hangi işlemi yaptığını ezbere bilmesi gerekiyordu.\ $2^4 = 16$ olduğu için 4 bitlik bir binary sayı tam olarak bir hexadecimal basamağı karşılık gelir.

#align(center)[
#let hucre-bosluk=(x:6pt, y:7pt)
*4-Bit İkilik (Binary) ve Onaltılık (Hexadecimal) Karşılıklar Tablosu*
#v(-0.4em)
#grid(
      columns: (auto, auto, auto, auto),
      gutter: 10pt,
      align: top,
icerik-tablo(
sutunlar: (auto,auto,auto),
sutun_basliklari: ("Hex","Dec","Binary"),
hucre-bosluk: hucre-bosluk,
      text(weight: "semibold", size: 11pt)[`0`], [`0`], [`0000`],
      text(weight: "semibold", size: 11pt)[`1`], [`1`], [`0001`],
      text(weight: "semibold", size: 11pt)[`2`], [`2`], [`0010`],
      text(weight: "semibold", size: 11pt)[`3`], [`3`], [`0011`],
),
icerik-tablo(
sutunlar: (auto,auto,auto),
sutun_basliklari: ("Hex","Dec","Binary"),
hucre-bosluk: hucre-bosluk,
        text(weight: "semibold", size: 11pt)[`4`], [`4`], [`0100`],
        text(weight: "semibold", size: 11pt)[`5`], [`5`], [`0101`],
        text(weight: "semibold", size: 11pt)[`6`], [`6`], [`0110`],
        text(weight: "semibold", size: 11pt)[`7`], [`7`], [`0111`],
),
icerik-tablo(
sutunlar: (auto,auto,auto),
sutun_basliklari: ("Hex","Dec","Binary"),
hucre-bosluk: hucre-bosluk,
        text(weight: "semibold", size: 11pt)[`8`], [`8`],  [`1000`],
        text(weight: "semibold", size: 11pt)[`9`], [`9`],  [`1001`],
        text(weight: "semibold", size: 11pt)[`A`], [`10`], [`1010`],
        text(weight: "semibold", size: 11pt)[`B`], [`11`], [`1011`],
),
icerik-tablo(
sutunlar: (auto,auto,auto),
sutun_basliklari: ("Hex","Dec","Binary"),
hucre-bosluk: hucre-bosluk,
        text(weight: "semibold", size: 11pt)[`C`], [`12`], [`1100`],
        text(weight: "semibold", size: 11pt)[`D`], [`13`], [`1101`],
        text(weight: "semibold", size: 11pt)[`E`], [`14`], [`1110`],
        text(weight: "semibold", size: 11pt)[`F`], [`15`], [`1111`],
),
  )
]

== Metin Temsili: 8 Bit = 1 Byte ve ASCII Tablosu
Bir harfi veya sembolü sayılarla temsil etmek için standart referans tablosu #text(weight: "semibold")[ASCII (American Standard Code for Information Interchange)] geliştirilmiştir. Böylelikle en temel düzeyde gerekli olan karakterlere için *ASCII* tablosundaki karakterin sayısal bir karşılığı oluşturuldu.

- Bilgisayar mimarisinin temelinde $1$ karakter *$1$ Byte ($8$ bit)* yer kaplar. ASCII tablosunda *$256$* karakter bulunmasının sebebi *$8$* bit'in yan yana getirilerek *$1$ Byte* oluşturmasıdır. *$1$ Byte* aynı zamanda iki hexadecimal karakterle de kolaylıkla ifade edilebilir.
- *Kontrol Karakterleri:* Tablodaki $0$ ile $31$ arasındaki ilk $32$ karakter ve $127$ numaralı *`DEL`* karakteri ekranda basılabilir bir harf veya sembol değildir. Bunlar cihazlar arası iletişimi ve imleç hareketlerini yöneten #text(weight: "semibold")[Kontrol Karakterleri (Control / Non-printable Characters)] olarak adlandırılır.

#link-box(
  url:"www.ascii-code.com",
  title: "ASCII Code - Karakter Kodlama Tablosu",
  desc: "Tüm ASCII karakterlerini incelemek için bu referans tablosunu kullanabilirsiniz."
)

#align(center)[
#block(breakable: false)[
// #let binary-size=6em
#let table-content-size=7.5pt
#let hucre_bosluk = (x:5pt, y:4.1pt)
#text(size:8pt)[*Temel ASCII Tablosu (32-127 Karakterin Kodu)*]
#v(-0.4em)
#grid(
    columns: (auto, auto, auto, auto),
    gutter: 6pt,
    align: (top),
    icerik-tablo(
      sutunlar: (auto,auto,auto,auto),
      sutun_basliklari: ([Dec],[Hex],[Binary],[Chr]),
      boyut: table-content-size,
      hucre_bosluk: hucre_bosluk,
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
    ),
      icerik-tablo(
            sutunlar: (auto,auto,auto,auto),
      sutun_basliklari: ([Dec],[Hex],[Binary],[Chr]),
      boyut: table-content-size,
      hucre_bosluk: hucre_bosluk,
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
    ),
      icerik-tablo(
      sutunlar: (auto,auto,auto,auto),
      sutun_basliklari: ([Dec],[Hex],[Binary],[Chr]),
      boyut: table-content-size,
      hucre_bosluk: hucre_bosluk,
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
    ),
      icerik-tablo(
      sutunlar: (auto,auto,auto,auto),
      sutun_basliklari: ([Dec],[Hex],[Binary],[Chr]),
      boyut: table-content-size,
      hucre_bosluk: hucre_bosluk,
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
    ),
)
]

]

== Bit'ten Terabayt'a Veri Büyüklükleri
Bilgisayar dünyasındaki tüm içeriklerin fiziksel temelde sadece *$1$* ve *$0$*'lardan ibaret olduğunu ve *$1$* ve *$0$* durumun oluşturan en küçük bilgi birimine *Bit (Binary Digit)* dendiğini söylemiştik.  

- *Bit (Binary Digit):* Bilgisayardaki en küçük mantıksal veri birimidir. Sadece *0* veya *1* değerini alabilir. Devredeki tek bir transistör lamba anahtarı gibi düşünülebilir: ya kapalıdır (0) ya da açıktır (1).
- *Byte:* 8 adet bitin yan yana gelmesiyle oluşan veri kümesidir. $8 "Bit" = 1 "Byte"$\ 
Örneğin *"A"* harfi bellekte *1 Byte* yer kaplar gibi düşünebiliriz.
- Günlük hayatta metrik sistemde birimler onluk sisteme ($10^3$) göre biner biner büyür (1 kg = 1000 g,\ 1 km = 1000 m). Ancak bilgisayarlar *2'lik sayı sistemine (Binary)* göre çalışır. Bilgisayar mimarisinde bellek adreslemesi 2'nin üsleri şeklinde katlanarak ilerler. Onluk sistemdeki 1000 sayısına ikili tabanda en yakın kuvvet: 1024 sayısıdır ($2^(10) = 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 times 2 = 1024$).\
  Bu nedenle bilişim mimarisinde her bir büyüklük basamağı bir öncekinin *1024 katı* ($2^(10)$) kabul edilir.

#icerik-tablo(boyut: 8.5pt, baslik-boyut: 8.5pt, tablo_baslik: "Veri Büyüklüğü Basamakları", sutunlar: (auto,auto,auto,auto),
icerik_hizalama: (left+horizon,left+horizon,center+horizon,left+horizon),
sutun_baslik_hizalama: (left+horizon,left+horizon,center+horizon,center+horizon),
sutun_basliklari: ([Birim], [Kapasite], [Kısaltma], [Somut Karşılığı]),
[Bit], [$0$ veya $1$], [*b*], [Tek bir transistör / elektrik sinyali],
  [Byte], [$8 " Bit"$], [*B*], [Tek bir karakter (harf, rakam, sembol)],
  [Kilobyte], [$1024 " Byte"$], [*KB*], [Düz metinden oluşan 1 sayfalık belge],
  [Megabyte], [$1024 " KB"$], [*MB*], [1 dakikalık MP3 ses kaydı veya telefon fotoğrafı],
  [Gigabyte], [$1024 " MB"$], [*GB*], [Yaklaşık 1 saatlik HD kalitede film],
  [Terabyte], [$1024 " GB"$], [*TB*], [Geniş harici yedekleme diski, çok sayıda büyük oyun],
  [Petabyte], [$1024 " TB"$], [*PB*], [Büyük veri merkezleri veya bulut sunucu havuzları],
  [Exabyte], [$1024 " PB"$], [*EB*], [Küresel internet trafiğinin aylık ölçekteki hacmi],)

#not_block(title: "Donanım Üreticisi vs. İşletim Sistemi Farkı: ", boyut: 9pt)[
Piyasadan satın alınan *1TB* kapasiteli bir SSD veya harici disk bilgisayara takıldığında, depolama alanı genellikle yaklaşık *931 GB* görünür. Bu durum donanım hatası değildir: 
#grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  [
    Disk Üreticileri *Onluk* sayı birimini kullanarak $1 "KB" = 10^3 "Byte"$ şeklinde hesap yapar:
  ],
  [
    $ 1 "TB"=1.000.000.000.000 "Byte"$
  ]
)

#grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  [
    Fakat işletim sistemleri ikilik sayı sistemine göre ölçüm yaptığı için yandaki ki bölme işleminin sonucu satın aldığınız diskinizin gerçek boyutu *1TB* altında olacaktır.    
  ],
  [
    $ frac(1.000.000.000.000, 1024 times 1024 times 1024) approx 931.32 " GB" $   
  ]
)
]

== Makine Kodundan Assembly Diline
Altair 8800 gibi erken dönem bilgisayarlarda, işlemciye komut vermek için sürekli #text(weight: "semibold")[`1` ve `0`] dizilimlerinden oluşan makine kodlarını kullanmak oldukça zahmetliydi ve hatalara açıktı. Makine kodlarını daha kısa ve okunabilir biçimde ifade etmek için #text(weight: "semibold")[Onaltılık (Hexadecimal) sayı sistemi] kullanılmaya başlandı. Ancak hexadecimal gösterim, makine kodunu daha kolay yazmayı sağlasa da komutların anlamını doğrudan açıklamıyordu.

Bu nedenle makine kodundaki komutları daha kolay hatırlayabilmek ve yazabilmek için İngilizce kelimelerin kısaltmalarından oluşan sembolik isimler (#text(weight: "bold")[Mnemonic]) kullanılmaya başlandı. Bu sembolik komutları kullanan dile #text(weight: "bold")[Assembly dili] adı verildi. Böylece programcılar, yalnızca #text(weight: "semibold")[`1` ve `0`] dizilimleriyle uğraşmak yerine, daha anlaşılır ve hatırlanması kolay komutlarla program yazabilir hâle geldi.
#grid(
  columns: (auto, auto),
  gutter: 10pt,
  align: top,
  [
    #icerik-tablo(
  sutunlar: (auto,auto,auto),
  tablo_baslik: [Hexadecimal Yerine Assembly Kullanımı Örneği],
  sutun_basliklari: ([Hex], [Assembly], [Açıklama]),
  hucre_bosluk: (x:7pt, y:6pt),
  boyut: 9pt,
  icerik_hizalama: (center+horizon, center+horizon, left+horizon),
  sutun_baslik_hizalama:  (center+horizon, center+horizon, center+horizon, center+horizon),
  [`B0 61`], [`MOV AL, 61H`], [AL yazmacına *`61H`* verisi taşındı.],
  [`04 05`], [`ADD AL, 05H`], [AL yazmacındaki değere *`05H`* eklendi.],
  [`2C 02`], [`SUB AL, 02H`], [AL yazmacındaki değerden *`02H`* çıkarıldı.],
  )
  Bu sembolik komutlarla yazılan programlar, #text(weight: "bold")[Assembler (Çevirici)] adı verilen bir program aracılığıyla işlemcinin anlayabileceği makine koduna dönüştürüldü.
  ],
  [
    #align(center)[
#text(size: 9pt, weight: "bold")[x86 Assembly: İki Sayıyı Toplama Örneği]
#text(size:9pt)[
```x86asm
section .text
global _start

_start:
    mov eax, 5    ; ilk sayı
    mov ebx, 7    ; ikinci sayı
    add eax, ebx  ; eax = eax + ebx  (5 + 7 = 12)

    mov ebx, eax  ; sonucu ebx'e al
    mov eax, 1    ; sys_exit sistem çağrısı numarası
    int 0x80      ; çekirdeği çağır
```
]
]     
  ]
)

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

#icerik-tablo(
  sutunlar: (1fr, 0.65fr, 0.7fr, 2fr, 2fr),
  tablo_baslik: [Programlama Dillerinin Evrimi: Makine Dilinden Yüksek Seviyeli Dillere],
  sutun_basliklari: ([Evrim Aşaması], [Temsil\ Biçimi], [Örnek Kod], [Temel Avantajı], [Temel Zorluğu],),
  boyut: 8pt,
  sutun_baslik_bosluk: (x: 6pt, y: 4pt),
  hucre_bosluk: (x:4pt, y:5pt),
  icerik_hizalama: (center+horizon, center+horizon, center+horizon, left+horizon, left+horizon),
  sutun_baslik_hizalama:  (center+horizon),
 // 1. Satır
      text(weight: "semibold")[1.Makine Dili\ (Binary)],
      [`0` ve `1`],
      text(weight: "semibold")[`1011 0000`\ `0110 0001`],
      text()[İşlemci hiçbir çeviriye ihtiyaç duymadan doğrudan çalıştırır.],
      text()[İnsan tarafından okunması ve yazılması çok zordur.],

      // 2. Satır
      text(weight: "semibold")[2.Hexadecimal\ (16'lık Sistem)],
      [`0-9` ve `A-F`],
      text(weight: "semibold")[`B0 61`],
      text()[Uzun 0 ve 1 dizilerini 4'lü gruplar halinde kısaltarak yazım kolaylığı sağlar.],
      text()[Komutların sayısal karşılıklarını akılda tutmak gerekiyordu.],

      // 3. Satır
      text(weight: "semibold")[3.Assembly Dili\ (Sembolik Dil)],
      [Mnemonics],
      text(weight: "semibold")[`MOV AL, 61h`],
      text()[Komutlar (`MOV`, `ADD`, `SUB`) anlamlı kelimelerle ifade edilir.],
      text()[Her işlemci mimarisi için farklıdır; büyük projelerde kod çok uzar.],

      // 4. Satır
      text(weight: "semibold")[4.Yüksek\ Seviyeli Diller],
      [Günlük Dil],
      text(weight: "semibold")[`int a = 97;`],
      text()[Öğrenmesi kolaydır, donanımdan bağımsızdır ve hızlı yazılım geliştirmeyi sağlar.],
      text()[İşlemcide çalışabilmesi için derleyici veya yorumlayıcı ile çevrilmesi gerekir.],
  )

#kod-cikti(baslik: [Örnek Python Kodu])[
  ```Python
puan = int(input("Puan Giriniz: "))
print("Puanı:", puan)
puan = puan + 25
print("Güncellenmiş Puan:", puan)
```
][
```
Puan Giriniz: 50
Puanı: 50
Güncellenmiş Puan: 75
```
]

// #align(center)[  
// #image("images/sayfa_alt_bosluklar/07_programlama_dilleri.jpg",width: 100%)
// ]

// TODO: Burada ki boşluk için daha uygun bir resim koy

// #pagebreak()
