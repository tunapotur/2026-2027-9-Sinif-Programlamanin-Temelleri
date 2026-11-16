// Infografik: Fonksiyonların Kullanımı
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
        #text(fill: white, weight: "bold", size: 14.5pt)[19. Fonksiyonların Kullanımı] \
        #v(2pt)
        #text(fill: rgb("#dbeafe"), size: 8.2pt)[
          DRY İlkesi, fonksiyon çağırma mekanizması, argümanlar, dönüş değeri ve yerleşik araçlar
        ]
      ],
      [
        #block(
          fill: rgb("#ffffff").transparentize(88%), stroke: 0.8pt + rgb("#ffffff").transparentize(60%),
          radius: 4pt, inset: (x: 8pt, y: 4pt),
        )[
          #set text(fill: white, size: 7.2pt, weight: "bold")
          Girdi (Argüman) #text(fill: rgb("#93c5fd"))[⟶] Fonksiyon Gövdesi #text(fill: rgb("#93c5fd"))[⟶] Çıktı (Dönüş Değeri)
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 2. DRY İLKESİ VE KOD TEKRARINI ÖNLEME ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[1. Kod Tekrarını Önleme: DRY İlkesi (Don't Repeat Yourself)],
      text(size: 7pt, fill: luma(100))[Manuel Hesaplama İsrafı ⟶ Tek Satır Fonksiyon Kolaylığı]
    )
    #v(3pt)
    #grid(
      columns: (1fr, 1.25fr), gutter: 7pt,
      // Sol: Tanım
      block(width: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_turuncu.dark)[🔄 DRY İlkesi Nedir?] \
        #v(2pt)
        #text(size: 7pt)[
          Aynı görevi yapan kodların projede tekrar tekrar yazılması hata riskini artırır ve bakımı zorlaştırır. \
          *Çözüm:* İşi bir kez tanımlayıp fonksiyon haline getirmek ve ihtiyaç duyuldukça yalnızca adıyla çağırmaktır.
        ]
      ],
      // Sağ: Somut Karşılaştırma
      block(width: 100%, fill: rgb("#f8fafc"), stroke: 1pt + c_gri.border, radius: 4pt, inset: 5pt)[
        #grid(
          columns: (1fr, auto, 1fr), gutter: 4pt, align: horizon + center,
          [
            #text(size: 6.8pt, weight: "bold", fill: c_kirmizi.dark)[✗ Manuel (Her Seferde 5 Satır)] \
            #v(2pt)
            #box(fill: white, stroke: 0.5pt + c_gri.border, radius: 3pt, inset: (x: 4pt, y: 3pt))[
              #set text(font: mono, size: 6.2pt)
              `s = 3.14159` \
              `s2 = s * 100` \
              `s3 = s2 // 1` \
              `s4 = s3 / 100` \
              `print(s4)`
            ]
          ],
          ok_isareti,
          [
            #text(size: 6.8pt, weight: "bold", fill: c_yesil.dark)[✓ Fonksiyon (Tek Satır!)] \
            #v(3pt)
            #box(fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 3pt, inset: 4pt)[
              #text(font: mono, size: 7.2pt, weight: "bold", fill: c_yesil.dark)[round(3.14159, 2)]
            ] \
            #v(2pt)
            #text(size: 6.4pt, fill: c_yesil.dark)[Sonuç: `3.14`]
          ]
        )
      ]
    )
  ]

  #v(4pt)

  // ---------- 3. FONKSİYON ANATOMİSİ VE KAVRAMLAR ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #grid(
      columns: (1fr, auto), align: horizon,
      text(weight: "bold", size: 9pt, fill: navy)[2. Bir Fonksiyonun Anatomisi ve Temel Bileşenleri],
      text(size: 7pt, fill: luma(100))[Çağırma `()` | Argümanlar | Gövde | Dönüş Değeri (`return`)]
    )
    #v(3pt)
    // Görsel Formül Kutusu
    #block(
      width: 100%, fill: rgb("#f8fafc"), stroke: 0.8pt + rgb("#cbd5e1"), radius: 4pt, inset: (x: 8pt, y: 4pt),
    )[
      #align(center)[
        #box(fill: c_gri.light, stroke: 0.8pt + c_gri.border, radius: 3pt, inset: (x: 5pt, y: 2pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: navy)[sonuc =]
        )
        #h(4pt)
        #box(fill: c_mor.light, stroke: 0.8pt + c_mor.border, radius: 3pt, inset: (x: 6pt, y: 2pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: c_mor.dark)[round]
        )
        #box(fill: c_mavi.light, stroke: 0.8pt + c_mavi.border, radius: 3pt, inset: (x: 5pt, y: 2pt),
          text(font: mono, size: 8.5pt, weight: "bold", fill: c_mavi.dark)[( 3.14159, 2 )]
        )
      ]
    ]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr), gutter: 5pt,
      // 1. Fonksiyon Adı & Çağırma
      block(width: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_mor.dark)[1. Çağırma `()`] \
        #v(1pt)
        #text(size: 6.8pt)[
          Fonksiyonun adından sonra parantez açılıp kapatılır. Parantez olmadan (`print`) fonksiyon çalışmaz; sadece kendisini temsil eder.
        ]
      ],
      // 2. Argümanlar
      block(width: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_mavi.dark)[2. Argüman (Girdi)] \
        #v(1pt)
        #text(size: 6.8pt)[
          Parantez içine gönderilen girdi değerleridir. Birden fazlaysa virgülle ayrılır (`3.14159` sayısı ve `2` basamak sayısı).
        ]
      ],
      // 3. Gövde ve İşlem
      block(width: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_turuncu.dark)[3. İşlem (Gövde)] \
        #v(1pt)
        #text(size: 6.8pt)[
          Fonksiyonun kapalı kapılar ardında çalıştırdığı algoritmadır. Geliştirici iç ayrıntıyı bilmeden hazır mekanizmayı kullanır.
        ]
      ],
      // 4. Dönüş Değeri
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 5pt)[
        #text(weight: "bold", size: 7.6pt, fill: c_yesil.dark)[4. Dönüş Değeri] \
        #v(1pt)
        #text(size: 6.8pt)[
          İşlem bitince geriye fırlatılan sonuçtur (`3.14`). Atama işleci (`=`) ile `sonuc` adlı değişkene kaydedilir.
        ]
      ]
    )
  ]

  #v(4pt)

  // ---------- 4. SIK KULLANILAN YERLEŞİK (BUILT-IN) FONKSİYONLAR ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[3. Sık Kullanılan Yerleşik (Built-in) Fonksiyonlar Çantası]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr), gutter: 6pt,
      // Sol Sütun
      block(width: 100%, fill: c_mavi.light.lighten(50%), stroke: 0.8pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #grid(
          columns: (68pt, 1fr, 48pt), gutter: 3pt, align: horizon,
          rozet("len(s)", c_mavi), text(size: 6.9pt)[Metnin karakter sayısını verir], text(font: mono, size: 6.6pt, weight: "bold")[len("Py") ⟶ 2],
          rozet("round(x, n)", c_mavi), text(size: 6.9pt)[Sayıyı n basamağa yuvarlar], text(font: mono, size: 6.6pt, weight: "bold")[round(2.68, 1) ⟶ 2.7],
          rozet("abs(x)", c_mavi), text(size: 6.9pt)[Sayının mutlak değerini döndürür], text(font: mono, size: 6.6pt, weight: "bold")[abs(-7) ⟶ 7],
          rozet("max(...) / min", c_mavi), text(size: 6.9pt)[En büyük / en küçük değeri seçer], text(font: mono, size: 6.6pt, weight: "bold")[max(3, 9) ⟶ 9]
        )
      ],
      // Sağ Sütun
      block(width: 100%, fill: c_mor.light.lighten(50%), stroke: 0.8pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #grid(
          columns: (68pt, 1fr, 52pt), gutter: 3pt, align: horizon,
          rozet("type(x)", c_mor), text(size: 6.9pt)[Değerin veri sınıfını bildirir], text(font: mono, size: 6.6pt, weight: "bold")[type(5) ⟶ int],
          rozet("int() / float()", c_mor), text(size: 6.9pt)[Tam sayı / ondalıklı sayıya dönüştürür], text(font: mono, size: 6.6pt, weight: "bold")[int("25") ⟶ 25],
          rozet("str(x)", c_mor), text(size: 6.9pt)[Herhangi bir değeri metne çevirir], text(font: mono, size: 6.6pt, weight: "bold")[str(15) ⟶ "15"],
          rozet("print() / input()", c_mor), text(size: 6.9pt)[Ekrana yazdırma ve klavyeden okuma], text(font: mono, size: 6.6pt, weight: "bold")[Girdi / Çıktı]
        )
      ]
    )
  ]

  #v(4pt)

  // ---------- 5. DÖNÜŞ DEĞERİ OLAN VS OLMAYAN FONKSİYONLAR ----------
  #block(
    width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: 7pt, breakable: false,
  )[
    #text(weight: "bold", size: 9pt, fill: navy)[4. Fonksiyon Türleri: Değer Döndürenler vs. Görev İcra Edenler (Yan Etkili)]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr), gutter: 7pt,
      // Sol: Değer Döndüren
      block(width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 6pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_yesil.dark)[📥 Değer Döndürenler (`return` Edenler)] \
        #v(2pt)
        #text(size: 7pt)[
          İşlem sonucunda somut bir veri üretirler. Sonuç doğrudan değişkene atanabilir: \
          #v(1pt)
          #box(fill: white, stroke: 0.5pt + c_yesil.border, radius: 3pt, inset: (x: 4pt, y: 2.5pt))[
            #text(font: mono, size: 6.8pt, weight: "bold")[sonuc = round(2.678, 1)]
            #h(4pt)
            #text(size: 6.5pt, fill: c_yesil.dark)[(\# 2.7 üretir)]
          ] \
          #v(1pt)
          `len()`, `abs()`, `max()`, `int()`, `round()` bu sınıftadır.
        ]
      ],
      // Sağ: Yan Etkili
      block(width: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 4pt, inset: 6pt)[
        #text(weight: "bold", size: 7.8pt, fill: c_turuncu.dark)[📢 Görev İcra Edenler (Değer Döndürmeyenler)] \
        #v(2pt)
        #text(size: 7pt)[
          Asıl amacı ekrana yazı yazmak veya dosyaya kaydetmektir; geriye işlenebilir değer vermez: \
          #v(1pt)
          #box(fill: white, stroke: 0.5pt + c_turuncu.border, radius: 3pt, inset: (x: 4pt, y: 2.5pt))[
            #text(font: mono, size: 6.8pt, weight: "bold")[b = print("Merhaba")]
            #h(4pt)
            #text(size: 6.5pt, fill: c_turuncu.dark)[(\# Ekrana yazar, b = None)]
          ] \
          #v(1pt)
          `print()` ekrana çıktı verir fakat kendisi geriye değer döndürmez.
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
      *Özet İlke:* Fonksiyonlar belirli bir işlevi paketleyip kod tekrarını (DRY) önleyen yapı taşlarıdır. Bir fonksiyonun çalışması için parantezle `()` çağrılması şarttır. Argümanlar parantez içine verilir; hesaplanan sonuç ise `return` mekanizmasıyla çağrıldığı yere aktarılır.
    ]
  ]

]
