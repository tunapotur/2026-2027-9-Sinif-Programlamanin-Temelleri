// #set page(width: auto, height: auto, margin: 12pt)
#set text(font: "New Computer Modern", lang: "tr")

// Renkler
#let color_bolunen = (fill: rgb("#cce5ff"), stroke: rgb("#6c8ebf"))
#let color_bolen = (fill: rgb("#e6d6ff"), stroke: rgb("#9673a6"))
#let color_bolum = (fill: rgb("#d5f5d0"), stroke: rgb("#82b366"))
#let color_kalan = (fill: rgb("#ffffcc"), stroke: rgb("#a3a35c"))
#let color_sonuc = (fill: rgb("#ffe6cc"), stroke: rgb("#d79b00"))

// Etiket kutusu
#let etiket(renk, metin) = box(
  fill: renk.fill,
  stroke: renk.stroke + 1pt,
  radius: 4pt,
  inset: (x: 9pt, y: 5pt),
  text(size: 11pt, weight: "bold", metin),
)

// Okla birlikte etiket (sol taraf: etiket →, sağ taraf: ← etiket)
#let etiket-sol(renk, metin) = grid(
  columns: 2,
  column-gutter: 5pt,
  align: horizon,
  etiket(renk, metin), text(size: 14pt, sym.arrow.r),
)
#let etiket-sag(renk, metin) = grid(
  columns: 2,
  column-gutter: 5pt,
  align: horizon,
  text(size: 14pt, sym.arrow.l), etiket(renk, metin),
)

// Sayı kutusu (kutulu: false ise kutu görünmez ama boyutu aynı kalır)
#let sayi(renk, metin, kalin: true, kutulu: true) = box(
  fill: if kutulu { renk.fill } else { none },
  stroke: if kutulu { renk.stroke + 1pt } else { none },
  radius: 3pt,
  inset: (x: 9pt, y: 6pt),
  text(size: 20pt, weight: if kalin { "bold" } else { "regular" }, metin),
)

#let bolme-sekli(bolunen, bolen, bolum, kalan) = {
  let cikarilan = bolen * bolum
  let cizgi = 1.5pt
  let ic(l: 0pt, r: 0pt) = (left: l, right: r, top: 5pt, bottom: 5pt)

  grid(
    columns: (auto, auto, auto, auto),
    align: horizon,

    // 1. satır
    grid.cell(inset: ic(r: 8pt), align(right, etiket-sol(color_bolunen)[Bölünen])),
    grid.cell(inset: ic(r: 12pt), align(right, sayi(color_bolunen, str(bolunen)))),
    grid.cell(
      stroke: (left: cizgi, bottom: cizgi),
      inset: ic(l: 12pt, r: 6pt),
      align(left, sayi(color_bolen, str(bolen))),
    ),
    grid.cell(inset: ic(l: 8pt), align(left, etiket-sag(color_bolen)[Bölen])),

    // 2. satır
    [],
    grid.cell(inset: ic(r: 12pt))[
      // eksi işareti: alttaki kalın çizginin sol ucunun biraz sol üstünde
      #place(left + bottom, dx: -18pt, dy: 4pt, text(size: 20pt)[$-$])
      #align(right, sayi(color_bolunen, str(cikarilan), kalin: false, kutulu: false))
    ],
    grid.cell(
      stroke: (left: cizgi),
      inset: ic(l: 12pt, r: 6pt),
      align(left, sayi(color_bolum, str(bolum))),
    ),
    grid.cell(inset: ic(l: 8pt), align(left, etiket-sag(color_bolum)[Bölüm])),

    // 3. satır
    grid.cell(inset: ic(r: 8pt), align(right, etiket-sol(color_kalan)[Kalan])),
    grid.cell(
      stroke: (top: cizgi),
      inset: ic(r: 12pt),
      align(right, sayi(color_kalan, str(kalan))),
    ),
    [],
    [],
  )
}

#let ozdeslik(bolunen, bolen, bolum, kalan) = {
  set text(size: 16pt)
  [
    #text(fill: color_bolunen.stroke)[*Bölünen*] $=$
    #text(fill: color_bolen.stroke)[*Bölen*] $times$
    #text(fill: color_bolum.stroke.darken(20%))[*Bölüm*] $+$
    #text(fill: color_kalan.stroke.darken(10%))[*Kalan*]

    #v(2pt)

    #text(fill: color_bolunen.stroke)[*#bolunen*] $=$
    #text(fill: color_bolen.stroke)[*#bolen*] $times$
    #text(fill: color_bolum.stroke.darken(20%))[*#bolum*] $+$
    #text(fill: color_kalan.stroke.darken(10%))[*#kalan*]
  ]
}

// Python // ve % operatörleri açıklaması
#let mono = "DejaVu Sans Mono"
#let kod(renk, s) = text(font: mono, size: 16pt, weight: "bold", fill: renk, s)

#let python-aciklama(bolunen, bolen) = {
  let bolum = calc.quo(bolunen, bolen)
  let kalan = calc.rem(bolunen, bolen)
  let c_bolunen = color_bolunen.stroke
  let c_bolen = color_bolen.stroke
  let koyu = rgb("#333333")

  text(size: 14pt, weight: "bold")[Python'da aynı işlem]
  v(6pt)

  grid(
    columns: 5,
    column-gutter: 10pt,
    row-gutter: 12pt,
    align: (right + horizon, center + horizon, center + horizon, left + horizon, left + horizon),

    // //  -> bölüm
    [#kod(c_bolunen, str(bolunen)) #kod(koyu, "//") #kod(c_bolen, str(bolen))],
    text(size: 14pt, sym.arrow.r),
    sayi(color_bolum, str(bolum)),
    etiket(color_bolum)[Bölüm],
    text(size: 12pt)[tam sayı bölmesi: sadece bölümü verir],

    // %  -> kalan
    [#kod(c_bolunen, str(bolunen)) #kod(koyu, "%") #kod(c_bolen, str(bolen))],
    text(size: 14pt, sym.arrow.r),
    sayi(color_kalan, str(kalan)),
    etiket(color_kalan)[Kalan],
    text(size: 12pt)[mod alma: sadece kalanı verir],
  )

  v(10pt)

  box(
    fill: luma(245),
    stroke: luma(210) + 0.8pt,
    radius: 4pt,
    inset: 10pt,
    align(left, raw(
      lang: "python",
      block: true,
      "print(" + str(bolunen) + " // " + str(bolen) + ")   # " + str(bolum) + "\n"
        + "print(" + str(bolunen) + " % " + str(bolen) + ")    # " + str(kalan) + "\n"
        + "print(" + str(bolen) + " * (" + str(bolunen) + " // " + str(bolen) + ") + " + str(bolunen) + " % " + str(bolen) + ")   # " + str(bolunen),
    )),
  )
}

// Ondalıklı bölme: kesir çizgisi ile gösterim
#let kesir-sekli(bolunen, bolen) = {
  let sonuc = bolunen / bolen
  let cizgi = 1.5pt

  text(size: 14pt, weight: "bold")[Ondalıklı bölme (Python'da #raw("/"))]
  v(6pt)

  grid(
    columns: 3,
    align: horizon,

    grid.cell(
      inset: (right: 8pt, y: 5pt),
      align(right, etiket-sol(color_bolunen)[Bölünen]),
    ),
    grid.cell(
      stroke: (bottom: cizgi),
      inset: (x: 14pt, top: 5pt, bottom: 8pt),
      align(center, sayi(color_bolunen, str(bolunen))),
    ),
    grid.cell(
      rowspan: 2,
      inset: (left: 14pt),
      align(left + horizon, grid(
        columns: 3,
        column-gutter: 10pt,
        align: horizon,
        text(size: 22pt)[$=$],
        etiket-sol(color_sonuc)[Sonuç],
        text(size: 22pt, weight: "bold", str(sonuc)),
      )),
    ),

    grid.cell(
      inset: (right: 8pt, y: 5pt),
      align(right, etiket-sol(color_bolen)[Bölen]),
    ),
    grid.cell(
      inset: (x: 14pt, top: 8pt, bottom: 5pt),
      align(center, sayi(color_bolen, str(bolen))),
    ),
  )
}

#align(center)[
  #bolme-sekli(17, 5, 3, 2)

  #v(14pt)

  #ozdeslik(17, 5, 3, 2)

  #v(8pt)

  #text(size: 12pt)[Kural: #text(fill: color_kalan.stroke.darken(10%))[*Kalan*] her zaman #text(fill: color_bolen.stroke)[*Bölen*]'den küçüktür. $(2 < 5)$]

  #v(18pt)

  #python-aciklama(17, 5)

  #v(22pt)

  #kesir-sekli(17, 5)
]
