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
