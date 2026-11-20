// Fonksiyon çağrısı açıklama şeması
// Kullanım: #fonksiyon-aciklama(degisken: "sonuc", ifade: "round(3.14159, 2)", deger: "3.14")
//
// İç içe çağrılar için isteğe bağlı parametreler (varsayılanlar eski davranışı korur):
//   on:  okun hedefinden (degisken) ÖNCE gelen sabit metin   (varsayılan: "")
//   ara: degisken ile ifade arasındaki metin                 (varsayılan: " = ")
//   son: ifadeden SONRA gelen sabit metin                    (varsayılan: "")
// Örnek: puan = int(input("Puan Giriniz: "))  →  ok "input(...)" altından "int" üzerine gider
//   #fonksiyon-aciklama(on: "puan = ", degisken: "int", ara: "(", ifade: "input(\"Puan Giriniz: \")", son: ")", deger: "\"50\"")

#let fonksiyon-aciklama(
  degisken: "sonuc",
  ifade: "round(3.14159, 2)",
  deger: "3.14",
  on: "",
  ara: " = ",
  son: "",
  boyut: 26pt,
  renk: rgb("#5b21e6"),
  kod-fontu: ("JetBrains Mono", "DejaVu Sans Mono", "Liberation Mono"),
  etiket-fontu: ("Open Sans", "DejaVu Sans", "Liberation Sans"),
) = context {
  // measure() için de aynı biçimi kullanmak şart: context içindeki `set` ölçüme etki etmez
  let kod(s) = text(font: kod-fontu, size: boyut, s)

  let tam = on + degisken + ara + ifade + son
  let w0 = measure(kod(on)).width // hedefin başladığı x
  let w1 = measure(kod(on + degisken)).width // hedefin bittiği x
  let w2 = measure(kod(on + degisken + ara)).width // ifadenin başladığı x
  let w3 = measure(kod(on + degisken + ara + ifade)).width // ifadenin bittiği x
  let wt = measure(kod(tam)).width // tüm satırın genişliği
  let h = measure(kod(tam)).height

  let k = 2pt // çizgi kalınlığı
  let cizgi = k + black
  let xd = w0 + (w1 - w0) / 2 // hedefin (değişken / fonksiyon adı) orta noktası
  let xc = w2 + (w3 - w2) / 2 // ifadenin (parantezin) orta noktası
  let u-ust = h + 12pt // U şeklinin üst kenarı
  let u-yuk = 30pt // U şeklinin yüksekliği

  let etiket = box(
    fill: white,
    inset: (x: 6pt, y: 0pt),
    text(font: etiket-fontu, weight: "bold", size: boyut * 0.7, deger),
  )
  let etiket-boyut = measure(etiket)

  // Kutunun alt kenarı: etiketin yatay çizgiden aşağı taşan yarısı kadar (sabit 10pt boşluk kaldırıldı)
  let alt = calc.max(etiket-boyut.height / 2, k / 2)

  box(width: wt, height: u-ust + u-yuk + alt, {
    // 1) Kod satırı
    place(top + left, kod(tam))

    // 2) İfadenin altındaki mor parantez
    place(top + left, dx: w2, dy: h + 2pt, rect(
      width: w3 - w2,
      height: 10pt,
      stroke: (left: k + renk, right: k + renk, bottom: k + renk),
      radius: (bottom: 8pt),
    ))

    // 3) Parantezin ortasından hedefe giden U şeklindeki yol
    place(top + left, dx: xd, dy: u-ust, rect(
      width: xc - xd,
      height: u-yuk,
      stroke: (left: cizgi, right: cizgi, bottom: cizgi),
      radius: (bottom: 10pt),
    ))

    // 4) Hedefe çıkan kısa çizgi ve ok ucu
    place(top + left, dx: xd, dy: h + 10pt, line(angle: 90deg, length: 4pt, stroke: cizgi))
    place(top + left, dx: xd - 5pt, dy: h + 1pt, polygon(
      fill: black,
      stroke: none,
      (5pt, 0pt),
      (10pt, 10pt),
      (0pt, 10pt),
    ))

    // 5) Sonuç etiketi (yatay çizginin üstüne oturur)
    place(top + left,
      dx: (xd + xc) / 2 - etiket-boyut.width / 2,
      dy: u-ust + u-yuk - etiket-boyut.height / 2,
      etiket,
    )
  })
}

#set page(width: auto, height: auto, margin: 12pt)

#fonksiyon-aciklama()
