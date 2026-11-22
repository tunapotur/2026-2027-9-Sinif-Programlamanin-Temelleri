// General Configuration
// sayfa-ayari: true ise sayfa boyutu ve kenar boşluklarını uygular.
// Typst'ta her '#set page()' kuralı yeni bir sayfa başlatır (pagebreak).
// Ana belgede (main.typ / 02_Temel_Programlama_Yapilari.typ) '#show: conf' bir kez çağrılır.
// #include edilen alt dosyalarda sayfa kırılması olmaması için '#show: conf' alt dosyalardan
// kaldırılmalı ya da '#show: conf.with(sayfa-ayari: false)' şeklinde kullanılmalıdır.
#let conf(
  doc,
  sayfa-ayari: true,
) = [
 #set page(
  paper: "a4",
  margin:(top:1cm, left:1.5cm, bottom: 1cm, right: 1.5cm),
  number-align: right
  ) if sayfa-ayari
  
  #set text(
  font: "Noto Sans", 
  size: 10pt,
  lang:"tr",
  )

  #set par(
  leading: 0.6em,  // satır aralığına eklenecek boşluk
  spacing: 1em,   // paragraflar arası boşluk
  justify:true,
)
  
// Numaralandırma:
//   = Bölüm, == Ünite, === Konu, ==== Alt konu
//   Konu numaraları her ünitede 1'den başlar: 1., 1.1., 1.1.1.
#set heading(numbering: (..nums) => {
  let n = nums.pos()
  if n.len() == 1 {
    "Bölüm " + str(n.first())
  } else if n.len() == 2 {
    "Ünite " + str(n.at(1))
  } else {
    numbering("1.1.1.", ..n.slice(2))
  }
})

// Tüm başlıklar için ortak ve dengeli üst/alt boşluk ayarları
#show heading: set block(above: 1em, below: 0.6em)

// 1. Seviye (Bölüm Başlığı): Ortalı, "Bölüm X: Başlık" biçiminde
#show heading.where(level: 1): it => {
  set align(center)
  set text(size: 22pt, weight: "bold")
  block(above: 1.2em, below: 0.75em)[
    #if it.numbering != none [
      #counter(heading).display((..nums) => "Bölüm " + str(nums.pos().first()) + ":")#h(0.5em)
    ]
    #it.body
  ]
}

// Ünite başlıkları: "Ünite N: Başlık"
#show heading.where(level: 2): it => {
  set align(left)
  set text(size: 18pt, weight: "bold")
  block(above: 1.4em, below: 0.8em)[
    #if it.numbering != none [
      #counter(heading).display((..nums) => "Ünite " + str(nums.pos().at(1)) + ":")#h(0.5em)
    ]
    #it.body
  ]
}

// Alt başlık boyutları (10pt gövde metnine uyumlu)
#show heading.where(level: 3): set text(size: 13pt)
#show heading.where(level: 4): set text(size: 11pt)


  // #set list(spacing: 0.75em)

  #show title: set text(size:22pt, weight: "bold")

  // #show outline: upper

  // İçindekiler: başlık numarası ile metin arasında tek karakterlik boşluk (0.3em)
  #show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner(), gap: 0.3em),
  )

  // İçindekiler: bölüm satırları ortalı, büyük ve aralıklı; sayfa numarası yok
  #show outline.entry.where(level: 1): it => block(
    above: 0.8em,
    below: 1.2em,
  )[
    #align(center)[
      #text(size: 14pt, weight: "bold")[
        #link(it.element.location(), [#it.prefix()#h(0.5em)#it.body()])
      ]
    ]
  ]

  // İçindekiler: ünite satırları koyu, biraz büyük ve üstü aralıklı
  #show outline.entry.where(level: 2): it => block(
    above: 1em,
    below: 0.2em,
  )[
    #set text(size: 11pt, weight: "bold")
    #link(it.element.location(), it.indented(it.prefix(), it.inner(), gap: 0.3em))
  ]

  #doc
]

// Ortalı, büyük ve altında boşluk bırakılan içindekiler başlığı
#let icindekiler(
  title: "İçindekiler",
  indent: 12pt,
) = outline(
  title: align(center)[
    #text(size: 26pt, weight: "bold", title)
    #v(1em)
  ],
  indent: indent,
)
