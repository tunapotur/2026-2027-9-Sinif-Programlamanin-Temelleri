#import "degisken_guncelleme_ortak.typ": *

#let degisken_guncelleme_satir_1 = {
  set text(font: "DejaVu Sans", size: 9pt, lang: "tr")
  set par(leading: 0.5em, spacing: 0.5em)
  set smartquote(enabled: false)
  block(width: 100%)[
    // ---------- 1. SATIR ----------
    #grid(
      columns: (1fr, 1fr), gutter: 8pt,
      kart(1, "Değer Atama", c_mavi,
        [Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.],
        [puan = #sayi("50")],
        ram(c_mavi, klasik(text(weight: "bold", size: 10pt, fill: navy)[50]), etiket("→")),
      ),
      kart(2, "Değer Güncelleme", c_turuncu,
        [Giriş yapılan *75* değeri, RAM'de bulunan *puan* değişkeninin önceki değerinin üzerine yazılır.],
        [puan = #sayi("75")],
        ram(c_turuncu, klasik(eski_yeni), etiket("→")),
      ),
    )
  ]
}

