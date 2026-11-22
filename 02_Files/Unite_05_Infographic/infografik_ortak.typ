// ============================================================
// Infografik Ortak Bileşenler
// Beş infografik dosyası bu dosyayı #import eder.
// Sayfa ayarı YAPMAZ: sayfa boyutu/kenar boşlukları pageGeneralConfig.typ (conf) ile
// ana belgeden gelir. Her infografik, içinde bulunduğu sayfayı tam doldurur (1 sayfa).
// ============================================================

// ---------- Renk Paleti ----------
#let navy = rgb("#16325c")
#let c_mavi = (main: rgb("#1d4ed8"), light: rgb("#eff6ff"), border: rgb("#93c5fd"), dark: rgb("#1e40af"))
#let c_yesil = (main: rgb("#15803d"), light: rgb("#f0fdf4"), border: rgb("#86efac"), dark: rgb("#166534"))
#let c_turuncu = (main: rgb("#c2410c"), light: rgb("#fff7ed"), border: rgb("#fed7aa"), dark: rgb("#9a3412"))
#let c_kirmizi = (main: rgb("#b91c1c"), light: rgb("#fef2f2"), border: rgb("#fca5a5"), dark: rgb("#991b1b"))
#let c_mor = (main: rgb("#7e22ce"), light: rgb("#faf5ff"), border: rgb("#d8b4fe"), dark: rgb("#6b21a8"))
#let c_gri = (main: rgb("#475569"), light: rgb("#f8fafc"), border: rgb("#cbd5e1"), dark: rgb("#1e293b"))
#let mono = "DejaVu Sans Mono"

// ---------- Küçük Bileşenler ----------

// Sayı içeren renkli daire (adım numarası)
#let daire(n, renk, r: 7.5pt) = box(
  width: 2 * r, height: 2 * r, radius: r, fill: renk,
  align(center + horizon, text(fill: white, weight: "bold", size: r * 1.15, str(n)))
)

// Uyarı / bilgi simgesi (emoji yerine çizilmiş, her yazı tipinde aynı görünür)
#let ikon(simge, renk, r: 7.5pt) = box(
  width: 2 * r, height: 2 * r, radius: r, fill: renk,
  align(center + horizon, text(fill: white, weight: "bold", size: r * 1.2, simge))
)

// Koda benzeyen rozet (renkli çerçeveli)
#let rozet(metin, c, boy: 9pt) = box(
  fill: c.light, stroke: 0.7pt + c.border, radius: 3pt, inset: (x: 4.5pt, y: 2pt), baseline: 2pt,
  text(font: mono, size: boy, weight: "bold", fill: c.dark, metin)
)

// Beyaz zeminli kod kutusu (satır içi)
#let kod(metin, c: c_gri, boy: 8.6pt, kalin: true) = box(
  fill: white, stroke: 0.6pt + c.border, radius: 2.5pt, inset: (x: 4pt, y: 2pt), baseline: 2pt,
  text(font: mono, size: boy, weight: if kalin { "bold" } else { "regular" }, fill: c.dark, metin)
)

// Çok satırlı kod bloğu
#let kodblok(c: c_gri, boy: 8.6pt, ..satirlar) = block(
  width: 100%, fill: white, stroke: 0.6pt + c.border, radius: 3pt, inset: (x: 6pt, y: 4.5pt),
  text(font: mono, size: boy, fill: c.dark, satirlar.pos().join(linebreak()))
)

// Sağa bakan ok (glif yerine çizim: yazı tipinden bağımsız)
#let ok = align(center + horizon, polygon(fill: luma(140), (0pt, 0pt), (8pt, 5.5pt), (0pt, 11pt)))

// Aşağı bakan ok
#let ok_asagi = align(center + horizon, polygon(fill: luma(140), (0pt, 0pt), (11pt, 0pt), (5.5pt, 8pt)))

// ---------- Kart ----------
// Renkli, başlıklı kutu. height: 100% ile bulunduğu grid hücresini doldurur.
#let kart(c, baslik, govde, ikon_: none, yukseklik: 100%, sol-cubuk: false, ic: 7pt) = block(
  width: 100%, height: yukseklik, fill: c.light, radius: if sol-cubuk { (right: 4pt) } else { 5pt },
  stroke: if sol-cubuk { (left: 3pt + c.main) } else { 1pt + c.border },
  inset: ic, breakable: false,
)[
  #grid(
    columns: if ikon_ == none { (1fr,) } else { (auto, 1fr) }, column-gutter: 5pt, align: horizon,
    ..if ikon_ != none { (ikon_,) } else { () },
    text(weight: "bold", size: 9.6pt, fill: c.dark, baslik),
  )
  #v(2pt)
  #set text(size: 8.6pt)
  #set par(justify: false, leading: 0.45em, spacing: 0.5em)
  #govde
]

// ---------- Bölüm (beyaz ana kutu) ----------
#let bolum(no, baslik, ipucu: none, govde) = block(
  width: 100%, height: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
)[
  #grid(
    rows: (auto, 1fr), row-gutter: 4pt,
    grid(
      columns: (1fr, auto), align: horizon, column-gutter: 8pt,
      text(weight: "bold", size: 11pt, fill: navy)[#if no != none [#no. ]#baslik],
      if ipucu != none { text(size: 8pt, fill: luma(110), ipucu) },
    ),
    govde,
  )
]

// ---------- Başlık Bandı ----------
#let baslik_bandi(baslik, alt, sag) = block(
  width: 100%, radius: 7pt, inset: (x: 12pt, y: 8pt),
  fill: gradient.linear(rgb("#16325c"), rgb("#1e40af"), angle: 0deg),
)[
  #text(fill: white, weight: "bold", size: 15.5pt, baslik)
  #v(2pt)
  #grid(
    columns: (1fr, auto), column-gutter: 10pt, align: horizon,
    text(fill: rgb("#dbeafe"), size: 8.6pt, alt),
    block(
      fill: white.transparentize(88%), stroke: 0.8pt + white.transparentize(55%),
      radius: 4pt, inset: (x: 7pt, y: 4pt),
    )[
      #set text(fill: white, size: 8pt, weight: "bold")
      #sag
    ],
  )
]

// ---------- Alt Özet Notu (ders notundaki mavi sol çubuklu not stili) ----------
#let ozet(etiket, govde) = block(
  width: 100%, fill: c_mavi.light, stroke: (left: 3pt + c_mavi.main), radius: (right: 4pt),
  inset: (x: 9pt, y: 6pt), breakable: false,
)[
  #set text(size: 9pt)
  #set par(justify: false, leading: 0.5em)
  *#etiket:* #govde
]

// ---------- Sayfa Çerçevesi ----------
// Bulunduğu sayfayı tam doldurur. Yeni sayfada başlar (weak pagebreak), böylece
// ana belgeye #include edildiğinde tam 1 sayfa yer kaplar.
// satirlar: her ana parça için grid satır yükseklikleri (auto / fr)
#let sayfa(satirlar, ..parcalar) = {
  pagebreak(weak: true)
  show raw: set text(font: mono, size: 0.92em)
  set par(justify: false)
  set text(size: 9pt)
  block(
    width: 100%, height: 100%, fill: rgb("#f1f5f9"), radius: 8pt, inset: 6pt, breakable: false,
    grid(rows: satirlar, row-gutter: 6pt, ..parcalar),
  )
}
