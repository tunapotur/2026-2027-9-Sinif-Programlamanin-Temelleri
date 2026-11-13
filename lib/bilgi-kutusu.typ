#import "@preview/showybox:2.0.4": showybox

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
