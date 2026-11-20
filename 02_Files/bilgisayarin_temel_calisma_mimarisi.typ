#import "@preview/fletcher:0.5.8": diagram, node, edge

#let bnm-renk = (
  giris: rgb("#16a34a"),
  bellek: rgb("#d97706"),
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

#block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 8pt,
  clip: true,
  breakable: false,
)[
  #block(
    width: 100%,
    inset: (x: 6pt, top: 12pt, bottom: 0pt),
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
        fill: rgb("#fffbeb"),
        stroke: 1.5pt + bnm-renk.bellek,
        corner-radius: 6pt,
        inset: 7pt,
      )[#align(center)[
        #text(size: 9.5pt, weight: "bold", fill: bnm-renk.bellek.darken(30%))[BELLEK BİRİMİ (RAM)]
        #v(1pt)
        #text(size: 6.6pt, weight: "bold", fill: rgb("#92400e"))[Komutlar • Veriler • Ara Sonuçlar]
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
  ]

  #block(
    width: 100%,
    fill: gradient.linear(rgb("#16325c"), rgb("#0f766e"), angle: 0deg),
    inset: (x: 12pt, y: 8pt),
  )[
    #set par(spacing: 0pt, leading: 0.65em)
    #text(size: 7.4pt, fill: white)[
      Giriş biriminden gelen veriler önce *belleğe (RAM)* yazılır; *işlemci (CPU)* çalıştıracağı komutu ve işleyeceği veriyi bellekten okur, sonucu tekrar belleğe yazar. Bellekteki işlenmiş sonuçlar *çıkış birimine* gönderilir.
    ]
  ]
]
