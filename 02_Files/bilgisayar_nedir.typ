#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/islem-aciklama.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge

#show: conf

== Bilgisayar Nedir?
*Bilgisayar*, kendisine verilen bilgiler üzerinden aritmetiksel, mantıksal ve karşılaştırma işlemleri yaparak sonuçları çıktı birimlerine gönderen elektronik bir cihazdır. Bilgisayarlar çok yüksek hızlarda, bıkıp usanmadan ve tekrarlı olarak aynı işlemleri hatasız yerine getirebilen aygıtlardır.

Bilgisayarda temel olarak giriş, veri işleme, veri saklama ve çıkış işlemleri gerçekleştirilir. Kullanıcı tarafından girilen işlenmemiş ham veriler bilgisayar tarafından *"girdi"* olarak algılanır ve bu girdiler programlar tarafından işlenir. İşlem sonucunda elde edilen ve kullanıcıya geri dönen anlamlı değer ise işlenmiş veridir; bu veri de *"çıktı"* olarak adlandırılır.

#v(0.4em)

// ============================================================
// BİLGİSAYARIN ÇALIŞMA MİMARİSİ ÇİZİMİ (TYP FORMATINDA)
// ============================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 8pt,
  fill: rgb("#f8fafc"),
  inset: 0pt,
  clip: true,
  breakable: false,
)[
  // Üst Başlık Bandı
  #block(
    width: 100%,
    fill: rgb("#16325c"),
    inset: (x: 12pt, y: 7.5pt),
  )[
    #set align(center)
    #text(weight: "bold", size: 10.5pt, fill: white)[Bilgisayarın Temel Çalışma Mimarisi]
    #v(2pt)
    #text(size: 7.5pt, fill: rgb("#bfdbfe"))[Giriş, Bellek, İşlemci ve Çıkış Birimleri Arasındaki Veri ve Komut Akışı]
  ]

  #pad(x: 10pt, top: 10pt, bottom: 9pt)[
    // 1. KAT: İŞLEMCİ (CPU)
    #align(center)[
      #block(
        width: 230pt,
        fill: rgb("#eff6ff"),
        stroke: 1.5pt + rgb("#2563eb"),
        radius: 6pt,
        inset: (x: 8pt, y: 6pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#1d4ed8"),
            radius: 3pt,
            inset: (x: 10pt, y: 2.5pt),
            text(weight: "bold", size: 8.8pt, fill: white)[İşlemci (CPU)]
          )
          #v(3pt)
          #text(size: 7.2pt, weight: "bold", fill: rgb("#1e40af"))[Merkezi İşlem Birimi (ALU + CU)]
          #v(1.5pt)
          #text(size: 6.3pt, fill: rgb("#334155"))[
            Aritmetiksel ve mantıksal işlemleri gerçekleştiren ana birimdir.\ Komutları sırayla yorumlar, hesaplamaları yapar ve tüm sistemi denetler.
          ]
        ]
      ]
    ]

    // 2. KAT: DİKEY ÇİFT YÖNLÜ VERİ / KOMUT İLETİŞİMİ
    #align(center)[
      #block(width: 260pt, inset: (y: 3pt))[
        #grid(
          columns: (1fr, auto, 1fr),
          align: horizon,
          align(right)[
            #text(size: 6.8pt, weight: "bold", fill: rgb("#1d4ed8"))[Komut / Veri Çağırma #h(3pt) ▲]
          ],
          [
            #block(
              fill: rgb("#dbeafe"),
              stroke: 1pt + rgb("#3b82f6"),
              radius: 4pt,
              inset: (x: 8pt, y: 2.5pt),
            )[
              #set align(center)
              #text(size: 8.5pt, weight: "bold", fill: rgb("#1e40af"))[▲ ┃ ▼]
              #v(-3pt)
              #text(size: 5.5pt, weight: "bold", fill: rgb("#1e40af"))[VERİ YOLU (BUS)]
            ]
          ],
          align(left)[
            #text(size: 6.8pt, weight: "bold", fill: rgb("#0d9488"))[#h(3pt) ▼ İşlenen Veriyi Yazma]
          ]
        )
      ]
    ]]

    // 3. KAT: YATAY AKIŞ (Girdi -> Giriş Birimi -> Bellek -> Çıkış Birimi -> Çıktı)
    #grid(
      columns: (1fr, 1.85fr, 0.35fr, 3.1fr, 0.35fr, 1.85fr, 1fr),
      gutter: 0pt,
      align: horizon,
      rows: (84pt,),

      // Sütun 1: Girdi Akışı
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#e0f2fe"),
        stroke: 1pt + rgb("#7dd3fc"),
        radius: (left: 6pt, right: 0pt),
        inset: (x: 4pt, y: 6pt),
      )[
        #align(center + horizon)[
          #text(size: 7.2pt, weight: "bold", fill: rgb("#0369a1"))[Komut ve\ Veriler]
          #v(2pt)
          #text(size: 5.8pt, fill: rgb("#0284c7"))[(Ham Girdi)]
          #v(3pt)
          #text(size: 11pt, fill: rgb("#0284c7"))[▶▶]
        ]
      ],

      // Sütun 2: Giriş Birimi
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#f0fdf4"),
        stroke: 1.2pt + rgb("#22c55e"),
        radius: 6pt,
        inset: (x: 4pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#16a34a"),
            radius: 3pt,
            inset: (x: 6pt, y: 2.2pt),
            text(weight: "bold", size: 8pt, fill: white)[Giriş Birimi]
          )
          #v(2.5pt)
          #text(size: 6.2pt, fill: rgb("#15803d"))[Veri ve komut iletimi]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 2.5pt,
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Klavye]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Fare]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Kamera]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Mikrofon]),
          )
        ]
      ],

      // Sütun 3: Ara Ok (Giriş -> Bellek)
      align(center + horizon)[
        #text(size: 13pt, fill: rgb("#16a34a"))[▶]
      ],

      // Sütun 4: Bellek Birimi (Merkez)
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#f0fdfa"),
        stroke: 1.5pt + rgb("#0d9488"),
        radius: 6pt,
        inset: (x: 5pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#0d9488"),
            radius: 3pt,
            inset: (x: 9pt, y: 2.2pt),
            text(weight: "bold", size: 8.5pt, fill: white)[Bellek Birimi]
          )
          #v(2pt)
          #text(size: 6.1pt, weight: "bold", fill: rgb("#0f766e"))[Komutlar, Veriler ve Sonuçlar Burada Tutulur]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 3pt,
            block(
              fill: white,
              stroke: 0.5pt + rgb("#5eead4"),
              radius: 3pt,
              inset: 2.5pt,
              [
                #text(size: 6.2pt, weight: "bold", fill: rgb("#115e59"))[Ana Bellek (RAM)] \
                #text(size: 5.4pt, fill: rgb("#64748b"))[Çalışan programlar ve anlık veriler]
              ]
            ),
            block(
              fill: white,
              stroke: 0.5pt + rgb("#5eead4"),
              radius: 3pt,
              inset: 2.5pt,
              [
                #text(size: 6.2pt, weight: "bold", fill: rgb("#115e59"))[Sabit Disk (HDD/SSD)] \
                #text(size: 5.4pt, fill: rgb("#64748b"))[Kalıcı dosyalar ve saklanan bilgiler]
              ]
            )
          )
        ]
      ],

      // Sütun 5: Ara Ok (Bellek -> Çıkış)
      align(center + horizon)[
        #text(size: 13pt, fill: rgb("#0d9488"))[▶]
      ],

      // Sütun 6: Çıkış Birimi
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#faf5ff"),
        stroke: 1.2pt + rgb("#c084fc"),
        radius: 6pt,
        inset: (x: 4pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#9333ea"),
            radius: 3pt,
            inset: (x: 6pt, y: 2.2pt),
            text(weight: "bold", size: 8pt, fill: white)[Çıkış Birimi]
          )
          #v(2.5pt)
          #text(size: 6.2pt, fill: rgb("#7e22ce"))[Sonuçların dışa aktarımı]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 2.5pt,
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Ekran]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Yazıcı]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Hoparlör]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Projeksiyon]),
          )
        ]
      ],

      // Sütun 7: Çıktı Akışı
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#fef3c7"),
        stroke: 1pt + rgb("#fcd34d"),
        radius: (left: 0pt, right: 6pt),
        inset: (x: 4pt, y: 6pt),
      )[
        #align(center + horizon)[
          #text(size: 11pt, fill: rgb("#d97706"))[▶▶]
          #v(2pt)
          #text(size: 7.2pt, weight: "bold", fill: rgb("#b45309"))[Sonuçlar]
          #v(2pt)
          #text(size: 5.8pt, fill: rgb("#d97706"))[(İşlenmiş Çıktı)]
        ]
      ],
    )

    #v(7pt)

    // ALT BANT: TEMEL İLKE AÇIKLAMASI
    #block(
      width: 100%,
      radius: 5pt,
      inset: (x: 10pt, y: 6pt),
      fill: gradient.linear(rgb("#16325c"), rgb("#0f766e"), angle: 0deg),
    )[
      #set par(spacing: 0pt)
      #align(center)[
        #text(size: 7.2pt, fill: white)[
          *Temel Çalışma Mantığı:* Giriş birimlerinden gelen veriler doğrudan işlemciye gitmez; önce *belleğe (RAM)* aktarılır. *İşlemci (CPU)* komut ve verileri bellekten okur, işler ve sonuçları tekrar belleğe yazar. Bellekteki işlenmiş sonuçlar *çıkış birimlerine* gönderilerek kullanıcıya sunulur.
        ]
      ]
    ]
  ]

#v(0.5em)

=== Bilgisayarın Temel Çalışma Mimarisi

Yukarıdaki şema, günümüz bilgisayarlarının büyük çoğunluğunda kullanılan mimarisini özetler. Bu mimarinin en ayırt edici özelliği, *komutların da verilerin de aynı bellekte* saklanmasıdır. İşlemci, çalıştıracağı komutu da işleyeceği veriyi de bellekten okur. Bu nedenle giriş biriminden gelen bir veri, işlemciye ulaşmadan önce mutlaka *bellekte (RAM)* bir alana yazılır.

Dört temel birim arasındaki görev paylaşımı şöyledir:

+ *Giriş Birimi:* Dış dünyadan gelen verileri ve kullanıcı komutlarını, bilgisayarın anlayacağı elektrik sinyallerine dönüştürür.
+ *Bellek Birimi:* Gelen verileri, çalıştırılacak programın komutlarını ve ara sonuçları geçici olarak saklar.
+ *İşlemci (CPU):* Bellekten okuduğu komutları yorumlar; aritmetiksel ve mantıksal işlemleri yaparak yeni sonuçlar üretir.
+ *Çıkış Birimi:* İşlenmiş sonuçları ekran, yazıcı veya hoparlör gibi araçlarla insanın algılayabileceği biçime çevirir.

Birimler arasındaki bu alışveriş, şemadaki *VERİ YOLU (BUS)* üzerinden gerçekleşir. Veri yolu, birimler arasında veri ve komut taşıyan ortak bir otoyol gibidir. Aynı anda yalnızca sınırlı miktarda veri taşıyabildiği için bilgisayarın hızını belirleyen önemli etkenlerden biridir.

==== Adım Adım Veri Akışı: "5 + 3" İşlemi

Bir bilgisayarda `5 + 3` gibi basit görünen bir toplama işleminin arka planda nasıl gerçekleştiğini izleyelim. Aşağıdaki tablo, şemadaki okları adım adım takip eder:

#icerik-tablo(
  tablo_baslik: "Bir Toplama İşleminin Bilgisayardaki Yolculuğu",
  sutunlar: (auto, auto, 1fr, auto),
  sutun_basliklari: ("Adım", "Sorumlu Birim", "Gerçekleşen İşlem", "Örnek"),
  icerik_hizalama: (center + horizon, center + horizon, left + horizon, center + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon, center + horizon),
  boyut: 9pt,
  dikey-bosluk: 6pt,
  [`1`], [Giriş Birimi], [Kullanıcı klavyeden `5` ve `3` tuşlarına basar; klavye bu tuşları elektrik sinyallerine çevirir.], [`5`, `3`],
  [`2`], [Bellek Birimi], [Sinyaller ikilik sisteme dönüştürülerek RAM'de ayrılan hücrelere yazılır.], [`0000 0101` \ `0000 0011`],
  [`3`], [İşlemci (CPU)], [İşlemci, bellekten "topla" komutunu ve toplanacak iki sayıyı okur (getirir).], [`topla`],
  [`4`], [İşlemci (ALU)], [Aritmetik mantık birimi iki sayıyı toplar ve sonucu üretir.], [`5 + 3 = 8`],
  [`5`], [Bellek Birimi], [Elde edilen sonuç, daha sonra kullanılmak üzere tekrar RAM'e yazılır.], [`0000 1000`],
  [`6`], [Çıkış Birimi], [Ekran, RAM'deki sonucu insanın okuyabileceği bir görüntüye dönüştürür.], [`8`],
)

=== Bilgisayar Veriyi Nasıl Saklar?
Bilgisayar verileri bellekte saklar. Her bir veri için bellekte belirli bir alan ayrılır ve bu alan her seferinde tek bir değer saklayabilir. Kullanıcı var olan değer yerine yeni bir değer atadığında eski değer silinir. Programın çalışması bittiğinde ya da bilgisayar kapatıldığında bu geçici veriler silinir.

Verilerin daha sonra tekrar kullanılabilmesi gerekiyorsa sabit diske kaydedilmesi gerekir. Bu şekilde kalıcı olarak kaydedilen verilere *"dosya"* adı verilir. Temel anlamda program dosyaları ve veri dosyaları olmak üzere iki dosya türü vardır:
- *Program Dosyaları:* Bilgisayarın yapması istenen komutları ve işlem adımlarını içerir.
- *Veri Dosyaları:* Programlar çalışırken kullanılan ve işlenen verileri kapsar.

#v(0.6em)

Son olarak, bilgisayarın temel çalışma mimarisini ve birimler arasındaki veri akışını bir şema üzerinde toparlayalım:

#let bnm-renk = (
  giris: rgb("#16a34a"),
  bellek: rgb("#0d9488"),
  cpu: rgb("#2563eb"),
  cikis: rgb("#9333ea"),
  lacivert: rgb("#16325c"),
  hat: rgb("#64748b"),
)

#let bnm-mini(metin, renk, boyut: 5.8pt) = block(
  width: 100%,
  fill: white,
  stroke: 0.6pt + renk.lighten(50%),
  radius: 2.5pt,
  inset: (x: 2pt, y: 2.2pt),
  align(center + horizon, text(size: boyut, weight: "bold", fill: renk.darken(28%), metin)),
)

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 6pt, y: 12pt),
    breakable: false,
  )[
    #align(center, text(size: 10pt, weight: "bold", fill: bnm-renk.lacivert)[Bilgisayarın Temel Çalışma Mimarisi])
    #v(12pt)
    #diagram(
      spacing: (22pt, 52pt),
      edge-stroke: 1.2pt + bnm-renk.hat,
      mark-scale: 85%,

      // İŞLEMCİ (CPU)
      node(
        (0, 0),
        width: 230pt,
        fill: rgb("#eff6ff"),
        stroke: 1.5pt + bnm-renk.cpu,
        corner-radius: 6pt,
        inset: 8pt,
      )[#align(center)[
        #text(size: 9.5pt, weight: "bold", fill: bnm-renk.cpu.darken(35%))[İŞLEMCİ (CPU)]
        #v(2pt)
        #text(size: 6.6pt, fill: rgb("#334155"))[Komutları yorumlar, aritmetiksel ve mantıksal işlemleri yapar.]
      ]],

      // GİRİŞ BİRİMİ
      node(
        (-1, 1),
        width: 106pt,
        fill: rgb("#f0fdf4"),
        stroke: 1.3pt + bnm-renk.giris,
        corner-radius: 6pt,
        inset: 6pt,
      )[#align(center)[
        #text(size: 9pt, weight: "bold", fill: bnm-renk.giris.darken(30%))[GİRİŞ BİRİMİ]
        #v(1.5pt)
        #text(size: 6.3pt, fill: rgb("#166534"))[Dış dünyadan gelen veri ve komutları elektrik sinyaline çevirir.]
        #v(4pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 3pt,
          bnm-mini([Klavye], bnm-renk.giris),
          bnm-mini([Fare], bnm-renk.giris),
          bnm-mini([Kamera], bnm-renk.giris),
          bnm-mini([Mikrofon], bnm-renk.giris),
        )
      ]],

      // BELLEK BİRİMİ (RAM)
      node(
        (0, 1),
        width: 154pt,
        fill: rgb("#f0fdfa"),
        stroke: 1.5pt + bnm-renk.bellek,
        corner-radius: 6pt,
        inset: 7pt,
      )[#align(center)[
        #text(size: 9.5pt, weight: "bold", fill: bnm-renk.bellek.darken(30%))[BELLEK BİRİMİ (RAM)]
        #v(1pt)
        #text(size: 6.6pt, weight: "bold", fill: rgb("#115e59"))[Komutlar • Veriler • Ara Sonuçlar]
        #v(1.5pt)
        #text(size: 6.2pt, fill: rgb("#334155"))[Girişten gelen veriler ve çalıştırılacak komutlar burada geçici olarak saklanır.]
        #v(4pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 4pt,
          bnm-mini([Program komutları], bnm-renk.bellek, boyut: 5.6pt),
          bnm-mini([Veriler ve ara sonuçlar], bnm-renk.bellek, boyut: 5.6pt),
        )
      ]],

      // ÇIKIŞ BİRİMİ
      node(
        (1, 1),
        width: 106pt,
        fill: rgb("#faf5ff"),
        stroke: 1.3pt + bnm-renk.cikis,
        corner-radius: 6pt,
        inset: 6pt,
      )[#align(center)[
        #text(size: 9pt, weight: "bold", fill: bnm-renk.cikis.darken(30%))[ÇIKIŞ BİRİMİ]
        #v(1.5pt)
        #text(size: 6.3pt, fill: rgb("#6b21a8"))[İşlenmiş sonuçları insanın algılayabileceği biçime çevirir.]
        #v(4pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 3pt,
          bnm-mini([Ekran], bnm-renk.cikis),
          bnm-mini([Yazıcı], bnm-renk.cikis),
          bnm-mini([Hoparlör], bnm-renk.cikis),
          bnm-mini([Projeksiyon], bnm-renk.cikis, boyut: 5.4pt),
        )
      ]],

      // Giriş → Bellek
      edge(
        (-1, 1), (0, 1),
        "-|>",
        stroke: 1.5pt + bnm-renk.giris,
        label: [Ham veri],
        label-fill: white,
        label-size: 6.4pt,
        label-sep: 2pt,
      ),

      // Bellek → Çıkış
      edge(
        (0, 1), (1, 1),
        "-|>",
        stroke: 1.5pt + bnm-renk.cikis,
        label: [Sonuç],
        label-fill: white,
        label-size: 6.4pt,
        label-sep: 2pt,
      ),

      // Bellek → İşlemci (okuma)
      edge(
        (0, 1), (0, 0),
        "-|>",
        shift: 8pt,
        stroke: 1.2pt + bnm-renk.cpu,
        label: [Oku],
        label-side: left,
        label-fill: white,
        label-size: 6.4pt,
        label-sep: 2pt,
      ),

      // İşlemci → Bellek (yazma)
      edge(
        (0, 0), (0, 1),
        "-|>",
        shift: 8pt,
        stroke: 1.2pt + bnm-renk.cpu,
        label: [Yaz],
        label-side: left,
        label-fill: white,
        label-size: 6.4pt,
        label-sep: 2pt,
      ),
    )
  ],
  caption: text(size: 8.5pt)[
    Bilgisayarın temel çalışma mimarisi. Giriş biriminden gelen veriler önce belleğe (RAM) yazılır; işlemci (CPU) çalıştıracağı komutu ve işleyeceği veriyi bellekten okur, sonucu tekrar belleğe yazar. Bellekteki işlenmiş sonuçlar çıkış birimine gönderilir.
  ],
)

=== Makinenin Dilinden İnsanın Diline: "Hello world!"

Bilgisayarın yalnızca 0 ve 1'lerden oluşan makine dilini anladığını gördük. Peki aynı `Hello world!` programı, makinenin dilinden insanın diline kadar nasıl farklı biçimlerde yazılır? Aşağıdaki dört örnek, aynı işi yapan programın dört farklı düzeydeki gösterimidir. Yukarıdan aşağıya doğru kod insan için okunaklılaşır; makineye yakınlık azalır.

#not_block(title: "Bilgi: ")[
  Makine dili örnekleri, 16 bitlik DOS ortamında çalışan bir *COM programına* aittir. Bu baytlar bir `.com` dosyasına yazıldığında program çalışır. Günümüz 64 bit işlemcilerinde komutlar ve adresler çok daha uzundur; buradaki amaç, aynı işin makine dilindeki görünümünü göstermektir.
]

==== Makine Dili (0 ve 1'lerle)

Makine dili, işlemcinin doğrudan çalıştırabildiği tek dildir. Bir *bayt* 8 bitten oluşur; aşağıdaki her grup 8 bitlik bir bayttır. Satır sonundaki açıklamalar insan içindir, makine bu açıklamaları görmez.

#kod-blok(width: 100%)[
  ```text
  ; 16 bit DOS COM programı (x86)
  ; Sütunlar: makine kodu baytları  |  karşılığı olan işlem

  10110100 00001001                  ; AH = 09h: metin yazdırma servisi
  10111010 00001100 00000001         ; DX = 010Ch: metnin bellek adresi
  11001101 00100001                  ; INT 21h: DOS servisini çağır
  10111000 00000000 01001100         ; AX = 4C00h: programdan çık
  11001101 00100001                  ; INT 21h: DOS servisini çağır

  ; "Hello world!$" metni (ASCII kodları)
  01001000 01100101 01101100 01101100 01101111 00100000
  01110111 01101111 01110010 01101100 01100100 00100001 00100100
  ```
]

==== Makine Dili (Hexadecimal Sayılarla)

Aynı makine kodu, ikilik sistemdeki her 8 bitlik baytın iki hexadecimal (onaltılık) basamakla gösterilmesiyle de yazılabilir. Hexadecimal gösterim, 0 ve 1'lerden oluşan uzun dizileri kısaltır ve okumayı kolaylaştırır.

#kod-blok(width: 100%)[
  ```text
  ; 16 bit DOS COM programı (x86) - aynı programın hexadecimal hâli
  B4 09                 ; AH = 09h: metin yazdırma servisi
  BA 0C 01              ; DX = 010Ch: metnin bellek adresi
  CD 21                 ; INT 21h: DOS servisini çağır
  B8 00 4C              ; AX = 4C00h: programdan çık
  CD 21                 ; INT 21h

  ; "Hello world!$" metni (ASCII kodları)
  48 65 6C 6C 6F 20 77 6F 72 6C 64 21 24
  ```
]

Metnin sonundaki `$` karakteri (ASCII 24h), DOS'a metnin bittiğini bildiren özel bir işarettir.

==== Assembly Dili

Assembly dili, makine kodundaki her komuta bir *anımsatıcı* (mnemonic) ad verir. Böylece `B4 09` gibi anlaşılmaz baytlar yerine `mov ah, 09h` gibi okunabilir komutlar yazılır. Aşağıdaki örnek NASM sözdizimini kullanır.

#kod-blok(width: 100%)[
  ```text
  ; NASM sözdizimi - 16 bit DOS COM programı
  org 100h

  mov ah, 09h          ; metin yazdırma servisi
  mov dx, mesaj        ; metnin bellek adresi
  int 21h              ; DOS servisini çağır

  mov ax, 4C00h        ; programdan çık
  int 21h

  mesaj db "Hello world!$"
  ```
]

==== Python Dili

Python gibi yüksek seviyeli dillerde aynı iş, tek bir komutla yapılır. Python yorumlayıcısı bu satırı önce kendi anladığı ara biçime, ardından makine diline çevirir.

#kod-blok(width: 100%)[
  ```python
  print("Hello world!")
  ```
]

#output-box[Hello world!]

Dört programın da ekran çıktısı aynıdır: *Hello world!* Görüldüğü gibi makine dilinde onlarca 0 ve 1'e karşılık gelen iş, Python'da tek bir `print()` satırına sığmaktadır. Derleyiciler ve yorumlayıcılar, insanın yazdığı bu kolay okunabilir kodu makinenin anlayacağı makine koduna çevirir.

=== Tarihteki İlk Bilgisayar Programcısı

1837'de Charles Babbage, "Analitik Makine" adını verdiği ve hesaplamalar yapabilen bir cihaz tasarladı. Ancak Babbage, tasarladığı Analitik Makine'yi dönemin teknolojisi yeterli olmadığı için hayata geçiremedi. Analitik Makine her ne kadar tamamlanamasa da zamanının birçok bilim insanını etkiledi.

#figure(
  align(center, image("/02_Files/images/charles-babbage.png", width: 42%)),
  caption: [Charles Babbage (1791–1871)],
)

Ada Lovelace, sahip olduğu maddi imkânlar sayesinde Babbage'in en büyük destekçilerinden biriydi. Kendisi de matematikçi olan Ada, Analitik Makine üzerine yazdığı notlarda Bernoulli sayılarını hesaplamak için bir algoritma tanımladı. Bu nedenle Ada Lovelace, tarihteki ilk bilgisayar programcısı olarak kabul edilir.

#figure(
  align(center, image("/02_Files/images/ada-lovelace.png", width: 30%)),
  caption: [Ada Lovelace (1815–1852)],
)

ABD Savunma Bakanlığı için geliştirilen Ada programlama dili, adını Ada Lovelace'ten almıştır. Ada Lovelace Günü ise her yıl ekim ayının ikinci salı günü kutlanan ve bilim, teknoloji, mühendislik ve matematik alanlarındaki kadınların görünürlüğünü artırmayı amaçlayan bir etkinliktir.

=== Değişken Kullanılarak Çözülen Matematik Problemi

*Problem:* $946877 times 946875 - 946876 times 946875 = ?$

*Çözüm:* Sayıları tek tek çarpmak veya 946875 sayısına göre ortak çarpan parantezine almak, sürekli altı haneli sayılarla işlem yapmayı gerektirir. Bu durum hem hata olasılığını artırır hem de çözümü uzatır. Bunun yerine 946875 sayısını bir değişkenle gösterelim.

$x = 946875$ dersek $946877 = x + 2$ ve $946876 = x + 1$ olur. İfadeyi yeniden yazalım:

#align(center)[
  $ (x + 2) times x - (x + 1) times x
    = x times [(x + 2) - (x + 1)] \
    = x times (x + 2 - x - 1) \
    = x times 1 \
    = x $
]

#not_block(title: "Sonuç: ")[
  $x = 946875$ olduğuna göre işlemin sonucu *946875*'tir.
]

=== Matematik İşleminin Sonucunu Değişkene Atama (Önce İşlem, Sonra Atama)

Programlamada `=` işareti, matematikteki "eşittir" anlamından farklı olarak *atama* anlamında kullanılır. Eşittir operatörünün sağındaki ifade önce hesaplanır; elde edilen sonuç, sol taraftaki değişkene atanır. Yani önce işlem yapılır, sonra sonuç değişkene atanır.

#let atama-sema(..args) = align(center)[
  #block(
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: auto,
  )[#islem-aciklama(..args)]
]

==== Örnek 1: x = 3 + 5 \* 2

`x = 3 + 5 * 2` örneğinde önce çarpma işlemi yapılır: `5 * 2 = 10`. Ardından toplama yapılır: `3 + 10 = 13`. Son olarak `13` değeri `x` değişkenine atanır.

#kod-blok(width: 100%)[
  ```python
  x = 3 + 5 * 2
  ```
]

#atama-sema(degisken: "x", ifade: "3 + 5 * 2", deger: "13", boyut: 12pt)

==== Örnek 2: ozkutle = kutle / hacim

#kod-blok(width: 100%)[
  ```python
  kutle = 100
  hacim = 25
  ozkutle = kutle / hacim
  ```
]

`kutle = 100` ve `hacim = 25` satırlarında değişkenlere değerler atanır. `ozkutle = kutle / hacim` satırında ise önce `kutle / hacim` işlemi yapılır. Python'da `/` operatörü ondalıklı bölme yaptığı için sonuç `4.0` olur. Ardından bu sonuç `ozkutle` (özkütle) değişkenine atanır.

#atama-sema(degisken: "ozkutle", ifade: "kutle / hacim", deger: "4.0", boyut: 12pt)

==== Örnek 3: x = x \* 2 + 3

#kod-blok(width: 100%)[
  ```python
  x = 5
  x = x * 2 + 3
  ```
]

`x = 5` satırıyla `x` değişkenine `5` değeri atanır. `x = x * 2 + 3` satırı ise bir denklem değil, bir atama komutudur. Eşittir operatörünün sağındaki ifade önce hesaplanır; buradaki `x`, değişkenin o anki değeri olan `5`'tir. `5 * 2 + 3 = 13` olduğundan yeni değer `13` olur ve bu değer yine `x` değişkenine atanır.

#atama-sema(degisken: "x", ifade: "x * 2 + 3", deger: "13", boyut: 12pt)

#not_block(title: "Önemli: ")[
  Programlamada `=` atama, `==` ise karşılaştırma operatörüdür. Bu nedenle `x = x * 2 + 3` satırı matematikteki bir denklem gibi çözülmez; "x'in yeni değerini hesapla ve x'e ata" anlamına gelir.
]

=== Mod Alma (%) ve Tam Bölme (`//`) Operatörleri

Python'da bölme işlemi yapılırken üç farklı operatör kullanılabilir. Bunların anlamlarını, 13 sayısının 3'e bölünmesi üzerinden inceleyelim.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    align: horizon,
    [
      #align(center)[
        #block(width: 210pt, height: 145pt, inset: 0pt)[
          #place(top + left, dx: 25pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölünen])
          #place(top + left, dx: 145pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölen])
          #place(top + left, dx: 30pt, dy: 14pt, text(size: 28pt, weight: "bold", fill: rgb("#1d4ed8"))[13])
          #place(top + left, dx: 150pt, dy: 14pt, text(size: 28pt, weight: "bold", fill: rgb("#dc2626"))[3])
          #place(top + left, dx: 115pt, dy: 6pt, line(length: 64pt, angle: 90deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 115pt, dy: 70pt, line(length: 85pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 150pt, dy: 72pt, text(size: 28pt, weight: "bold", fill: rgb("#7e22ce"))[4])
          #place(top + left, dx: 30pt, dy: 48pt, text(size: 28pt, weight: "bold", fill: rgb("#4d7c0f"))[12])
          #place(top + left, dx: 15pt, dy: 88pt, line(length: 92pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 30pt, dy: 92pt, text(size: 28pt, weight: "bold", fill: rgb("#d97706"))[1])
          #place(top + left, dx: 140pt, dy: 108pt, text(size: 8pt, fill: rgb("#334155"))[Bölüm])
          #place(top + left, dx: 25pt, dy: 128pt, text(size: 8pt, fill: rgb("#334155"))[Kalan])
        ]
      ]
    ],
    [
      #align(center)[
        #block(width: 210pt, height: 145pt, inset: 0pt)[
          #place(top + left, dx: 25pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölünen])
          #place(top + left, dx: 35pt, dy: 14pt, text(size: 30pt, weight: "bold", fill: rgb("#1d4ed8"))[13])
          #place(top + left, dx: 20pt, dy: 52pt, line(length: 85pt, angle: 0deg, stroke: 1.5pt + rgb("#0f172a")))
          #place(top + left, dx: 48pt, dy: 58pt, text(size: 30pt, weight: "bold", fill: rgb("#dc2626"))[3])
          #place(top + left, dx: 30pt, dy: 98pt, text(size: 8pt, fill: rgb("#334155"))[Bölen])
          #place(top + left, dx: 115pt, dy: 37pt, text(size: 30pt, weight: "bold")[=])
          #place(top + left, dx: 145pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Sonuç])
          #place(top + left, dx: 135pt, dy: 28pt, line(length: 72pt, angle: 0deg, stroke: 2pt + rgb("#7e22ce")))
          #place(top + left, dx: 135pt, dy: 32pt, text(size: 18pt, weight: "bold", fill: rgb("#7e22ce"))[4.333333])
        ]
      ]
    ],
  ),
  caption: [13 sayısının 3'e bölümü: solda tam bölme ve kalan, sağda ondalıklı bölme],
)

Uzun bölmede *13* bölünen, *3* bölen, *4* bölüm ve *1* kalandır. Buna göre:

$ "bölünen" = "bölen" times "bölüm" + "kalan" $

$ 13 = 3 times 4 + 1 $

Python'da bu üç sonuç farklı operatörlerle elde edilir:

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center, left, center, center),
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  [*Operatör*], [*Anlamı*], [*Örnek*], [*Sonuç*],
  [`/`], [Ondalıklı bölme], [`13 / 3`], [`4.333333`],
  [`//`], [Tam bölme (bölüm)], [`13 // 3`], [`4`],
  [`%`], [Mod alma (kalan)], [`13 % 3`], [`1`],
)

- `/` operatörü ondalıklı bölme yapar; `13 / 3` işleminin sonucu `4.333333...` olur.
- `//` operatörü tam bölme yapar ve bölümü verir; `13 // 3` işleminin sonucu `4` olur.
- `%` operatörü mod alır ve bölümden kalanı verir; `13 % 3` işleminin sonucu `1` olur.

#kod-blok(width: 100%)[
  ```python
  bolunen = 13
  bolen = 3

  print(bolunen / bolen)   # 4.333333333333333
  print(bolunen // bolen)  # 4
  print(bolunen % bolen)   # 1
  ```
]

#not_block(title: "Not: ")[
  `//` operatörü, pozitif sayılarda bölümün tam kısmını verir. `%` operatörünün sonucu ise pozitif sayılarda her zaman bölenden küçüktür. Örneğin `13 % 3 = 1` ve `1 < 3` olur.
]

=== Bölme İşleminin Şematik Gösterimi

Aşağıdaki şema, 17 sayısının 5'e ondalıklı bölümünü özetler.

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 10pt, y: 20pt),
  )[
    #align(center)[
      #grid(
        columns: (auto, 70pt, auto, auto),
        rows: (auto, auto, auto),
        column-gutter: 6pt,
        align: (right + horizon, center + horizon, center + horizon, center + horizon),
        grid.cell(x: 0, y: 0, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Bölünen →]),
        grid.cell(x: 1, y: 0, text(size: 24pt)[$17$]),
        grid.cell(x: 1, y: 1, line(length: 70pt, stroke: 1.5pt + rgb("#0f172a"))),
        grid.cell(x: 2, y: 1, text(size: 24pt)[$=$]),
        grid.cell(x: 3, y: 1, text(size: 24pt)[$3.4$]),
        grid.cell(x: 0, y: 2, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Bölen →]),
        grid.cell(x: 1, y: 2, text(size: 24pt)[$5$]),
        grid.cell(x: 3, y: 2, block(pad(top: 10pt, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Sonuç]))),
      )
    ]
  ],
  caption: [17'nin 5'e ondalıklı bölümü],
)

=== Bölme İşleminin Elemanları (Bölünen, Bölen, Bölüm ve Kalan)

Bir bölme işleminde yer alan dört temel terim (*Bölünen*, *Bölen*, *Bölüm* ve *Kalan*) ile matematiksel sağlaması ($17 = 5 times 3 + 2$) aşağıdaki klasik bölme algoritması şemasında gösterilmiştir:

#figure(
  block(
    width: 100%,
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    fill: rgb("#ffffff"),
    clip: true,
    breakable: false,
  )[
    // 1) Üst Başlık Bandı
    #block(
      width: 100%,
      fill: rgb("#16325c"),
      inset: (x: 14pt, y: 10pt),
    )[
      #align(center)[
        #text(weight: "bold", size: 11pt, fill: white)[Bölme İşleminin Temel Elemanları]
      ]
    ]

    #pad(x: 20pt, top: 18pt, bottom: 16pt)[
      #align(center)[
        #text(size: 9.5pt, weight: "bold", fill: rgb("#475569"))[Klasik Bölme Algoritması Şeması (17 ÷ 5)]
        #v(16pt)

        // Bölme Şeması Tablosu
        #box[
          #table(
            columns: (auto, auto),
            stroke: (x, y) => if x == 1 and y == 0 {
              (left: 2.2pt + rgb("#334155"), bottom: 2.2pt + rgb("#334155"))
            } else if x == 1 and y == 1 {
              (left: 2.2pt + rgb("#334155"))
            } else {
              none
            },
            inset: (x, y) => if x == 0 and y == 0 {
              (right: 8pt, bottom: 10pt, left: 14pt, top: 6pt)
            } else if x == 1 and y == 0 {
              (left: 8pt, bottom: 10pt, right: 14pt, top: 6pt)
            } else if x == 0 and y == 1 {
              (right: 8pt, top: 10pt, left: 14pt, bottom: 8pt)
            } else {
              (left: 8pt, top: 10pt, right: 14pt, bottom: 8pt)
            },
            align: (x, y) => if x == 0 { right + top } else { left + top },

            // --- SOL ÜST: Bölünen solda, 17 dikey çizgiye bitişik ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 14pt, weight: "bold", fill: rgb("#1d4ed8"))[Bölünen],
                text(size: 26pt, weight: "bold", fill: rgb("#1d4ed8"))[17],
              )
            ],

            // --- SAĞ ÜST: 5 dikey çizgiye bitişik, Bölen sağda ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 26pt, weight: "bold", fill: rgb("#dc2626"))[5],
                text(size: 14pt, weight: "bold", fill: rgb("#dc2626"))[Bölen],
              )
            ],

            // --- SOL ALT: - 15 ve 2 dikey çizgiye bitişik, Kalan solda ---
            [
              #align(right)[
                #grid(
                  columns: (auto, auto),
                  gutter: 4pt,
                  align: horizon,
                  text(size: 18pt, weight: "bold", fill: rgb("#64748b"))[−],
                  text(size: 26pt, weight: "bold", fill: rgb("#64748b"))[15],
                )
                #v(-3pt)
                #line(length: 46pt, stroke: 1.5pt + rgb("#64748b"))
                #v(4pt)
                #grid(
                  columns: (auto, auto),
                  gutter: 14pt,
                  align: horizon,
                  text(size: 14pt, weight: "bold", fill: rgb("#d97706"))[Kalan],
                  text(size: 26pt, weight: "bold", fill: rgb("#d97706"))[2],
                )
              ]
            ],

            // --- SAĞ ALT: 3 dikey çizgiye bitişik, Bölüm sağda ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 26pt, weight: "bold", fill: rgb("#7e22ce"))[3],
                text(size: 14pt, weight: "bold", fill: rgb("#7e22ce"))[Bölüm],
              )
            ],
          )
        ]
      ]

      #v(18pt)

      // Alt Bilgi Bandı: Matematiksel Denklem ve Altın Kural (17 ve 5 ile)
      #block(
        width: 100%,
        fill: rgb("#f1f5f9"),
        stroke: 1pt + rgb("#cbd5e1"),
        radius: 6pt,
        inset: (x: 12pt, y: 10pt),
      )[
        #grid(
          columns: (1.2fr, 1fr),
          gutter: 14pt,
          align: horizon,
          [
            #align(center)[
              #text(size: 8.5pt, weight: "bold", fill: rgb("#475569"))[Bölme İşleminin Matematiksel Sağlaması:]
              #v(3pt)
              #text(size: 12pt, weight: "bold", fill: rgb("#0f172a"))[
                $ "Bölünen" = ("Bölen" times "Bölüm") + "Kalan" $
              ]
              #v(2pt)
              #text(size: 10.5pt, fill: rgb("#1d4ed8"), weight: "bold")[
                $ 17 = (5 times 3) + 2 $
              ]
            ]
          ],
          [
            #block(
              fill: white,
              stroke: 1pt + rgb("#e2e8f0"),
              radius: 5pt,
              inset: (x: 10pt, y: 8pt),
            )[
              #text(size: 8pt, weight: "bold", fill: rgb("#0f172a"))[💡 Unutmayınız (Altın Kural):]
              #v(2pt)
              #text(size: 7.5pt, fill: rgb("#334155"))[
                Bir bölme işleminde *kalan* daima sıfır veya sıfırdan büyük, ancak *bölenden kesinlikle küçük* olmak zorundadır:
              ]
              #v(3pt)
              #align(center)[
                #text(size: 9.5pt, weight: "bold", fill: rgb("#d97706"))[
                  $ 0 <= "Kalan" < "Bölen" quad (0 <= 2 < 5) $
                ]
              ]
            ]
          ]
        )
      ]
    ]
  ],
  caption: [Bölme işleminin temel elemanları (Bölünen, Bölen, Bölüm, Kalan)],
)

#include "bolme-islemi.typ"