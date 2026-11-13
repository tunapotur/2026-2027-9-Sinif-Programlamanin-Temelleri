#let ram-renkleri = (
  "int": rgb("#2563eb"),
  "float": rgb("#ea580c"),
  "double": rgb("#dc2626"),
  "bool": rgb("#16a34a"),
  "char": rgb("#9333ea"),
)

#let ram-goster = (tip, kod, bitler, aciklama: none) => {
  let bit-listesi = bitler.replace(" ", "").clusters()

  assert(
    bit-listesi.len() > 0 and calc.rem(bit-listesi.len(), 8) == 0,
    message: "bitler uzunluğu 8'in katı olmalı, şu an: " + str(bit-listesi.len()),
  )

  let byte-sayisi = calc.quo(bit-listesi.len(), 8)
  let renk = ram-renkleri.at(tip, default: rgb("#475569"))

  // Üst satır: veri tipi etiketi ve byte sayısı
  let baslik = grid(
    columns: (auto, 1fr),
    align: (left + horizon, right + horizon),
    box(
      fill: renk,
      radius: 3pt,
      inset: (x: 7pt, y: 3pt),
      text(size: 10pt, weight: "bold", fill: white)[#tip],
    ),
    text(size: 9pt, weight: "bold", fill: renk)[#byte-sayisi byte],
  )

  // Değişken atama kodu
  let kod-kutusu = block(
    width: 100%,
    fill: luma(246),
    radius: 4pt,
    inset: (x: 8pt, y: 6pt),
    raw(kod, lang: "c"),
  )

  // Tek bir bit kutusu: 1 koyu ve renkli, 0 sade
  let bit-kutusu = b => rect(
    width: 100%,
    height: 0.7cm,
    inset: 0pt,
    radius: 3pt,
    stroke: none,
    fill: if b == "1" { renk.lighten(82%) } else { luma(245) },
  )[
    #align(center + horizon)[
      #text(
        size: 9.5pt,
        weight: if b == "1" { "bold" } else { "regular" },
        fill: if b == "1" { renk.darken(35%) } else { luma(110) },
      )[#b]
    ]
  ]

  // Tablo: her satır 1 byte, solda byte numarası
  let tablo = grid(
    columns: (1.6cm,) + (1fr,) * 8,
    gutter: 3pt,
    ..range(byte-sayisi)
      .map(i => (
        align(left + horizon, text(size: 8pt, fill: luma(130))[#(i + 1). byte]),
        ..bit-listesi.slice(i * 8, i * 8 + 8).map(bit-kutusu),
      ))
      .flatten(),
  )

  // İsteğe bağlı açıklama
  let alt = if aciklama != none {
    (text(size: 8.5pt, fill: luma(110))[#aciklama],)
  } else {
    ()
  }

  block(
    breakable: false,
    width: 100%,
    inset: 10pt,
    radius: 6pt,
    stroke: 0.6pt + luma(215),
    stack(dir: ttb, spacing: 8pt, baslik, kod-kutusu, tablo, ..alt),
  )
}
