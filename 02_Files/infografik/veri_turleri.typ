// Infografik: Veri Türleri ve RAM Kullanımı
#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 8.8pt, lang: "tr")
#set par(leading: 0.5em, spacing: 0.5em)
#set smartquote(enabled: false)

// ---------- Ayarlanabilir ölçüler ----------
#let h_baslik = 62pt
#let h_ram = 90pt
#let h_sira1 = 124pt   // bool + char
#let h_sira2 = 180pt   // int + float
#let h_metin = 96pt    // Karakterden metne
#let h_islemci = 130pt // RAM-işlemci + int/float
#let bosluk = 5pt

// ---------- Renkler (ders notu şablonundaki ram-renkleri ile aynı) ----------
#let navy = rgb("#16325c")
#let r_bool = rgb("#16a34a")
#let r_char = rgb("#9333ea")
#let r_int = rgb("#2563eb")
#let r_float = rgb("#ea580c")
#let mavi = (main: rgb("#1f6fb2"), light: rgb("#e3eefb"), border: rgb("#8db4de"))
#let mono = "DejaVu Sans Mono"

// ---------- Yardımcılar ----------
#let bayt_kareleri(n, renk) = {
  for i in range(n) { box(width: 8pt, height: 8pt, fill: renk, radius: 1.5pt); h(1.5pt) }
}

#let bitsatiri(etiket, bits, renk) = grid(
  columns: (28pt,) + (1fr,) * 8, gutter: 2pt, align: horizon,
  text(size: 6.8pt, fill: luma(120), etiket),
  ..bits.clusters().map(b => rect(
    width: 100%, height: 11pt, inset: 0pt, radius: 2pt, stroke: none,
    fill: if b == "1" { renk.lighten(78%) } else { luma(244) },
    align(center + horizon, text(font: mono, size: 7.4pt, weight: if b == "1" { "bold" } else { "regular" }, fill: if b == "1" { renk.darken(35%) } else { luma(120) }, b)),
  )),
)

#let tur_karti(ad, bayt, renk, yuk, maddeler, kod, bitler, aciklama) = block(
  width: 100%, height: yuk, fill: white, stroke: 1pt + renk.lighten(40%), radius: 6pt, clip: true, inset: 0pt, breakable: false,
)[
  #block(width: 100%, fill: renk.lighten(86%), inset: (x: 9pt, y: 6pt))[
    #grid(
      columns: (auto, 1fr, auto), gutter: 8pt, align: horizon,
      box(fill: renk, radius: 3pt, inset: (x: 8pt, y: 3pt), text(fill: white, weight: "bold", size: 11pt, font: mono, ad)),
      [],
      [#bayt_kareleri(bayt, renk) #h(3pt) #text(weight: "bold", size: 10.5pt, fill: renk.darken(25%))[#bayt bayt]],
    )
  ]
  #block(width: 100%, inset: (x: 9pt, top: 5pt, bottom: 6pt))[
    #set list(marker: text(fill: renk, weight: "bold")[•], body-indent: 5pt, spacing: 0.55em)
    #set par(leading: 0.5em)
    #list(..maddeler)
    #v(3pt)
    #block(width: 100%, fill: luma(246), radius: 3pt, inset: (x: 7pt, y: 4pt), text(font: mono, size: 8.6pt, kod))
    #v(3pt)
    #for (i, bt) in bitler.split(" ").enumerate() {
      bitsatiri(str(i + 1) + ". bayt", bt, renk)
      v(2pt)
    }
    #text(size: 7.2pt, fill: luma(100), aciklama)
  ]
]

#let bolum(baslik, renk: mavi, h: auto, govde) = block(
  width: 100%, height: h, fill: white, stroke: 1pt + renk.border, radius: 6pt, clip: true, inset: 0pt, breakable: false,
)[
  #block(width: 100%, fill: renk.light, inset: (x: 9pt, y: 5pt), text(weight: "bold", size: 10.5pt, fill: navy, baslik))
  #block(width: 100%, inset: (x: 9pt, top: 6pt, bottom: 6pt), govde)
]

// ---------- RAM ÇUBUĞU (başlık sağı) ----------
#let ram_cubuk = {
  let w = 100pt
  let renkler = (r_bool, r_char, r_int, r_float)
  let boyutlar = ("1", "1", "2", "4")
  stack(
    dir: ttb, spacing: 0pt,
    block(width: w, height: 30pt, fill: rgb("#2f8f68"), stroke: 1pt + rgb("#9be8c4"), radius: (top: 3pt), inset: 0pt)[
      #for i in range(4) {
        place(top + left, dx: 5pt + i * 23.5pt, dy: 7pt,
          rect(width: 19pt, height: 16pt, radius: 2pt, fill: renkler.at(i), stroke: 0.8pt + white,
            align(center + horizon, text(font: mono, size: 8pt, weight: "bold", fill: white, boyutlar.at(i)))))
      }
    ],
    block(width: w, height: 5pt, inset: 0pt)[
      #for i in range(17) {
        if i != 8 { place(top + left, dx: 2pt + i * 5.8pt, rect(width: 3.4pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none)) }
      }
    ],
    v(5pt),
    align(center, text(size: 6.4pt, fill: rgb("#d6e4f7"))[bool · char · int · float \ (bayt cinsinden boyut)]),
  )
}

// Arka plan yalnızca infografiğin biraz dışına taşar, kâğıt kenarları beyaz kalır
#block(width: 100%, fill: rgb("#f2f6fc"), outset: 8pt, radius: 10pt)[

// ---------- BAŞLIK ----------
#block(width: 100%, height: h_baslik, fill: navy, radius: 8pt, inset: (x: 14pt, y: 9pt))[
  #grid(
    columns: (1fr, 100pt), gutter: 14pt, align: horizon,
    [
      #set par(leading: 0.9em)
      #text(fill: white, weight: "bold", size: 18pt)[Veri Türleri ve RAM Kullanımı] \
      #v(3pt)
      #text(fill: rgb("#d6e4f7"), size: 8.2pt)[Programlar verileri RAM'de bayt kutularında saklar. Verinin türü, \ kaç bayt yer ayrılacağını ve hangi işlemlerin yapılabileceğini belirler.]
    ],
    ram_cubuk,
  )
]

#v(bosluk)

// ---------- RAM = KUTULAR ----------
#bolum("RAM: üst üste dizilmiş küçük kutular", h: h_ram)[
  #grid(
    columns: (1.4fr, 1fr), gutter: 14pt, align: horizon,
    [
      #grid(
        columns: (1fr,) * 8, gutter: 2pt,
        ..range(8).map(i => rect(
          width: 100%, height: 20pt, radius: 2pt, inset: 0pt,
          fill: if i == 3 { mavi.light.darken(4%) } else { luma(236) },
          stroke: if i == 3 { 1.3pt + mavi.main } else { 0.5pt + luma(185) },
          align(center + horizon, text(size: 6.4pt, fill: luma(100))[1 bayt]),
        )),
      )
      #v(2pt)
      #align(center, text(size: 9pt, fill: mavi.main, weight: "bold")[▼ yakınlaştır])
      #grid(
        columns: (1fr,) * 8, gutter: 2pt,
        ..("0", "1", "0", "0", "0", "0", "0", "1").map(b => rect(
          width: 100%, height: 14pt, radius: 2pt, inset: 0pt, stroke: 0.6pt + mavi.border,
          fill: if b == "1" { mavi.light.darken(6%) } else { luma(248) },
          align(center + horizon, text(font: mono, size: 8.4pt, weight: "bold", fill: navy, b)),
        )),
      )
      #align(center, text(size: 7.4pt, fill: luma(90))[*1 bayt = 8 bit* (her bit yalnızca 0 ya da 1)])
    ],
    [
      #set par(leading: 0.55em)
      #grid(
        columns: (16pt, 1fr), row-gutter: 7pt, align: horizon,
        circle(radius: 7pt, fill: mavi.main, align(center + horizon, text(fill: white, weight: "bold", size: 8pt)[1])),
        [Bu veri *ne tür* bir veri? \ #text(size: 7.6pt, fill: luma(100))[(sayı mı, karakter mi, doğru/yanlış mı?)]],
        circle(radius: 7pt, fill: mavi.main, align(center + horizon, text(fill: white, weight: "bold", size: 8pt)[2])),
        [RAM'de *kaç kutu (bayt)* ayrılmalı ve *hangi işlemler* yapılabilir?],
      )
    ],
  )
]

#v(bosluk)

// ---------- bool + char ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  tur_karti("bool", 1, r_bool, h_sira1,
    ([Yalnızca iki değer: *true* (1) ya da *false* (0)], [Karar yapılarında kullanılır (if, while)]),
    "bool kapiAcik = true;", "00000001",
    [Tek bit yeter; ancak RAM'e bayt bayt ulaşıldığı için 1 tam bayt ayrılır.]),
  tur_karti("char", 1, r_char, h_sira1,
    ([Tek karakter: harf, rakam karakteri, noktalama], [ASCII sayısıyla saklanır: 'A' = 65], [Matematiksel işlem yapılmaz: '5' ≠ 5]),
    "char harf = 'A';", "01000001",
    [1 bayt, ASCII tablosundaki 256 karakter için yeterlidir.]),
)

#v(bosluk)

// ---------- int + float ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  tur_karti("int", 2, r_int, h_sira2,
    ([2#super[16] = 65536 değer: −32768 … +32767], [Yalnızca tam sayı: 7 / 2 = 3, 7 % 2 = 1], [Toplama, çıkarma, çarpma, bölme, mod]),
    "int puan = 50;\nint sonuc = 7 / 2;  // 3 (3.5 değil!)", "00000000 00110010",
    [50 = 32 + 16 + 2 olduğu için son bayt 00110010 olur; ilk baytın tamamı 0'dır.]),
  tur_karti("float", 4, r_float, h_sira2,
    ([Virgüllü sayılar: 3.14 (kodda nokta ile)], [int'in 2 katı yer; 7 / 2 = 3.5 (küsuratlı)], [Çok daha geniş aralık, IEEE 754 biçimi]),
    "float pi = 3.14;", "01000000 01001000 11110101 11000011",
    [Ondalıklı sayılar IEEE 754 biçiminde 4 bayt yer kaplar.]),
)

#v(bosluk)

// ---------- Karakterden metne ----------
#bolum("Karakterden Metne", renk: (main: r_char, light: r_char.lighten(86%), border: r_char.lighten(40%)), h: h_metin)[
  #grid(
    columns: (auto, 1fr), gutter: 10pt, align: horizon,
    block(fill: r_char.lighten(90%), stroke: (left: 3pt + r_char), radius: (right: 3pt), inset: (x: 8pt, y: 5pt),
      text(size: 8pt)[*Toplam bellek alanı* = \ karakter sayısı × 1 bayt]),
    text(size: 8pt)[Her harf için RAM'de art arda (bitişik) 1 baytlık kutular ayrılır. #text(font: mono, size: 7.6pt)["Ada Lovelace"]: 12 karakter (boşluk dahil) = *12 bayt*.],
  )
  #v(3pt)
  #grid(
    columns: (1fr,) * 12, gutter: 2pt,
    ..(("A", "65"), ("d", "100"), ("a", "97"), ("␣", "32"), ("L", "76"), ("o", "111"), ("v", "118"), ("e", "101"), ("l", "108"), ("a", "97"), ("c", "99"), ("e", "101")).map(((c, k)) => block(
      width: 100%, fill: r_char.lighten(88%), stroke: 0.7pt + r_char.lighten(35%), radius: 2pt, inset: (y: 2.5pt),
      align(center)[#text(font: mono, weight: "bold", size: 10pt, fill: r_char.darken(30%), c) \ #text(size: 6.6pt, fill: luma(90), k)],
    )),
  )
]

#v(bosluk)

// ---------- RAM-işlemci + int/float ----------
#let cip(t, renk) = box(fill: renk, radius: 1.5pt, inset: (x: 3pt, y: 1.2pt), text(fill: white, weight: "bold", size: 6.4pt, font: mono, t))
#let hat(etiket, kal, chipler, renk) = stack(
  dir: ttb, spacing: 2pt,
  text(size: 7.2pt, weight: "bold", fill: renk, etiket),
  grid(
    columns: (1fr, auto), gutter: 2pt, align: horizon,
    rect(width: 100%, height: kal, radius: 3pt, fill: rgb("#d4e6f8"), stroke: 0.8pt + mavi.border, inset: (x: 4pt, y: 0pt),
      align(left + horizon, stack(dir: ltr, spacing: 3pt, ..chipler))),
    text(size: 11pt, fill: mavi.main)[▶],
  ),
)

#grid(
  columns: (1.55fr, 1fr), gutter: 8pt,
  bolum("RAM ve İşlemci İlişkisi", h: h_islemci)[
    #grid(
      columns: (36pt, 1fr, 46pt), column-gutter: 6pt, row-gutter: 6pt, align: horizon,
      grid.cell(rowspan: 2, block(width: 100%, height: 58pt, fill: rgb("#2f8f68"), stroke: 1pt + rgb("#9be8c4"), radius: 3pt, align(center + horizon, text(fill: white, weight: "bold", size: 10pt)[RAM]))),
      hat("Küçük türler: hızlı taşıma, düşük iş yükü", 14pt, (cip("1B", r_bool), cip("1B", r_char), cip("2B", r_int)), rgb("#2b6f4a")),
      grid.cell(rowspan: 2, block(width: 100%, height: 58pt, fill: navy, stroke: 1pt + mavi.border, radius: 3pt, align(center + horizon, text(fill: white, weight: "bold", size: 7.6pt)[İŞLEMCİ]))),
      hat("Büyük türler: yavaş taşıma, ek iş yükü", 17pt, (cip("4B", r_float), cip("4B", r_float), cip("4B", r_float)), rgb("#b8470d")),
    )
    #v(5pt)
    #text(weight: "bold", size: 8.4pt, fill: navy)[Büyük veri türleri hem RAM'de daha fazla yer kaplar hem de işlemciyi daha fazla meşgul eder.]
  ],
  bolum("int mi, float mı?", h: h_islemci)[
    #set par(leading: 0.55em)
    #block(width: 100%, fill: r_int.lighten(90%), stroke: (left: 3pt + r_int), radius: (right: 3pt), inset: (x: 7pt, y: 4pt))[
      #text(font: mono, weight: "bold", fill: r_int)[int] #h(2pt) Tam sayı yetiyorsa
    ]
    #v(4pt)
    #block(width: 100%, fill: r_float.lighten(90%), stroke: (left: 3pt + r_float), radius: (right: 3pt), inset: (x: 7pt, y: 4pt))[
      #text(font: mono, weight: "bold", fill: r_float)[float] #h(2pt) Küsurat gerekiyorsa (ortalama, not, fiyat, sıcaklık)
    ]
    #v(4pt)
    #text(size: 7.8pt)[*Gerekmedikçe* int yerine float kullanılmamalıdır: daha fazla RAM kaplar, işlemciyi daha çok yorar.]
  ],
)

#v(bosluk)

// ---------- NOT ----------
#block(width: 100%, fill: rgb("#eff6ff"), stroke: (left: 3pt + rgb("#3b82f6")), radius: (right: 3pt), inset: (x: 10pt, y: 4.5pt))[
  #text(size: 7.6pt)[*Not:* Anlatımda C++ ve 16 bit sistemler (Arduino Uno, Turbo C) esas alınmıştır; böylece veri türlerinin donanımsal mantığı daha rahat anlaşılır. Derslerimizde Python kullanılacaktır; Python'da veri türleri ve bellek yapısı farklı işler.]
]

]
