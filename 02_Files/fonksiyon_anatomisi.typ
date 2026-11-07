// Fonksiyon anatomisi: dönüş değeri, fonksiyon adı, parantezler ve argümanlar renkli çizgilerle tanıtılır
//
// KULLANIM
//  - Tanımlar (#let ...) notlarının başına, #fonksiyon-anatomi(...) çağrısı şeklin geleceği yere konur.
//  - Tek başına PNG/PDF almak için aşağıdaki satırın başındaki // işaretlerini kaldır:
// #set page(width: auto, height: auto, margin: 10pt)

// ---------- Renkler ve font ----------
#let renk-ad = black
#let renk-parantez = rgb("#e63946")
#let renk-arguman = rgb("#5b3df5")
#let renk-donus = rgb("#16a34a")
#let renk-atama = luma(100)
#let kod-font = ("JetBrains Mono", "DejaVu Sans Mono")

// ---------- Aşağı bakan ok ----------
#let alt-ok(renk, yukseklik: 24pt, kalinlik: 2.4pt) = box(width: 14pt, height: yukseklik, {
  place(top + center, line(start: (0pt, 0pt), end: (0pt, yukseklik - 7pt), stroke: kalinlik + renk))
  place(bottom + center, polygon(fill: renk, stroke: none, (0pt, 0pt), (13pt, 0pt), (6.5pt, 9pt)))
})

// ---------- Altı çizili kod parçası ----------
#let kod-parca(icerik, renk, boyut, kalinlik) = box(
  inset: (x: 3pt, bottom: 4pt),
  stroke: (bottom: kalinlik + renk),
  text(font: kod-font, size: boyut, fill: renk, icerik),
)

// ---------- Ana fonksiyon ----------
// ad:             fonksiyon adı, örn. "print"
// arguman:        tek argüman için metin, birden fazla argüman için dizi: ("3.14159", "2")
// donus:          sonucun atandığı değişken adı, örn. "sonuc" (none ise gösterilmez)
// donus-deger:    fonksiyonun döndürdüğü değer, örn. "3.14" (none ise gösterilmez)
// ad-etiket, arguman-etiket, donus-etiket: alttaki açıklamalar
//                 (arguman-etiket: tek metin ya da argüman sayısı kadar eleman içeren dizi)
// boyut:          koddaki yazı boyutu, etiket-boyut: açıklama yazısı boyutu, cizgi: alt çizgi kalınlığı
#let fonksiyon-anatomi(
  ad, arguman,
  donus: none,
  donus-deger: none,
  ad-etiket: "Fonksiyon Adı",
  arguman-etiket: auto,
  donus-etiket: "Dönüş Değeri",
  boyut: 26pt, etiket-boyut: 9pt, cizgi: 3pt,
) = {
  // Boşluklar bölünmeyen boşlukla değiştirilir: etiket tek satırda kalır, kutudan iki yana taşar
  let etiket(t) = text(font: kod-font, size: etiket-boyut, t.replace(" ", "\u{a0}"))

  let argumanlar = if type(arguman) == array { arguman } else { (arguman,) }
  let etiketler = if arguman-etiket == auto {
    if argumanlar.len() == 1 { ("Fonksiyon Argüman'ı",) }
    else { argumanlar.enumerate().map(((i, _)) => str(i + 1) + ". Argüman") }
  } else if type(arguman-etiket) == array { arguman-etiket }
  else { (arguman-etiket,) }

  // Her parça: (içerik, çizgi rengi, ok rengi, etiket) — ok ve etiket yoksa none
  let parcalar = ()
  if donus != none {
    let e = etiket(donus-etiket)
    if donus-deger != none {
      e = [#etiket(donus-etiket) \ #text(font: kod-font, size: etiket-boyut + 1pt, weight: "bold", fill: renk-donus)[#sym.arrow.r#sym.space.nobreak#donus-deger]]
    }
    parcalar.push((donus, renk-donus, renk-donus, e))
    parcalar.push(("=", renk-atama, none, none))
  }
  parcalar.push((ad, renk-ad, renk-ad, etiket(ad-etiket)))
  parcalar.push(("(", renk-parantez, none, none))
  for (i, a) in argumanlar.enumerate() {
    if i > 0 { parcalar.push((",", renk-parantez, none, none)) }
    parcalar.push((a, renk-arguman, renk-arguman, etiket(etiketler.at(i))))
  }
  parcalar.push((")", renk-parantez, none, none))

  // Dönüş değeri satırı varsa etiket alanı iki satır yüksekliğinde olur
  let etiket-yuksekligi = if donus != none and donus-deger != none { 2.8 * etiket-boyut } else { 1.5 * etiket-boyut }

  align(center, grid(
    columns: parcalar.len(), column-gutter: 4pt, row-gutter: 3pt, align: center + top,
    ..parcalar.map(p => kod-parca(p.at(0), p.at(1), boyut, cizgi)),
    ..parcalar.map(p => if p.at(2) != none { alt-ok(p.at(2)) } else { [] }),
    // Etiketler sütun genişliğini etkilemez: sıfır genişlikli kutuda ortalanıp iki yana taşar
    ..parcalar.map(p => if p.at(3) != none {
      box(width: 0pt, height: etiket-yuksekligi, place(top + center, p.at(3)))
    } else { [] }),
  ))
}

// ---------- Örnekler ----------
#fonksiyon-anatomi("print", "“Merhaba Dünya”")



#v(1.5em)

#fonksiyon-anatomi("round", ("3.14159", "2"), donus: "sonuc", donus-deger: "3.14")

#v(1.5em)

#fonksiyon-anatomi("input", "“Adınız: ”", donus: "ad", boyut: 20pt, etiket-boyut: 8pt)
