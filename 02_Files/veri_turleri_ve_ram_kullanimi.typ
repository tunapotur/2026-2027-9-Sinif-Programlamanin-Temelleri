#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/ram-goster.typ": *
#import "/lib/icerik-tablo.typ": *

// #show: conf

#let ram-goster-spacing = 0.5em

== Veri Türleri ve RAM Kullanımı
Bilgisayar programları verileri RAM (bellek) üzerinde saklar. RAM’i, üst üste dizilmiş çok sayıda küçük kutu gibi düşünebiliriz. Her kutunun boyutu 1 bayt’tır (1 bayt = 8 bit; bit yalnızca 0 ya da 1 tutabilir).
- Bu veri *ne tür* bir veri? (sayı mı, karakter mi, doğru/yanlış mı?)
- Bu yüzden RAM’de *kaç kutu (bayt)* ayrılmalı ve bu veriyle *hangi işlemler* yapılabilir?

#not_block(title: "")[Temel veri türleri konusunu anlatmak için C++ dili ve 16-bit sistemler (Arduino Uno, Turbo C) esas alınmıştır. Bu tercih, veri türlerinin donanımsal mantığının rahat anlaşılması amacıyla yapılmıştır. Derslerimizde ise Python programlama dili kullanılacak olup, Python'da veri türleri ve bellek yapısı farklı şekilde işlemektedir.
]

=== Boolean (bool): doğru / yanlış
#align(center)[
  #block(breakable: false, above: 4pt, below: 4pt)[
    #grid(
      columns: (auto, auto),
      gutter: 10pt,
      align: (horizon + left, horizon + left),
      [
        - RAM’de en az yer kaplayan veri türüdür: *1 bayt*.
        - Yalnızca iki değer alabilir: *true* (doğru, 1) veya *false* (yanlış, 0).
        - Karar verme (if, while) işlemlerinde kullanılır.
      ],
      [
        #kod-blok[```cpp
        bool kapiAcik = true;
        bool sinavGecti = false;
        bool girisYapti = true;
        ```]
      ]
    )
  ]
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

#not_block(title: "",boyut: 10pt)[RAM’e ulaşım bayt bayt yapıldığı için bilgisayar boolean veriler için de 1 tam bayt ayırır.
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
char harf = 'A';            // Karakter
char rakamKarakteri = '5';  // bu bir sayı değil, karakterdir
char cinsiyet = 'E';        // 'E' (Erkek) veya 'K' (Kadın) gibi tek harfli kısaltmalar
char paraBirimi = '$';      // Özel semboller ve işaretler
char islemTuru = '+';       // Matematiksel operatör sembolleri
char cevapSikki = 'C';      // Çoktan seçmeli testlerde işaretlenen şık
  ```
]

#block(breakable: false, spacing: ram-goster-spacing)[
  #grid(
    columns: (auto, auto),
    gutter: 5pt,
    align: (horizon),
ram-goster(
  "char",
  "char harf = 'A';",
  "01000001",
  aciklama: "'A' karakterinin ASCII kodu 65'tir.",
),
ram-goster(
  "char",
  "char karakter = '5';",
  "00110101",
  aciklama: "'5' karakterinin ASCII kodu 53'tür Bellekte 1 byte kaplar.",
)
  )
]

=== Tam Sayı (int)
#block(breakable: false)[
  #grid(
    columns: (25em, auto),
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
int toplam = a + b  // toplam = 9
int sonuc = a / b;  // sonuc = 3 (3.5 değil!)
int kalan = a % b;  // kalan = 1
  ```
]
      ]
  )
]

#[
#set block(spacing: ram-goster-spacing)
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
]


=== Ondalıklı Sayı (float)
#block(breakable: false)[
  #grid(
    columns: (25em, auto),
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
float sonuc = a / b;      // => 3.5
float pi = 3.14;
float alan = pi * b * b;  // => 12.56
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
  float her işlemde kullanılabilir; ancak hem daha fazla RAM kaplar hem de işlemciyi daha çok yorar. Bu yüzden *gerekmedikçe* *int* yerine *float* kullanılmamalıdır. Küsurat gerekiyorsa (ortalama, not, fiiyat, sıcaklık gibi) float tercih edilir.
]

== Bellek Yönetimi, RAM ve İşlemcinin İlişkisi
Bellek yönetimi, verilerin RAM'de gereksiz yer kaplamasını önlemek için her veriye yalnızca ihtiyacı kadar alan ayrılmasıdır. Veri türleri, bu alan planlamasını yaparak etkin bir bellek yönetimi sağlar. İşlemci, RAM'den aldığı veriyi işleyip tekrar RAM'e yazan bir donanım birimi olduğu için bu yönetim sistem performansını doğrudan belirler. İhtiyaçtan büyük seçilen her veri türü, RAM ile işlemci arasındaki veri yollarında gereksiz bilgi trafiği yaratır ve işlem süresini uzatır. Doğru bellek yönetimi ise taşınan veri boyutunu küçülterek işlemcinin veriyi çok daha hızlı okuyup işlemesini sağlar. #text(weight: "semibold")[Özetle; doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır.]

#image("/02_Files/images/ChatGpt Bellek Yönetimi ve CPU Performansı.png")

#image("/02_Files/images/Gemini_Bellek Yönetimi ve CPU Performansı.jpg")

// =============================================================================
// --- [YENİ TASARIM] 10. BELLEK YÖNETİMİ, RAM VE İŞLEMCİNİN İLİŞKİSİ ---
// (Mevcut bölüm ile karşılaştırabilmeniz için hemen altına eklenmiştir.
// Karşılaştırma bittikten sonra yukarıdaki eski bölümü ve resimleri kaldırıp,
// aşağıdaki başlığın sonundaki "(Önerilen Yeni Tasarım)" ekini silebilirsiniz.)
// =============================================================================

#v(1.5em)
#line(length: 100%, stroke: 1.5pt + rgb("#cbd5e1"))
#align(center)[#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[--- AŞAĞIDAKİ BÖLÜM YENİDEN DÜZENLENEN ÖNERİLEN TASARIMDIR ---]]
#v(0.5em)

== Bellek Yönetimi, RAM ve İşlemcinin İlişkisi (Önerilen Yeni Tasarım)

Program yazmaya başlarken aklımıza şu soru gelebilir: _"Bilgisayarımızda gigabaytlarca (GB) RAM varken, bir değişkenin bellekte 1 bayt mı yoksa 4 bayt mı yer kapladığını neden dert edelim? Her şeyi en geniş veri türüyle tanımlasak ne fark eder?"_

Bu sorunun cevabı, bilgisayar donanımının çalışma biçiminde gizlidir. Bilgisayar yalnızca verilerin saklandığı pasif bir depo değildir; verileri sürekli taşıyan ve işleyen dinamik bir fabrikadır. Tanımladığımız her değişken üzerinde işlem yapılacağı zaman *RAM (Ana Bellek)*, *Veri Yolu (Data Bus)* ve *İşlemci (CPU)* arasında yoğun bir bilgi trafiği başlar.

#not_block(title: "Altın Kural:", width: 100%)[
  Doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır!
]

=== 1. Donanım Üçlüsü: RAM, Veri Yolu ve İşlemci

Bilgisayarda bir hesaplama yapılırken üç temel donanım birimi birlikte çalışır:
- *RAM (Ana Bellek):* Verilerin ve değişkenlerin elektrik kesilene kadar geçici olarak saklandığı alandır. RAM tek başına hesaplama yapamaz; yalnızca değerleri muhafaza eder.
- *Veri Yolu (Data Bus):* RAM ile işlemciyi birbirine bağlayan fiziksel iletken hatlardır (dijital bilgi otoyolu). Veriler bitler ve baytlar halinde bu hatlardan akar.
- *İşlemci (CPU):* Bilgisayarın beynidir. İçindeki *Aritmetik ve Mantık Birimi (ALU)* ile hesaplamaları yapar. Ancak işlemcinin içinde büyük miktarda veriyi saklayacak alan (yazmaçlar dışında) yoktur; bu yüzden her veriyi RAM'den çağırmak zorundadır.

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 6pt,
  inset: 10pt,
  breakable: false,
)[
  #align(center)[#text(weight: "bold", size: 10pt, fill: rgb("#16325c"))[Donanım Mimarisi: RAM, Veri Yolu ve İşlemci Arasındaki Veri Akışı]]
  #v(6pt)
  #grid(
    columns: (1.3fr, 1.4fr, 1.3fr),
    gutter: 8pt,
    align: horizon,
    // SOL: RAM KUTUSU
    block(
      width: 100%,
      fill: white,
      stroke: 1pt + rgb("#15803d"),
      radius: 4pt,
      clip: true,
      inset: 0pt,
    )[
      #block(width: 100%, fill: rgb("#15803d"), inset: (y: 5pt), align(center, text(fill: white, weight: "bold", size: 9pt)[RAM (Ana Bellek)]))
      #pad(6pt)[
        #set text(size: 7.8pt)
        #rect(width: 100%, fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 3pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1000:], [*a = 7* (2 Bayt)])
        ]
        #v(3pt)
        #rect(width: 100%, fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 3pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1002:], [*b = 2* (2 Bayt)])
        ]
        #v(3pt)
        #rect(width: 100%, fill: rgb("#ecfdf5"), stroke: 0.5pt + rgb("#a7f3d0"), radius: 2pt, inset: 3pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1004:], [*sonuc = 9* (2 Bayt)])
        ]
        #v(3pt)
        #align(center, text(size: 6.8pt, fill: luma(120))[Verilerin Saklandığı Adresler])
      ]
    ],
    // ORTA: VERİ YOLU
    block(
      width: 100%,
      fill: rgb("#f1f5f9"),
      stroke: 1pt + rgb("#94a3b8"),
      radius: 4pt,
      inset: 6pt,
    )[
      #align(center)[
        #text(weight: "bold", size: 8.2pt, fill: rgb("#334155"))[VERİ YOLU (Data Bus)] \
        #text(size: 6.8pt, fill: luma(100))[Bilgi İletim Otoyolu]
      ]
      #v(5pt)
      #block(
        width: 100%,
        fill: rgb("#dbeafe"),
        stroke: 0.8pt + rgb("#3b82f6"),
        radius: 3pt,
        inset: 4pt,
      )[
        #align(center)[
          #text(size: 7.4pt, weight: "bold", fill: rgb("#1d4ed8"))[1. Oku: Değerleri Al ⟶] \
          #text(size: 6.5pt, fill: rgb("#1e40af"))[a ve b İşlemciye Taşınır]
        ]
      ]
      #v(5pt)
      #block(
        width: 100%,
        fill: rgb("#dcfce7"),
        stroke: 0.8pt + rgb("#22c55e"),
        radius: 3pt,
        inset: 4pt,
      )[
        #align(center)[
          #text(size: 7.4pt, weight: "bold", fill: rgb("#15803d"))[⟵ 3. Yaz: Sonucu Kaydet] \
          #text(size: 6.5pt, fill: rgb("#166534"))[sonuc RAM'e Geri Yazılır]
        ]
      ]
    ],
    // SAĞ: İŞLEMCİ KUTUSU
    block(
      width: 100%,
      fill: white,
      stroke: 1pt + rgb("#1e3a8a"),
      radius: 4pt,
      clip: true,
      inset: 0pt,
    )[
      #block(width: 100%, fill: rgb("#1e3a8a"), inset: (y: 5pt), align(center, text(fill: white, weight: "bold", size: 9pt)[İŞLEMCİ (CPU)]))
      #pad(6pt)[
        #set text(size: 7.8pt)
        #block(
          width: 100%,
          fill: rgb("#eff6ff"),
          stroke: 0.5pt + rgb("#93c5fd"),
          radius: 2pt,
          inset: 4pt,
        )[
          #align(center)[
            #text(weight: "bold", size: 7.8pt, fill: rgb("#1e40af"))[ALU (Aritmetik Birim)] \
            #v(2pt)
            #text(size: 8pt, weight: "bold", fill: rgb("#dc2626"))[2. İşle: 7 + 2 = 9]
          ]
        ]
        #v(4pt)
        #block(
          width: 100%,
          fill: rgb("#f8fafc"),
          stroke: 0.5pt + rgb("#cbd5e1"),
          radius: 2pt,
          inset: 3pt,
        )[
          #align(center, text(size: 6.8pt, fill: luma(100))[Yazmaçlar (Hızlı Kayıtçılar)])
        ]
        #v(2pt)
        #align(center, text(size: 6.8pt, fill: luma(120))[Hesaplamanın Yapıldığı Beyin])
      ]
    ]
  )
]

=== 2. Bir İşlemin Yaşam Döngüsü: Oku ⟶ İşle ⟶ Yaz

Programda `sonuc = a + b;` gibi basit bir satır çalıştırıldığında donanım arka planda şu üç adımı sırayla yürütür:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 7pt,
  block(
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#bfdbfe"),
    radius: 4pt,
    inset: 8pt,
    // height: 100%,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#1d4ed8"))[1 Oku (Fetch / Read)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemci RAM'deki veriyi doğrudan işleyemez. Toplama yapabilmek için *a* ve *b* değişkenlerinin değerlerini RAM adreslerinden *Veri Yolu* üzerinden kendi içine çeker.
    ]
  ],
  block(
    fill: rgb("#faf5ff"),
    stroke: 1pt + rgb("#e9d5ff"),
    radius: 4pt,
    inset: 8pt,
    // height: 100%,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#7e22ce"))[2 İşle (Execute / Process)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemcinin *Aritmetik ve Mantık Birimi (ALU)*, gelen ikilik sayıları toplar ($7 + 2 = 9$). Sayının türü ne kadar karmaşıksa işlemcinin bu adımı tamamlaması o kadar uzun sürer.
    ]
  ],
  block(
    fill: rgb("#f0fdf4"),
    stroke: 1pt + rgb("#bbf7d0"),
    radius: 4pt,
    inset: 8pt,
    // height: 100%,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#15803d"))[3 Yaz (Store / Write)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemci sonucu bulduktan sonra bunu kendi içinde saklamaz. Elde edilen *9* değerini tekrar veri yolu üzerinden RAM'e gönderir ve *sonuc* değişkeninin adresine kaydeder.
    ]
  ]
)

=== 3. Gündelik Hayat Benzetmesi: Kurye Çantası mı, Nakliye Tırı mı?

Veri türü seçiminin neden bu kadar kritik olduğunu kavramak için kargo ve taşımacılık örneğini düşünelim:

#block(
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 6pt,
  inset: 9pt,
  breakable: false,
)[
  #text(weight: "bold", size: 9.5pt, fill: rgb("#1e293b"))[📦 Kargo Taşıma ve Trafik Benzetmesi]
  #v(4pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    block(
      fill: rgb("#eff6ff"),
      stroke: (left: 3pt + rgb("#2563eb")),
      radius: (right: 4pt),
      inset: 8pt,
    )[
      #text(weight: "bold", size: 9pt, fill: rgb("#1d4ed8"))[Doğru Veri Türü (`int`): Kurye Çantası] \
      #v(3pt)
      #text(size: 8.2pt)[
        Bir kalemi taşımak için *küçük bir kurye çantası* kullanmak gibidir:
        - *RAM:* Depoda neredeyse hiç yer tutmaz, diğer kutulara geniş alan kalır.
        - *Veri Yolu:* Kurye hafif olduğu için trafikte sıkışıklık yaratmaz, anında geçer.
        - *İşlemci:* Çantayı açıp kalemi çıkarmak (işlemek) tek bir saniyede biter.
      ]
    ],
    block(
      fill: rgb("#fff7ed"),
      stroke: (left: 3pt + rgb("#ea580c")),
      radius: (right: 4pt),
      inset: 8pt,
    )[
      #text(weight: "bold", size: 9pt, fill: rgb("#c2410c"))[Gereksiz Büyük Tür (`float`): Nakliye Tırı] \
      #v(3pt)
      #text(size: 8.2pt)[
        Aynı tek kalemi taşımak için *dev bir nakliye tırı* kiralamak gibidir:
        - *RAM:* Kocaman bir depoyu tek bir kalem için gereksizce işgal eder.
        - *Veri Yolu:* Dar caddelerde yolu tıkar; diğer verilerin geçişini geciktirir.
        - *İşlemci:* Koskoca tırı park edip rampayı açmak işlemciyi boş yere oyalar.
      ]
    ]
  )
]

=== 4. Somut Örnek ve Kanıt: Aynı İşlem, İki Farklı Veri Türü!

Aşağıda iki farklı programcının yazdığı kodu inceleyelim. İki program da aynı iki tam sayıyı ($7$ ve $2$) toplayıp $9$ sonucunu bulmaktadır:

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  // SOL KART: INT
  block(
    fill: white,
    stroke: 1pt + rgb("#93c5fd"),
    radius: 6pt,
    clip: true,
    inset: 0pt,
    breakable: false,
  )[
    #block(
      width: 100%,
      fill: rgb("#dbeafe"),
      inset: (x: 8pt, y: 5pt),
      grid(
        columns: (1fr, auto),
        text(weight: "bold", size: 9.5pt, fill: rgb("#1e40af"))[Doğru Seçim: int (2 Bayt)],
        text(size: 8pt, weight: "bold", fill: rgb("#15803d"))[✓ Verimli],
      )
    )
    #pad(8pt)[
      #kod-blok(width: 100%, satir-no: false)[```cpp
int a = 7;
int b = 2;
int sonuc = a + b;
```]
      #v(4pt)
      #set text(size: 8.2pt)
      - *RAM Tüketimi:* 3 değişken $times$ 2 Bayt = *Toplam 6 Bayt*.
      - *Veri Yolu Trafiği:* 4 bayt okunur (a, b) + 2 bayt yazılır (sonuc) = *6 Bayt taşınır*.
      - *İşlemci Eforu:* Tam sayı toplama işlemi ALU biriminin ana işidir. Donanımsal olarak *1 saat vuruşunda (çevrim)* hesaplanır.
      #v(4pt)
      #block(fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 3pt, inset: 5pt)[
        #text(weight: "bold", size: 8pt, fill: rgb("#166534"))[Sonuç:] Az bellek, açık veri yolu, maksimum işlemci hızı!
      ]
    ]
  ],
  // SAĞ KART: FLOAT
  block(
    fill: white,
    stroke: 1pt + rgb("#fed7aa"),
    radius: 6pt,
    clip: true,
    inset: 0pt,
    breakable: false,
  )[
    #block(
      width: 100%,
      fill: rgb("#ffedd5"),
      inset: (x: 8pt, y: 5pt),
      grid(
        columns: (1fr, auto),
        text(weight: "bold", size: 9.5pt, fill: rgb("#9a3412"))[Gereksiz Seçim: float (4 Bayt)],
        text(size: 8pt, weight: "bold", fill: rgb("#b91c1c"))[✗ İsraf ve Yavaşlık],
      )
    )
    #pad(8pt)[
      #kod-blok(width: 100%, satir-no: false)[```cpp
float a = 7;
float b = 2;
float sonuc = a + b;
```]
      #v(4pt)
      #set text(size: 8.2pt)
      - *RAM Tüketimi:* 3 değişken $times$ 4 Bayt = *Toplam 12 Bayt* (Tam 2 katı!).
      - *Veri Yolu Trafiği:* 8 bayt okunur + 4 bayt yazılır = *12 Bayt taşınır* (2 kat trafik!).
      - *İşlemci Eforu:* Ondalıklı sayılar IEEE 754 standardında (işaret, üs, mantissa) saklanır. İşlemci üsleri hizalamak ve basamak kaydırmak için *onlarca çevrim* harcar.
      #v(4pt)
      #block(fill: rgb("#fef2f2"), stroke: 0.5pt + rgb("#fca5a5"), radius: 3pt, inset: 5pt)[
        #text(weight: "bold", size: 8pt, fill: rgb("#991b1b"))[Sonuç:] RAM israfı, veri yolu tıkanıklığı, geciken işlem!
      ]
    ]
  ]
)

=== 5. Karşılaştırma ve Donanım Etkisi

#icerik-tablo(
  tablo_baslik: [Aynı Toplama İşleminde "int" ve "float" Türlerinin Donanım Etkisi],
  sutunlar: (1.3fr, 1fr, 1.1fr, 1.6fr),
  sutun_basliklari: ([İncelenen Kriter], [`int` (Doğru Tercih)], [`float` (Gereksiz Tercih)], [Sisteme ve Performansa Etkisi]),
  hucre_bosluk: (x: 6pt, y: 5pt),
  boyut: 8.3pt,
  icerik_hizalama: (left + horizon, center + horizon, center + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon, center + horizon),
  [*RAM Alanı*], [6 Bayt], [12 Bayt], [*%50 Bellek Tasarrufu:* RAM'de diğer programlara ve değişkenlere daha fazla yer kalır.],
  [*Veri Yolu Trafiği*], [6 Bayt taşınır], [12 Bayt taşınır], [*2 Kat Daha Az Trafik:* Veri yollarındaki yoğunluk ve bekleme süresi yarıya iner.],
  [*İşlemci Eforu*], [1 Saat Çevrimi (Tek Adım)], [Onlarca Çevrim (Çok Adım)], [*İşlemci Yorulmaz:* Karmaşık ondalık algoritmaları işletilmez.],
  [*Donanım Uyumu*], [Tüm İşlemcilerde Doğal Hız], [FPU Yoksa Çok Yavaş], [Arduino gibi gömülü sistemlerde hız farkı yüzlerce kata çıkabilir.],
)

=== 6. Neden-Sonuç Zinciri: Veri Türü Sistemi Nasıl Etkiler?

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#e2e8f0"),
  radius: 6pt,
  inset: 8pt,
  breakable: false,
)[
  #let kutu(metin, renk) = block(
    width: 100%,
    fill: renk.lighten(88%),
    stroke: 1pt + renk,
    radius: 4pt,
    inset: (x: 4pt, y: 5pt),
    align(center + horizon, text(size: 7.5pt, weight: "bold", fill: renk.darken(30%), metin))
  )
  #let ok = align(center + horizon, text(size: 11pt, weight: "bold", fill: luma(130))[▶])

  #text(weight: "bold", size: 8.8pt, fill: rgb("#991b1b"))[✗ Hatalı ve Gereksiz Büyük Tür Seçildiğinde:]
  #v(3pt)
  #grid(
    columns: (1fr, 10pt, 1fr, 10pt, 1fr, 10pt, 1fr),
    align: horizon,
    kutu([Büyük Veri Türü \ (Gereksiz float)], rgb("#ea580c")), ok,
    kutu([RAM'de Fazla Alan \ (Bellek İsrafı)], rgb("#ea580c")), ok,
    kutu([Veri Yolunda Trafik \ (Daha Çok Bayt)], rgb("#dc2626")), ok,
    kutu([İşlemci Meşgul \ (Sistem Yavaşlar)], rgb("#dc2626")),
  )

  #v(8pt)
  #text(weight: "bold", size: 8.8pt, fill: rgb("#166534"))[✓ Doğru ve İhtiyaç Kadar Tür Seçildiğinde:]
  #v(3pt)
  #grid(
    columns: (1fr, 10pt, 1fr, 10pt, 1fr, 10pt, 1fr),
    align: horizon,
    kutu([Doğru Veri Türü \ (İhtiyaç Kadar int)], rgb("#2563eb")), ok,
    kutu([RAM'de Tasarruf \ (Hafif Bellek)], rgb("#2563eb")), ok,
    kutu([Veri Yolunda Hızlı Akış \ (Az Bayt Trafiği)], rgb("#16a34a")), ok,
    kutu([İşlemci Anında Bitirir \ (Maksimum Hız)], rgb("#16a34a")),
  )
]

#v(4pt)

#not_block(title: "Özet ve Altın Kural", boyut: 10pt, width: 100%)[
  *Doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır.*

  İyi bir programcı, yazdığı kodun yalnızca ekranda doğru sonuç vermesini değil; arka planda bilgisayar donanımını en verimli şekilde kullanmasını da sağlar. İhtiyaçtan büyük seçilen her veri türü, RAM ile işlemci arasındaki veri yollarında gereksiz bilgi trafiği yaratır ve işlem süresini uzatır. Doğru bellek yönetimi ise taşınan veri boyutunu küçülterek işlemcinin veriyi çok daha hızlı okuyup işlemesini sağlar.
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 7pt,
  block(
    fill: rgb("#f0fdf4"),
    stroke: 1pt + rgb("#86efac"),
    radius: 4pt,
    inset: 7pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#166534"))[1. İhtiyaç Kadar Boyut] \
    #v(2pt)
    #text(size: 7.8pt)[Küsurat içermeyen (yaş, sayaç, adet, döngü vb.) hiçbir değer için `float` kullanmayın. Tam sayıları tercih edin.]
  ],
  block(
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#93c5fd"),
    radius: 4pt,
    inset: 7pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1e40af"))[2. Değer Aralığı Analizi] \
    #v(2pt)
    #text(size: 7.8pt)[Verinin alabileceği en küçük ve en büyük sayıyı öngörün. Sadece 0-100 arası notlar için devasa türler seçmeyin.]
  ],
  block(
    fill: rgb("#fefce8"),
    stroke: 1pt + rgb("#fde047"),
    radius: 4pt,
    inset: 7pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#854d0e"))[3. Donanım Bilinci] \
    #v(2pt)
    #text(size: 7.8pt)[RAM tasarrufu sadece alan kazanmak değildir; işlemcinin hızını doğrudan artıran en kritik donanım kuralıdır.]
  ]
)

== Karakterden Metne (Karakter Dizisi)
Tek bir *char* verisi bellekte yalnızca *1 Bayt* yer kaplar ve tek başına sadece bir karakteri tutabilir. Birden fazla karakterden oluşan bir kelimeyi veya metni bellekte saklamak istediğimizde ise tekil karakterler yan yana getirilerek bir *karakter dizisi* oluşturulur. Programlamada aynı türdeki verilerin bellekte peş peşe sıralanarak tek bir grup halinde tutulmasına *dizi (array)* adı verilir. Metinler de aslında karakterlerin yan yana dizildiği birer dizidir; bu nedenle aşağıdaki yapı ile her bir harf için RAM üzerinde art arda gelen (bitişik) 1 baytlık çekmeceler tahsis edilir.

#align(center)[
#text(size: 12pt, weight: "semibold")[
  #not_block(title: "", width: auto)[
      Toplam Bellek Alanı = Karakter Sayısı x 1 Byte
  ]
]
]

#align(center)[*BATUHAN* Metni RAM üzerinde nasıl saklanır?]
#ram-goster(
  "char",
  "char isim[7] = {'B', 'A', 'T', 'U', 'H', 'A', 'N'};",
  "01000010 01000001 01010100 01010101 01001000 01000001 01001110",
  aciklama: "Her bir harf ASCII karşılığı ile bellekte 1 byte yer kaplar (B:66, A:65, T:84, U:85, H:72, A:65, N:78). Toplam 7 karakter = 7 byte.",
)

#align(center)[*ADA LOVELACE* Metni RAM üzerinde nasıl saklanır?]
#ram-goster(
  "char",
  "char isim[12] = {'A', 'D', 'A', ' ', 'L', 'O', 'V', 'E', 'L', 'A', 'C', 'E'};",
  "01000001 01000100 01000001 00100000 01001100 01001111 01010110 01000101 01001100 01000001 01000011 01000101",
  aciklama: "Her bir karakter ASCII karşılığı ile bellekte 1 byte yer kaplar (A:65, D:68, A:65, Boşluk:32, L:76, O:79, V:86, E:69, L:76, A:65, C:67, E:69). Toplam 12 karakter = 12 byte.",
)