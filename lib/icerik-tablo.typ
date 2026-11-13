// Table yardımcı fonksiyonları ve stilleri
#let table_HeaderFillColor = rgb("#70ad47")
#let table_Stroke = rgb("#9bc67e")
#let table_headerCell(body) = table.cell(fill: table_HeaderFillColor, align: center + horizon)[
  #text(fill: white, weight: "bold")[#body]
]
#let table_dataCell_middle(body) = table.cell(align: center + horizon)[#body]
#let table_dataCell_left(body) = table.cell(align: left + horizon)[#body]

// Projedeki tablo stiliyle (gri başlık, zebra satır) başlıklı tablo
#let icerik-tablo(
  tablo_baslik: none,
  sutunlar: auto,
  sutun_basliklari: (),
  icerik_hizalama: none,
  sutun_baslik_hizalama: none,
  boyut: 10pt,          // tablo içindeki yazı boyutu
  baslik-boyut: 10pt,   // tablo başlığının (üstteki kalın yazı) boyutu
  bolunebilir: false,   // true: tablo sayfa sonunda bölünebilir
  ..satirlar,
) = {
  let baslik_hiz = if sutun_baslik_hizalama != none {
    sutun_baslik_hizalama
  } else if icerik_hizalama != none {
    icerik_hizalama
  } else {
    center + horizon
  }

  let icerik_hiz = if icerik_hizalama != none {
    icerik_hizalama
  } else {
    center + horizon
  }

  let hucre-hizala(hiz, col) = {
    if type(hiz) == array {
      hiz.at(calc.rem(col, hiz.len()))
    } else {
      hiz
    }
  }

  let baslik-hucreleri = if sutun_basliklari.len() > 0 {
    (table.header(..sutun_basliklari.enumerate().map(((col, b)) => {
      table.cell(align: hucre-hizala(baslik_hiz, col))[#text(weight: "bold")[#b]]
    })),)
  } else {
    ()
  }

  align(center)[
    #block(breakable: bolunebilir)[
      #if tablo_baslik != none and tablo_baslik != "" [
        #block(below: 6pt)[#text(size: baslik-boyut)[*#tablo_baslik*]]
      ]
      #text(size: boyut)[
        #table(
          columns: sutunlar,
          fill: (x, y) => if y == 0 and sutun_basliklari.len() > 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: icerik_hiz,
          inset: 6pt,
          ..baslik-hucreleri,
          ..satirlar,
        )
      ]
    ]
  ]
}


