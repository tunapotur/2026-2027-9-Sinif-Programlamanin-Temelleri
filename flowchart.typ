#import "@preview/fletcher:0.5.8": diagram, node, edge, shapes

#let flowchart_width = 120pt

// Flowchart
#let color_baslangic = (fill: rgb("#e6d6ff"), stroke: rgb("#9673a6"))
#let color_tanim = (fill: rgb("#ffffcc"), stroke: rgb("#a3a35c"))
#let color_cikti = (fill: rgb("#d5f5d0"), stroke: rgb("#82b366"))
#let color_girdi = (fill: rgb("#cce5ff"), stroke: rgb("#6c8ebf"))
#let color_karar = (fill: rgb("#f8d7d7"), stroke: rgb("#d9534f"))
#let color_dongu = (fill: rgb("#fce5cd"), stroke: rgb("#c27ba0"))

#let baslangic(position, metin, width: 60pt) = node(
  position,
  metin,
  shape: shapes.pill,
  fill: color_baslangic.fill,
  stroke: color_baslangic.stroke + 1pt,
  width: width,
)

#let islem(position, metin, width: flowchart_width) = node(
  position,
  metin,
  shape: shapes.rect,
  fill: color_tanim.fill,
  stroke: color_tanim.stroke + 1pt,
  width: width,
)

#let cikti(position, metin, width: flowchart_width) = node(
  position,
  metin,
  shape: shapes.parallelogram,
  fill: color_cikti.fill,
  stroke: color_cikti.stroke + 1pt,
  width: width,
)

#let girdi(position, metin, width: flowchart_width) = node(
  position,
  metin,
  shape: shapes.parallelogram,
  fill: color_girdi.fill,
  stroke: color_girdi.stroke + 1pt,
  width: width,
)

#let karar(position, metin, width: 96pt, height: 48pt) = node(
  position,
  metin,
  shape: shapes.diamond,
  fill: color_karar.fill,
  stroke: color_karar.stroke + 1pt,
  width: width,
  height: height,
)

#let birlesim(position, width: 12pt, height: 12pt) = node(
  position,
  [],
  shape: circle,
  fill: luma(225),
  stroke: luma(120) + 1pt,
  width: width,
  height: height,
  inset: 0pt,
)

#let dongu-altigen(position, metin, width: 110pt, height: 34pt) = node(
  position,
  metin,
  shape: shapes.hexagon,
  fill: rgb("#fce5cd"),
  stroke: rgb("#d5a6bd") + 1.2pt,
  width: width,
  height: height,
)

// Flowgorithm Konsol Çıktı Baloncuğu
#let flow-konsol-baloncuk(metin, width: flowchart_width, height: 24pt) = {
  let fill_color = rgb("#d5f5d0")   // Açık yeşil dolgu
  let stroke_color = rgb("#528d58") // Koyu yeşil kenarlık

  box(width: width + 8pt, height: height)[
    #place(top + left)[
      #polygon(
        fill: fill_color,
        stroke: stroke_color + 0.8pt,
        // Baloncuğun sol çıkıntılı üçgen kuyruğu ve gövdesi
        (8pt, 0pt),
        (width + 8pt, 0pt),
        (width + 8pt, height),
        (8pt, height),
        (8pt, 16pt),
        (0pt, 12pt),
        (8pt, 8pt),
      )
    ]
    #place(
      top + left,
      dx: 16pt,
      dy: 6pt,
      text(size: 10.5pt, fill: rgb("#1b3b1e"))[#metin]
    )
  ]
}

// Konsol çıktılarının alt alta listelenmesi
#let flow-konsol-ciktilari(..mesajlar) = {
  stack(
    dir: ttb,
    spacing: 7pt,
    ..mesajlar.pos().map(m => flow-konsol-baloncuk(m))
  )
}