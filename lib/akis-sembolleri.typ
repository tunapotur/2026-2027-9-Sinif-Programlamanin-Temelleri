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
