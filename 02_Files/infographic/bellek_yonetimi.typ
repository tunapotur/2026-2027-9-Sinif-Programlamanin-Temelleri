// Infografik: Bellek Yönetimi, RAM ve İşlemcinin İlişkisi
#set page(paper: "a4", margin: (top: 1.2cm, left: 1.6cm, bottom: 0.9cm, right: 1.6cm))
#set text(font: "DejaVu Sans", size: 8.2pt, lang: "tr")
#set par(leading: 0.44em, spacing: 0.44em)
#set smartquote(enabled: false)

// ---------- Renk Paleti ----------
#let navy = rgb("#16325c")
#let c_mavi = (main: rgb("#1d4ed8"), light: rgb("#eff6ff"), border: rgb("#93c5fd"), dark: rgb("#1e40af"))
#let c_yesil = (main: rgb("#15803d"), light: rgb("#f0fdf4"), border: rgb("#86efac"), dark: rgb("#166534"))
#let c_turuncu = (main: rgb("#c2410c"), light: rgb("#fff7ed"), border: rgb("#fed7aa"), dark: rgb("#9a3412"))
#let c_kirmizi = (main: rgb("#b91c1c"), light: rgb("#fef2f2"), border: rgb("#fca5a5"), dark: rgb("#991b1b"))
#let c_mor = (main: rgb("#7e22ce"), light: rgb("#faf5ff"), border: rgb("#e9d5ff"), dark: rgb("#6b21a8"))
#let c_gri = (main: rgb("#475569"), light: rgb("#f8fafc"), border: rgb("#cbd5e1"), dark: rgb("#1e293b"))
#let mono = "DejaVu Sans Mono"

// ---------- Yardımcı Bileşenler ----------
#let daire_sayi(n, renk) = circle(
  radius: 6.5pt, fill: renk,
  align(center + horizon, text(fill: white, weight: "bold", size: 7.5pt, str(n)))
)

#let olcer(dolu, toplam: 5, renk) = {
  for i in range(toplam) {
    box(
      width: 7.5pt, height: 7.5pt, radius: 1.5pt,
      fill: if i < dolu { renk } else { luma(225) },
      stroke: 0.5pt + if i < dolu { renk.darken(20%) } else { luma(190) }
    )
    h(1.5pt)
  }
}

#let bayt_kareleri(n, renk) = {
  for i in range(n) {
    box(width: 7pt, height: 7pt, radius: 1.2pt, fill: renk, stroke: 0.4pt + renk.darken(25%))
    h(1.2pt)
  }
}

#let mini_kutu(metin, c) = block(
  width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 4pt, inset: (x: 5pt, y: 5pt),
  align(center + horizon, text(size: 7.4pt, weight: "bold", fill: c.dark, metin))
)

#let ok_isareti = align(center + horizon, text(size: 11pt, weight: "bold", fill: luma(130))[▶])

// ============================================================
// ANA ÇERÇEVE
// ============================================================
#block(width: 100%, fill: rgb("#f1f5f9"), outset: (x: 6pt, y: 6pt), radius: 8pt)[

  // ---------- 1. BAŞLIK BANDI ----------
  #block(
    width: 100%, radius: 7pt, inset: (x: 12pt, y: 8pt),
    fill: gradient.linear(rgb("#16325c"), rgb("#1e40af"), angle: 0deg),
  )[
    #grid(
      columns: (1fr, auto), gutter: 10pt, align: horizon,
      [
        #text(fill: white, weight: "bold", size: 15pt)[Bellek Yönetimi, RAM ve İşlemci İlişkisi] \
        #v(2pt)
        #text(fill: rgb("#dbeafe"), size: 8.2pt)[
          Doğru veri türü seçimi hem RAM'de tasarruf sağlar hem de işlemcinin çalışma hızını katlar!
        ]
      ],
      [
        #block(
          fill: rgb("#ffffff").transparentize(88%), stroke: 0.8pt + rgb("#ffffff").transparentize(60%),
          radius: 4pt, inset: (x: 8pt, y: 4pt),
        )[
          #set text(fill: white, size: 7.2pt, weight: "bold")
          RAM #text(fill: rgb("#93c5fd"))[⟷] Veri Yolu #text(fill: rgb("#93c5fd"))[⟷] CPU
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 2. DONANIM ÜÇLÜSÜ VE BİR İŞLEMİN YAŞAM DÖNGÜSÜ ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[1. Donanım Mimarisi ve Bir İşlemin Yaşam Döngüsü (`sonuc = a + b`)],
      text(size: 7pt, fill: luma(100))[Oku ⟶ İşle ⟶ Yaz]
    )
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 6pt,
      // 1. Oku
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 6pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(1, c_mavi.main), text(weight: "bold", size: 8pt, fill: c_mavi.dark)[1. Oku (Fetch)])
        #v(2pt)
        #text(size: 7.2pt)[
          İşlemci RAM'deki veriyi doğrudan hesaplayamaz. *a* ve *b* değişkenlerini adreslerinden *Veri Yolu* üzerinden kendi yazmaçlarına çeker.
        ]
      ],
      // 2. İşle
      block(width: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 4pt, inset: 6pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(2, c_mor.main), text(weight: "bold", size: 8pt, fill: c_mor.dark)[2. İşle (Execute)])
        #v(2pt)
        #text(size: 7.2pt)[
          İşlemcinin *ALU (Aritmetik-Mantık Birimi)* ikilik sayıları toplar ($7 + 2 = 9$). Tür karmaşıklaştıkça işlemcinin bu adımı uzar.
        ]
      ],
      // 3. Yaz
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 6pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(3, c_yesil.main), text(weight: "bold", size: 8pt, fill: c_yesil.dark)[3. Yaz (Store)])
        #v(2pt)
        #text(size: 7.2pt)[
          İşlemci sonucu kendi içinde tutmaz. Bulduğu *9* değerini veri yolu üzerinden RAM'e geri yollar ve *sonuc* adresine yazar.
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 3. GÜNDELİK HAYAT BENZETMESİ: KARGO VE TRAFİK ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[2. Gündelik Hayat Benzetmesi: Kurye Çantası mı, Nakliye Tırı mı?]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr), gutter: 7pt,
      // Kurye Çantası
      block(
        width: 100%, fill: c_mavi.light, stroke: (left: 3pt + c_mavi.main), radius: (right: 4pt), inset: (x: 7pt, y: 5pt),
      )[
        #text(weight: "bold", size: 8.2pt, fill: c_mavi.dark)[📦 Doğru Tür (`int`): Çevik Motokurye] \
        #v(2pt)
        #text(size: 7.3pt)[
          Bir kalemi adrese götürmek için *küçük bir kurye çantası* kullanmak gibidir:
          - *RAM:* Depoda neredeyse hiç yer kaplamaz; diğer kutulara yer kalır.
          - *Veri Yolu:* Kurye hafif olduğundan trafikte hiç beklemeden anında geçer.
          - *İşlemci:* Çantayı açıp kalemi teslim almak (işlemek) tek bir hamlede biter.
        ]
      ],
      // Nakliye Tırı
      block(
        width: 100%, fill: c_turuncu.light, stroke: (left: 3pt + c_turuncu.main), radius: (right: 4pt), inset: (x: 7pt, y: 5pt),
      )[
        #text(weight: "bold", size: 8.2pt, fill: c_turuncu.dark)[🚚 Gereksiz Büyük Tür (`float`): Koca Nakliye Tırı] \
        #v(2pt)
        #text(size: 7.3pt)[
          Aynı tek kalemi taşımak için *dev bir nakliye tırı* kiralamak gibidir:
          - *RAM:* Kocaman bir depoyu tek bir kalem için gereksizce işgal eder (%50 israf).
          - *Veri Yolu:* Dar sokaklarda yolu tıkar; diğer verilerin geçişini geciktirir.
          - *İşlemci:* Koca tırı park edip rampasını açmak işlemciyi boş yere oyalar.
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 4. SOMUT KANIT: AYNI İŞLEM (7 + 2 = 9), İKİ FARKLI VERİ TÜRÜ ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[3. Somut Kanıt: Aynı İşlem ($7 + 2 = 9$), İki Farklı Veri Türü!]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr), gutter: 7pt,
      // INT KARTI
      block(
        width: 100%, fill: c_mavi.light.lighten(50%), stroke: 1pt + c_mavi.border, radius: 5pt, inset: 6pt,
      )[
        #grid(
          columns: (auto, 1fr, auto), gutter: 5pt, align: horizon,
          box(fill: c_mavi.main, radius: 3pt, inset: (x: 5pt, y: 2pt), text(fill: white, weight: "bold", size: 8.5pt, font: mono, "int")),
          text(size: 7.5pt, weight: "bold", fill: c_mavi.dark)[Doğru Seçim (Tam Sayı)],
          [#bayt_kareleri(2, c_mavi.main) #text(size: 7.5pt, weight: "bold", fill: c_mavi.dark)[2 Bayt]]
        )
        #v(3pt)
        #block(fill: white, stroke: 0.5pt + c_mavi.border, radius: 3pt, inset: 4pt, width: 100%)[
          #text(font: mono, size: 7.2pt)[int a = 7; int b = 2; int sonuc = a + b;]
        ]
        #v(3pt)
        #grid(
          columns: (1fr, 1fr, 1fr), gutter: 4pt,
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[RAM Tüketimi] \
            #text(size: 8.5pt, weight: "bold", fill: c_mavi.dark)[6 Bayt] \
            #text(size: 5.8pt, fill: c_yesil.dark)[(%50 tasarruf)]
          ]),
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[Veri Yolu Trafiği] \
            #text(size: 8.5pt, weight: "bold", fill: c_mavi.dark)[6 Bayt] \
            #text(size: 5.8pt, fill: luma(110))[(4 oku + 2 yaz)]
          ]),
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[İşlemci Eforu] \
            #text(size: 8.5pt, weight: "bold", fill: c_yesil.dark)[1 Çevrim] \
            #olcer(1, c_yesil.main)
          ])
        )
        #v(3pt)
        #block(fill: c_yesil.light, stroke: 0.5pt + c_yesil.border, radius: 2pt, inset: 3pt, width: 100%)[
          #text(size: 6.8pt, fill: c_yesil.dark)[*Sonuç:* Hafif bellek, açık veri yolu, maksimum doğal işlemci hızı!]
        ]
      ],
      // FLOAT KARTI
      block(
        width: 100%, fill: c_turuncu.light.lighten(50%), stroke: 1pt + c_turuncu.border, radius: 5pt, inset: 6pt,
      )[
        #grid(
          columns: (auto, 1fr, auto), gutter: 5pt, align: horizon,
          box(fill: c_turuncu.main, radius: 3pt, inset: (x: 5pt, y: 2pt), text(fill: white, weight: "bold", size: 8.5pt, font: mono, "float")),
          text(size: 7.5pt, weight: "bold", fill: c_turuncu.dark)[Gereksiz Seçim (Ondalık)],
          [#bayt_kareleri(4, c_turuncu.main) #text(size: 7.5pt, weight: "bold", fill: c_turuncu.dark)[4 Bayt]]
        )
        #v(3pt)
        #block(fill: white, stroke: 0.5pt + c_turuncu.border, radius: 3pt, inset: 4pt, width: 100%)[
          #text(font: mono, size: 7.2pt)[float a = 7; float b = 2; float sonuc = a + b;]
        ]
        #v(3pt)
        #grid(
          columns: (1fr, 1fr, 1fr), gutter: 4pt,
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[RAM Tüketimi] \
            #text(size: 8.5pt, weight: "bold", fill: c_kirmizi.dark)[12 Bayt] \
            #text(size: 5.8pt, fill: c_kirmizi.dark)[(2 kat israf!)]
          ]),
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[Veri Yolu Trafiği] \
            #text(size: 8.5pt, weight: "bold", fill: c_kirmizi.dark)[12 Bayt] \
            #text(size: 5.8pt, fill: luma(110))[(8 oku + 4 yaz)]
          ]),
          block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 3pt, align(center)[
            #text(size: 6.2pt, fill: luma(100))[İşlemci Eforu] \
            #text(size: 8.5pt, weight: "bold", fill: c_kirmizi.dark)[Onlarca Çevrim] \
            #olcer(5, c_kirmizi.main)
          ])
        )
        #v(3pt)
        #block(fill: c_kirmizi.light, stroke: 0.5pt + c_kirmizi.border, radius: 2pt, inset: 3pt, width: 100%)[
          #text(size: 6.8pt, fill: c_kirmizi.dark)[*Sonuç:* 2 kat bellek israfı, veri yolu tıkanıklığı, geciken hesaplama!]
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 5. NEDEN-SONUÇ ZİNCİRİ: VERİ TÜRÜ SİSTEMİ NASIL ETKİLER? ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[4. Neden-Sonuç Zinciri: Veri Türü Seçimi Sistemi Nasıl Etkiler?]
    #v(3pt)
    // Hatalı Zincir
    #grid(
      columns: (auto, 1fr, 10pt, 1fr, 10pt, 1fr, 10pt, 1fr), align: horizon,
      text(weight: "bold", size: 7.4pt, fill: c_kirmizi.dark)[✗ Hatalı Tür:],
      mini_kutu([Gereksiz Büyük Tür \ (float)], c_turuncu), ok_isareti,
      mini_kutu([RAM'de Fazla Alan \ (%50 İsraf)], c_turuncu), ok_isareti,
      mini_kutu([Veri Yolunda Trafik \ (2 Kat Bayt)], c_kirmizi), ok_isareti,
      mini_kutu([İşlemci Aşırı Meşgul \ (Sistem Yavaşlar!)], c_kirmizi)
    )
    #v(3pt)
    // Doğru Zincir
    #grid(
      columns: (auto, 1fr, 10pt, 1fr, 10pt, 1fr, 10pt, 1fr), align: horizon,
      text(weight: "bold", size: 7.4pt, fill: c_yesil.dark)[✓ Doğru Tür:],
      mini_kutu([Doğru Veri Türü \ (int)], c_mavi), ok_isareti,
      mini_kutu([RAM'de Tasarruf \ (Hafif Depolama)], c_mavi), ok_isareti,
      mini_kutu([Veri Yolunda Akış \ (Hızlı Geçiş)], c_yesil), ok_isareti,
      mini_kutu([İşlemci Anında Bitirir \ (Maksimum Hız!)], c_yesil)
    )
  ]

  #v(4pt)

  // ---------- 6. BELLEK YÖNETİMİNİN 3 ALTIN KURALI ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[5. Bellek Yönetiminin 3 Altın Kuralı]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 6pt,
      block(fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[1. İhtiyaç Kadar Boyut] \
        #v(1pt)
        #text(size: 6.9pt)[Küsurat içermeyen (yaş, sayaç, adet, döngü vb.) hiçbir değer için `float` kullanmayın. Tam sayıları tercih edin.]
      ],
      block(fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[2. Değer Aralığı Analizi] \
        #v(1pt)
        #text(size: 6.9pt)[Değişkenin alabileceği en küçük ve en büyük sayıyı öngörün. 0-100 arası notlar için devasa türler seçmeyin.]
      ],
      block(fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_turuncu.dark)[3. Donanım Bilinci] \
        #v(1pt)
        #text(size: 6.9pt)[RAM tasarrufu sadece alan kazanmak değildir; veri yolu trafiğini azaltarak işlemci hızını doğrudan artıran kuraldır.]
      ]
    )
  ]

  #v(3pt)

  // ---------- 7. ALT NOT ----------
  #block(
    width: 100%, fill: c_mavi.light, stroke: (left: 3pt + c_mavi.main), radius: (right: 3pt), inset: (x: 8pt, y: 3pt),
  )[
    #text(size: 6.9pt)[
      *Özet İlke:* İyi bir yazılımcı, yazdığı kodun yalnızca doğru sonuç vermesini değil; arka planda RAM, Veri Yolu ve İşlemciyi en az yorup en yüksek verimle çalışmasını da sağlar.
    ]
  ]

]
