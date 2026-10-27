#import "@preview/cades:0.3.1": qr-code

#let kare-kod-hucresi(baslik, url, gorunen) = align(center, stack(
  dir: ttb,
  spacing: 4pt,
  text(size: 8pt,weight: "bold")[#baslik],
  qr-code(url, width: 3cm),
  text(size: 8pt)[#link(url)[Bağlantıya tıklayın \ #gorunen]],
))

#let link-box(url:"", title: "Faydalı Bağlantı", desc: none) = {
  align(center)[
    #rect(
      width: 95%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      radius: 6pt,
      fill: rgb("#f8fafc"),
      inset: 12pt,
      [
        #grid(
          columns: (1fr, auto),
          gutter: 14pt,
          align: (left + horizon, center + horizon),
          
          // Sol Kolon: Başlık, Açıklama ve URL
          [
            #text(weight: "bold", size: 11.5pt)[#link(url)[#title]]

            #if desc != none [
              // #v(1pt)
              #text(fill: rgb("#475569"), size: 10pt)[#desc]
            ]

            // #v(3pt)
            #text(fill: rgb("#2563eb"), weight: "semibold", size: 11.5pt, tracking: 0.6pt)[#link(url)[#url]]
          ],

          // Sağ Kolon: QR Kod
          qr-code(url, width: 3cm)
        )
      ]
    )
  ]
}