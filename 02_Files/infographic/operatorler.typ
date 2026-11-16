// Infografik: Operatörler ve İşlem Önceliği
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
  radius: 6pt, fill: renk,
  align(center + horizon, text(fill: white, weight: "bold", size: 7.2pt, str(n)))
)

#let rozet(metin, renk) = box(
  fill: renk.light, stroke: 0.7pt + renk.border, radius: 3pt, inset: (x: 4pt, y: 1.5pt),
  text(font: mono, size: 7.2pt, weight: "bold", fill: renk.dark, metin)
)

#let mini_kutu(metin, c) = block(
  width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 4pt, inset: (x: 4pt, y: 3.5pt),
  align(center + horizon, text(size: 7pt, weight: "bold", fill: c.dark, metin))
)

#let ok_isareti = align(center + horizon, text(size: 10pt, weight: "bold", fill: luma(130))[▶])

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
        #text(fill: white, weight: "bold", size: 14.5pt)[Operatörler ve İşlem Önceliği] \
        #v(2pt)
        #text(fill: rgb("#dbeafe"), size: 8.2pt)[
          Değerleri işleyen semboller, 4 temel operatör grubu ve Python'un hesaplama hiyerarşisi
        ]
      ],
      [
        #block(
          fill: rgb("#ffffff").transparentize(88%), stroke: 0.8pt + rgb("#ffffff").transparentize(60%),
          radius: 4pt, inset: (x: 8pt, y: 4pt),
        )[
          #set text(fill: white, size: 7.2pt, weight: "bold")
          Parantez #text(fill: rgb("#93c5fd"))[⟶] Aritmetik #text(fill: rgb("#93c5fd"))[⟶] Karşılaştırma #text(fill: rgb("#93c5fd"))[⟶] Mantık #text(fill: rgb("#93c5fd"))[⟶] Atama
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 2. DÖRT TEMEL OPERATÖR GRUBU ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[1. Python'daki Dört Temel Operatör Grubu],
      text(size: 7pt, fill: luma(100))[`sonuc = 5 + 3` ⟶ `5, 3`: Operand | `+`: Operatör | `=`: Atama]
    )
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1.05fr, 0.95fr), gutter: 5pt,
      // GRUP 1: Aritmetik
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[🧮 Aritmetik] \
        #v(2pt)
        #text(size: 6.8pt)[
          Matematiksel hesaplama yapar: \
          #text(font: mono, size: 6.8pt, weight: "bold", "+  -  *  /  //  %  **") \
          - `/` her zaman `float` üretir (`2.0`)
          - `//` tam bölüm, `%` kalandır
          - `**` üs alır (`2 ** 3 = 8`)
          - `+` ve `*` metinlerde de çalışır
        ]
      ],
      // GRUP 2: Atama
      block(width: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_mor.dark)[📥 Atama & Bileşik] \
        #v(2pt)
        #text(size: 6.8pt)[
          Değişkene değer aktarır / günceller: \
          #text(font: mono, size: 6.8pt, weight: "bold", "=  +=  -=  *=  /=  //=  %=") \
          - *Sağdan sola* çalışır!
          - `a += 3` ⟶ `a = a + 3`
          - Önce sağ taraf hesaplanır, ardından sol değişkene yazılır
        ]
      ],
      // GRUP 3: Karşılaştırma
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[⚖ Karşılaştırma] \
        #v(2pt)
        #text(size: 6.8pt)[
          İki değeri kıyaslar, `bool` üretir: \
          #text(font: mono, size: 6.8pt, weight: "bold", "==  !=  >  <  >=  <=") \
          - Sonuç daima `True` veya `False`
          - `==` eşitlik, `!=` farklılık sorar
          - `=` (atama) ile `==` (kıyas) *asla karıştırılmamalıdır!*
        ]
      ],
      // GRUP 4: Mantıksal
      block(width: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_turuncu.dark)[🔀 Mantıksal] \
        #v(2pt)
        #text(size: 6.8pt)[
          Koşulları birbirine bağlar: \
          #text(font: mono, size: 6.8pt, weight: "bold", "not    and    or") \
          - `and`: İkisi de `True` ise `True`
          - `or`: En az biri `True` ise `True`
          - `not`: Doğruyu yanlışa çevirir
          - *Kısa Devre:* İlk sonuca göre durur
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 3. İŞLEM ÖNCELİĞİ HİYERARŞİSİ (BÜYÜK PİRAMİT) ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[2. Operatörler Arası İşlem Önceliği Hiyerarşisi],
      text(size: 7pt, fill: luma(100))[En Yüksek Öncelik (1) ⟶ En Düşük Öncelik (6)]
    )
    #v(3pt)

    // Katman Katman Hiyerarşi Kartları
    #grid(
      columns: (32pt, 80pt, 1fr, 85pt), gutter: 3pt, align: horizon,

      // Seviye 1: Parantez
      mini_kutu([1], c_kirmizi),
      rozet("( )", c_kirmizi),
      text(size: 7.2pt)[*Parantez İçi:* Her zaman en başta hesaplanır. İç içe ise en içteki parantez önceliklidir.],
      text(size: 6.8pt, fill: c_kirmizi.dark, weight: "bold")[En Yüksek Öncelik],

      // Seviye 2: Üs Alma
      mini_kutu([2], c_turuncu),
      rozet("**", c_turuncu),
      text(size: 7.2pt)[*Üs Alma:* Soldan sağa değil, *SAĞDAN SOLA* çalışır! #text(font: mono, size: 6.8pt, "2 ** 3 ** 2 = 2 ** 9 = 512")],
      text(size: 6.8pt, fill: c_turuncu.dark)[Sağdan Sola ⟵],

      // Seviye 3: Çarpma / Bölme
      mini_kutu([3], c_mavi),
      rozet("*  /  //  %", c_mavi),
      text(size: 7.2pt)[*Çarpma, Bölme, Tam Bölme, Mod:* Kendi aralarında eşit önceliklidir; *soldan sağa* işlenir.],
      text(size: 6.8pt, fill: c_mavi.dark)[Soldan Sağa ⟶],

      // Seviye 4: Toplama / Çıkarma
      mini_kutu([4], c_mavi),
      rozet("+  -", c_mavi),
      text(size: 7.2pt)[*Toplama ve Çıkarma:* Kendi aralarında eşit önceliklidir; *soldan sağa* işlenir.],
      text(size: 6.8pt, fill: c_mavi.dark)[Soldan Sağa ⟶],

      // Seviye 5: Karşılaştırma
      mini_kutu([5], c_yesil),
      rozet("== != > < >= <=", c_yesil),
      text(size: 7.2pt)[*Karşılaştırma Operatörleri:* Tüm aritmetik işlemler bittikten sonra çalışır; `bool` üretir.],
      text(size: 6.8pt, fill: c_yesil.dark)[True / False],

      // Seviye 6: Mantıksal
      mini_kutu([6], c_mor),
      rozet("not ⟶ and ⟶ or", c_mor),
      text(size: 7.2pt)[*Mantıksal Operatörler:* Kendi aralarında sıra: önce *not*, sonra *and*, en son *or* işlenir.],
      text(size: 6.8pt, fill: c_mor.dark)[not > and > or],

      // En Son: Atama
      mini_kutu([Son], c_gri),
      rozet("= += -= *=", c_gri),
      text(size: 7.2pt)[*Atama Operatörleri:* İfadenin sağ tarafındaki tüm hesaplamalar bittikten sonra belleğe yazar.],
      text(size: 6.8pt, fill: c_gri.dark)[En Son Adım]
    )
  ]

  #v(4pt)

  // ---------- 4. ADIM ADIM İŞLEM ÇÖZÜMLEME ÖRNEKLERİ ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[3. Somut Örneklerle Adım Adım İşlem Çözümlemesi]
    #v(3pt)
    #grid(
      columns: (1fr, 1.15fr), gutter: 7pt,
      // Sol: Aritmetik İfade
      block(
        width: 100%, fill: c_mavi.light.lighten(50%), stroke: 1pt + c_mavi.border, radius: 5pt, inset: 6pt,
      )[
        #text(weight: "bold", size: 8pt, fill: c_mavi.dark)[A. Aritmetik İfade Çözümü:] \
        #v(2pt)
        #block(fill: white, stroke: 0.5pt + c_mavi.border, radius: 3pt, inset: 4pt, width: 100%)[
          #text(font: mono, size: 7.2pt, weight: "bold", "sonuc = 2 + 3 ** 2 * 2")
        ]
        #v(2pt)
        #text(size: 7pt)[
          #grid(
            columns: (auto, 1fr), gutter: 4pt, align: horizon,
            daire_sayi(1, c_turuncu.main), [Önce üs alma: #text(font: mono, size: 6.8pt, "3 ** 2 = 9")],
            daire_sayi(2, c_mavi.main), [Sonra çarpma: #text(font: mono, size: 6.8pt, "9 * 2 = 18")],
            daire_sayi(3, c_yesil.main), [Sonra toplama: #text(font: mono, size: 6.8pt, "2 + 18 = 20")],
            daire_sayi(4, c_gri.main), [En son atama: #text(font: mono, size: 6.8pt, "sonuc = 20")]
          )
        ]
      ],
      // Sağ: Mantıksal ve Karşılaştırma İfadesi
      block(
        width: 100%, fill: c_mor.light.lighten(50%), stroke: 1pt + c_mor.border, radius: 5pt, inset: 6pt,
      )[
        #text(weight: "bold", size: 8pt, fill: c_mor.dark)[B. Karşılaştırma + Mantık İfadesi Çözümü:] \
        #v(2pt)
        #block(fill: white, stroke: 0.5pt + c_mor.border, radius: 3pt, inset: 4pt, width: 100%)[
          #text(font: mono, size: 7.2pt, weight: "bold")[yas = 16; izin = True \
          sonuc = yas >= 18 or (izin and not False)]
        ]
        #v(2pt)
        #text(size: 7pt)[
          #grid(
            columns: (auto, 1fr), gutter: 4pt, align: horizon,
            daire_sayi(1, c_mor.main), [Parantez içi not: #text(font: mono, size: 6.8pt, "not False ⟶ True")],
            daire_sayi(2, c_mor.main), [Parantez içi and: #text(font: mono, size: 6.8pt, "True and True ⟶ True")],
            daire_sayi(3, c_yesil.main), [Karşılaştırma: #text(font: mono, size: 6.8pt, "16 >= 18 ⟶ False")],
            daire_sayi(4, c_turuncu.main), [En son or: #text(font: mono, size: 6.8pt, "False or True ⟶ True")]
          )
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 5. ALTIN KURALLAR & KRİTİK TUZAKLAR ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[4. Sık Yapılan Hatalar ve Kritik Tuzaklar]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 6pt,
      // Tuzak 1
      block(fill: c_kirmizi.light, stroke: 1pt + c_kirmizi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_kirmizi.dark)[⚠ `=` ile `==` Asla Aynı Değildir!] \
        #v(1pt)
        #text(size: 6.9pt)[
          `x = 5` bir *atamadır*; `5` değerini `x` değişkenine kaydeder. \
          `x == 5` bir *karşılaştırmadır*; "`x`'in değeri `5` mi?" sorusunu sorup `True`/`False` üretir.
        ]
      ],
      // Tuzak 2
      block(fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_turuncu.dark)[⚠ Üs Alma Sağdan Sola Çalışır] \
        #v(1pt)
        #text(size: 6.9pt)[
          Python'da `2 ** 3 ** 2` soldan sağa işlenmez! Sağdaki üs önce hesaplanır: `3 ** 2 = 9`, ardından `2 ** 9 = 512` olur. (2³)² = 64 için parantez şarttır: `(2 ** 3) ** 2`.
        ]
      ],
      // Tuzak 3
      block(fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_yesil.dark)[⚠ Kısa Devre (Short-Circuit) Koruması] \
        #v(1pt)
        #text(size: 6.9pt)[
          `and` işleci ilk `False`'u görünce; `or` işleci ilk `True`'yu görünce sağ tarafa hiç bakmaz! Bu özellik, sıfıra bölme (`x != 0 and 10/x > 1`) gibi hataları önler.
        ]
      ]
    )
  ]

  #v(3pt)

  // ---------- 6. ALT ÖZET NOTU ----------
  #block(
    width: 100%, fill: c_mavi.light, stroke: (left: 3pt + c_mavi.main), radius: (right: 3pt), inset: (x: 8pt, y: 3pt),
  )[
    #text(size: 6.9pt)[
      *Altın Kural:* İşlem önceliği sırasından emin olmadığınız veya kodun başkaları tarafından kolay okunmasını istediğiniz her durumda *parantez ( )* kullanın. Parantez hem hesaplama hatalarını kesin olarak önler hem de geliştiricinin asıl niyetini netleştirir.
    ]
  ]

]
