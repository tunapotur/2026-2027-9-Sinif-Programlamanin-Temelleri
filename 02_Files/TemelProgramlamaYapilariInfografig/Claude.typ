#import "@preview/fletcher:0.5.8": diagram, node, edge, shapes

#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 8pt, lang: "tr")
#set par(leading: 0.45em, spacing: 0.5em)
#show raw: set text(font: "DejaVu Sans Mono", size: 7pt)

// Flowchart
#let color_baslangic = (fill: rgb("#e6d6ff"), stroke: rgb("#9673a6"))
#let color_tanim = (fill: rgb("#ffffcc"), stroke: rgb("#a3a35c"))
#let color_cikti = (fill: rgb("#d5f5d0"), stroke: rgb("#82b366"))
#let color_girdi = (fill: rgb("#cce5ff"), stroke: rgb("#6c8ebf"))

#let flowchart_width = 120pt

#let baslangic(position, metin) = node(position, metin, shape: shapes.pill, fill: color_baslangic.fill, stroke: color_baslangic.stroke + 1pt, width: 90pt)
#let islem(position, metin) = node(position, metin, shape: shapes.rect, fill: color_tanim.fill, stroke: color_tanim.stroke + 1pt, width: flowchart_width)
#let cikti(position, metin) = node(position, metin, shape: shapes.parallelogram, fill: color_cikti.fill, stroke: color_cikti.stroke + 1pt, width: flowchart_width)
#let girdi(position, metin) = node(position, metin, shape: shapes.parallelogram, fill: color_girdi.fill, stroke: color_girdi.stroke + 1pt, width: flowchart_width)

// ---------- Yardımcılar ----------
#let panel(num, title, c, body, hh: auto) = block(
  width: 100%, height: hh, breakable: false, radius: 4pt, clip: true,
  stroke: 0.8pt + c.stroke, fill: c.fill.lighten(55%),
)[
  #block(width: 100%, fill: c.stroke, inset: (x: 6pt, y: 3pt))[
    #text(white, weight: "bold", size: 8.5pt)[#num #h(2pt) #title]
  ]
  #block(inset: 5pt, width: 100%, body)
]

#let bits(s, size: 14pt) = grid(
  columns: range(s.len()).map(_ => size), column-gutter: 2pt,
  ..s.clusters().map(b => block(
    width: size, height: size, radius: 2pt,
    fill: if b == "1" { color_girdi.fill } else { white },
    stroke: 0.7pt + color_girdi.stroke,
  )[#align(center + horizon)[#text(weight: "bold", font: "DejaVu Sans Mono", b)]]),
)

#let state(on) = {
  let col = if on { color_cikti.fill } else { rgb("#e4e4e4") }
  let st = if on { color_cikti.stroke } else { rgb("#888888") }
  block(fill: col, stroke: 1pt + st, radius: 3pt, inset: 5pt, width: 100%)[
    #align(center)[
      #circle(radius: 8pt, fill: if on { rgb("#ffd54a") } else { rgb("#777777") }, stroke: st)[
        #align(center + horizon)[#text(weight: "bold", size: 10pt, fill: if on { black } else { white })[#if on { "1" } else { "0" }]]
      ]
      #v(1pt)
      #text(weight: "bold")[#if on { "AÇIK · Akım var" } else { "KAPALI · Akım yok" }] \
      #text(size: 6.5pt)[Base: #if on { "5V (HIGH)" } else { "0V (LOW)" }]
    ]
  ]
}

// ---------- Başlık ----------
#block(width: 100%, fill: rgb("#2b2d42"), radius: 5pt, inset: (x: 10pt, y: 9pt))[
  #grid(columns: (1fr, auto), align: horizon,
    [
      #text(white, weight: "bold", size: 15pt)[Bilgisayarın Dili: Transistörden Programlamaya] \
      #v(2pt)#text(rgb("#c9c9e0"), size: 7.5pt)[1.1 Değişkenler, Sabitler ve Veri Türleri · Programlamanın Temelleri]
    ],
    text(white, size: 20pt, weight: "bold", font: "DejaVu Sans Mono")[1011],
  )
]
#v(8pt)

// ---------- 1. Transistör ----------
#panel("1", "Transistör, Bit ve Byte", color_baslangic)[
  #grid(columns: (1fr, 1fr, 1.7fr), column-gutter: 6pt, align: horizon,
    state(true),
    state(false),
    [
      #align(center)[
        #bits("01000001") \
        #v(1pt)
        #text(weight: "bold")[8 Bit = 1 Byte] #sym.arrow.r #text(weight: "bold")["A" harfi (65)] \
        #text(size: 6.5pt)[2#super[8] = 256 farklı durum (0–255)]
      ]
    ],
  )
  #v(2pt)
  #text(size: 7pt)[*Transistör* akımı geçirerek ya da keserek *1* veya *0* üretir; en küçük bilgi birimi *Bit*'tir. İşlemci ve hafızada milyarlarca transistör bulunur. Yazılım, video, oyun ve metin; fiziksel olarak yalnızca 1 ve 0'lardan ibarettir.]
]
#v(8pt)

// ---------- 2 & 3: Hex ve ASCII ----------
#grid(columns: (1fr, 1fr), column-gutter: 6pt,
  panel("2", "4 Bit = 1 Hex Basamağı", color_girdi, hh: 118pt)[
    #grid(columns: 8, gutter: 2pt,
      ..range(16).map(i => {
        let b = str(i, base: 2)
        b = "0" * (4 - b.len()) + b
        block(width: 100%, fill: white, stroke: 0.5pt + color_girdi.stroke, radius: 2pt, inset: (x: 1pt, y: 2pt))[
          #align(center)[
            #text(weight: "bold", size: 8.5pt)[#upper(str(i, base: 16))] #text(size: 5.5pt, fill: gray)[#i] \
            #text(size: 5.8pt, font: "DejaVu Sans Mono")[#b]
          ]
        ]
      })
    )
    #v(3pt)
    #align(center)[
      #grid(columns: (auto, auto, auto), column-gutter: 6pt, row-gutter: 2pt, align: center + horizon,
        bits("1011", size: 11pt), [ ], bits("0000", size: 11pt),
        [#sym.arrow.b], [ ], [#sym.arrow.b],
        text(weight: "bold", size: 10pt)[B], [ ], text(weight: "bold", size: 10pt)[0],
      )
      #text(size: 6.5pt)[`1011 0000` #sym.arrow.r *B0* (2#super[4] = 16) · kısa, okunur, ama anlamı yok]
    ]
  ],
  panel("3", "ASCII: Harf = Sayı", color_tanim, hh: 118pt)[
    #grid(columns: (32fr, 95fr, 1fr, 128fr), column-gutter: 0pt,
      block(width: 100%, height: 9pt, fill: rgb("#f4b6b6"))[],
      block(width: 100%, height: 9pt, fill: color_cikti.fill)[],
      block(width: 100%, height: 9pt, fill: rgb("#f4b6b6"))[],
      block(width: 100%, height: 9pt, fill: rgb("#dddddd"))[],
    )
    #v(2pt)
    #text(size: 6.3pt)[
      #box(width: 6pt, height: 6pt, fill: rgb("#f4b6b6")) *0–31 ve 127 (DEL):* kontrol karakterleri (basılamaz) \
      #box(width: 6pt, height: 6pt, fill: color_cikti.fill) *32–126:* basılabilir harf, rakam, sembol \
      #box(width: 6pt, height: 6pt, fill: rgb("#dddddd")) *128–255:* genişletilmiş karakter seti
    ]
    #v(3pt)
    #align(center)[
      #table(columns: 4, stroke: 0.5pt + color_tanim.stroke, inset: 3pt, align: center + horizon, fill: white,
        [*Chr*], [*Dec*], [*Hex*], [*Binary*],
        [*A*], [65], [41], raw("0100 0001"),
        [*a*], [97], [61], raw("0110 0001"),
      )
      #text(size: 6.5pt)[Windows: *Alt + 65* #sym.arrow.r *A*]
    ]
  ],
)
#v(8pt)

// ---------- 4. Veri birimleri ----------
#panel("4", "Veri Büyüklükleri: Bit'ten Exabyte'a", color_cikti)[
  #align(center)[#text(size: 7pt)[Metrikte 10#super[3] = 1000; bilgisayarda 2#super[10] = *1024*. Her basamak bir öncekinin 1024 katıdır.]]
  #v(2pt)
  #let birimler = (
    ("Bit", "b", "0 veya 1", "tek transistör"),
    ("Byte", "B", "8 bit", "tek karakter"),
    ("Kilobyte", "KB", "1024 B", "1 sayfa düz metin"),
    ("Megabyte", "MB", "1024 KB", "1 dk MP3 / fotoğraf"),
    ("Gigabyte", "GB", "1024 MB", "~1 saat HD film"),
    ("Terabyte", "TB", "1024 GB", "harici yedek diski"),
    ("Petabyte", "PB", "1024 TB", "veri merkezleri"),
    ("Exabyte", "EB", "1024 PB", "aylık küresel internet trafiği"),
  )
  #grid(columns: 8, column-gutter: 3pt, align: bottom,
    ..birimler.enumerate().map(((i, u)) => {
      let cols = (rgb("#e6d6ff"), rgb("#cce5ff"), rgb("#cce5ff"), rgb("#ffffcc"), rgb("#ffffcc"), rgb("#ffe0b3"), rgb("#ffd0d0"), rgb("#ffb3b3"))
      block(width: 100%, height: 56pt + i * 8pt, fill: cols.at(i), stroke: 0.6pt + gray, radius: 3pt, inset: 3pt)[
        #align(center)[
          #text(weight: "bold", size: 7.5pt)[#u.at(0)] \
          #text(size: 6pt, fill: rgb("#444444"))[(#u.at(1))] \
          #text(size: 6.3pt, weight: "bold")[#u.at(2)] \
          #text(size: 5.8pt)[#u.at(3)]
        ]
      ]
    })
  )
]
#v(8pt)

// ---------- 5. Evrim ----------
#panel("5", "Makine Kodundan Yüksek Seviyeli Dillere", color_tanim)[
  #let kod(t) = align(left, text(size: 6.8pt, t))
  #align(center)[
    #diagram(
      node-inset: 4pt, spacing: (10pt, 13pt), edge-stroke: 1pt,
      baslangic((0, 0), [*1. Makine Dili* \ #text(size: 6pt)[(Binary)]]),
      node((1, 0), width: 120pt, stroke: none, kod[#raw("1011 0000") \ #raw("0110 0001")]),
      node((2, 0), width: 215pt, stroke: none, kod[#text(fill: rgb("#2e7d32"))[+] İşlemci çeviri olmadan çalıştırır \ #text(fill: rgb("#c62828"))[−] Okuması zor; Altair 8800'de anahtarlarla elle girilirdi]),

      girdi((0, 1), [*2. Hexadecimal* \ #text(size: 6pt)[(16'lık sistem)]]),
      node((1, 1), width: 120pt, stroke: none, kod[#raw("B0 61")]),
      node((2, 1), width: 215pt, stroke: none, kod[#text(fill: rgb("#2e7d32"))[+] 4 bit = 1 hex, kısa ve okunur \ #text(fill: rgb("#c62828"))[−] Komutların anlamı ezberlenmeliydi]),

      islem((0, 2), [*3. Assembly* \ #text(size: 6pt)[(mnemonic)]]),
      node((1, 2), width: 120pt, stroke: none, kod[#raw("MOV AL, 61H") \ #raw("ADD AL, 05H")]),
      node((2, 2), width: 215pt, stroke: none, kod[#text(fill: rgb("#2e7d32"))[+] MOV, ADD, SUB gibi anlamlı kısaltmalar \ #text(fill: rgb("#c62828"))[−] Her işlemciye özel; büyük projelerde uzar \ #text(size: 6pt)[Assembler ile makine koduna çevrilir]]),

      cikti((0, 3), [*4. Yüksek Seviye* \ #text(size: 6pt)[(C, Python…)]]),
      node((1, 3), width: 120pt, stroke: none, kod[#raw("int a = 97;") \ #raw("sonuc = a + b")]),
      node((2, 3), width: 215pt, stroke: none, kod[#text(fill: rgb("#2e7d32"))[+] Kolay, donanımdan bağımsız, hızlı geliştirme \ #text(fill: rgb("#c62828"))[−] Derleyici / yorumlayıcı ile çevrilmeli]),

      edge((0, 0), (0, 1), "-|>"),
      edge((0, 1), (0, 2), "-|>"),
      edge((0, 2), (0, 3), "-|>"),
    )
  ]
]
#v(8pt)

// ---------- 6. Derleyici / Yorumlayıcı ----------
#panel("6", "Derleyici ve Yorumlayıcı", color_girdi)[
  #grid(columns: (1fr, 1fr), column-gutter: 6pt,
    block(fill: white, stroke: 0.7pt + color_girdi.stroke, radius: 3pt, inset: 5pt, width: 100%)[
      #text(weight: "bold")[Derleyici (Compiler)] \
      #text(size: 6.8pt)[Kodun *tamamını* baştan sona okur, hataları denetler ve bütün olarak makine diline çevirir. Hata varsa derleme tamamlanmaz. \
      Kaynak kod #sym.arrow.r Derleyici #sym.arrow.r Makine kodu #sym.arrow.r İşlemci \
      _Örnek: C_]
    ],
    block(fill: white, stroke: 0.7pt + color_girdi.stroke, radius: 3pt, inset: 5pt, width: 100%)[
      #text(weight: "bold")[Yorumlayıcı (Interpreter)] \
      #text(size: 6.8pt)[Kodu *satır satır* okuyup anında çalıştırır; hatalı satıra gelince durur. Anlık çeviri yapan bir tercümana benzer. \
      Satır 1 #sym.arrow.r çalıştır #sym.arrow.r Satır 2 #sym.arrow.r çalıştır … \
      _Örnek: Python, Ruby_]
    ],
  )
]
