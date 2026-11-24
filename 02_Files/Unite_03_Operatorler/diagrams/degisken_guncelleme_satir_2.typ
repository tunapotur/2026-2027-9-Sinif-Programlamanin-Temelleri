#import "degisken_guncelleme_ortak.typ": *

#let degisken_guncelleme_satir_2 = {
  set text(font: "DejaVu Sans", size: 9pt, lang: "tr")
  set par(leading: 0.5em, spacing: 0.5em)
  set smartquote(enabled: false)
  block(width: 100%)[
    // ---------- 2. SATIR ----------
    #grid(
      columns: (1fr, 1fr), gutter: 8pt,
      kart(3, "Mevcut ile Güncelleme", c_yesil,
        [Güncellenen değişkenin eski değeri kullanılarak yeni değer yazılır.],
        [puan = puan + #sayi("25")],
        ram(c_yesil, klasik(eski_yeni), sol3, w_sol: 76pt, w_ram: 66pt, ustsol: etiket3),
      ),
      kart(4, "Değişken Türü ile Güncelleme", c_mor,
        [RAM'deki sayısal alan silinir, yerine metin dizisi oluşturulur.],
        [puan = #sd("\"elli\"")],
        // ofs: 1 -> adresler 4097'den başlar, böylece "e" harfi yine 4098'de kalır
        ram(c_mor, metin_ram, etiket("→", satir: 1), vurgu: (1, 2, 3, 4), ofs: 1),
      ),
    )
  ]
}

