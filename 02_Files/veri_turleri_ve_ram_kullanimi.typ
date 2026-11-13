#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/ram-goster.typ": *

#show: conf

== Veri Türleri ve RAM Kullanımı
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
  bool girisYapti = true;
  ```
]

    ]
  
  )
]

#block(breakable: false)[
  #grid(
    columns: (auto, auto),
    gutter: 5pt,
    align: (horizon),
    [
      #ram-goster(
  "bool",
  "bool kapiAcik = true;",
  "00000001",
  aciklama: "true değeri 1, olarak saklanır.",
)
    ],
    [
      #ram-goster(
  "bool",
  "bool sinavGecti = false;",
  "00000000",
  aciklama: "false değeri 0 olarak saklanır.",
)
    ]
  )
]

#not_block(title: "")[Aslında doğru/yanlış bilgisi tek bir bit ile saklanabilir; ancak RAM’e ulaşım bayt bayt yapıldığı için bilgisayar bool için de 1 tam bayt ayırır.
]

=== Karakter (char)
- RAM’de 1 bayt yer kaplar.
- Tek bir karakter tutar: harf, rakam karakteri, noktalama işareti. 
- Tek tırnak içinde yazılır: 'A'.
- Bilgisayar karakterleri ASCII tablosundaki sayı karşılığı ile saklar (örneğin 'A' karakteri 65). 
- 1 bayt (`8bit` $=2^16=256$), ASCII tablosundaki 256 karakter için yeterlidir.
- Karakterler metin için kullanılır, matematiksel işlemlere girmez. '5' karakteri ile 5 sayısı aynı şey değildir.

#kod-blok(width: 100%)[
  ```cpp
char harf = 'A';
char rakamKarakteri = '5'; // bu bir sayı değil, karakterdir
char cinsiyet = 'E'; // 'E' (Erkek) veya 'K' (Kadın) gibi tek harfli kısaltmalar
char paraBirimi = '$'; // Özel semboller ve işaretler
char islemTuru = '+'; // Matematiksel operatör sembolleri
char cevapSikki = 'C'; // Çoktan seçmeli testlerde işaretlenen şık
  ```
]

#block(breakable: false)[
  #grid(
    columns: (auto, auto),
    gutter: 5pt,
    align: (horizon),
    [
      #ram-goster(
  "char",
  "char harf = 'A';",
  "01000001",
  aciklama: "'A' karakterinin ASCII kodu 65'tir.",
)
      ],
    [
      #ram-goster(
  "char",
  "char karakter = '5';",
  "00110101",
  aciklama: "'5' karakterinin ASCII kodu 53'tür Bellekte 1 byte kaplar.",
)
      ]
  )
]

#pagebreak()
=== Tam Sayı (int)
#block(breakable: false)[
  #grid(
    columns: (23em, auto),
    gutter: 5pt,
    align: (horizon),
    [
- RAM’de *2 bayt* (16 bit) yer kaplar.
- $16$ bit ile $2^16=65536$ farklı değer saklanabilir.
- Yalnızca tam sayıları tutar.
- Toplama, çıkarma, çarpma, bölme ve mod(kalan) işlemlerinde kullanılır.
      ],
    [
#kod-blok(width: 100%)[
    ```cpp
int a = 7;
int b = 2;
int toplam = a + b // toplam = 9
int sonuc = a / b; // sonuc = 3 (3.5 değil!)
int kalan = a % b; // kalan = 1
  ```
]
      ]
  )
]

#ram-goster(
  "int",
  "int puan = 50;",
  "00000000 00110010",
  aciklama: "50 = 32 + 16 + 2 olduğu için son byte 00110010 olur. İlk byte'ın tamamı 0'dır.",
)

#ram-goster(
  "int",
  "int sayi = 12377;",
  "00110000 01011001",
  aciklama: "12377 = 8192 + 4096 + 64 + 16 + 8 + 1 olduğu için ilk byte 00110000 (12288), son byte ise 01011001 (89) olur.",
)


=== Ondalıklı Sayı (float)
#block(breakable: false)[
  #grid(
    columns: (auto, 22em),
    gutter: 10pt,
    align: (horizon),
    [
- RAM’de *4 bayt* yer kaplar; *int*’ten 2 kat fazla alan.
- Virgüllü sayıları tutar. Kodda nokta ile yazılır: $3.14$.
- Tam sayı ve küsurat kısımlarını ayrı işler.
- Küsuratlı ve geniş aralıklı sayılarda kullanılır.
- Tüm matematiksel işlemlerde kullanılabilir.
      ],
    [
      #kod-blok(width: 100%)[
  ```cpp
float a = 7;
float b = 2;
float sonuc = a / b; // => 3.5
float pi = 3.14;
float alan = pi * b * b; // => 12.56
  ```
]

      ]
  )
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

== Bellek Yönetimi, RAM ve İşlemcinin İlişkisi
Bellek yönetimi, verilerin RAM'de gereksiz yer kaplamasını önlemek için her veriye yalnızca ihtiyacı kadar alan ayrılmasıdır. Veri türleri, bu alan planlamasını yaparak etkin bir bellek yönetimi sağlar. İşlemci, RAM'den aldığı veriyi işleyip tekrar RAM'e yazan bir donanım birimi olduğu için bu yönetim sistem performansını doğrudan belirler. İhtiyaçtan büyük seçilen her veri türü, RAM ile işlemci arasındaki veri yollarında gereksiz bilgi trafiği yaratır ve işlem süresini uzatır. Doğru bellek yönetimi ise taşınan veri boyutunu küçülterek işlemcinin veriyi çok daha hızlı okuyup işlemesini sağlar. #text(weight: "semibold")[Özetle; doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır.]

#image("/02_Files/images/ChatGpt Bellek Yönetimi ve CPU Performansı.png")
#image("/02_Files/images/Gemini_Bellek Yönetimi ve CPU Performansı.jpg")

== Karakterden Metne (Karakter Dizisi)
Tek bir *char* verisi bellekte yalnızca *1 Bayt* yer kaplar ve tek başına sadece bir karakteri tutabilir. Birden fazla karakterden oluşan bir kelimeyi veya metni bellekte saklamak istediğimizde ise tekil karakterler yan yana getirilerek bir *karakter dizisi* oluşturulur. Programlamada aynı türdeki verilerin bellekte peş peşe sıralanarak tek bir grup halinde tutulmasına *dizi (array)* adı verilir. Metinler de aslında karakterlerin yan yana dizildiği birer dizidir; bu nedenle aşağıdaki yapı ile her bir harf için RAM üzerinde art arda gelen (bitişik) 1 baytlık çekmeceler tahsis edilir.

#text(size: 11pt, weight: "semibold")[
  #not_block(title: "", width: auto)[
      Toplam Bellek Alanı = Karakter Sayısı x 1 Byte
  ]
]

#align(center)[*KEMAL* Metni RAM üzerinde nasıl saklanır?]
#ram-goster(
  "char",
  "char isim[5] = {'K', 'E', 'M', 'A', 'L'};",
  "01001011 01000101 01001101 01000001 01001100",
  aciklama: "Her bir harf ASCII karşılığı ile bellekte 1 byte yer kaplar (K:75, E:69, M:77, A:65, L:76). Toplam 5 karakter = 5 byte.",
)

#align(center)[*Ada Lovelace* Metni RAM üzerinde nasıl saklanır?]
#ram-goster(
  "char",
  "char tam_isim[12] = {'A', 'd', 'a', ' ', 'L', 'o', 'v', 'e', 'l', 'a', 'c', 'e'};",
  "01000001 01100100 01100001 00100000 01001100 01101111 01110110 01100101 01101100 01100001 01100011 01100101",
  aciklama: "Boşluk karakteri (' ') de bellekte 1 byte yer kaplar (ASCII: 32). Toplam 12 karakter = 12 byte.",
)