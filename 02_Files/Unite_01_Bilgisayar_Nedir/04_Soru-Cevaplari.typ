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

#cevap(1, [A], [Transistör])

#cevap(2, [B], [8 bit = 1 Byte ($2^8 = 256$ farklı kombinasyon)])

#cevap(3, [E], [4 bit ($16 = 2^4$, 1 nibble)])

#cevap(4, [A], [Uzun ikili (binary) bit dizilerini daha kısa ve okunabilir göstermesi])

#cevap(5, [C], [Harf ve sembollere standart sayısal kodlar karşılık getirmek])

#cevap(6, [D], [Assembly Dili])

#cevap(7, [B], [Makine komutlarını sembolik kısaltmalarla (mnemonics) yazma imkânı vermesi])

#cevap(8, [A], [Derleyici (Compiler)])

#cevap(9, [Bit], [İkilik sayı sisteminde $0$ veya $1$ değerini alabilen en temel mantıksal veri birimi.])

#cevap(10, [Byte (Bayt)], [8 bitin birleşmesiyle oluşan ve 1 karakter saklamaya yeten veri birimi.])

#cevap(11, [Hexadecimal (Onaltılık)], [0–9 rakamları ile A–F harflerini kullanan 16 tabanlı sayı sistemi.])

#cevap(12, [ASCII], [Karakter ve sembolleri standart sayısal kodlarla eşleştiren kodlama tablosu.])

#cevap(13, [Assembly], [İşlemci komutlarını kısaltmalarla ifade eden alt seviyeli programlama dili.])

#cevap(14, [Y], [Bilgisayardaki en küçük veri birimi Byte değil, *bittir* (1 Byte = 8 bit).])

#cevap(15, [D], [8 bit bir araya gelerek 1 Byte'lık veri büyüklüğünü meydana getirir.])

#cevap(16, [D], [Hexadecimal sistemde 0–9 rakamları ile A–F arasındaki 6 harf (toplam 16 sembol) kullanılır.])

#text(weight: "semibold")[Soru 17.] Eşleştirme: *1-B, 2-C, 3-E, 4-D, 5-A*

==== Tarihteki İlk Bilgisayar Programcısı

#cevap(18, [B], [Analitik Makine'yi 1837'de Charles Babbage tasarlamıştır.])
#cevap(19, [B], [Dönemin teknolojisi makinenin yapımı için yeterli değildi.])
#cevap(20, [B], [Ada Lovelace, Babbage'ın en büyük destekçilerinden biriydi.])
#cevap(21, [B], [Bernoulli sayıları için algoritma tasarladığı için ilk bilgisayar programcısı kabul edilir.])
#cevap(22, [B], [Ada programlama dili, adını Ada Lovelace'ten alır.])

