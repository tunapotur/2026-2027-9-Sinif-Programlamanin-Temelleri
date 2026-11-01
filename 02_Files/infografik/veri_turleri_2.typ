// Infografik: Veri Türleri ve RAM Kullanımı (dikey RAM gösterimi)
#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 8.8pt, lang: "tr")
#set par(leading: 0.5em, spacing: 0.5em)
#set smartquote(enabled: false)

// ---------- Ayarlanabilir ölçüler ----------
#let h_baslik = 62pt
#let h_giris = 104pt   // "RAM: üst üste dizilmiş kutular" bölümü
#let h_sira1 = 155pt   // bool + char
#let h_sira2 = 189pt   // int + float
#let h_metin = 190pt   // Karakterden metne
#let bosluk = 4pt
#let rh = 12pt         // Tür kartlarındaki RAM satır yüksekliği
#let rh_metin = 11pt   // Karakterden metne bölümündeki RAM satır yüksekliği

// ---------- Renkler (ders notu şablonundaki ram-renkleri ile aynı) ----------
#let navy = rgb("#16325c")
#let r_bool = rgb("#16a34a")
#let r_char = rgb("#9333ea")
#let r_int = rgb("#2563eb")
#let r_float = rgb("#ea580c")
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

// ---------- Dikey RAM çizimi ----------
// satirlar: (içerik, vurgulu mu?) çiftleri. sol: soldaki etiket (sol_bas. satırdan sol_say satır boyunca)
#let ram_dik(
  renk, satirlar, ilk: 4096, rh: 13pt, w_sol: 0pt, w_ram: 92pt, w_adres: 50pt,
  sol: none, sol_bas: 0, sol_say: 1, ust: [RAM], ust_h: 16pt,
) = {
  let n = satirlar.len()
  let hucre(i) = {
    let (icerik, vurgu) = satirlar.at(i)
    block(
      width: 100%, height: rh, inset: 0pt,
      fill: if vurgu { renk.lighten(82%) } else { rgb("#e3e8f0") },
      stroke: if vurgu { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.7pt + renk, bottom: 0.7pt + renk) }
              else { (left: 1.2pt + navy, right: 1.2pt + navy, top: 0.4pt + luma(175), bottom: 0.4pt + luma(175)) },
      align(center + horizon, icerik),
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
  if sol != none {
    cells.push(grid.cell(x: 0, y: sol_bas + 1, rowspan: sol_say, align: right + horizon, sol))
  }
  grid(columns: (w_sol, w_ram, w_adres), column-gutter: 5pt, rows: (ust_h,) + (rh,) * n, ..cells)
}

#let nokta = text(fill: luma(110))[…]

// Bir veri türünün RAM'de kapladığı satırlar: bool 1, char 1, int 2, float 4
#let ram_tur(renk, ad, bayt, bitler) = {
  let veri = bitler.split(" ")
  let sat = ((nokta, false),) + veri.map(b => (bitmetin(b, renk), true)) + ((nokta, false),)
  ram_dik(
    renk, sat, ilk: 4096, rh: rh, w_sol: 64pt, w_ram: 88pt, w_adres: 48pt,
    sol: align(right)[
      #text(weight: "bold", size: 9.6pt, fill: navy, ad) #text(fill: navy, size: 10pt, weight: "bold")[→] \
      #text(size: 7pt, fill: luma(90))[(#bayt bayt)]
    ],
    sol_bas: 1, sol_say: bayt,
  )
}

#let tur_karti(ad, bayt, renk, yuk, maddeler, kod, bitler, degisken) = block(
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
  #block(width: 100%, inset: (x: 9pt, top: 5pt, bottom: 5pt))[
    #set list(marker: text(fill: renk, weight: "bold")[•], body-indent: 5pt, spacing: 0.5em)
    #set par(leading: 0.5em)
    #list(..maddeler)
    #v(3pt)
    #kod-satiri(raw(kod, lang: "cpp", block: true), no: 0, size: 8.6pt, width: 100%)
    #v(2pt)
    #align(center, ram_tur(renk, degisken, bayt, bitler))
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
  let w = 150pt
  let renkler = (r_bool, r_char, r_int, r_float)
  let boyutlar = ("1", "1", "2", "4")
  stack(
    dir: ttb, spacing: 0pt,
    block(width: w, height: 32pt, fill: rgb("#2f8f68"), stroke: 1pt + rgb("#9be8c4"), radius: (top: 3pt), inset: 0pt)[
      #for i in range(4) {
        place(top + left, dx: 7pt + i * 36pt, dy: 7pt,
          rect(width: 28pt, height: 18pt, radius: 2pt, fill: renkler.at(i), stroke: 0.8pt + white, inset: 0pt,
            align(center + horizon, text(font: mono, size: 8.6pt, weight: "bold", fill: white, boyutlar.at(i)))))
      }
    ],
    block(width: w, height: 5pt, inset: 0pt)[
      #for i in range(23) {
        if i != 11 { place(top + left, dx: 4pt + i * 6.2pt, rect(width: 3.6pt, height: 5pt, fill: rgb("#e8b84a"), stroke: none)) }
      }
    ],
    v(5pt),
    align(center, text(size: 6.6pt, fill: rgb("#d6e4f7"))[bool · char · int · float \ (bayt cinsinden boyut)]),
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
      #text(fill: white, weight: "bold", size: 18pt)[Veri Türleri ve RAM Kullanımı] \
      #v(3pt)
      #text(fill: rgb("#d6e4f7"), size: 8.4pt)[Programlar verileri RAM'de bayt kutularında saklar. Verinin türü, kaç \ bayt yer ayrılacağını ve hangi işlemlerin yapılabileceğini belirler.]
    ],
    ram_cubuk,
  )
]

#v(bosluk)

// ---------- RAM = KUTULAR (dikey) ----------
#bolum("RAM: üst üste dizilmiş küçük kutular", h: h_giris)[
  #grid(
    columns: (auto, 1fr, 1.15fr), gutter: 12pt,
    ram_dik(
      mavi.main,
      ((nokta, false),
       (text(size: 7.4pt, weight: "bold", fill: navy)[1 bayt], true),
       (text(size: 6.8pt, fill: luma(100))[1 bayt], false),
       (nokta, false)),
      ilk: 4096, rh: 13pt, w_ram: 74pt, w_adres: 50pt,
    ),
    // seçili kutunun 8 bite yakınlaştırılması
    pad(top: 16pt + 1.5 * 13pt - 17pt)[
      #grid(
        columns: (auto, 1fr), gutter: 4pt, align: horizon,
        text(size: 13pt, fill: mavi.main, weight: "bold")[◀],
        [
          #grid(
            columns: (1fr,) * 8, gutter: 1.5pt,
            ..("0", "1", "0", "0", "0", "0", "0", "1").map(b => rect(
              width: 100%, height: 14pt, radius: 2pt, inset: 0pt, stroke: 0.6pt + mavi.border,
              fill: if b == "1" { mavi.light.darken(6%) } else { luma(248) },
              align(center + horizon, text(font: mono, size: 8.4pt, weight: "bold", fill: navy, b)),
            )),
          )
          #v(1pt)
          #text(size: 7.4pt, fill: luma(90))[*1 bayt = 8 bit* \ (her bit yalnızca 0 ya da 1)]
        ],
      )
    ],
    align(horizon)[
      #set par(leading: 0.55em)
      #grid(
        columns: (16pt, 1fr), row-gutter: 7pt, align: horizon,
        circle(radius: 7pt, fill: mavi.main, align(center + horizon, text(fill: white, weight: "bold", size: 8pt)[1])),
        [Bu veri *ne tür* bir veri? \ #text(size: 7.4pt, fill: luma(100))[(sayı mı, karakter mi, doğru/yanlış mı?)]],
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
    ([İki değer: *true* (1) ya da *false* (0)], [Karar yapılarında kullanılır (if, while)], [Tek bit yeter; yine de 1 tam bayt ayrılır]),
    "bool kapiAcik = true;", "00000001", "kapiAcik"),
  tur_karti("char", 1, r_char, h_sira1,
    ([Tek karakter: harf, rakam karakteri, noktalama], [ASCII sayısıyla saklanır: 'A' = 65], [Matematiksel işlem yapılmaz: '5' ≠ 5]),
    "char harf = 'A';", "01000001", "harf"),
)

#v(bosluk)

// ---------- int + float ----------
#grid(
  columns: (1fr, 1fr), gutter: 8pt,
  tur_karti("int", 2, r_int, h_sira2,
    ([2#super[16] = 65536 değer: −32768 … +32767], [Yalnızca tam sayı: 7 / 2 = 3, 7 % 2 = 1], [Toplama, çıkarma, çarpma, bölme, mod]),
    "int puan = 50;", "00000000 00110010", "puan"),
  tur_karti("float", 4, r_float, h_sira2,
    ([Virgüllü sayılar: 3.14 (kodda nokta ile)], [int'in 2 katı yer; 7 / 2 = 3.5 (küsuratlı)], [Çok geniş aralık, IEEE 754 biçimi]),
    "float pi = 3.14;", "01000000 01001000 11110101 11000011", "pi"),
)

#v(bosluk)

// ---------- Karakterden metne (dikey) ----------
#let harfler = (
  ("A", "65", "01000001"), ("d", "100", "01100100"), ("a", "97", "01100001"), ("SP", "32", "00100000"),
  ("L", "76", "01001100"), ("o", "111", "01101111"), ("v", "118", "01110110"), ("e", "101", "01100101"),
  ("l", "108", "01101100"), ("a", "97", "01100001"), ("c", "99", "01100011"), ("e", "101", "01100101"),
)

#bolum("Karakterden Metne", renk: (main: r_char, light: r_char.lighten(86%), border: r_char.lighten(40%)), h: h_metin)[
  #grid(
    columns: (1fr, auto), gutter: 14pt,
    [
      #set par(leading: 0.55em)
      Tek bir *char* 1 bayt yer kaplar. Birden fazla karakterden oluşan bir metin için her harfe RAM'de art arda (bitişik) 1 baytlık kutular ayrılır.
      #v(4pt)
      #block(fill: r_char.lighten(90%), stroke: (left: 3pt + r_char), radius: (right: 3pt), inset: (x: 8pt, y: 5pt), width: 100%,
        text(size: 8.4pt)[*Toplam bellek alanı* = karakter sayısı × 1 bayt])
      #v(4pt)
      #text(font: mono, size: 8pt, weight: "bold")["Ada Lovelace"] → 12 karakter (boşluk dahil) = *12 bayt*. Boşluk karakteri (SP, ASCII 32) de 1 bayt yer kaplar.
      #v(5pt)
      #block(fill: mavi.light, stroke: (left: 3pt + mavi.main), radius: (right: 3pt), inset: (x: 8pt, y: 5pt), width: 100%)[
        #text(size: 8pt)[*Neden önemli?* Büyük veri türleri hem RAM'de daha fazla yer kaplar hem de işlemciyi daha fazla meşgul eder; bu yüzden gerekmedikçe *int* yerine *float* kullanılmamalıdır.]
      ]
    ],
    ram_dik(
      r_char,
      harfler.map(((c, k, bits)) => (
        grid(
          columns: (15pt, 1fr, 22pt), align: center + horizon,
          text(font: mono, weight: "bold", size: if c == "SP" { 6.6pt } else { 8.6pt }, fill: r_char.darken(30%), c),
          bitmetin(bits, r_char, size: 7.4pt),
          text(size: 6.8pt, fill: luma(90), k),
        ),
        true,
      )),
      ilk: 4096, rh: rh_metin, w_ram: 122pt, w_adres: 50pt,
      ust: [RAM \ #text(size: 5.8pt, weight: "regular", fill: luma(90))[karakter · 8 bit · ASCII]], ust_h: 22pt,
    ),
  )
]

#v(bosluk)

// ---------- NOT ----------
#block(width: 100%, fill: rgb("#eff6ff"), stroke: (left: 3pt + rgb("#3b82f6")), radius: (right: 3pt), inset: (x: 10pt, y: 3.5pt))[
  #text(size: 7.4pt)[*Not:* Anlatımda C++ ve 16 bit sistemler (Arduino Uno, Turbo C) esas alınmıştır; böylece veri türlerinin donanımsal mantığı daha rahat anlaşılır. Derslerimizde Python kullanılacaktır; Python'da veri türleri ve bellek yapısı farklı işler.]
]

]
