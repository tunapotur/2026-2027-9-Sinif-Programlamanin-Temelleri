#import "@preview/cades:0.3.1": qr-code

#let kare-kod-hucresi(baslik, url, gorunen) = align(center, stack(
  dir: ttb,
  spacing: 4pt,
  text(size: 8pt,weight: "bold")[#baslik],
  qr-code(url, width: 2.5cm),
  text(size: 8pt)[#link(url)[Bağlantıya tıklayın \ #gorunen]],
))