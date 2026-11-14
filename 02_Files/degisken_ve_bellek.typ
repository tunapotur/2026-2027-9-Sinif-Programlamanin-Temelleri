#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *

// #show: conf
// #show: conf.with(sayfa-ayari: false)

== Değişkenler ve Bellek(RAM)
*Değişken*; programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir. Kullanıcıdan veya harici bir kaynaktan alınan bilgiler bu değişkenlerde saklanır; kod çalıştıkça hesaplamalarda kullanılır ve süreç içinde yeni değerler alabilir. *Değişkenler* yardımıyla bellekte (RAM) saklanan verilere kolayca erişilir; kod çalıştırıldığında bu değişken isimleri çağrılarak temsil ettikleri veriler üzerinde işlemler gerçekleştirilir.

// #let image_width = auto

// #kod-cikti(baslik: [Örnek Python Kodu])[
// ```Python
// puan = int(input("Puan Giriniz: "))
// print("Puanı:", puan)
// puan = puan + 25
// print("Güncellenmiş Puan:", puan)
// ```
// ][
// ```
// Puan Giriniz: 50
// Puanı: 50
// Güncellenmiş Puan: 75
// ```
// ]

// #grid(
//   columns: (auto,auto, auto, auto),
//   gutter: 2pt,
//   align: (center + horizon),
//   image("/02_Files/images/01-Deger-Atama-RAM-3.jpg",width: image_width),
//   image("/02_Files/images/02-Hafizadan-Cagirma-RAM-3.jpg",width: image_width),
//   image("/02_Files/images/03-Deger-Guncelleme-RAM-3.jpg",width: image_width),
//   image("/02_Files/images/04-Guncel-Hali-Cagirma-RAM-3.jpg",width: image_width),
// )

#let image_width = 94%

#let atama1 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[
  #image("/02_Files/images/01-Deger-Atama-RAM.jpg",width: image_width)
  ]
  #grid(
    columns: (8em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Puan Giriniz: 50]],
    [#text(size:8pt)[Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.]]
  )
]

#let atama2 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("/02_Files/images/02-Hafizadan-Cagirma-RAM.jpg",width: image_width)]
  #grid(
    columns: (5em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Puanı: 50]],
    [#text(size:8pt)[*puan* değişkeni RAM'deki adresinden çağırılarak *50* değeri ekrana yazdırılır.]]
  )
]

#let atama3 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("/02_Files/images/03-Deger-Guncelleme-RAM.jpg",width: image_width)]
  #grid(
    columns: (4em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[İşlem]],
    text(size:8pt)[Mevcut *50* değeri hafızadan alınır, *25* eklenir ve elde edilen *75* değeri tekrar *puan* değişkenine atanır.]
  )
]

#let atama4 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("/02_Files/images/04-Guncel-Hali-Cagirma-RAM.jpg",width: image_width)]
  #grid(
    columns: (10.1em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Güncellenmiş Puan: 75]],
    text(size:8pt)[Güncellenen *puan* değişkeni hafızadan çağırılarak ekrana yazdırılır.]
  )
]


#grid(
  columns: (auto,auto),
  gutter: 5pt,
  align: (left + horizon),
  atama1, atama2
)

#grid(
  columns: (auto,auto),
  gutter: 5pt,
  align: (left + horizon),
  atama3, atama4
)


// #grid(
//   columns: (auto,auto),
//   gutter: 2pt,
//   align: (left+horizon),
//   [
//     1) Değer Atama\ Giriş yapılan 50 değeri, RAM'de puan ismiyle bir adrese kaydedilir.
//     #kod-satiri(no:0)[
//       ```Python
//       Puan Giriniz: 50
//       ```
//     ]
//   ],
//   image("/02_Files/images/01-Deger-Atama-RAM-3.jpg",width: image_width),
// )

// #grid(
//   columns: (auto,auto),
//   gutter: 1pt,
//   align: (center + horizon),
//   image("/02_Files/images/01-Deger-Atama.png",width: image_width),
//   image("/02_Files/images/02-Hafizadan-Cagirma.png",width: image_width),
// )

// #grid(
//   columns: (auto,auto),
//   gutter: 1pt,
//   align: (center + horizon),
//   image("/02_Files/images/03-Deger-Guncelleme.png",width: image_width),
//   image("/02_Files/images/04-Guncel-Hali-Cagirma.png",width: image_width),
// )

#not_block(title:"Özet",boyut: 10pt, width: 100%)[Değişkenler, değerleri geçici olarak RAM'de tutan etiketlerdir. Program çalıştığı sürece bu değerler kullanılabilir ve güncellenebilir.]

