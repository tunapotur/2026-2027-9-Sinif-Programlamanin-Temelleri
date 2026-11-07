// Şekil: Değişkenlerde Atama ve Güncelleme (2x2 kart)
//
// KULLANIM
//  - Notlarına yapıştırırken: tanımlar (#let ...) üstte kalır, şekil en alttaki #[ ... ] kapsamındadır.
//    Font/boyut ayarları (#set text ...) yalnızca bu kapsamın içinde geçerlidir, notlarının geri kalanını etkilemez.
//  - Tek başına PNG/PDF almak için aşağıdaki satırın başındaki // işaretlerini kaldır:
// #set page(width: 17.5cm + 16pt, height: auto, margin: 8pt)

// ---------- Ayarlanabilir ölçüler ----------
#let h_sira1 = 242pt   // Kart 1 ve 2
#let h_sira2 = 247pt   // Kart 3 ve 4
#let bosluk = 8pt      // Satırlar arası boşluk
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
#let sd(t) = text(fill: rgb("#b3263e"), t)
#let sayi(t) = text(fill: rgb("#1c3fb0"), weight: "bold", t)

// ---------- RAM çizimi ----------
#let adresler = ("0x00001000(4096)", "0x00001001(4097)", "0x00001002(4098)", "0x00001003(4099)", "0x00001004(4100)", "0x00001005(4101)", "0x00001006(4102)")
#let nokta = text(fill: luma(110), "…")
// Klasik düzen: yalnızca ortadaki (3.) hücre dolu
#let klasik(orta) = (nokta, [], orta, [], [], nokta)

#let ramhucre(i, icerik, c, vurgu) = block(
  width: 100%, height: rh, inset: 0pt,
  fill: if vurgu { c.light.darken(6%) } else { rgb("#e3e8f0") },
  stroke: if vurgu { (left: 1.2pt + navy, right: 1.2pt + navy, top: 1pt + c.main, bottom: 1pt + c.main) }
          else { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.4pt + luma(175), bottom: 0.4pt + luma(175)) },
  align(center + horizon, icerik),
)
#let adreshucre(i, vurgu, ofs) = align(left + horizon, text(
  font: mono, size: 7.2pt, weight: if vurgu { "bold" } else { "regular" }, adresler.at(i + ofs),
))

// icerikler: 6 elemanlı dizi, vurgu: renkli gösterilecek hücre numaraları
#let ram(c, icerikler, sol, vurgu: (2,), ofs: 0, w_sol: 52pt, w_ram: 74pt, ustsol: []) = grid(
  columns: (w_sol, w_ram, 1fr), column-gutter: 5pt,
  rows: (26pt, rh, rh, rh, rh, rh, rh),
  align(right + bottom, pad(bottom: 2pt, ustsol)),
  align(center + bottom, pad(bottom: 2pt, text(weight: "bold", size: 9.5pt, fill: navy)[RAM])),
  align(left + bottom, pad(bottom: 2pt, text(size: 6.2pt)[Hexadecimal(Decimal) \ Bellek Adresleri])),
  grid.cell(rowspan: 6, align: top + right, sol),
  ..range(6).map(i => (ramhucre(i, icerikler.at(i), c, i in vurgu), adreshucre(i, i in vurgu, ofs))).flatten(),
)

// satir: okun hizalanacağı RAM satırı (0'dan başlar)
#let etiket(ok, satir: 2) = pad(top: (satir + 0.5) * rh - 13pt, align(right)[
  #text(weight: "bold", size: 12pt, fill: navy)[puan] #text(fill: navy, size: 11pt, weight: "bold", ok) \
  #text(size: 8pt)[(adres)]
])

// ---------- Kod kutusu ve kart ----------
#let kodkutu(c, t) = block(
  width: 100%, fill: c.light.lighten(45%), stroke: (left: 3pt + c.main), radius: 2pt, inset: (x: 8pt, y: 5pt),
  text(font: mono, size: 10.6pt, t),
)

#let kart(no, baslik, c, h, aciklama, kod, govde) = block(
  width: 100%, height: h, fill: white, stroke: 1pt + c.border, radius: 6pt, clip: true, inset: 0pt, breakable: false,
)[
  #block(width: 100%, fill: c.light, inset: (x: 9pt, y: 6pt))[
    #grid(
      columns: (auto, 1fr), gutter: 7pt, align: horizon,
      circle(radius: 9.5pt, fill: c.main, align(center + horizon, text(fill: white, weight: "bold", size: 12pt, str(no)))),
      text(weight: "bold", size: 12pt, fill: navy, baslik),
    )
  ]
  #block(width: 100%, inset: (x: 9pt, top: 3pt, bottom: 6pt))[
    #aciklama
    #v(5pt)
    #kodkutu(c, kod)
    #v(4pt)
    #govde
  ]
]

#let chip(t, fill, stroke, tc: black, strike: false) = block(
  width: 100%, fill: fill, stroke: 0.9pt + stroke, radius: 3pt, height: 24pt, inset: 0pt,
  align(center + horizon, text(fill: tc, weight: "bold", size: 10pt, if strike { std.strike(t) } else { t })),
)

// ---------- Hücre içi ortak parçalar ----------
// Üstü çizili eski değer + yeni değer (75)
#let eski_yeni = [
  #text(fill: luma(130), weight: "bold", size: 8.6pt, strike[50]) #h(2pt) #box(fill: rgb("#d9f1e0"), stroke: 0.8pt + rgb("#4aa96f"), radius: 2pt, inset: (x: 3pt, y: 3pt), text(fill: rgb("#1d6b40"), weight: "bold", size: 9pt)[75])
]

// Kart 3: eski değer + 25 = yeni değer kutuları ve çift yönlü ok
#let etiket3 = align(left)[#text(weight: "bold", size: 12pt, fill: navy)[puan] #text(size: 8.5pt)[(adres)]]
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
  // Ok, diğer hücrelerdeki "puan →" okuyla aynı hizada: 4098 hücresinin üst kenarı
  pad(top: 2 * rh - 5pt, align(center)[
    #text(size: 16pt, weight: "bold", fill: c_turuncu.main)[⟷] \
    #v(-3pt)
    #text(size: 6pt)[oku / yaz]
  ]),
)

// Kart 4: metin dizisi, her harf ayrı bir bellek satırında
#let harf(t) = text(font: mono, weight: "bold", size: 11pt, fill: navy, t)
#let metin_ram = (nokta, harf("e"), harf("l"), harf("l"), harf("i"), nokta)

// =====================================================================
// Arka plan yalnızca şeklin biraz dışına taşar (outset)
#[
#set text(font: "DejaVu Sans", size: 9pt, lang: "tr")
#set par(leading: 0.5em, spacing: 0.5em)
#set smartquote(enabled: false)

#block(width: 100%, fill: rgb("#f2f6fc"), outset: 8pt, radius: 10pt)[

// ---------- 1. SATIR ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  kart(1, "Değer Atama", c_mavi, h_sira1,
    [Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.],
    [puan = #sayi("50")],
    ram(c_mavi, klasik(text(weight: "bold", size: 11pt, fill: navy)[50]), etiket("→")),
  ),
  kart(2, "Değer Güncelleme", c_turuncu, h_sira1,
    [Giriş yapılan *75* değeri, RAM'de bulunan *puan* değişkeninin önceki değerinin üzerine yazılır.],
    [puan = #sayi("75")],
    ram(c_turuncu, klasik(eski_yeni), etiket("→")),
  ),
)

#v(bosluk)

// ---------- 2. SATIR ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  kart(3, "Mevcut ile Güncelleme", c_yesil, h_sira2,
    [Güncellenen değişkenin eski değeri kullanılarak yeni değer yazılır.],
    [puan = puan + #sayi("25")],
    ram(c_yesil, klasik(eski_yeni), sol3, w_sol: 76pt, w_ram: 66pt, ustsol: etiket3),
  ),
  kart(4, "Değişken Türü ile Güncelleme", c_mor, h_sira2,
    [RAM'deki sayısal alan silinir, yerine metin dizisi oluşturulur.],
    [puan = #sd("\"elli\"")],
    // ofs: 1 -> adresler 4097'den başlar, böylece "e" harfi yine 4098'de kalır
    ram(c_mor, metin_ram, etiket("→", satir: 1), vurgu: (1, 2, 3, 4), ofs: 1),
  ),
)

]

]
