#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *

// ============================================================
// YENİ YARDIMCI: Eşit yükseklikli grid
// (Bunu belgenin başına, diğer #let tanımlarının yanına taşıyabilirsin.)
//
// Kullanım: esit-grid(columns: (...), gutter: ..., h => block(height: h, ...), h => ...)
// Her hücre, yüksekliği parametre olarak alan bir fonksiyondur.
// Satırdaki en uzun hücre ölçülür ve tüm kutular o yüksekliğe getirilir.
// Sütunlar `fr` veya sabit uzunluk (pt) olabilir.
// ============================================================
#let esit-grid(columns: (1fr, 1fr), gutter: 8pt, ..hucreler) = layout(size => {
  let n = columns.len()
  let bosluk = gutter * (n - 1)
  let sabit = columns.map(c => if type(c) == length { c } else { 0pt }).sum()
  let fr-toplam = columns.map(c => if type(c) == fraction { c / 1fr } else { 0 }).sum()
  let genislikler = columns.map(c => if type(c) == length {
    c
  } else {
    (size.width - bosluk - sabit) * (c / 1fr) / fr-toplam
  })
  let fnler = hucreler.pos()
  let yukseklik = calc.max(..fnler.zip(genislikler).map(((f, w)) => measure(block(width: w, f(auto))).height))
  grid(columns: columns, gutter: gutter, ..fnler.map(f => f(yukseklik)))
})


// ============================================================
// ÖZET RESİM: Veri türü seçimi RAM, veri yolu ve işlemciyi nasıl etkiler?
// Belgenin sonuna (özet kutusundan sonra) yapıştırın. Ek paket gerekmez.
// ============================================================
#let ozet-bayt(renk, dolu: true) = rect(
  width: 7pt, height: 7pt, radius: 1pt,
  fill: if dolu { renk } else { rgb("#dcfce7") },
  stroke: if dolu { 0.5pt + renk.darken(25%) } else { 0.6pt + rgb("#86efac") },
)

#let ozet-paket(renk, boy, metin) = rect(
  width: boy.at(0), height: boy.at(1), radius: 2pt,
  fill: renk, stroke: 0.6pt + renk.darken(30%), inset: 0pt,
  align(center + horizon, text(size: 5.8pt, weight: "bold", fill: white, metin)),
)

#let ozet-seritli(renk, acik, baslik, alt, ram, yol, cpu) = block(
  width: 100%, fill: acik, stroke: 1pt + renk, radius: 6pt, inset: 8pt, breakable: false,
)[
  #grid(
    columns: (1.05fr, 1.2fr, 1.5fr, 1.2fr),
    gutter: 9pt,
    align: horizon,
    [
      #text(weight: "bold", size: 9.2pt, fill: renk.darken(35%))[#baslik] \
      #v(2pt)
      #text(size: 7.4pt, fill: luma(90))[#alt]
    ],
    ram, yol, cpu,
  )
]

#let ozet-yol(renk, paketler, etiket, etiket-renk) = block(width: 100%)[
  #block(width: 100%, height: 30pt)[
    #place(horizon + left, line(length: 100% - 8pt, stroke: 2.2pt + luma(170)))
    #place(horizon + right, text(size: 9pt, fill: luma(130))[▶])
    #align(horizon + center, stack(dir: ltr, spacing: paketler.at(0), ..paketler.slice(1)))
  ]
  #align(center, text(size: 7pt, weight: "bold", fill: etiket-renk)[#etiket])
]

#let ozet-olcer(renk, oran, ust, alt) = block(width: 100%)[
  #align(center, text(size: 7.4pt, weight: "bold", fill: renk.darken(25%))[#ust])
  #v(3pt)
  #block(width: 100%, radius: 3pt, clip: true, stroke: 0.6pt + luma(190))[
    #grid(
      columns: (oran, 1fr),
      rect(width: 100%, height: 8pt, fill: renk, stroke: none),
      rect(width: 100%, height: 8pt, fill: luma(232), stroke: none),
    )
  ]
  #v(2pt)
  #align(center, text(size: 6.8pt, fill: luma(100))[#alt])
]

#let ozet-ram(renk, dolu, bos, yazi) = block(width: 100%)[
  #align(center)[
    #grid(
      columns: (7pt,) * 6, gutter: 2pt,
      ..range(dolu).map(_ => ozet-bayt(renk)),
      ..range(bos).map(_ => ozet-bayt(rgb("#16a34a"), dolu: false)),
    )
  ]
  #v(3pt)
  #align(center, text(size: 7.2pt, weight: "bold", fill: renk.darken(25%))[#yazi])
]


== Bellek Yönetimi, RAM ve İşlemcinin İlişkisi

#align(center)[
#image("/02_Files/Unite_02_Degiskenler_ve_Bellek/images/bellek-yönetimi-ve-CPU-Performansi.jpg", width: 93%)
]

Program yazmaya başlarken aklımıza şu soru gelebilir: _"Bilgisayarımızda gigabaytlarca (GB) RAM varken, bir değişkenin bellekte 1 bayt mı yoksa 4 bayt mı yer kapladığını neden dert edelim? Her şeyi en geniş veri türüyle tanımlasak ne fark eder?"_\
Bu sorunun cevabı, bilgisayar donanımının çalışma biçiminde gizlidir. Bilgisayar yalnızca verilerin saklandığı pasif bir depo değildir; verileri sürekli taşıyan ve işleyen dinamik bir fabrikadır. Tanımladığımız her değişken üzerinde işlem yapılacağı zaman *RAM (Ana Bellek)*, *Veri Yolu (Data Bus)* ve *İşlemci (CPU)* arasında yoğun bir bilgi trafiği başlar.

#not_block(title: "Altın Kural:", width: 100%, boyut: 9.4pt)[
  Doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır!
]

=== Donanım Üçlüsü: RAM, Veri Yolu ve İşlemci

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
  #esit-grid(
    columns: (1.3fr, 1.4fr, 1.3fr),
    gutter: 8pt,
    // SOL: RAM KUTUSU
    h => block(
      width: 100%,
      height: h,
      fill: white,
      stroke: 1pt + rgb("#15803d"),
      radius: 4pt,
      clip: true,
      inset: 0pt,
    )[
      #block(width: 100%, fill: rgb("#15803d"), inset: (y: 5pt), below: 0pt, align(center, text(fill: white, weight: "bold", size: 9pt)[RAM (Ana Bellek)]))
      #pad(x: 6pt, top: 11pt, bottom: 6pt)[
        #set text(size: 7.8pt)
        #rect(width: 100%, fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 5pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1000:], [*a = 7* (2 Bayt)])
        ]
        #v(3pt)
        #rect(width: 100%, fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 5pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1002:], [*b = 2* (2 Bayt)])
        ]
        #v(3pt)
        #rect(width: 100%, fill: rgb("#ecfdf5"), stroke: 0.5pt + rgb("#a7f3d0"), radius: 2pt, inset: 5pt)[
          #grid(columns: (auto, 1fr), gutter: 4pt, [0x1004:], [*sonuc = 9* (2 Bayt)])
        ]
        #v(6pt)
        #v(1fr)
        #align(center, text(size: 6.8pt, fill: luma(120))[Verilerin Saklandığı Adresler])
      ]
    ],
    // ORTA: VERİ YOLU
    h => block(
      width: 100%,
      height: h,
      fill: rgb("#f1f5f9"),
      stroke: 1pt + rgb("#94a3b8"),
      radius: 4pt,
      inset: 6pt,
    )[
      #align(center)[
        #text(weight: "bold", size: 8.2pt, fill: rgb("#334155"))[VERİ YOLU (Data Bus)] \
        #text(size: 6.8pt, fill: luma(100))[Bilgi İletim Otoyolu]
        #v(5pt)
      ]
      #v(1fr)
      #block(
        width: 100%,
        fill: rgb("#dbeafe"),
        stroke: 0.8pt + rgb("#3b82f6"),
        radius: 3pt,
        inset: 4pt,
      )[
        #align(center)[
          #text(size: 7.4pt, weight: "bold", fill: rgb("#1d4ed8"))[1.Oku: Değerleri Al $stretch(arrow.r.long, size: #30pt)$] \
          #text(size: 6.5pt, fill: rgb("#1e40af"))[a ve b İşlemciye Taşınır]
        ]
      ]
      #v(2pt)
      #block(
        width: 100%,
        fill: rgb("#dcfce7"),
        stroke: 0.8pt + rgb("#22c55e"),
        radius: 3pt,
        inset: 4pt,
      )[
        #align(center)[
          #text(size: 7.4pt, weight: "bold", fill: rgb("#15803d"))[$stretch(arrow.l.long, size: #30pt)$ 3.Yaz: Sonucu Kaydet] \
          #text(size: 6.5pt, fill: rgb("#166534"))[sonuc RAM'e Geri Yazılır]
        ]
      ]
      #v(1fr)
    ],
    // SAĞ: İŞLEMCİ KUTUSU
    h => block(
      width: 100%,
      height: h,
      fill: white,
      stroke: 1pt + rgb("#1e3a8a"),
      radius: 4pt,
      clip: true,
      inset: 0pt,
    )[
      #block(width: 100%, fill: rgb("#1e3a8a"), inset: (y: 5pt), below: 0pt, align(center, text(fill: white, weight: "bold", size: 9pt)[İŞLEMCİ (CPU)]))
      #pad(x: 6pt, top: 11pt, bottom: 6pt)[
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
            #text(size: 8pt, weight: "bold", fill: rgb("#dc2626"))[2.İşle: 7 + 2 = 9]
          ]
        ]
        #v(4pt)
        #block(
          width: 100%,
          fill: rgb("#f8fafc"),
          stroke: 0.5pt + rgb("#cbd5e1"),
          radius: 2pt,
          inset: 5pt,
        )[
          #align(center, text(size: 6.8pt, fill: luma(100))[Yazmaçlar (Hızlı Kayıtçılar)])
        ]
        #v(1fr)
        #align(center, text(size: 6.8pt, fill: luma(120))[Hesaplamanın Yapıldığı Beyin])
      ]
    ],
  )
]

=== Bir İşlemin Yaşam Döngüsü: Oku → İşle → Yaz

Programda `sonuc = a + b;` gibi basit bir satır çalıştırıldığında donanım arka planda şu üç adımı sırayla yürütür:

// DÜZELTİLDİ: 3 sütunlu kutular artık eşit yükseklikte
#esit-grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 7pt,
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#bfdbfe"),
    radius: 4pt,
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#1d4ed8"))[1. Oku (Fetch / Read)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemci RAM'deki veriyi doğrudan işleyemez. Toplama yapabilmek için *a* ve *b* değişkenlerinin değerlerini RAM adreslerinden *Veri Yolu* üzerinden kendi içine çeker.
    ]
  ],
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#faf5ff"),
    stroke: 1pt + rgb("#e9d5ff"),
    radius: 4pt,
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#7e22ce"))[2. İşle (Execute / Process)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemcinin *Aritmetik ve Mantık Birimi (ALU)*, gelen ikilik sayıları toplar ($7 + 2 = 9$). Sayının türü ne kadar karmaşıksa işlemcinin bu adımı tamamlaması o kadar uzun sürer.
    ]
  ],
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#f0fdf4"),
    stroke: 1pt + rgb("#bbf7d0"),
    radius: 4pt,
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("#15803d"))[3. Yaz (Store / Write)]
    #v(3pt)
    #text(size: 8.3pt)[
      İşlemci sonucu bulduktan sonra bunu kendi içinde saklamaz. Elde edilen *9* değerini tekrar veri yolu üzerinden RAM'e gönderir ve *sonuc* değişkeninin adresine kaydeder.
    ]
  ],
)

=== Gündelik Hayat Benzetmesi: Kurye Çantası mı, Nakliye Tırı mı?

Veri türü seçiminin neden bu kadar kritik olduğunu kavramak için kargo ve taşımacılık örneğini düşünelim:

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 6pt,
  inset: 9pt,
  breakable: false,
)[
  #text(weight: "bold", size: 9.5pt, fill: rgb("#1e293b"))[📦 Kargo Taşıma ve Trafik Benzetmesi]
  #v(4pt)
  // DÜZELTİLDİ: 2 sütunlu kutular eşit yükseklikte
  #esit-grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    h => block(
      width: 100%,
      height: h,
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
    h => block(
      width: 100%,
      height: h,
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
    ],
  )
]

=== Somut Örnek ve Kanıt: Aynı İşlem, İki Farklı Veri Türü!

Aşağıda iki farklı programcının yazdığı kodu inceleyelim. İki program da aynı iki tam sayıyı ($7$ ve $2$) toplayıp $9$ sonucunu bulmaktadır:

#esit-grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  // SOL KART: INT
  h => block(
    width: 100%,
    height: h,
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
      below: 0pt,
      grid(
        columns: (1fr, auto),
        text(weight: "bold", size: 9.5pt, fill: rgb("#1e40af"))[Doğru Seçim: int (2 Bayt)],
        text(size: 8pt, weight: "bold", fill: rgb("#15803d"))[✓ Verimli],
      )
    )
    #pad(x: 8pt, top: 14pt, bottom: 8pt)[
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
      #v(8pt)
      #v(1fr)
      #block(width: 100%, fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), radius: 3pt, inset: 5pt)[
        #text(weight: "bold", size: 8pt, fill: rgb("#166534"))[Sonuç:] Az bellek, açık veri yolu, maksimum işlemci hızı!
      ]
    ]
  ],
  // SAĞ KART: FLOAT
  h => block(
    width: 100%,
    height: h,
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
      below: 0pt,
      grid(
        columns: (1fr, auto),
        text(weight: "bold", size: 9.5pt, fill: rgb("#9a3412"))[Gereksiz Seçim: float (4 Bayt)],
        text(size: 8pt, weight: "bold", fill: rgb("#b91c1c"))[✗ İsraf ve Yavaşlık],
      )
    )
    #pad(x: 8pt, top: 14pt, bottom: 8pt)[
      #kod-blok(width: 100%, satir-no: false)[```cpp
float a = 7;
float b = 2;
float sonuc = a + b;
```]
      #v(4pt)
      #set text(size: 8.2pt)
      - *RAM Tüketimi:* 3 değişken $times$ 4 Bayt = *Toplam 12 Bayt* (Tam 2 katı!).
      - *Veri Yolu Trafiği:* 8 bayt okunur + 4 bayt yazılır = *12 Bayt taşınır* (2 kat trafik!).
      - *İşlemci Eforu:* Ondalıklı sayılarda işlemci basamakları hesaplamak için *onlarca çevrim* harcar.
      #v(8pt)
      #v(1fr)
      #block(width: 100%, fill: rgb("#fef2f2"), stroke: 0.5pt + rgb("#fca5a5"), radius: 3pt, inset: 5pt)[
        #text(weight: "bold", size: 8pt, fill: rgb("#991b1b"))[Sonuç:] RAM israfı, veri yolu tıkanıklığı, geciken işlem!
      ]
    ]
  ],
)


=== Karşılaştırma ve Donanım Etkisi

#icerik-tablo(
  tablo_baslik: [Aynı Toplama İşleminde "int" ve "float" Türlerinin Donanım Etkisi],
  sutunlar: (auto, auto, auto, 1fr),
  sutun_basliklari: ([İncelenen Kriter], [`int` (Doğru Tercih)], [`float` (Gereksiz Tercih)], [Sisteme ve Performansa Etkisi]),
  hucre_bosluk: (x: 6pt, y: 6.5pt),
  boyut: 9.4pt,
  icerik_hizalama: (left + horizon, center + horizon, center + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon, center + horizon),
  [*RAM Alanı*], [6 Bayt], [12 Bayt], [*%50 Bellek Tasarrufu:* RAM'de diğer programlara ve değişkenlere daha fazla yer kalır.],
  [*Veri Yolu Trafiği*], [6 Bayt taşınır], [12 Bayt taşınır], [*2 Kat Daha Az Trafik:* Veri yollarındaki yoğunluk ve bekleme süresi yarıya iner.],
  [*İşlemci Eforu*], [1 Saat Çevrimi (Tek Adım)], [Onlarca Çevrim (Çok Adım)], [*İşlemci Yorulmaz:* Karmaşık ondalık algoritmaları işletilmez.],
  [*Donanım Uyumu*], [Tüm İşlemcilerde Doğal Hız], [FPU Yoksa Çok Yavaş], [Arduino gibi gömülü sistemlerde hız farkı yüzlerce kata çıkabilir.],
)

=== Neden-Sonuç Zinciri: Veri Türü Sistemi Nasıl Etkiler?

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#e2e8f0"),
  radius: 6pt,
  inset: 8pt,
  breakable: false,
)[
  #let kutu(metin, renk) = h => block(
    width: 100%,
    height: h,
    fill: renk.lighten(88%),
    stroke: 1pt + renk,
    radius: 4pt,
    inset: (x: 4pt, y: 6pt),
    align(center + horizon, text(size: 7.5pt, weight: "bold", fill: renk.darken(30%), metin))
  )
  #let ok = h => block(height: h, width: 100%, align(center + horizon, text(size: 10pt, weight: "bold", fill: luma(130))[▶]))
  #let zincir-sutunlari = (1fr, 12pt, 1fr, 12pt, 1fr, 12pt, 1fr)

  #text(weight: "bold", size: 8.8pt, fill: rgb("#991b1b"))[✗ Hatalı ve Gereksiz Büyük Tür Seçildiğinde:]
  #v(3pt)
  #esit-grid(
    columns: zincir-sutunlari,
    gutter: 2pt,
    kutu([Büyük Veri Türü \ (Gereksiz float)], rgb("#ea580c")), ok,
    kutu([RAM'de Fazla Alan \ (Bellek İsrafı)], rgb("#ea580c")), ok,
    kutu([Veri Yolunda Trafik \ (Daha Çok Bayt)], rgb("#dc2626")), ok,
    kutu([İşlemci Meşgul \ (Sistem Yavaşlar)], rgb("#dc2626")),
  )

  #v(8pt)
  #text(weight: "bold", size: 8.8pt, fill: rgb("#166534"))[✓ Doğru ve İhtiyaç Kadar Tür Seçildiğinde:]
  #v(3pt)
  #esit-grid(
    columns: zincir-sutunlari,
    gutter: 2pt,
    kutu([Doğru Veri Türü \ (İhtiyaç Kadar int)], rgb("#2563eb")), ok,
    kutu([RAM'de Tasarruf \ (Hafif Bellek)], rgb("#2563eb")), ok,
    kutu([Veri Yolunda Hızlı Akış \ (Az Bayt Trafiği)], rgb("#16a34a")), ok,
    kutu([İşlemci Anında Bitirir \ (Maksimum Hız)], rgb("#16a34a")),
  )
]

#v(4pt)

#not_block(title: "", boyut: 9.8pt, width: 100%)[
  *Doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır!*
  
  İyi bir programcı, yazdığı kodun yalnızca ekranda doğru sonuç vermesini değil; arka planda bilgisayar donanımını en verimli şekilde kullanmasını da sağlar. İhtiyaçtan büyük seçilen her veri türü, RAM ile işlemci arasındaki veri yollarında gereksiz bilgi trafiği yaratır ve işlem süresini uzatır. Doğru bellek yönetimi ise taşınan veri boyutunu küçülterek işlemcinin veriyi çok daha hızlı okuyup işlemesini sağlar.
]

#esit-grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 7pt,
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#f0fdf4"),
    stroke: 1pt + rgb("#86efac"),
    radius: 4pt,
    inset: 7pt,
  )[
#set par(spacing: 2pt)
#text(weight: "bold", size: 8.5pt, fill: rgb("#166534"))[1. İhtiyaç Kadar Boyut]
#v(5pt)
#text(size: 7.8pt)[Küsurat içermeyen (yaş, sayaç, adet, döngü vb.) hiçbir değer için `float` kullanmayın. Tam sayıları tercih edin.]
  ],
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#93c5fd"),
    radius: 4pt,
    inset: 7pt,
  )[
#set par(spacing: 2pt)
#text(weight: "bold", size: 8.5pt, fill: rgb("#166534"))[2. Değer Aralığı Analizi]
#v(5pt)
#text(size: 7.8pt)[Verinin alabileceği en küçük ve en büyük sayıyı öngörün. Sadece 0-100 arası notlar için devasa türler seçmeyin.]
  ],
  h => block(
    width: 100%,
    height: h,
    fill: rgb("#fefce8"),
    stroke: 1pt + rgb("#fde047"),
    radius: 4pt,
    inset: 7pt,
  )[
#set par(spacing: 2pt)
#text(weight: "bold", size: 8.5pt, fill: rgb("#166534"))[3. Donanım Bilinci]
#v(5pt)
#text(size: 7.8pt)[RAM tasarrufu sadece alan kazanmak değildir; işlemcinin hızını doğrudan artıran en kritik donanım kuralıdır.]
  ],
)


// ============================================================
// ÖZET RESİM: Veri türü seçimi RAM, veri yolu ve işlemciyi nasıl etkiler?
// Belgenin sonuna (özet kutusundan sonra) yapıştırın. Ek paket gerekmez.
// ============================================================

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 8pt,
  clip: true,
  inset: 0pt,
  breakable: false,
)[
  // ÜST BANT
  #block(width: 100%, fill: rgb("#16325c"), inset: (x: 10pt, y: 8pt), below: 0pt)[
    #set par(spacing: 0pt)
    #align(center)[
      #text(weight: "bold", size: 11pt, fill: white)[Bellek Yönetimi Özeti: Aynı İşlem, İki Farklı Veri Türü]
      #v(5pt)
      #text(size: 7.8pt, fill: rgb("#bfdbfe"))[7 + 2 = 9 işlemi RAM, Veri Yolu ve İşlemci üzerinden nasıl geçer?]
    ]
  ]

  #pad(x: 10pt, top: 10pt, bottom: 10pt)[
    // İSTASYON BAŞLIKLARI
    #pad(x: 9pt, grid(
      columns: (1.05fr, 1.2fr, 1.5fr, 1.2fr),
      gutter: 9pt,
      [],
      block(width: 100%, fill: rgb("#15803d"), radius: 3pt, inset: 4pt, align(center, text(size: 8pt, weight: "bold", fill: white)[RAM])),
      block(width: 100%, fill: rgb("#64748b"), radius: 3pt, inset: 4pt, align(center, text(size: 8pt, weight: "bold", fill: white)[VERİ YOLU])),
      block(width: 100%, fill: rgb("#1e3a8a"), radius: 3pt, inset: 4pt, align(center, text(size: 8pt, weight: "bold", fill: white)[İŞLEMCİ])),
    ))
    #v(4pt)

    // ŞERİT 1: float (israf)
    #ozet-seritli(
      rgb("#ea580c"), rgb("#fff7ed"),
      [float: Nakliye Tırı], [Gereksiz büyük tür\ 4 Bayt $times$ 3 değişken],
      ozet-ram(rgb("#ea580c"), 12, 0, "12 Bayt: 2 kat yer"),
      ozet-yol(
        rgb("#ea580c"),
        (1pt, ozet-paket(rgb("#ea580c"), (17pt, 20pt), "4B"), ozet-paket(rgb("#ea580c"), (17pt, 20pt), "4B"), ozet-paket(rgb("#dc2626"), (17pt, 20pt), "4B"), ozet-paket(rgb("#dc2626"), (17pt, 20pt), "4B")),
        [✗ Trafik sıkışır], rgb("#b91c1c"),
      ),
      ozet-olcer(rgb("#dc2626"), 22%, [✗ Onlarca çevrim], [İşlemci meşgul, sistem yavaşlar]),
    )

    #v(8pt)

    // ŞERİT 2: int (verimli)
    #ozet-seritli(
      rgb("#2563eb"), rgb("#eff6ff"),
      [int: Kurye Çantası], [İhtiyaç kadar tür\ 2 Bayt $times$ 3 değişken],
      ozet-ram(rgb("#2563eb"), 6, 6, "6 Bayt: %50 tasarruf"),
      ozet-yol(
        rgb("#2563eb"),
        (14pt, ozet-paket(rgb("#2563eb"), (9pt, 12pt), "2B"), ozet-paket(rgb("#16a34a"), (9pt, 12pt), "2B")),
        [✓ Yol açık, hızlı akış], rgb("#15803d"),
      ),
      ozet-olcer(rgb("#16a34a"), 100%, [✓ 1 çevrim], [İşlemci anında bitirir]),
    )

    #v(3pt)

    // ALT BANT: ALTIN KURAL
    #block(
      width: 100%,
      radius: 6pt,
      inset: (x: 12pt, y: 9pt),
      fill: gradient.linear(rgb("#1e3a8a"), rgb("#15803d"), angle: 0deg),
    )[
      #set par(spacing: 0pt)
      #align(center)[
        #text(size: 7.6pt, weight: "bold", fill: rgb("#fde68a"))[ALTIN KURAL]
        #v(9pt)
        #text(size: 9.3pt, weight: "bold", fill: white)[Doğru veri türüyle yapılan bellek yönetimi hem RAM’de tasarruf sağlar hem de işlemcinin hızını artırır!]
      ]
    ]
  ]
]
