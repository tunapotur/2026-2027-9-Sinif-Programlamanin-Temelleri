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
  boyut: 10pt,                 // tablo gövdesindeki yazı boyutu
  baslik-boyut: auto,          // tablo üst başlığı ve sütun başlıkları boyutu
  baslik_boyut: auto,          // snake_case alternatifi
  sutun_baslik_boyut: auto,    // sütun başlıklarına özel boyut
  tablo_baslik_boyut: auto,    // tablo üst başlığına özel boyut
  bolunebilir: false,          // true: tablo sayfa sonunda bölünebilir
  hucre_bosluk: auto,          // hücre içi genel boşluk (örn: 5pt veya (x: 4pt, y: 2pt))
  hucre-bosluk: auto,
  inset: auto,                 // Typst table standart inset parametresi
  dikey_bosluk: auto,          // hücre içi dikey boşluk (y)
  dikey-bosluk: auto,
  yatay_bosluk: auto,          // hücre içi yatay boşluk (x)
  yatay-bosluk: auto,
  satir_yuksekligi: auto,      // satır yükseklikleri (rows parametresi)
  satir-yuksekligi: auto,
  rows: auto,                  // Typst table rows parametresi
  ..satirlar,
) = {
  // Ortak başlık boyutu (baslik-boyut veya baslik_boyut)
  let ortak_baslik = if baslik_boyut != auto {
    baslik_boyut
  } else if baslik-boyut != auto {
    baslik-boyut
  } else {
    none
  }

  // Sütun başlıkları yazı boyutu: sutun_baslik_boyut -> baslik-boyut -> boyut
  let s_baslik_boyut = if sutun_baslik_boyut != auto {
    sutun_baslik_boyut
  } else if ortak_baslik != none {
    ortak_baslik
  } else {
    boyut
  }

  // Tablo üst başlığı yazı boyutu: tablo_baslik_boyut -> baslik-boyut -> 10pt
  let t_baslik_boyut = if tablo_baslik_boyut != auto {
    tablo_baslik_boyut
  } else if ortak_baslik != none {
    ortak_baslik
  } else {
    10pt
  }

  // Hücre içi boşluk (inset) hesaplama
  let g_inset = if inset != auto {
    inset
  } else if hucre_bosluk != auto {
    hucre_bosluk
  } else if hucre-bosluk != auto {
    hucre-bosluk
  } else {
    none
  }

  let g_dikey = if dikey_bosluk != auto {
    dikey_bosluk
  } else if dikey-bosluk != auto {
    dikey-bosluk
  } else {
    none
  }

  let g_yatay = if yatay_bosluk != auto {
    yatay_bosluk
  } else if yatay-bosluk != auto {
    yatay-bosluk
  } else {
    none
  }

  let efektif_inset = if g_dikey != none or g_yatay != none {
    let varsayilan_x = if type(g_inset) == dictionary and "x" in g_inset {
      g_inset.x
    } else if type(g_inset) == dictionary and "left" in g_inset {
      g_inset.left
    } else if g_inset != none and type(g_inset) != dictionary {
      g_inset
    } else {
      6pt
    }

    let varsayilan_y = if type(g_inset) == dictionary and "y" in g_inset {
      g_inset.y
    } else if type(g_inset) == dictionary and "top" in g_inset {
      g_inset.top
    } else if g_inset != none and type(g_inset) != dictionary {
      g_inset
    } else {
      6pt
    }

    (
      x: if g_yatay != none { g_yatay } else { varsayilan_x },
      y: if g_dikey != none { g_dikey } else { varsayilan_y },
    )
  } else if g_inset != none {
    g_inset
  } else {
    6pt
  }

  let efektif_rows = if rows != auto {
    rows
  } else if satir_yuksekligi != auto {
    satir_yuksekligi
  } else if satir-yuksekligi != auto {
    satir-yuksekligi
  } else {
    auto
  }

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
      table.cell(align: hucre-hizala(baslik_hiz, col))[#text(size: s_baslik_boyut, weight: "bold")[#b]]
    })),)
  } else {
    ()
  }

  align(center)[
    #block(breakable: bolunebilir)[
      #if tablo_baslik != none and tablo_baslik != "" [
        #block(below: 6pt)[#text(size: t_baslik_boyut, weight: "bold")[#tablo_baslik]]
      ]
      #text(size: boyut)[
        #table(
          columns: sutunlar,
          rows: efektif_rows,
          fill: (x, y) => if y == 0 and sutun_basliklari.len() > 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: icerik_hiz,
          inset: efektif_inset,
          ..baslik-hucreleri,
          ..satirlar,
        )
      ]
    ]
  ]
}


