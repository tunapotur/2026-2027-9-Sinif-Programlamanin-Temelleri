// Infografik: RAM ve İşlemci İlişkisi
#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 8.8pt, lang: "tr")
#set par(leading: 0.5em, spacing: 0.5em)
#set smartquote(enabled: false)

// ---------- Ayarlanabilir ölçüler ----------
#let h_baslik = 62pt
#let h_s1 = 108pt      // İşlemci RAM ile nasıl çalışır?
#let h_s2 = 252pt      // int / float karşılaştırması
#let h_s3 = 178pt      // Metin: char dizisi
#let bosluk = 4pt
#let rh = 10.5pt       // RAM satır yüksekliği (karşılaştırma kartları)
#let rh_metin = 12pt   // RAM satır yüksekliği (char dizisi)

// ---------- Renkler ----------
#let navy = rgb("#16325c")
#let r_char = rgb("#9333ea")
#let r_int = rgb("#2563eb")
#let r_float = rgb("#ea580c")
#let r_kirmizi = rgb("#dc2626")
#let r_yesil = rgb("#16a34a")
#let mavi = (main: rgb("#1f6fb2"), light: rgb("#e3eefb"), border: rgb("#8db4de"))
#let mono = "DejaVu Sans Mono"

// ---------- Ders notu şablonundan: kod-satiri ----------
#let kod-satiri(kod, no: none, size: 10pt, weight: "regular", width: auto) = {
  // Yazı boyutu ve kalınlığını bloğa uygula
  set text(size: size, weight: weight)

  // Satır numaralandırma kuralı
  show raw.line: it => {
    if no != none and no != 0 {
      box(width: 2.2em, align(right, text(fill: luma(120), weight: "regular", str(no))))
      h(1em)
    }
    it.body
  }

  // Tek satırlık blok görünümü
  show raw.where(block: true): set block(
    fill: rgb("#f6f8fa"),
    inset: (x: 10pt, y: 7pt),
    radius: 4pt,
    stroke: 0.5pt + rgb("#d0d7de"),
    width: width,
  )

  kod
}

// ---------- Yardımcılar ----------
#let bayt_kareleri(n, renk) = {
  for i in range(n) { box(width: 8pt, height: 8pt, fill: renk, radius: 1.5pt); h(1.5pt) }
}

// 8 bitlik diziyi renkli yazar (1 koyu/renkli, 0 sönük)
#let bitmetin(s, renk, size: 7.6pt) = text(font: mono, size: size, {
  for b in s.clusters() {
    text(fill: if b == "1" { renk.darken(30%) } else { luma(150) }, weight: if b == "1" { "bold" } else { "regular" }, b)
    h(1pt)
  }
})

// Bellek adresi: yalnızca 0x ile başlayan hexadecimal değer
#let adres(v) = "0x" + upper(("00000000" + str(v, base: 16)).slice(-8))
#let nokta = text(fill: luma(110))[…]

// ---------- Dikey RAM çizimi ----------
// satirlar: (içerik, vurgulu mu?, [isteğe bağlı satır rengi]) üçlüleri
// soller: ((ilk satır, satır sayısı, içerik), ...) soldaki etiketler
#let ram_dik(
  renk, satirlar, ilk: 4096, rh: 13pt, w_sol: 0pt, w_ram: 92pt, w_adres: 50pt,
  soller: (), ust: [RAM], ust_h: 16pt,
) = {
  let n = satirlar.len()
  let hucre(i) = {
    let s = satirlar.at(i)
    let rr = if s.len() > 2 { s.at(2) } else { renk }
    block(
      width: 100%, height: rh, inset: 0pt,
      fill: if s.at(1) { rr.lighten(82%) } else { rgb("#e3e8f0") },
      stroke: if s.at(1) { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.7pt + rr, bottom: 0.7pt + rr) }
              else { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.4pt + luma(175), bottom: 0.4pt + luma(175)) },
      align(center + horizon, s.at(0)),
    )
  }
  let cells = (
    grid.cell(x: 1, y: 0, align: center + bottom, pad(bottom: 2pt, text(weight: "bold", size: 9pt, fill: navy, ust))),
    grid.cell(x: 2, y: 0, align: left + bottom, pad(bottom: 2pt, text(size: 6.4pt)[Bellek Adresi])),
  )
  for i in range(n) {
    cells.push(grid.cell(x: 1, y: i + 1, hucre(i)))
    cells.push(grid.cell(x: 2, y: i + 1, align: left + horizon,
      text(font: mono, size: 7.2pt, weight: if satirlar.at(i).at(1) { "bold" } else { "regular" }, adres(ilk + i))))
  }
  for (bas, say, icerik) in soller {
    cells.push(grid.cell(x: 0, y: bas + 1, rowspan: say, align: right + horizon, icerik))
  }
  grid(columns: (w_sol, w_ram, w_adres), column-gutter: 5pt, rows: (ust_h,) + (rh,) * n, ..cells)
}

#let bolum(baslik, renk: mavi, h: auto, govde) = block(
  width: 100%, height: h, fill: white, stroke: 1pt + renk.border, radius: 6pt, clip: true, inset: 0pt, breakable: false,
)[
  #block(width: 100%, fill: renk.light, inset: (x: 9pt, y: 5pt), text(weight: "bold", size: 10.5pt, fill: navy, baslik))
  #block(width: 100%, inset: (x: 9pt, top: 6pt, bottom: 6pt), govde)
]

#let sayi_daire(n, renk) = circle(radius: 7pt, fill: renk, align(center + horizon, text(fill: white, weight: "bold", size: 8pt, str(n))))

// İşlemci yükü ölçeri: 5 kutudan n tanesi dolu
#let olcer(n, renk) = {
  for i in range(5) {
    box(width: 8pt, height: 8pt, radius: 1.5pt, fill: if i < n { renk } else { luma(228) }, stroke: 0.5pt + luma(190))
    h(1.5pt)
  }
}

// ---------- Başlık sağı: RAM ⟷ İşlemci çizimi ----------
#let cpu_ram_cizim = {
  let ram = stack(
    dir: ttb, spacing: 0pt,
    block(width: 60pt, height: 26pt, fill: rgb("#2f8f68"), stroke: 1pt + rgb("#9be8c4"), radius: (top: 3pt), inset: 0pt)[
      #for i in range(3) {
        place(top + left, dx: 5pt + i * 18pt, dy: 6pt,
          rect(width: 14pt, height: 14pt, radius: 2pt, fill: rgb("#17263d"), stroke: 0.6pt + rgb("#8aa4c8"), inset: 0pt))
      }
    ],
    block(width: 60pt, height: 5pt, inset: 0pt)[
      #for i in range(10) {
        if i != 5 { place(top + left, dx: 3pt + i * 5.8pt, rect(width: 3.4pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none)) }
      }
    ],
    v(3pt),
    align(center, text(size: 7pt, weight: "bold", fill: white)[RAM]),
  )
  let cpu = block(width: 44pt, height: 44pt, inset: 0pt)[
    #for i in range(5) {
      place(top + left, dx: 6pt + i * 7pt, dy: 0pt, rect(width: 2.6pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none))
      place(bottom + left, dx: 6pt + i * 7pt, rect(width: 2.6pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none))
      place(top + left, dx: 0pt, dy: 6pt + i * 7pt, rect(width: 5pt, height: 2.6pt, fill: rgb("#e8b84a"), stroke: none))
      place(top + right, dx: 0pt, dy: 6pt + i * 7pt, rect(width: 5pt, height: 2.6pt, fill: rgb("#e8b84a"), stroke: none))
    }
    #place(center + horizon, rect(width: 32pt, height: 32pt, radius: 3pt, fill: rgb("#2b5ea3"), stroke: 1.2pt + rgb("#8fbcf0"), inset: 0pt,
      align(center + horizon, text(size: 6.4pt, weight: "bold", fill: white)[İŞLEMCİ])))
  ]
  grid(
    columns: (auto, auto, auto), column-gutter: 5pt, align: horizon,
    ram,
    stack(dir: ttb, spacing: 1pt, align(center, text(size: 16pt, weight: "bold", fill: rgb("#8fbcf0"))[⟷]), align(center, text(size: 5.8pt, fill: rgb("#d6e4f7"))[veri yolu])),
    cpu,
  )
}

// Arka plan yalnızca infografiğin biraz dışına taşar, kâğıt kenarları beyaz kalır
#block(width: 100%, fill: rgb("#f2f6fc"), outset: 8pt, radius: 10pt)[

// ---------- BAŞLIK ----------
#block(width: 100%, height: h_baslik, fill: navy, radius: 8pt, inset: (x: 14pt, y: 9pt))[
  #grid(
    columns: (1fr, 150pt), gutter: 14pt, align: horizon,
    [
      #set par(leading: 0.95em)
      #text(fill: white, weight: "bold", size: 18pt)[RAM ve İşlemci İlişkisi] \
      #v(3pt)
      #text(fill: rgb("#d6e4f7"), size: 8.4pt)[İşlemci, RAM'den aldığı veriyi işleyip tekrar RAM'e yazar. \ Veri ne kadar büyükse bu yolculuk o kadar uzun sürer.]
    ],
    align(center + horizon, cpu_ram_cizim),
  )
]

#v(bosluk)

// ---------- NEDEN-SONUÇ ZİNCİRİ ----------
#let halka(t, renk) = block(width: 100%, height: 28pt, fill: renk.lighten(84%), stroke: 1pt + renk, radius: 5pt, inset: (x: 4pt),
  align(center + horizon, text(size: 8pt, weight: "bold", fill: renk.darken(35%), t)))
#let ok = align(center + horizon, text(size: 14pt, weight: "bold", fill: luma(120))[▶])
#grid(
  columns: (1fr, 12pt, 1fr, 12pt, 1fr, 12pt, 1fr), align: horizon,
  halka([Büyük veri türü \ (daha çok bayt)], r_int), ok,
  halka([RAM'de daha \ fazla yer], r_char), ok,
  halka([Veri yolunda daha \ çok bayt taşınır], r_float), ok,
  halka([İşlemci daha uzun \ süre meşgul olur], r_kirmizi),
)

#v(bosluk)

// ---------- İŞLEMCİ RAM İLE NASIL ÇALIŞIR? ----------
#bolum("İşlemci RAM ile nasıl çalışır?  (sonuc = a + b)", h: h_s1)[
  #grid(
    columns: (auto, 1fr, 1.5fr), gutter: 12pt, align: horizon,
    ram_dik(
      mavi.main,
      ((nokta, false),
       (text(font: mono, weight: "bold", size: 8pt, fill: r_int)[a], true, r_int),
       (text(font: mono, weight: "bold", size: 8pt, fill: r_int)[b], true, r_int),
       (text(font: mono, weight: "bold", size: 8pt, fill: r_yesil)[sonuc], true, r_yesil)),
      ilk: 4096, rh: 14pt, w_ram: 62pt, w_adres: 50pt,
    ),
    grid(
      columns: (1fr, 50pt), column-gutter: 4pt, rows: (16pt, 14pt, 14pt, 14pt),
      grid.cell(x: 0, y: 1, rowspan: 2, align: center + horizon, text(weight: "bold", size: 8.4pt, fill: r_int)[oku ⟶]),
      grid.cell(x: 0, y: 3, align: center + horizon, text(weight: "bold", size: 8.4pt, fill: r_yesil)[⟵ yaz]),
      grid.cell(x: 1, y: 1, rowspan: 3, rect(width: 100%, height: 100%, radius: 4pt, fill: navy, stroke: 1pt + mavi.border, inset: 2pt,
        align(center + horizon, text(fill: white, weight: "bold", size: 6.8pt)[İŞLEMCİ \ #text(size: 5.8pt, weight: "regular", fill: rgb("#d6e4f7"))[topla (a + b)]]))),
    ),
    [
      #set par(leading: 0.5em)
      #grid(
        columns: (16pt, 1fr), row-gutter: 6pt, align: horizon,
        sayi_daire(1, r_int), [*Oku:* işlemci *a* ve *b* değerlerini RAM'den veri yolu ile alır.],
        sayi_daire(2, r_char), [*İşle:* toplama işlemini yapar.],
        sayi_daire(3, r_yesil), [*Yaz:* sonucu RAM'e geri yazar.],
      )
    ],
  )
]

#v(bosluk)

// ---------- AYNI İŞLEM, FARKLI VERİ TÜRÜ ----------
#let tip_karti(ad, bayt, renk, yuk, kod, a, b, s, yuk_n, okunan, yazilan, alt) = {
  let n = bayt
  let sat = ()
  for g in (a, b, s) { for x in g { sat.push((bitmetin(x, renk, size: 7pt), true)) } }
  let dh = 16pt + sat.len() * rh
  let toplam = (okunan + yazilan)
  block(
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
    #block(width: 100%, height: yuk - 32pt, inset: (x: 9pt, top: 5pt, bottom: 5pt))[
      #kod-satiri(raw(kod, lang: "cpp", block: true), no: 0, size: 8.6pt, width: 100%)
      #v(3pt)
      #grid(
        columns: (auto, 1fr), column-gutter: 6pt,
        ram_dik(
          renk, sat, ilk: 4096, rh: rh, w_sol: 40pt, w_ram: 56pt, w_adres: 50pt,
          soller: (
            (0, n, text(weight: "bold", size: 8.6pt, fill: navy)[a →]),
            (n, n, text(weight: "bold", size: 8.6pt, fill: navy)[b →]),
            (2 * n, n, text(weight: "bold", size: 8.6pt, fill: navy)[sonuc ←]),
          ),
        ),
        block(height: calc.max(dh, 120pt))[
          #grid(
            rows: (1fr, 1fr, 1fr), row-gutter: 3pt,
            block(width: 100%, height: 100%, fill: luma(247), stroke: 0.6pt + luma(215), radius: 3pt, inset: 3pt,
              align(center + horizon)[#text(size: 6.2pt, fill: luma(90))[RAM'de yer] \ #text(size: 10pt, weight: "bold", fill: renk.darken(20%))[#(3 * n) bayt]]),
            block(width: 100%, height: 100%, fill: luma(247), stroke: 0.6pt + luma(215), radius: 3pt, inset: 3pt,
              align(center + horizon)[#text(size: 6.2pt, fill: luma(90))[Veri yolundan geçen] \ #text(size: 10pt, weight: "bold", fill: renk.darken(20%))[#toplam bayt] \ #text(size: 5.8pt, fill: luma(100))[(#okunan oku + #yazilan yaz)]]),
            block(width: 100%, height: 100%, fill: luma(247), stroke: 0.6pt + luma(215), radius: 3pt, inset: 3pt,
              align(center + horizon)[#text(size: 6.2pt, fill: luma(90))[İşlemci yükü] \ #v(2pt) #olcer(yuk_n, if yuk_n > 3 { r_kirmizi } else { r_yesil })]),
          )
        ],
      )
      #v(1fr)
      #alt
    ]
  ]
}

#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  tip_karti("int", 2, r_int, h_s2, "int sonuc = a + b;",
    ("00000000", "00000111"), ("00000000", "00000010"), ("00000000", "00001001"), 2, 4, 2,
    block(width: 100%, fill: r_int.lighten(90%), stroke: (left: 3pt + r_int), radius: (right: 3pt), inset: (x: 7pt, y: 4pt),
      text(size: 7.8pt)[*a = 7, b = 2* için toplam sadece *6 bayt* RAM'e yazılıp okunur. Küçük bir işlemcide (ör. 8 bitlik Arduino Uno) bile 2 küçük adımda (düşük bayt, sonra yüksek bayt) toplanır.])),
  tip_karti("float", 4, r_float, h_s2, "float sonuc = a + b;",
    ("01000000", "11100000", "00000000", "00000000"), ("01000000", "00000000", "00000000", "00000000"), ("01000001", "00010000", "00000000", "00000000"), 5, 8, 4,
    block(width: 100%, fill: r_float.lighten(90%), stroke: (left: 3pt + r_float), radius: (right: 3pt), inset: (x: 7pt, y: 4pt),
      text(size: 7.8pt)[Aynı işlem için *12 bayt* taşınır: int'in *2 katı*. FPU olmayan işlemcilerde (ör. Arduino Uno) float, yazılımla çok daha fazla adımda hesaplanır.])),
)

#v(bosluk)

// ---------- METİN: CHAR DİZİSİ ----------
#let harfler = (
  ("A", "65", "01000001"), ("l", "108", "01101100"), ("i", "105", "01101001"), ("SP", "32", "00100000"),
  ("C", "67", "01000011"), ("a", "97", "01100001"), ("n", "110", "01101110"),
)
#let adim(i, c) = {
  let bos = c == "SP"
  let renk = if bos { r_float } else { r_char }
  block(width: 100%, height: 30pt, fill: renk.lighten(86%), stroke: (if bos { 1.4pt } else { 0.7pt }) + renk, radius: 3pt, inset: 0pt,
    align(center + horizon)[
      #text(font: mono, weight: "bold", size: if bos { 8pt } else { 10pt }, fill: renk.darken(30%), c) \
      #text(size: 6pt, fill: luma(90))[adım #i]
    ])
}

#bolum("Metin (char dizisi): her karakter 1 bayt, boşluk da dahil", renk: (main: r_char, light: r_char.lighten(86%), border: r_char.lighten(40%)), h: h_s3)[
  #grid(
    columns: (1fr, 178pt), gutter: 14pt,
    [
      #set par(leading: 0.55em)
      #kod-satiri(raw("char isim[7] = {'A', 'l', 'i', ' ', 'C', 'a', 'n'};", lang: "cpp", block: true), no: 0, size: 7.8pt, width: 100%)
      #v(3pt)
      #set list(marker: text(fill: r_char, weight: "bold")[•], body-indent: 5pt, spacing: 0.5em)
      #list(
        [*"Ali Can"* = 6 harf + 1 boşluk = *7 karakter = 7 bayt*],
        [*Boşluk da bir karakterdir:* ASCII 32, RAM'de 1 bayt yer kaplar ve işlemci onu da okur.],
        [Metni kopyalarken, karşılaştırırken ya da ekrana yazarken işlemci *her karakter için bir adım* atar.],
      )
      #v(4pt)
      #grid(
        columns: (1fr,) * 7, gutter: 2pt,
        ..harfler.enumerate().map(((i, (c, k, bits))) => adim(i + 1, c)),
      )
    ],
    [
      #ram_dik(
        r_char,
        harfler.map(((c, k, bits)) => (
          grid(
            columns: (15pt, 1fr, 22pt), align: center + horizon,
            text(font: mono, weight: "bold", size: if c == "SP" { 6.6pt } else { 8.2pt }, fill: (if c == "SP" { r_float } else { r_char }).darken(30%), c),
            bitmetin(bits, if c == "SP" { r_float } else { r_char }, size: 7.2pt),
            text(size: 6.6pt, fill: luma(90), k),
          ),
          true,
          if c == "SP" { r_float } else { r_char },
        )),
        ilk: 4096, rh: rh_metin, w_ram: 118pt, w_adres: 50pt,
        ust: [RAM \ #text(size: 5.8pt, weight: "regular", fill: luma(90))[karakter · 8 bit · ASCII]], ust_h: 22pt,
      )
      #v(5pt)
      #grid(
        columns: (40pt, 77pt, 56pt), row-gutter: 3pt, column-gutter: 3pt, align: horizon,
        text(size: 7pt, weight: "bold")["Ali"], align(left, rect(width: 3 * 11pt, height: 9pt, radius: 2pt, fill: r_char.lighten(40%), stroke: none)), text(size: 6.8pt)[3 bayt · 3 adım],
        text(size: 7pt, weight: "bold", baseline: 0pt)["Ali Can"], align(left, rect(width: 7 * 11pt, height: 9pt, radius: 2pt, fill: r_char, stroke: none)), text(size: 6.8pt)[7 bayt · 7 adım],
      )
    ],
  )
]

#v(bosluk)

// ---------- İPUÇLARI ----------
#let ipucu(n, renk, baslik, metin) = block(width: 100%, height: 56pt, fill: white, stroke: 1pt + renk.lighten(40%), radius: 5pt, inset: (x: 6pt, y: 5pt))[
  #grid(columns: (16pt, 1fr), gutter: 5pt,
    sayi_daire(n, renk),
    [#text(weight: "bold", size: 8pt, fill: navy, baslik) \ #text(size: 7.2pt, metin)],
  )
]
#grid(
  columns: (1fr,) * 4, gutter: 5pt,
  ipucu(1, r_int, [Tam sayı: int], [Küsurat gerekmedikçe float kullanma: daha çok RAM, daha çok işlemci süresi.]),
  ipucu(2, r_char, [Uygun türü seç], [Değerin aralığına yeten en küçük türü kullan.]),
  ipucu(3, r_float, [Metin uzadıkça], [Boşluklar dahil her karakter RAM'de yer tutar ve işlenir; yük artar.]),
  ipucu(4, r_kirmizi, [Eski donanım], [RAM ve işlemci sınırlıydı; veri türleri verimli bellek yönetimi için doğdu.]),
)

#v(bosluk)

// ---------- NOT ----------
#block(width: 100%, fill: rgb("#eff6ff"), stroke: (left: 3pt + rgb("#3b82f6")), radius: (right: 3pt), inset: (x: 10pt, y: 3.5pt))[
  #text(size: 7.2pt)[*Not:* Bayt sayıları C++ ve 16 bit sistemler (Arduino Uno, Turbo C) esas alınarak verilmiştir. Gerçek işlem süresi işlemciye göre değişir; ama RAM'de yer kaplayan her bayt, veri yolundan geçer ve işlemcinin işini artırır. Python'da bellek yapısı farklıdır.]
]

]
