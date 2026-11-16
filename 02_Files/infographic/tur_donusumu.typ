// Infografik: Tür Dönüşümü (Type Conversion / Type Casting)
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

#let rozet(metin, renk) = box(
  fill: renk.light, stroke: 0.7pt + renk.border, radius: 3pt, inset: (x: 5pt, y: 2pt),
  text(font: mono, size: 7.4pt, weight: "bold", fill: renk.dark, metin)
)

#let mini_kutu(metin, c) = block(
  width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 4pt, inset: (x: 5pt, y: 4pt),
  align(center + horizon, text(size: 7.2pt, weight: "bold", fill: c.dark, metin))
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
        #text(fill: white, weight: "bold", size: 14.5pt)[Tür Dönüşümü (Type Conversion / Casting)] \
        #v(2pt)
        #text(fill: rgb("#dbeafe"), size: 8.2pt)[
          Metinden sayıya, örtükten açık dönüşüme: Verilerin bellekteki tür dönüşüm yolculuğu
        ]
      ],
      [
        #block(
          fill: rgb("#ffffff").transparentize(88%), stroke: 0.8pt + rgb("#ffffff").transparentize(60%),
          radius: 4pt, inset: (x: 8pt, y: 4pt),
        )[
          #set text(fill: white, size: 7.2pt, weight: "bold")
          `str` #text(fill: rgb("#93c5fd"))[⟷] `int` #text(fill: rgb("#93c5fd"))[⟷] `float`
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 2. NEDEN TÜR DÖNÜŞÜMÜ? (METİN TUZAĞI) ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[1. Neden Tür Dönüşümü Yapılır? (Kullanıcı Girişi ve Metin Tuzağı)],
      text(size: 7pt, fill: luma(100))[Klavye Girişi ⟶ Karakter Dizisi (`str`)]
    )
    #v(3pt)
    #grid(
      columns: (1fr, 1.15fr, 1.15fr), gutter: 6pt,
      // 1. Giriş
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 6pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[⌨ Klavyeden Giriş (`input`)] \
        #v(2pt)
        #text(size: 7.1pt)[
          Klavyeden ne yazılırsa yazılsın, `input()` veriyi *daima metin* (`str`) olarak alır. \
          Örneğin kullanıcı `25` yazdığında bilgisayar bunu sayı değil, `'2'` (ASCII: 50) ve `'5'` (ASCII: 53) karakterleri olarak görür.
        ]
      ],
      // 2. Metin Tuzağı
      block(width: 100%, fill: c_kirmizi.light, stroke: 1pt + c_kirmizi.border, radius: 4pt, inset: 6pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_kirmizi.dark)[✗ Metin Bitiştirme Faciası] \
        #v(2pt)
        #text(size: 7.1pt)[
          Dönüşüm yapılmazsa `+` işleci matematiksel toplama yapmaz, metinleri uca ekler: \
          #text(font: mono, weight: "bold", fill: c_kirmizi.dark)["25" + "10" ⟶ "2510"] \
          Beklenen 35 yerine hatalı `"2510"` metni oluşur!
        ]
      ],
      // 3. Çözüm
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 6pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[✓ Doğru Çözüm: Tür Dönüşümü] \
        #v(2pt)
        #text(size: 7.1pt)[
          Matematiksel hesaplama yapabilmek için metin biçimindeki veri sayıya dönüştürülmelidir: \
          #text(font: mono, weight: "bold", fill: c_yesil.dark)[int("25") + int("10") ⟶ 35] \
          `int()` veya `float()` ile tür dönüşümü şarttır!
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 3. INT(INPUT()) NASIL ÇALIŞIR? (İÇTEN DIŞA PRENSİBİ) ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[2. `int(input())` Nasıl Çalışır? (İçten Dışa Çalışma Prensibi)],
      text(size: 7pt, fill: luma(100))[Önce İç Fonksiyon ⟶ Sonra Dış Fonksiyon ⟶ En Son Atama]
    )
    #v(3pt)
    #block(
      width: 100%, fill: rgb("#f8fafc"), stroke: 0.8pt + rgb("#cbd5e1"), radius: 4pt, inset: (x: 8pt, y: 5pt),
    )[
      #align(center)[
        #text(font: mono, size: 8.5pt, weight: "bold", fill: navy)[puan = ]
        #box(fill: c_mor.light, stroke: 0.8pt + c_mor.border, radius: 3pt, inset: (x: 5pt, y: 2.5pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: c_mor.dark, "int(")
        )
        #box(fill: c_mavi.light, stroke: 0.8pt + c_mavi.border, radius: 3pt, inset: (x: 5pt, y: 2.5pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: c_mavi.dark, "input(\"Puan Giriniz: \")")
        )
        #box(fill: c_mor.light, stroke: 0.8pt + c_mor.border, radius: 3pt, inset: (x: 5pt, y: 2.5pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: c_mor.dark, ")")
        )
      ]
    ]
    #v(3pt)
    #grid(
      columns: (1fr, 12pt, 1fr, 12pt, 1fr), gutter: 0pt, align: horizon,
      // Adım 1
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(1, c_mavi.main), text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[1. Aşama: input()])
        #v(2pt)
        #text(size: 7pt)[
          Kullanıcı klavyeden `50` yazar ve Enter'a basar. `input()` bunu *metin* olarak üretir: \
          #align(center)[#box(fill: white, stroke: 0.5pt + c_mavi.border, radius: 2pt, inset: (x: 4pt, y: 2pt), text(font: mono, size: 7.2pt, fill: c_mavi.dark, "\"50\" (str)"))]
        ]
      ],
      ok_isareti,
      // Adım 2
      block(width: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(2, c_mor.main), text(weight: "bold", size: 7.8pt, fill: c_mor.dark)[2. Aşama: int()])
        #v(2pt)
        #text(size: 7pt)[
          Dıştaki `int()` fonksiyonu gelen `"50"` metnini ikilik tam sayıya dönüştürür: \
          #align(center)[#box(fill: white, stroke: 0.5pt + c_mor.border, radius: 2pt, inset: (x: 4pt, y: 2pt), text(font: mono, size: 7.2pt, fill: c_mor.dark, "int(\"50\") ⟶ 50 (int)"))]
        ]
      ],
      ok_isareti,
      // Adım 3
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(3, c_yesil.main), text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[3. Aşama: Atama (=)])
        #v(2pt)
        #text(size: 7pt)[
          Atama işleci (`=`) üretilen tam sayı `50` değerini `puan` değişkeninin RAM adresine yazar: \
          #align(center)[#box(fill: white, stroke: 0.5pt + c_yesil.border, radius: 2pt, inset: (x: 4pt, y: 2pt), text(font: mono, size: 7.2pt, fill: c_yesil.dark, "puan = 50"))]
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 4. DÖNÜŞÜM TÜRLERİ: ÖRTÜK VS BİLİNÇLİ ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[3. Tür Dönüşümü Çeşitleri: Otomatik (Örtük) vs. Bilinçli (Açık)]
    #v(3pt)
    #grid(
      columns: (1.1fr, 1fr), gutter: 7pt,
      // SOL: Örtük Dönüşüm
      block(
        width: 100%, fill: c_mavi.light.lighten(50%), stroke: 1pt + c_mavi.border, radius: 5pt, inset: 6pt,
      )[
        #grid(
          columns: (1fr, auto), align: horizon,
          text(weight: "bold", size: 8.2pt, fill: c_mavi.dark)[A. Otomatik (Örtük / Implicit)],
          box(fill: c_mavi.main, radius: 3pt, inset: (x: 4pt, y: 1.5pt), text(fill: white, size: 6.8pt, weight: "bold", "Python Yapar"))
        )
        #v(2pt)
        #text(size: 7.1pt)[
          Farklı sayı türleri aynı matematiksel işleme girdiğinde, *veri kaybını önlemek için* küçük tür (`int`) otomatik olarak geniş türe (`float`) yükseltilir:
        ]
        #v(2pt)
        #block(fill: white, stroke: 0.5pt + c_mavi.border, radius: 3pt, inset: 4pt, width: 100%)[
          #grid(
            columns: (auto, auto, auto, auto, auto), gutter: 4pt, align: horizon + center,
            rozet("int", c_mavi), text(font: mono, weight: "bold", size: 8pt, "+  -  *  /"), rozet("float", c_turuncu), text(weight: "bold", "⟶"), rozet("float", c_turuncu)
          )
        ]
        #v(2pt)
        #block(fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 4pt, width: 100%)[
          #text(font: mono, size: 6.8pt)[
            adet = 5 #text(fill: luma(120))[\# int (tam sayı)] \
            birim_fiyat = 2.5 #text(fill: luma(120))[\# float (ondalıklı)] \
            #text(fill: c_mavi.dark)[\# Python 'adet' değerini 5.0 yapar:] \
            tutar = adet \* birim_fiyat #text(fill: c_yesil.dark)[\# 12.5 (float)]
          ]
        ]
        #v(1pt)
        #text(size: 6.6pt, fill: c_mavi.dark)[
          *Kural:* İşlemde tek bir `float` bile varsa sonuç kesinlikle `float` olur!
        ]
      ],
      // SAĞ: Bilinçli Dönüşüm
      block(
        width: 100%, fill: c_turuncu.light.lighten(50%), stroke: 1pt + c_turuncu.border, radius: 5pt, inset: 6pt,
      )[
        #grid(
          columns: (1fr, auto), align: horizon,
          text(weight: "bold", size: 8.2pt, fill: c_turuncu.dark)[B. Bilinçli (Açık / Explicit)],
          box(fill: c_turuncu.main, radius: 3pt, inset: (x: 4pt, y: 1.5pt), text(fill: white, size: 6.8pt, weight: "bold", "Programcı Yapar"))
        )
        #v(2pt)
        #text(size: 7.1pt)[
          Programcının türü kasten değiştirmesidir. Özel fonksiyonlar (`int()`, `float()`, `str()`) doğrudan çağrılır:
        ]
        #v(2pt)
        // 1. int -> float
        #block(fill: white, stroke: 0.5pt + c_turuncu.border, radius: 3pt, inset: 3.5pt, width: 100%)[
          #text(weight: "bold", size: 7pt, fill: c_turuncu.dark)[1. Hassasiyet Kazanma (`int` ⟶ `float`):] \
          #text(font: mono, size: 6.8pt)[puan = 100 ⟶ float(puan) ⟶ 100.0]
        ]
        #v(2pt)
        // 2. float -> int
        #block(fill: white, stroke: 0.5pt + c_turuncu.border, radius: 3pt, inset: 3.5pt, width: 100%)[
          #text(weight: "bold", size: 7pt, fill: c_kirmizi.dark)[2. Ondalığı Kesip Atma (`float` ⟶ `int`):] \
          #text(font: mono, size: 6.8pt)[ortalama = 85.85 ⟶ int(ortalama) ⟶ 85] \
          #text(size: 6.4pt, fill: c_kirmizi.dark)[*Dikkat:* 86'ya yuvarlamaz, virgülden sonrasını siler!]
        ]
        #v(2pt)
        // 3. Sayı -> str
        #block(fill: white, stroke: 0.5pt + c_turuncu.border, radius: 3pt, inset: 3.5pt, width: 100%)[
          #text(weight: "bold", size: 7pt, fill: c_mor.dark)[3. Metinle Birleştirme (`Sayı` ⟶ `str`):] \
          #text(font: mono, size: 6.8pt)["Puan: " + str(85) ⟶ "Puan: 85"]
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 5. KRİTİK UYARILAR & ÖĞRENCİ TUZAKLARI ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[4. Kritik Uyarılar ve Sık Yapılan Hatalar (Tuzaklar)]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 6pt,
      // Tuzak 1
      block(fill: c_kirmizi.light, stroke: 1pt + c_kirmizi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_kirmizi.dark)[⚠ int() Yuvarlama Yapmaz!] \
        #v(1pt)
        #text(size: 6.9pt)[
          `int(9.99)` işleminin sonucu `10` değil `9` değeridir. `int()` asla yuvarlama yapmaz; sayının tam kısmını alır, ondalığı acımasızca budar. Matematiksel yuvarlama için `round()` fonksiyonu kullanılır.
        ]
      ],
      // Tuzak 2
      block(fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_turuncu.dark)[⚠ Doğrudan ValueError Hatası] \
        #v(1pt)
        #text(size: 6.9pt)[
          `int("3.14")` veya `int("abc")` doğrudan çalışma hatası verir! Metin içinde ondalık nokta varsa önce `float("3.14")` yapılmalı, tam sayı isteniyorsa ardından `int()` uygulanmalıdır.
        ]
      ],
      // Tuzak 3
      block(fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_mavi.dark)[⚠ / Bölmesi Daima float Üretir] \
        #v(1pt)
        #text(size: 6.9pt)[
          Python'da tek bölü (`/`) işleci iki tam sayı bölünse ve tam çıksa dahi her zaman `float` döndürür: `6 / 2 ⟶ 3.0`. Sonucun tam sayı kalması isteniyorsa taban bölme (`//`) kullanılmalıdır: `6 // 2 ⟶ 3`.
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
      *Özet İlke:* Klavye ve dosya girişleri sisteme daima `str` olarak ulaşır. Hesaplama yapabilmek için `int()` ya da `float()` ile dönüştürülmelidir. Matematiksel işlemlerde `float` varsa sonuç otomatik olarak `float`'a yükseltilir; `int()` ise ondalığı yuvarlamaz, doğrudan siler!
    ]
  ]

]
