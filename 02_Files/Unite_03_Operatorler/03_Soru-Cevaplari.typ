#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap(no, cevap, aciklama) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt, weight: "semibold")[#underline(stroke: 1.25pt, offset: 1.25pt)[(#cevap)]]
  #text(size:10pt)[#aciklama]
]

#let cevap-acikUclu(no, cevap) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt)[#cevap]
]

#let ara-baslik(baslik) = block(
  breakable: false,
  width: 100%,
  above: 1em,
  below: 0.7em
)[
  #text(weight: "bold", size: 10pt)[#baslik]
]

=== Bölüm Soruları: Cevap Anahtarı

#cevap(1, [B], [26 ($20 + 10 = 30$, $30 - 4 = 26$)])

#cevap(2, [D], [`==` (karşılaştırma operatörüdür; `=` ise atama yapar)])

#cevap(3, [C], [64 ($2^6 = 64$)])

#cevap(4, [B], [`>=` (karşılaştırma operatörüdür)])

#cevap(5, [D], [`=` operatörü değişken ataması yaparken, `==` operatörü eşitlik karşılaştırması yapar.])

#cevap-acikUclu(
  6,
  [`=` operatörü bir değişkene değer atamak için kullanılırken, `==` operatörü iki değerin birbirine eşit olup olmadığını denetler (karşılaştırır).],
)
