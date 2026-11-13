#let _align = align

#let show-op(size: 14pt, weight: "semibold", body) = {
  text(size: size, weight: weight)[#raw(body.text)]
}

#let iki_hucreli_satir(
  columns: (2fr, 1fr),
  gutter: 10pt,
  align: horizon,
  sol,
  sag,
) = {
  block(breakable: false)[
    #grid(
      columns: columns,
      gutter: gutter,
      align: align,
      [
        #sol
      ],
      [
        #sag
      ],
    )
  ]
}

#let soru_bilgi(body, ust_bolluk: -0.75em) = text(size: 9pt, fill: luma(110))[
  #v(ust_bolluk)
  #body
]
