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
#let table_dataCell_left(body) = table.cell(align: left +horizon)[#body]

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

