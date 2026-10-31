// Infografik: Değişkenler ve Bellek
#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 9pt, lang: "tr")
#set par(leading: 0.5em, spacing: 0.5em)
#set smartquote(enabled: false)

// ---------- Ayarlanabilir ölçüler ----------
#let h_baslik = 76pt   // Üst başlık bandı
#let h_kod = 118pt     // Python kodu + değişken kutusu
#let h_sira1 = 242pt   // Kart 1 ve 2
#let h_sira2 = 240pt   // Kart 3 ve 4
#let h_alt = 46pt      // "Kısaca" kutusu
#let bosluk = 7pt      // Bölümler arası boşluk
#let rh = 20pt         // RAM hücre yüksekliği

// ---------- Renkler ----------
#let navy = rgb("#16325c")
#let mk(main, light, border) = (main: main, light: light, border: border)
#let c_mavi = mk(rgb("#1f6fb2"), rgb("#e3eefb"), rgb("#8db4de"))
#let c_yesil = mk(rgb("#2e9a6a"), rgb("#e3f4ea"), rgb("#8cc8a6"))
#let c_turuncu = mk(rgb("#ee9a14"), rgb("#fdebd0"), rgb("#efbf72"))
#let c_mor = mk(rgb("#6b4bb8"), rgb("#ebe5f9"), rgb("#b4a2e2"))
#let mono = "DejaVu Sans Mono"

// ---------- Kod renklendirme ----------
#let fn(t) = text(fill: rgb("#1c63b8"), t)
#let sd(t) = text(fill: rgb("#b3263e"), t)
#let sayi(t) = text(fill: rgb("#1c3fb0"), weight: "bold", t)
#let kodsatir(n, body) = grid(
  columns: (16pt, 1fr), gutter: 7pt,
  text(fill: luma(150), font: mono, size: 10.6pt, str(n)),
  text(font: mono, size: 11.4pt, body),
)

// ---------- RAM çizimi ----------
#let adresler = ("0x00001000(4096)", "0x00001001(4097)", "0x00001002(4098)", "0x00001003(4099)", "0x00001004(4100)", "0x00001005(4101)")

#let ramhucre(i, icerik, c) = {
  let vurgu = i == 2
  block(
    width: 100%, height: rh, inset: 0pt,
    fill: if vurgu { c.light.darken(6%) } else { rgb("#e3e8f0") },
    stroke: if vurgu { (left: 1.2pt + navy, right: 1.2pt + navy, top: 1pt + c.main, bottom: 1pt + c.main) }
            else { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.4pt + luma(175), bottom: 0.4pt + luma(175)) },
    align(center + horizon, if vurgu { icerik } else if i == 0 or i == 5 { text(fill: luma(110), "…") } else { [] }),
  )
}
#let adreshucre(i) = align(left + horizon, text(
  font: mono, size: 7.2pt, weight: if i == 2 { "bold" } else { "regular" }, adresler.at(i),
))

#let ram(c, orta, sol, w_sol: 52pt, w_ram: 74pt, ustsol: []) = grid(
  columns: (w_sol, w_ram, 1fr), column-gutter: 5pt,
  rows: (26pt, rh, rh, rh, rh, rh, rh),
  align(right + bottom, pad(bottom: 2pt, ustsol)),
  align(center + bottom, pad(bottom: 2pt, text(weight: "bold", size: 9.5pt, fill: navy)[RAM])),
  align(left + bottom, pad(bottom: 2pt, text(size: 6.2pt)[Hexadecimal(Decimal) \ Bellek Adresleri])),
  grid.cell(rowspan: 6, align: top + right, sol),
  ..range(6).map(i => (ramhucre(i, orta, c), adreshucre(i))).flatten(),
)

#let etiket(ok) = pad(top: 2.5 * rh - 13pt, align(right)[
  #text(weight: "bold", size: 12pt, fill: navy)[puan] #text(fill: navy, size: 11pt, weight: "bold", ok) \
  #text(size: 8pt)[(adres)]
])

// ---------- Çıktı kutusu ve kart ----------
#let cikti(c, t) = block(
  width: 100%, fill: c.light.lighten(45%), stroke: (left: 3pt + c.main), radius: 2pt, inset: (x: 8pt, y: 4.5pt),
  text(font: mono, size: 9.2pt, t),
)

#let kart(no, baslik, c, h, aciklama, ciktimetni, govde) = block(
  width: 100%, height: h, fill: white, stroke: 1pt + c.border, radius: 6pt, clip: true, inset: 0pt, breakable: false,
)[
  #block(width: 100%, fill: c.light, inset: (x: 9pt, y: 6pt))[
    #grid(
      columns: (auto, 1fr), gutter: 7pt, align: horizon,
      circle(radius: 9.5pt, fill: c.main, align(center + horizon, text(fill: white, weight: "bold", size: 12pt, str(no)))),
      text(weight: "bold", size: 13pt, fill: navy, baslik),
    )
  ]
  #block(width: 100%, inset: (x: 9pt, top: 3pt, bottom: 6pt))[
    #aciklama
    #v(5pt)
    #if ciktimetni != none { cikti(c, ciktimetni); v(4pt) }
    #govde
  ]
]

#let chip(t, fill, stroke, tc: black, strike: false) = block(
  width: 100%, fill: fill, stroke: 0.9pt + stroke, radius: 3pt, height: 24pt, inset: 0pt,
  align(center + horizon, text(fill: tc, weight: "bold", size: 10pt, if strike { std.strike(t) } else { t })),
)

// ---------- RAM ÇUBUĞU (başlık sağı) ----------
#let ram_cubuk = {
  let w = 108pt
  let etiketler = ("…", "…", "75", "…")
  stack(
    dir: ttb, spacing: 0pt,
    block(width: w, height: 32pt, fill: rgb("#2f8f68"), stroke: 1pt + rgb("#9be8c4"), radius: (top: 3pt), inset: 0pt)[
      #for i in range(4) {
        place(top + left, dx: 6.5pt + i * 25pt, dy: 8pt,
          rect(
            width: 20pt, height: 16pt, radius: 2pt, fill: rgb("#17263d"),
            stroke: if i == 2 { 1.2pt + rgb("#ffb43a") } else { 0.6pt + rgb("#5b7597") },
            align(center + horizon, text(font: mono, size: 6.6pt, weight: "bold", fill: if i == 2 { rgb("#ffd27a") } else { rgb("#8aa4c8") }, etiketler.at(i))),
          ))
      }
    ],
    block(width: w, height: 5pt, inset: 0pt)[
      #for i in range(18) {
        if i != 9 { place(top + left, dx: 2pt + i * 5.8pt, rect(width: 3.4pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none)) }
      }
    ],
    v(6pt),
    align(center, text(size: 6.8pt, fill: rgb("#d6e4f7"))[*puan* = 75 · RAM]),
  )
}

// Arka plan yalnızca infografiğin biraz dışına taşar (outset), kâğıt kenarları beyaz kalır
#block(width: 100%, fill: rgb("#f2f6fc"), outset: 8pt, radius: 10pt)[
// ---------- BAŞLIK ----------
#block(width: 100%, height: h_baslik, fill: navy, radius: 8pt, inset: (x: 14pt, y: 10pt))[
  #grid(
    columns: (54pt, 1fr, 108pt), gutter: 14pt, align: horizon,
    block(width: 54pt, height: 54pt, fill: rgb("#2b5ea3"), stroke: 1.6pt + rgb("#8fbcf0"), radius: 9pt, inset: 0pt)[
      #align(center + horizon)[
        #text(font: mono, fill: white, weight: "bold", size: 9pt)[x = 50] \
        #v(2pt)
        #box(fill: rgb("#8fbcf0"), radius: 2pt, inset: (x: 4pt, y: 1.5pt), text(fill: navy, size: 6.5pt, weight: "bold")[RAM])
      ]
    ],
    [
      #set par(leading: 0.95em)
      #text(fill: white, weight: "bold", size: 22pt)[Değişkenler ve Bellek] \
      #v(4pt)
      #text(fill: rgb("#d6e4f7"), size: 8.4pt)[Programda tanımlanan değişkenler, geçici olarak bellekte (RAM) \ bir alan tutar ve bu alanlara değerler kaydedilir.]
    ],
    ram_cubuk,
  )
]

#v(bosluk)

// ---------- KOD + DEĞİŞKEN ----------
#grid(
  columns: (1.9fr, 1fr), gutter: 8pt,
  block(width: 100%, height: h_kod, fill: white, stroke: 1pt + c_mavi.border, radius: 6pt, inset: 8pt)[
    #box(fill: c_mavi.main, radius: (top-left: 4pt, top-right: 4pt, bottom-right: 4pt), inset: (x: 9pt, y: 3pt), text(fill: white, weight: "bold", size: 11pt)[Python Kodu])
    #v(3pt)
    #block(width: 100%, fill: rgb("#f1f6fe"), radius: 4pt, inset: (x: 8pt, y: 8pt))[
      #kodsatir(1, [puan = ] + fn("int") + [(] + fn("input") + [(] + sd("\"Puan Giriniz: \"") + [))])
      #v(4pt)
      #kodsatir(2, fn("print") + [(] + sd("\"Puanı:\"") + [, puan)])
      #v(4pt)
      #kodsatir(3, [puan = puan + ] + sayi("25"))
      #v(4pt)
      #kodsatir(4, fn("print") + [(] + sd("\"Güncellenmiş Puan:\"") + [, puan)])
    ]
  ],
  block(width: 100%, height: h_kod, fill: white, stroke: 1pt + c_mavi.border, radius: 6pt, clip: true, inset: 0pt)[
    #block(width: 100%, fill: c_mavi.light, inset: (x: 9pt, y: 5pt), text(weight: "bold", size: 11pt, fill: navy)[Kullanılan Değişken])
    #block(width: 100%, inset: (x: 9pt, y: 5pt))[
      #text(weight: "bold", size: 25pt, fill: navy)[puan] \
      #v(4pt)
      #text(size: 10pt)[(tamsayı / int)] \
      #v(5pt)
      #text(size: 11.5pt)[Puan değerini geçici olarak tutan değişken.]
    ]
  ],
)

#v(bosluk)

// ---------- KART 1 ve 2 ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  kart(1, "Değer Atama", c_mavi, h_sira1,
    [Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.],
    [Puan Giriniz: 50],
    ram(c_mavi, text(weight: "bold", size: 11pt, fill: navy)[50], etiket("→")),
  ),
  kart(2, "Hafızadan Çağırma", c_yesil, h_sira1,
    [*puan* değişkeni RAM'deki adresinden çağırılarak *50* değeri ekrana yazdırılır.],
    [Puanı: 50],
    ram(c_yesil, text(weight: "bold", size: 11pt, fill: navy)[50], etiket("←")),
  ),
)

#v(bosluk)

// ---------- KART 3 ve 4 ----------
#let etiket3 = align(left)[#text(weight: "bold", size: 12pt, fill: navy)[puan] #text(size: 8.5pt)[(adres)]]
// Kutular (dar/yüksek) + aradaki çift yönlü ok: RAM'den okuma ve RAM'e yazma
#let sol3 = grid(
  columns: (40pt, 1fr), column-gutter: 5pt,
  pad(top: 5pt)[
    #chip("50", rgb("#eceff3"), luma(190), tc: luma(130), strike: true)
    #align(center, text(size: 5.8pt)[(hafızadan alınır)])
    #v(3pt)
    #chip("+ 25", rgb("#fde3e6"), rgb("#d96b7c"), tc: rgb("#b3263e"))
    #v(3pt)
    #line(length: 100%, stroke: 1pt + navy)
    #v(3pt)
    #chip("75", rgb("#d9f1e0"), rgb("#4aa96f"), tc: rgb("#1d6b40"))
    #align(center, text(size: 5.8pt)[(yeni değer)])
  ],
  pad(top: 2.5 * rh - 4pt, align(center)[
    #text(size: 16pt, weight: "bold", fill: c_turuncu.main)[⟷] \
    #v(-3pt)
    #text(size: 6pt)[oku / yaz]
  ]),
)

#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  kart(3, "Değer Güncelleme", c_turuncu, h_sira2,
    [Mevcut *50* değeri hafızadan alınır, *25* eklenir ve elde edilen yeni *75* değeri tekrar *puan* değişkenine atanır.],
    none,
    ram(c_turuncu,
      [#text(fill: luma(130), weight: "bold", size: 8.6pt, strike[50]) #h(2pt) #box(fill: rgb("#d9f1e0"), stroke: 0.8pt + rgb("#4aa96f"), radius: 2pt, inset: (x: 3pt, y: 3pt), text(fill: rgb("#1d6b40"), weight: "bold", size: 9pt)[75])],
      sol3, w_sol: 76pt, w_ram: 66pt, ustsol: etiket3),
  ),
  kart(4, "Güncel Hali Çağırma", c_mor, h_sira2,
    [Güncellenen *puan* değişkeni hafızadan çağırılarak ekrana yazdırılır.],
    [Güncellenmiş Puan: 75],
    ram(c_mor, text(weight: "bold", size: 11pt, fill: rgb("#1d6b40"))[75], etiket("←")),
  ),
)

#v(bosluk)

// ---------- KISACA ----------
#block(width: 100%, height: h_alt, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 7pt, inset: (x: 14pt, y: 8pt))[
  #grid(
    columns: (30pt, 1fr), gutter: 12pt, align: horizon,
    align(center)[
      #circle(radius: 8.5pt, fill: rgb("#ffd34d"), stroke: 1.2pt + rgb("#e0a800"))
      #v(-2pt)
      #rect(width: 8pt, height: 4pt, radius: 1pt, fill: luma(130), stroke: none)
    ],
    [
      #text(size: 9.2pt)[*Kısaca:* Değişkenler, değerleri geçici olarak RAM'de tutan etiketlerdir. \
      Program çalıştığı sürece bu değerler kullanılabilir ve güncellenebilir.]
    ],
  )
]

]
