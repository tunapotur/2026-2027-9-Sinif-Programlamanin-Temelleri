#import "@preview/showybox:2.0.4": showybox


// General Configuration
#let conf(doc) = [
 #set page(
  paper: "a4",
  margin:(top:1.5cm, left:2cm, bottom: 1cm, right: 1.5cm),
  number-align: right
  )
  
  #set text(
  font: "Noto Sans", 
  size: 10pt,
  lang:"tr",
  )

  #set par(
  leading: 0.8em,  // satır aralığına eklenecek boşluk
  spacing: 1.2em,   // paragraflar arası boşluk
  // justify:true,
)
  
  #set heading(numbering: "1.1.1.1.")
  // #show heading: upper
  #show heading: set block(below: 1em)
  #show heading.where(level: 1): set text(size:18pt)
  #show heading.where(level: 2): set text(size:16pt)
  #show heading.where(level: 3): set text(size:14pt)
  // #show heading.where(level: 4): set text(size:12pt,fill: rgb("#8B0000"))
  #show heading.where(level: 4): set text(size:12pt)

  #set list(spacing: 0.75em)

  #show title: set text(size:22pt, fill:blue, weight: "bold")

  // #show outline: upper

  #doc
]

#let bilgi-kutusu(baslik, govde) = showybox(
  title: baslik,

  frame: (
    title-color: black.lighten(40%),
    body-color: white,
    border-color: black,
    thickness: 0.8pt,
    radius: 3pt,
    title-inset: (x: 1em, y: 0.55em),
    body-inset: (x: 1em, y: 0.8em),
  ),

  title-style: (
    color: white,
    weight: "bold",
    align: start,
    sep-thickness: 0.8pt,
  ),

  body-style: (
    color: black,
    align: start,
  ),

  breakable: true,
  above: 1em,
  below: 1em,

  shadow: (
    offset: 2pt,
  ),
)[
  #govde
]

#let ders-notu(
  body,
  ust-bosluk: 1em,
  alt-bosluk: 1em,
) = {
  v(ust-bosluk)
  text(
    weight: "bold",
    fill: red,
    size: 14pt,
  )[✱ #body]
  v(alt-bosluk)
}

#let ornek_baslik(body,
  ust-bosluk: 1em,
  alt-bosluk: 0em) = {
    v(ust-bosluk)
    text(weight: "bold", fill: rgb("#8B0000"))[#body]
    v(alt-bosluk)
}

// Table
#let table_HeaderFillColor = rgb("#70ad47")
#let table_Stroke = rgb("#9bc67e")
#let table_headerCell(body) = table.cell(fill: table_HeaderFillColor, align: center + horizon)[
  #text(fill: white, weight: "bold")[#body]
]
#let table_dataCell_middle(body) = table.cell(align: center + horizon)[#body]
#let table_dataCell_left(body) = table.cell(align: left + horizon)[#body]

// Akış şeması sembolleri
#let terminal-sembolu = ellipse(
  width: 1.8cm,
  height: 0.8cm,
  fill: white,
  stroke: 1pt + black,
)

#let giris-cikis-sembolu = polygon(
  fill: white,
  stroke: 1pt + black,
  (20%, 0pt),
  (100%, 0pt),
  (80%, 0.9cm),
  (0%, 0.9cm),
)

#let islem-sembolu = rect(
  width: 1.8cm,
  height: 0.9cm,
  fill: white,
  stroke: 1pt + black,
)

#let karar-sembolu = polygon(
  fill: white,
  stroke: 1pt + black,
  (50%, 0pt),
  (100%, 0.9cm),
  (50%, 1.8cm),
  (0%, 0.9cm),
)

#let akis-sembolu = text(size: 25pt)[→]

#let output-box(title: "Ekran Çıktısı", content) = {
  block(
    fill: rgb("#F1F5F9"),
    stroke: (left: 3pt + rgb("#16A34A")),
    inset: 12pt,
    radius: 5pt,
    width: 100%,
  )[
    #text(size: 9pt, weight: "bold", fill: rgb("#166534"))[
      #title
    ]

    #v(6pt)

    #block(
      fill: white,
      inset: 10pt,
      radius: 3pt,
      width: 100%,
    )[
      #set text(
        font: "DejaVu Sans Mono",
        size: 9pt,
        fill: rgb("#1E293B"),
      )
      #content
    ]
  ]
}

#let not_block(body, title: "Not:",width:100%) = {
  block(
    fill: rgb("#eff6ff"),
    stroke: (left: 3pt + rgb("#3b82f6")),
    inset: (x: 10pt, y: 8pt),
    radius: (right: 3pt),
    width: width,
  )[

    #if title != "" [*#title* ]
    #body
  ]
}

#let kod-blok(body, width:auto) = {
  // Satır numaralandırma kuralı
  show raw.line: it => {
    box(width: 2em, align(right, text(fill: luma(120), str(it.number))))
    h(1em)
    it.body
  }

  // Blok görünümü (GitHub stilinde açık gri arka plan ve çerçeve)
  show raw.where(block: true): set block(
    fill: rgb("#f6f8fa"),
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + rgb("#d0d7de"),
    width: width
  )

  body
}

#let kod-satiri(kod, no: none, size: 10pt, weight: "regular", width: auto) = {
  // Yazı boyutu ve kalınlığını bloğa uygula
  set text(size: size, weight: weight)

  // Satır numaralandırma kuralı
  show raw.line: it => {
    if no != none and no != 0 {
      box(width: 2.2em, align(right, text(fill: luma(120), weight: "regular", str(no))))
      h(1em)
    }
    it.body
  }

  // Tek satırlık blok görünümü
  show raw.where(block: true): set block(
    fill: rgb("#f6f8fa"),
    inset: (x: 10pt, y: 7pt),
    radius: 4pt,
    stroke: 0.5pt + rgb("#d0d7de"),
    width: width,
  )

  kod
}

#let ram-renkleri = (
  "int": rgb("#2563eb"),
  "float": rgb("#ea580c"),
  "double": rgb("#dc2626"),
  "bool": rgb("#16a34a"),
  "char": rgb("#9333ea"),
)

#let ram-goster = (tip, kod, bitler, aciklama: none) => {
  let bit-listesi = bitler.replace(" ", "").clusters()

  assert(
    bit-listesi.len() > 0 and calc.rem(bit-listesi.len(), 8) == 0,
    message: "bitler uzunluğu 8'in katı olmalı, şu an: " + str(bit-listesi.len()),
  )

  let byte-sayisi = calc.quo(bit-listesi.len(), 8)
  let renk = ram-renkleri.at(tip, default: rgb("#475569"))

  // Üst satır: veri tipi etiketi ve byte sayısı
  let baslik = grid(
    columns: (auto, 1fr),
    align: (left + horizon, right + horizon),
    box(
      fill: renk,
      radius: 3pt,
      inset: (x: 7pt, y: 3pt),
      text(size: 10pt, weight: "bold", fill: white)[#tip],
    ),
    text(size: 9pt, weight: "bold", fill: renk)[#byte-sayisi byte],
  )

  // Değişken atama kodu
  let kod-kutusu = block(
    width: 100%,
    fill: luma(246),
    radius: 4pt,
    inset: (x: 8pt, y: 6pt),
    raw(kod, lang: "c"),
  )

  // Tek bir bit kutusu: 1 koyu ve renkli, 0 sade
  let bit-kutusu = b => rect(
    width: 100%,
    height: 0.7cm,
    inset: 0pt,
    radius: 3pt,
    stroke: none,
    fill: if b == "1" { renk.lighten(82%) } else { luma(245) },
  )[
    #align(center + horizon)[
      #text(
        size: 9.5pt,
        weight: if b == "1" { "bold" } else { "regular" },
        fill: if b == "1" { renk.darken(35%) } else { luma(110) },
      )[#b]
    ]
  ]

  // Tablo: her satır 1 byte, solda byte numarası
  let tablo = grid(
    columns: (1.6cm,) + (1fr,) * 8,
    gutter: 3pt,
    ..range(byte-sayisi)
      .map(i => (
        align(left + horizon, text(size: 8pt, fill: luma(130))[#(i + 1). byte]),
        ..bit-listesi.slice(i * 8, i * 8 + 8).map(bit-kutusu),
      ))
      .flatten(),
  )

  // İsteğe bağlı açıklama
  let alt = if aciklama != none {
    (text(size: 8.5pt, fill: luma(110))[#aciklama],)
  } else {
    ()
  }

  block(
    breakable: false,
    width: 100%,
    inset: 10pt,
    radius: 6pt,
    stroke: 0.6pt + luma(215),
    stack(dir: ttb, spacing: 8pt, baslik, kod-kutusu, tablo, ..alt),
  )
}
