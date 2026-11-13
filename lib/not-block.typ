#let not_block(body, title: "Not:", width: 100%, boyut: 10pt) = {
  block(
    fill: rgb("#eff6ff"),
    stroke: (left: 3pt + rgb("#3b82f6")),
    inset: (x: boyut, y: boyut * 0.8),
    radius: (right: 3pt),
    width: width,
  )[
    #set text(size: boyut)
    #if title != "" [*#title* ]
    #body
  ]
}

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
