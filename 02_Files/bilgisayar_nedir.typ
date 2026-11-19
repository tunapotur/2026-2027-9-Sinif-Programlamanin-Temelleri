#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
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

