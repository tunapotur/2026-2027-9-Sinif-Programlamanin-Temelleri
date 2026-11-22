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

#cevap(1, [C], [16-11-2026 (sep parametresi araya tire ekler)])

#cevap(2, [E], [`type()`])

#cevap(3, [D], [True (7.5 bir float türüdür)])

#cevap(4, [E], [Metin içinde değişken ve ifadeleri `{}` ile doğrudan biçimlendirmek])

#ara-baslik([Boşluk Doldurma Soruları Cevap Anahtarı])

#cevap(5, [`input()`], [Kullanıcının klavyeden metin girişi yapmasını sağlayan standart fonksiyon.])

#cevap(6, [`print()`], [Ekrana veya konsola çıktı yazdırmak için kullanılan temel Python fonksiyonu.])

#ara-baslik([Doğru – Yanlış Soruları Cevap Anahtarı])

#cevap(7, [D], [`type()` fonksiyonu parametre olarak verilen değişkenin veri türünü döndürür.])

#ara-baslik([*Açık Uçlu ve Klasik Sorular Model Cevapları*])

#cevap-acikUclu(
  8,
  [Aynı kodları tekrar tekrar yazmayı önler (kod tekrarını azaltır) ve programın daha düzenli, bakımı kolay olmasını sağlar.],
)

#cevap-acikUclu(
  9,
  ["Kendini Tekrar Etme" anlamına gelir; aynı kodun veya mantığın program içinde defalarca yazılmaması gerektiğini ifade eder.],
)
