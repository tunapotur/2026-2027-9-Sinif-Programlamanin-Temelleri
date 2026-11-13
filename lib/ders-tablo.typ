// Table yardımcı fonksiyonları ve stilleri
#let table_HeaderFillColor = rgb("#70ad47")
#let table_Stroke = rgb("#9bc67e")
#let table_headerCell(body) = table.cell(fill: table_HeaderFillColor, align: center + horizon)[
  #text(fill: white, weight: "bold")[#body]
]
#let table_dataCell_middle(body) = table.cell(align: center + horizon)[#body]
#let table_dataCell_left(body) = table.cell(align: left + horizon)[#body]

// Projedeki tablo stiliyle (gri başlık, zebra satır) başlıklı tablo
#let ders-tablosu(
  baslik, sutunlar, basliklar,
  hizalama: center + horizon,
  boyut: 10pt,          // tablo içindeki yazı boyutu
  baslik-boyut: 10pt,   // tablo başlığının (üstteki kalın yazı) boyutu
  bolunebilir: false,   // true: tablo sayfa sonunda bölünebilir
  ..satirlar,
) = align(center)[
  #block(breakable: bolunebilir)[
    #if baslik != none and baslik != "" [
      #block(below: 6pt)[#text(size: baslik-boyut)[*#baslik*]]
    ]
    #text(size: boyut)[
      #table(
        columns: sutunlar,
        fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
        stroke: 0.5pt + rgb("#cbd5e1"),
        align: hizalama,
        inset: 6pt,
        table.header(..basliklar.map(b => [*#b*])),
        ..satirlar,
      )
    ]
  ]
]
