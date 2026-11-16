// Infografik: input() ve print() Fonksiyonları
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
  fill: renk.light, stroke: 0.7pt + renk.border, radius: 3pt, inset: (x: 4.5pt, y: 1.5pt),
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
        #text(fill: white, weight: "bold", size: 14.5pt)[20. input() ve print() Fonksiyonları] \
        #v(2pt)
        #text(fill: rgb("#dbeafe"), size: 8.2pt)[
          Girdi-İşlem-Çıktı modeli, modern f-string biçimlendirme sanatı, sep / end ve kaçış dizileri
        ]
      ],
      [
        #block(
          fill: rgb("#ffffff").transparentize(88%), stroke: 0.8pt + rgb("#ffffff").transparentize(60%),
          radius: 4pt, inset: (x: 8pt, y: 4pt),
        )[
          #set text(fill: white, size: 7.2pt, weight: "bold")
          Girdi (`input`) #text(fill: rgb("#93c5fd"))[⟶] İşlem (CPU / RAM) #text(fill: rgb("#93c5fd"))[⟶] Çıktı (`print`)
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 2. YAŞAM DÖNGÜSÜ: GİRDİ - İŞLEM - ÇIKTI (IPO) ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[1. Programın Temel Yaşam Döngüsü: Girdi ⟶ İşlem ⟶ Çıktı],
      text(size: 7pt, fill: luma(100))[Kullanıcı ⟶ Klavyeden Veri ⟶ Hesaplama ⟶ Ekrana Sonuç]
    )
    #v(3pt)
    #grid(
      columns: (1fr, 12pt, 1fr, 12pt, 1fr), gutter: 0pt, align: horizon,
      // 1. Girdi
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(1, c_mavi.main), text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[1. Girdi (`input`)])
        #v(2pt)
        #text(size: 7pt)[
          Program klavyeden veri bekler. Kullanıcı yazıp Enter'a basınca veriyi *metin (`str`)* olarak teslim alır.
        ]
      ],
      ok_isareti,
      // 2. İşlem
      block(width: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(2, c_mor.main), text(weight: "bold", size: 7.8pt, fill: c_mor.dark)[2. İşlem (CPU / RAM)])
        #v(2pt)
        #text(size: 7pt)[
          Gerekirse `int()` / `float()` ile sayıya çevrilir, matematiksel veya mantıksal hesaplama tamamlanır.
        ]
      ],
      ok_isareti,
      // 3. Çıktı
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #grid(columns: (auto, 1fr), gutter: 4pt, align: horizon, daire_sayi(3, c_yesil.main), text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[3. Çıktı (`print`)])
        #v(2pt)
        #text(size: 7pt)[
          Hesaplanan sonuçlar biçimlendirilerek ekrana yazdırılır ve kullanıcıya geri yansıtılır.
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 3. INPUT() FONKSİYONUNUN 3 ALTIN KURALI ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[2. `input()` Fonksiyonunun 3 Kritik Kuralı]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 6pt,
      // Kural 1
      block(fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_turuncu.dark)[⏸ Program Akışı Durur] \
        #v(1pt)
        #text(size: 6.9pt)[
          `input()` satırına gelindiğinde Python çalışmayı dondurur. Kullanıcı klavyeden bir metin yazıp *Enter* tuşuna basana kadar program beklemede kalır.
        ]
      ],
      // Kural 2
      block(fill: c_kirmizi.light, stroke: 1pt + c_kirmizi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_kirmizi.dark)[⚠ Daima Metin (`str`) Döndürür] \
        #v(1pt)
        #text(size: 6.9pt)[
          Klavyeden `15` yazılsa bile gelen veri `"15"` metnidir. Matematiksel işlem için mutlaka `int(input())` ya da `float(input())` ile dönüştürülmelidir.
        ]
      ],
      // Kural 3
      block(fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_mavi.dark)[💬 Yönlendirme İletisi] \
        #v(1pt)
        #text(size: 6.9pt)[
          `input("Adınız: ")` içindeki metin ekranda görünür. İletinin sonuna bir boşluk bırakmak, kullanıcının yazacağı cevabın soruya yapışmasını önler.
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 4. PRINT() VE MODERN F-STRING BİÇİMLENDİRME SANATI ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[3. `print()` ve Modern f-string Biçimlendirme Sanatı],
      text(size: 7pt, fill: luma(100))[Virgülle Yazdırma vs. f-string `{değişken}`]
    )
    #v(3pt)
    #grid(
      columns: (1fr, 1.25fr), gutter: 7pt,
      // Sol: Virgül vs f-string
      block(width: 100%, fill: rgb("#f8fafc"), stroke: 1pt + c_gri.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: navy)[İki Temel Yazdırma Yolu:] \
        #v(2pt)
        #text(size: 6.8pt)[
          - *Virgül (,) ile:* \
            #text(font: mono, size: 6.4pt)[`print("Ad:", ad, "Yaş:", yas)`] \
            Python değerler arasına *otomatik 1 boşluk* koyar.
          - *Modern f-string ile:* \
            #text(font: mono, size: 6.4pt, weight: "bold", fill: c_mor.dark)[`print(f"Merhaba {ad}, {yas} yaşındasın.")`] \
            En okunaklı, esnek ve standart yöntemdir.
        ]
      ],
      // Sağ: f-string Süper Yetenekleri
      block(width: 100%, fill: c_mor.light.lighten(60%), stroke: 1pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_mor.dark)[f-string'in 4 Süper Yeteneği:] \
        #v(2pt)
        #grid(
          columns: (1fr, 1fr), gutter: 4pt,
          block(fill: white, stroke: 0.5pt + c_mor.border, radius: 3pt, inset: 3pt)[
            #text(size: 6.4pt, weight: "bold", fill: c_mor.dark)[1. Sayı Formatı (`:`) :] \
            #text(font: mono, size: 6.2pt)[`{pi:.2f}` ⟶ `3.14` \ `{1234567:,}` ⟶ `1,234,567` \ `{0.256:.1%}` ⟶ `25.6%` ]
          ],
          block(fill: white, stroke: 0.5pt + c_mor.border, radius: 3pt, inset: 3pt)[
            #text(size: 6.4pt, weight: "bold", fill: c_mor.dark)[2. Tablo Hizalama:] \
            #text(font: mono, size: 6.2pt)[`{ad:<10}` (Sola yasla) \ `{fiyat:>8.2f}` (Sağa yasla) \ `{kod:^8}` (Ortala)]
          ],
          block(fill: white, stroke: 0.5pt + c_mor.border, radius: 3pt, inset: 3pt)[
            #text(size: 6.4pt, weight: "bold", fill: c_mor.dark)[3. İfade Hesaplama:] \
            #text(font: mono, size: 6.2pt)[`f"{a} + {b} = {a+b}"` \ `f"{ad.upper()}"` \ `f"{len(ad)} harf"`]
          ],
          block(fill: white, stroke: 0.5pt + c_mor.border, radius: 3pt, inset: 3pt)[
            #text(size: 6.4pt, weight: "bold", fill: c_mor.dark)[4. Kolay Debug (`=`):] \
            #text(font: mono, size: 6.2pt)[`print(f"{puan=}")` \ Çıktı: `puan=75` \ Değişken adı ve değeri!]
          ]
        )
      ]
    )
  ]

  #v(4pt)

  // ---------- 5. PRINT() PARAMETRELERİ VE KAÇIŞ KARAKTERLERİ ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[4. `print()` İsteğe Bağlı Parametreleri (`sep`, `end`) ve Kaçış Karakterleri]
    #v(3pt)
    #grid(
      columns: (1.1fr, 1fr), gutter: 7pt,
      // Sol: sep ve end
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_mavi.dark)[⚙ sep ve end Parametreleri] \
        #v(2pt)
        #text(size: 6.9pt)[
          - *`sep` (Ayırıcı):* Virgülle ayrılan değerlerin arasına ne gelsin? (Varsayılan: `" "` tek boşluk) \
            #text(font: mono, size: 6.4pt)[`print(15, 11, 2026, sep="/")` ⟶ `15/11/2026`] \
            #text(font: mono, size: 6.4pt)[`print("A", "B", "C", sep="-")` ⟶ `A-B-C`]
          - *`end` (Bitiş):* Yazdırma bittikten sonra satır nasıl sonlansın? (Varsayılan: `"\n"` alt satıra geç) \
            #text(font: mono, size: 6.4pt)[`print("Yükleniyor", end="...")` \ `print("Tamam")` ⟶ `Yükleniyor...Tamam`]
        ]
      ],
      // Sağ: Kaçış Karakterleri
      block(width: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_turuncu.dark)[🔤 Kaçış Karakterleri (`\`)] \
        #v(2pt)
        #grid(
          columns: (28pt, 1fr, 68pt), gutter: 3pt, align: horizon,
          rozet("\\n", c_turuncu), text(size: 6.8pt)[Yeni satıra geçer (Enter)], text(font: mono, size: 6.2pt)[`"A\\nB"` ⟶ 2 satır],
          rozet("\\t", c_turuncu), text(size: 6.8pt)[Sekme (Tab) boşluğu bırakır], text(font: mono, size: 6.2pt)[`"A\\tB"` ⟶ Sekme],
          rozet("\\\"", c_turuncu), text(size: 6.8pt)[Metin içinde çift tırnak yazar], text(font: mono, size: 6.2pt)[`"O \\"evet\\" dedi"`],
          rozet("\\\\", c_turuncu), text(size: 6.8pt)[Ters eğik çizginin kendisini yazar], text(font: mono, size: 6.2pt)[`"C:\\\\Okul"`]
        )
      ]
    )
  ]

  #v(3pt)

  // ---------- 6. ALT ÖZET NOTU ----------
  #block(
    width: 100%, fill: c_mavi.light, stroke: (left: 3pt + c_mavi.main), radius: (right: 3pt), inset: (x: 8pt, y: 3pt),
  )[
    #text(size: 6.9pt)[
      *Özet İlke:* `input()` kullanıcıdan daima `str` (karakter dizisi) alır; matematiksel işlemler için mutlaka `int()` veya `float()` ile sarılmalıdır. `print()` ekrana bilgi yansıtır; hizalama, basamak yuvarlama ve değişken gömme için modern `f-string` (`f"{fiyat:.2f}"`) en temiz ve profesyonel yöntemdir.
    ]
  ]

]
