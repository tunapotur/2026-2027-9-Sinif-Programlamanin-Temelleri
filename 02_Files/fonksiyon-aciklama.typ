// Fonksiyon çağrısı açıklama şeması
// Kullanım: #fonksiyon-aciklama(degisken: "sonuc", ifade: "round(3.14159, 2)", deger: "3.14")

#let fonksiyon-aciklama(
  degisken: "sonuc",
  ifade: "round(3.14159, 2)",
  deger: "3.14",
  boyut: 26pt,
  renk: rgb("#5b21e6"),
  kod-fontu: ("JetBrains Mono", "DejaVu Sans Mono", "Liberation Mono"),
  etiket-fontu: ("Open Sans", "DejaVu Sans", "Liberation Sans"),
) = context {
  // measure() için de aynı biçimi kullanmak şart: context içindeki `set` ölçüme etki etmez
  let kod(s) = text(font: kod-fontu, size: boyut, s)

  let tam = degisken + " = " + ifade
  let w1 = measure(kod(degisken)).width
  let w2 = measure(kod(degisken + " = ")).width
  let w3 = measure(kod(tam)).width
  let h = measure(kod(tam)).height

  let k = 2pt // çizgi kalınlığı
  let cizgi = k + black
  let xd = w1 / 2 // değişkenin orta noktası
  let xc = w2 + (w3 - w2) / 2 // ifadenin (parantezin) orta noktası
  let u-ust = h + 12pt // U şeklinin üst kenarı
  let u-yuk = 30pt // U şeklinin yüksekliği

  let etiket = box(
    fill: white,
    inset: (x: 6pt, y: 2pt),
    text(font: etiket-fontu, weight: "bold", size: boyut * 0.7, deger),
  )
  let etiket-boyut = measure(etiket)

  box(width: w3, height: u-ust + u-yuk + 10pt, {
    // 1) Kod satırı
    place(top + left, kod(tam))

    // 2) İfadenin altındaki mor parantez
    place(top + left, dx: w2, dy: h + 2pt, rect(
      width: w3 - w2,
      height: 10pt,
      stroke: (left: k + renk, right: k + renk, bottom: k + renk),
      radius: (bottom: 8pt),
    ))

    // 3) Parantezin ortasından değişkene giden U şeklindeki yol
    place(top + left, dx: xd, dy: u-ust, rect(
      width: xc - xd,
      height: u-yuk,
      stroke: (left: cizgi, right: cizgi, bottom: cizgi),
      radius: (bottom: 10pt),
    ))

    // 4) Değişkene çıkan kısa çizgi ve ok ucu
    place(top + left, dx: xd, dy: h + 10pt, line(angle: 90deg, length: 4pt, stroke: cizgi))
    place(top + left, dx: xd - 5pt, dy: h + 1pt, polygon(
      fill: black,
      stroke: none,
      (5pt, 0pt),
      (10pt, 10pt),
      (0pt, 10pt),
    ))

    // 5) Sonuç etiketi (yatay çizginin üstüne oturur)
    place(top + left,
      dx: (xd + xc) / 2 - etiket-boyut.width / 2,
      dy: u-ust + u-yuk - etiket-boyut.height / 2,
      etiket,
    )
  })
}

#set page(width: auto, height: auto, margin: 12pt)

#fonksiyon-aciklama()
