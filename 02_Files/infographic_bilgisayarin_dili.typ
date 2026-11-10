// Infografik: Transistörden Yüksek Seviyeli Dillere
#set page(paper: "a4", margin: (top: 1.5cm, left: 2cm, bottom: 1cm, right: 1.5cm))
#set text(font: "DejaVu Sans", size: 7.6pt, lang: "tr")
#set par(leading: 0.48em, spacing: 0.55em)

// Renkler
#let c_mor = (fill: rgb("#e6d6ff"), stroke: rgb("#9673a6"))
#let c_sari = (fill: rgb("#ffffcc"), stroke: rgb("#a3a35c"))
#let c_yesil = (fill: rgb("#d5f5d0"), stroke: rgb("#82b366"))
#let c_mavi = (fill: rgb("#cce5ff"), stroke: rgb("#6c8ebf"))

// Kutu yükseklikleri (buradan ayarlayabilirsin)
#let h_kutu12 = 76pt   // Kutu 1 (Transistör) ve Kutu 2 (Bit)
#let h_kutu34 = 155pt  // Kutu 3 (Altair) ve Kutu 4 (Hexadecimal)

#let mono(t) = text(font: "DejaVu Sans Mono", size: 7.2pt, t)

#let card(title, c, h: auto, body) = block(
  width: 100%, height: h, fill: c.fill.lighten(35%), stroke: 1pt + c.stroke, radius: 5pt, inset: 7pt, breakable: false,
)[
  #text(weight: "bold", size: 8.6pt, fill: c.stroke.darken(35%))[#title]
  #v(2pt)
  #body
]

#let bitbox(v, c: c_mor) = box(
  width: 11pt, height: 13pt, radius: 2pt,
  fill: if v == 1 { c.stroke } else { c.fill },
  stroke: 0.6pt + c.stroke,
  align(center + horizon, text(fill: if v == 1 { white } else { c.stroke.darken(40%) }, weight: "bold", size: 7.5pt, str(v))),
)
#let bits(s, c: c_mor) = {
  for (i, ch) in s.clusters().enumerate() {
    if ch == " " { h(5pt) } else { bitbox(int(ch), c: c); h(1.5pt) }
  }
}

#let lamp(on) = circle(
  radius: 8pt,
  fill: if on { rgb("#ffd34d") } else { luma(205) },
  stroke: 1pt + if on { rgb("#e0a800") } else { luma(120) },
)
#let sw(v) = box(
  width: 11pt, height: 19pt, radius: 2pt, fill: luma(228), stroke: 0.6pt + luma(120),
  align(if v == 1 { top } else { bottom },
    rect(width: 100%, height: 9pt, radius: 2pt, fill: if v == 1 { c_yesil.stroke } else { luma(120) }, stroke: none)),
)
#let pill(t, c) = box(fill: c.fill, stroke: 0.8pt + c.stroke, radius: 8pt, inset: (x: 5pt, y: 2.5pt), text(weight: "bold", size: 7.2pt, t))

// ---------- BAŞLIK ----------
#block(
  width: 100%, radius: 7pt, inset: (x: 12pt, y: 9pt),
  fill: gradient.linear(rgb("#7a5a96"), rgb("#4f74a8"), angle: 0deg),
)[
  #text(fill: white, weight: "bold", size: 17pt)[Bilgisayarın Dili] \
  #text(fill: rgb("#ece4f7"), size: 9pt)[Transistörden yüksek seviyeli programlama dillerine: 1 ve 0'ın yolculuğu]
]

#v(3pt)

// ---------- EVRİM ŞERİDİ ----------
#let stage(n, name, ex, ok, zor, c) = block(
  width: 100%, height: 74pt, fill: c.fill, stroke: 1pt + c.stroke, radius: 5pt, inset: 6pt, breakable: false,
)[
  #box(circle(radius: 6pt, fill: c.stroke, align(center + horizon, text(fill: white, weight: "bold", size: 7pt, str(n))))) #h(2pt)
  #text(weight: "bold", size: 8pt)[#name]
  #v(1pt)
  #align(center, block(fill: white, radius: 3pt, inset: (x: 4pt, y: 2.5pt), mono(ex)))
  #v(1pt)
  #text(size: 6.6pt)[#text(fill: rgb("#3b7a2a"), weight: "bold")[✓] #ok] \
  #text(size: 6.6pt)[#text(fill: rgb("#b03030"), weight: "bold")[✗] #zor]
]
#let arrow = align(center + horizon, text(size: 13pt, fill: luma(110), weight: "bold")[›])

#text(weight: "bold", size: 9pt)[Programlamanın Evrimi]
#v(2pt)
#grid(
  columns: (1fr, 9pt, 1fr, 9pt, 1fr, 9pt, 1fr), align: horizon,
  stage(1, "Makine Dili", "1011 0000", "İşlemci çeviri olmadan çalıştırır", "Okuması ve yazması çok zor", c_mor), arrow,
  stage(2, "Hexadecimal", "B0 61", "0/1 dizilerini 4'lü gruplarla kısaltır", "Komut kodları ezberlenmeli", c_sari), arrow,
  stage(3, "Assembly", "MOV AL, 61H", "Anlamlı kısaltmalar (MOV, ADD)", "Her işlemciye özel, kod uzar", c_yesil), arrow,
  stage(4, "Yüksek Seviyeli", "sonuc = a + b", "Kolay, donanımdan bağımsız, hızlı", "Derleyici/yorumlayıcı gerekir", c_mavi),
)

#v(3pt)

// ---------- TRANSİSTÖR + BİT ----------
#grid(
  columns: (1.55fr, 1fr), gutter: 6pt,
  card("1 · Transistör: Akımı Geçirir veya Keser", c_sari, h: h_kutu12)[
    Bilgisayarın en temel donanım birimi; işlemci ve hafızada *milyarlarca* transistör bulunur.
    #v(3pt)
    #grid(
      columns: (1fr, 1fr), gutter: 6pt,
      block(fill: white, radius: 4pt, inset: 5pt, width: 100%)[
        #grid(columns: (auto, 1fr), gutter: 5pt, align: horizon, lamp(true),
          [#text(weight: "bold", fill: rgb("#8a6a00"))[AÇIK · Çıkış 1] \ Base: HIGH (5V) \ Akım geçer, LED yanar])
      ],
      block(fill: white, radius: 4pt, inset: 5pt, width: 100%)[
        #grid(columns: (auto, 1fr), gutter: 5pt, align: horizon, lamp(false),
          [#text(weight: "bold", fill: luma(80))[KAPALI · Çıkış 0] \ Base: LOW (0V) \ Akım kesilir, LED söner])
      ],
    )
  ],
  card("2 · Bit (Binary Digit)", c_mor, h: h_kutu12)[
    1 ve 0 durumunu oluşturan *en küçük bilgi birimi.* Yazılımlar, videolar, oyunlar ve metinler fiziksel olarak yalnızca 1 ve 0'lardan oluşur.
    #v(2pt)
    #align(center, bits("1 0 1 1"))
  ],
)

#v(3pt)

// ---------- ALTAIR + HEX ----------
#grid(
  columns: (1.15fr, 1fr), gutter: 6pt,
  card("3 · Altair 8800 (1970'lerin ortası)", c_mavi, h: h_kutu34)[
    Klavye ve ekran yoktu; ön panelde *toggle switch* ve LED'ler vardı. Her 8 bitlik komut anahtarlarla tek tek belleğe yükleniyordu: yukarı = 1, aşağı = 0.
    #v(3pt)
    #block(
      fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), radius: 4pt, inset: 5pt, width: 100%,
    )[
      #show raw: set text(font: "DejaVu Sans Mono", size: 6.1pt)  // şekil boyutu
      #align(center)[
```text
+-------------------------------------------------------------+
|                  ALTAIR 8800 ÖN PANELİ                      |
|                                                             |
|   LED'ler (Çıkış):    (O) (X) (O) (O)   (X) (X) (O) (X)     |
|                        0   1   0   0     1   1   0   1      |
|                                                             |
|   Anahtarlar (Giriş): [v] [^] [v] [v]   [^] [^] [v] [^]     |
|                        0   1   0   0     1   1   0   1      |
+-------------------------------------------------------------+
```
      ]
    ]
    #v(1pt)
    #text(size: 6.8pt)[İki sayıyı toplamak için bile onlarca komut hatasız girilmeliydi: yavaş, yorucu, hataya açık.]
  ],
  card("4 · Hexadecimal: 4 Bit = 1 Basamak", c_sari, h: h_kutu34)[
    2#super[4] = 16 olduğundan 4 bit, tek bir hex karakterine (0–9, A–F) karşılık gelir.
    #v(2pt)
    #grid(
      columns: 4, gutter: 2.5pt,
      ..range(16).map(i => block(fill: white, stroke: 0.6pt + c_sari.stroke, radius: 3pt, inset: (x: 2pt, y: 2.5pt), width: 100%)[
        #align(center)[#text(weight: "bold", size: 8.5pt, fill: rgb("#7a6a00"))[#upper(str(i, base: 16))] #text(size: 6pt, fill: luma(110))[(#i)] \
          #text(font: "DejaVu Sans Mono", size: 6.6pt)[#("0000" + str(i, base: 2)).slice(-4)]]
      ]),
    )
    #v(2pt)
    #align(center)[#mono[1011 0000] → #text(weight: "bold")[B0] #h(8pt) #mono[0110 0001] → #text(weight: "bold")[61]]
  ],
)

#v(3pt)

// ---------- ASCII ----------
#card("5 · Metin Temsili: 8 Bit = 1 Byte ve ASCII", c_yesil)[
  #grid(
    columns: (1fr, 1.25fr), gutter: 8pt,
    [
      Harf ve sembolleri sayılarla temsil etmek için *ASCII* standardı geliştirildi. 1 karakter = *1 Byte* (8 bit) yer kaplar ve iki hex karakterle yazılır.
      #v(3pt)
      #align(center)[
        #box(fill: white, radius: 4pt, stroke: 0.8pt + c_yesil.stroke, inset: 4pt)[
          #bits("0100 0001", c: c_yesil)
        ] \
        #v(1pt)
        #text(size: 7.4pt)[1 Byte = hex *41* = onluk *65* = '*A*']
      ]
    ],
    table(
      columns: (auto, 1fr, 1fr, 2fr), align: center + horizon, inset: 2.6pt,
      fill: (_, y) => if y == 0 { c_yesil.stroke } else if calc.odd(y) { white } else { c_yesil.fill.lighten(40%) },
      stroke: 0.4pt + c_yesil.stroke,
      table.header(..([Chr], [Dec], [Hex], [Binary]).map(t => text(fill: white, weight: "bold", size: 7pt, t))),
      mono[SP], mono[32], mono[20], mono[0010 0000],
      mono[0], mono[48], mono[30], mono[0011 0000],
      mono[A], mono[65], mono[41], mono[0100 0001],
      mono[a], mono[97], mono[61], mono[0110 0001],
      mono[DEL], mono[127], mono[7F], mono[0111 1111],
    ),
  )
  #v(3pt)
  #grid(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr), gutter: 3pt,
    ..(
      ("0–31 ve 127", "Kontrol karakterleri (basılamaz)", c_mor),
      ("32–47", "Boşluk ve semboller", c_sari),
      ("48–57", "Rakamlar 0–9", c_mavi),
      ("65–90", "Büyük harfler A–Z", c_yesil),
      ("97–122", "Küçük harfler a–z", c_yesil),
    ).map(((r, t, c)) => block(fill: c.fill, stroke: 0.7pt + c.stroke, radius: 3pt, inset: 3.5pt, width: 100%)[
      #align(center)[#text(weight: "bold", size: 7.4pt)[#r] \ #text(size: 6.4pt)[#t]]
    ]),
  )
]

#v(3pt)

// ---------- ASSEMBLY ----------
#card("6 · Makine Kodundan Assembly'ye", c_mor)[
  Komutlar, İngilizce kelime kısaltmalarından oluşan sembolik isimlerle (*mnemonic*) yazıldı. *Assembler* bu kodu makine koduna çevirir.
  #v(3pt)
  #grid(
    columns: (1.15fr, 1fr), gutter: 8pt,
    table(
      columns: (auto, auto, 1fr), align: left + horizon, inset: 3.75pt,
      fill: (_, y) => if y == 0 { c_mor.stroke } else if calc.odd(y) { white } else { c_mor.fill.lighten(40%) },
      stroke: 0.4pt + c_mor.stroke,
      table.header(..([Hex], [Assembly], [Açıklama]).map(t => text(fill: white, weight: "bold", size: 7pt, t))),
      mono[B0 61], mono[MOV AL, 61H], text(size: 6.6pt)[AL'ye 61H taşındı],
      mono[04 05], mono[ADD AL, 05H], text(size: 6.6pt)[AL'ye 05H eklendi],
      mono[2C 02], mono[SUB AL, 02H], text(size: 6.6pt)[AL'den 02H çıkarıldı],
    ),
    block(fill: rgb("#2b2f3a"), radius: 4pt, inset: 6pt, width: 100%)[
      #text(fill: rgb("#9fb4d8"), size: 6.4pt, weight: "bold")[x86 · 5 + 7] \
      #text(font: "DejaVu Sans Mono", size: 6.8pt, fill: white)[
        mov eax, 5 #text(fill: rgb("#7fd68a"))[; ilk sayı] \
        mov ebx, 7 #text(fill: rgb("#7fd68a"))[; ikinci sayı] \
        add eax, ebx #text(fill: rgb("#7fd68a"))[; 12]
      ] \
      #text(fill: rgb("#ffd34d"), size: 6.8pt)[Yüksek seviyede: ] #text(font: "DejaVu Sans Mono", fill: white, size: 7pt)[sonuc = a + b]
    ],
  )
]

#v(3pt)

// ---------- DERLEYİCİ / YORUMLAYICI ----------
#card("7 · Programlama Dilleri: Derleyici ve Yorumlayıcı", c_mavi)[
  Fortran, COBOL ve C gibi dillerde çıktı; makine koduna çevrilir. Öğrenmesi kolaydır, donanımdan bağımsızdır ve hızlı yazılım geliştirmeyi sağlar.
  #v(3pt)
  
  #layout(size => {
    let gw = 6pt
    let wl = (size.width - gw) * 1.6 / 2.6
    // Sol: derleyici ve yorumlayıcı alt alta
    let left = stack(
      spacing: 6pt,
      block(fill: white, stroke: 0.8pt + c_mavi.stroke, radius: 4pt, inset: 5pt, width: 100%)[
        #pill([Derleyici (Compiler)], c_mavi) \
        #v(2pt)
        Kodun *tamamını* baştan sona okur, hataları denetler, bütünü makine diline çevirir. Söz diziminde hata varsa derleme tamamlanmaz.
      ],
      block(fill: white, stroke: 0.8pt + c_mavi.stroke, radius: 4pt, inset: 5pt, width: 100%)[
        #pill([Yorumlayıcı (Interpreter)], c_mavi) \
        #v(2pt)
        Kodu *satır satır* okuyup anında çalıştırır; hatalı satıra gelince durur. Tıpkı anlık çeviri yapan bir tercüman gibi (Python, Ruby).
      ],
    )
    let hl = measure(left, width: wl).height
    // Sağ: Python örneği (sol sütunla aynı yükseklikte)
    let right = block(fill: rgb("#2b2f3a"), radius: 4pt, inset: 7pt, width: 100%, height: hl)[
      #text(fill: rgb("#9fb4d8"), size: 6.4pt, weight: "bold")[PYTHON · YORUMLAYICI ÖRNEĞİ]
      #v(3pt)
      #let kod(n, t) = grid(columns: (9pt, 1fr), text(fill: luma(130), n), t)
      #set text(font: "DejaVu Sans Mono", size: 6.8pt, fill: white)
      #set par(leading: 0.6em)
      #let str_(t) = text(fill: rgb("#7fd68a"), t)
      #let fn(t) = text(fill: rgb("#8ec5ff"), t)
      #kod("1", [puan = #fn("int")\(#fn("input")\(#str_("\"Puan Giriniz: \"")\)\)])
      #kod("2", [#fn("print")\(#str_("\"Puanı:\""), puan\)])
      #kod("3", [puan = puan + 25])
      #kod("4", [#fn("print")\(#str_("\"Güncellenmiş Puan:\""), puan\)])
      #v(3pt)
      #text(font: "DejaVu Sans", fill: rgb("#ffd34d"), size: 6.4pt)[Satırlar sırayla yorumlanıp çalıştırılır.]
    ]
    grid(columns: (1.6fr, 1fr), gutter: gw, left, right)
  })
]
