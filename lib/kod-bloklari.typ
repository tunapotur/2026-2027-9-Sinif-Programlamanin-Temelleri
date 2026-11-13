#let _align = align

#let output-box(title: "Ekran Çıktısı", width: 100%, content) = {
  block(
    fill: rgb("#F1F5F9"),
    stroke: (left: 3pt + rgb("#16A34A")),
    inset: (top: 8pt, x: 8pt, bottom: 5pt),
    radius: 3pt,
    width: width,
  )[
    #set block(spacing: 0pt)
    #set par(spacing: 0pt, leading: 0.7em)

    #text(size: 8pt, weight: "bold", fill: rgb("#166534"))[
      #title
    ]

    #v(6pt)

    #block(
      fill: white,
      inset: 8pt,
      radius: 3pt,
      width: 100%,
    )[
      #set text(
        font: "DejaVu Sans Mono",
        size: 9pt,
        fill: rgb("#1E293B"),
        top-edge: "cap-height",
        bottom-edge: "baseline",
      )
      #content
    ]
  ]
}

#let kod-blok(body, ilk-satir: 1, satir-no: true, width: auto) = {
  // Satır numaralandırma (kapatılabilir, başlangıç değeri ayarlanabilir)
  show raw.line: it => {
    if satir-no {
      let son = ilk-satir + it.count - 1
      box(
        width: str(son).len() * 0.6em,
        align(right, text(fill: luma(120), size: 0.85em, str(it.number + ilk-satir - 1))),
      )
      h(1em)
    }
    it.body
  }

  // Blok görünümü (GitHub stilinde açık gri arka plan ve çerçeve)
  show raw.where(block: true): set block(
    fill: rgb("#f6f8fa"),
    inset: 8pt,
    radius: 4pt,
    stroke: 0.5pt + rgb("#d0d7de"),
    width: width,
    breakable: false,
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

#let kod-cikti(
  baslik: none,
  baslik-yeri: "sol",   // "sol" veya "sag"
  columns: (auto, auto),
  gutter: 10pt,
  align: bottom,
  kod,
  cikti,
) = {
  let baslik-var = baslik != none and baslik != ""
  let baslik-icerik = if baslik-var { _align(center)[*#baslik*] } else { none }

  block(breakable: false)[
    #grid(
      columns: columns,
      gutter: gutter,
      align: align,
      [
        #if baslik-yeri == "sol" { baslik-icerik }
        #kod-blok(width: 100%)[#kod]
      ],
      [
        #if baslik-yeri == "sag" { baslik-icerik }
        #output-box[#cikti]
      ],
    )
  ]
}
