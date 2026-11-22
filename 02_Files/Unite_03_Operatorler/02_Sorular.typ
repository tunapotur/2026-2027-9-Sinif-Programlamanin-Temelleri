#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": *

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

