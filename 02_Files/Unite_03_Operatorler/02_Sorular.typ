#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap-cizgisi(..args) = {
  let n = if args.pos().len() > 0 {
    args.pos().first()
  } else if "n" in args.named() {
    args.named().at("n")
  } else {
    1
  }
  for _ in range(n) [
    #v(0.25em)
    #line(length: 100%, stroke: 0.45pt + gray)
    #v(0.45em)
  ]
}

#let soru(no, metin) = block(breakable: false, below: 0.65em)[
  *#no.* #metin
]

#let siklar2(a, b, c, d, ..rest) = {
  let e = if rest.pos().len() > 0 { rest.pos().first() } else { none }
  if e != none {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
      grid.cell(colspan: 2)[E) #e],
    )
  } else {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
    )
  }
}

#let siklar4(a, b, c, d) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d],
)

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

=== Bölüm Soruları

#soru(1, [Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi -= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?])
#siklar5([22], [26], [32], [30], [24])

#soru(2, [Python'da iki değerin birbirine eşit olup olmadığını denetlemek (karşılaştırmak) için hangi operatör kullanılır?])
#siklar5([`=`], [`:=`], [`=>`], [`==`], [`!=`])

#soru(3, [Python'da `2 ** 6` üs alma işleminin sonucu kaçtır?])
#siklar5([36], [512], [64], [18], [12])

#soru(4, [Aşağıdakilerden hangisi bir aritmetik operatör *değildir*?])
#siklar5([`+`], [`>=`], [`*`], [`/`], [`-`])

#soru(5, [Python'da `=` atama operatörü, `==` ise eşitlik karşılaştırma operatörüdür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(6, [Python'da atama operatörü (`=`) ile eşitlik karşılaştırma operatörü (`==`) arasındaki fark nedir?])
#cevap-cizgisi(2)

