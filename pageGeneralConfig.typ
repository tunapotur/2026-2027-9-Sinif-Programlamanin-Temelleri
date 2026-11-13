// General Configuration
#let conf(doc) = [
 #set page(
  paper: "a4",
  margin:(top:1.5cm, left:2cm, bottom: 1cm, right: 1.5cm),
  number-align: right
  )
  
  #set text(
  font: "Noto Sans", 
  size: 10pt,
  lang:"tr",
  )

  #set par(
  leading: 0.8em,  // satır aralığına eklenecek boşluk
  spacing: 1.2em,   // paragraflar arası boşluk
  // justify:true,
)
  
  // Numaralandırma: 1. seviye -> I, II, III; alt seviyeler her bölümde 1'den başlar (1., 1.1., 1.1.1.)
  #set heading(numbering: (..nums) => {
    let n = nums.pos()
    if n.len() == 1 {
      numbering("I", n.first())
    } else {
      numbering("1.1.1.", ..n.slice(1))
    }
  })
  // #show heading: upper
  #show heading: set block(below: 1em)
  // Bölüm başlığı: ortalı, "I  Başlık" biçiminde
  #show heading.where(level: 1): it => {
    set align(center)
    set text(size: 18pt)
    
    block(above: 1.5em, below: 1em)[
      #if it.numbering != none [
        #counter(heading).display("I")#h(0.4em)
      ]
      #it.body
    ]
  }
  #show heading.where(level: 2): set text(size:16pt)
  #show heading.where(level: 3): set text(size:14pt)
  // #show heading.where(level: 4): set text(size:12pt,fill: rgb("#8B0000"))
  #show heading.where(level: 4): set text(size:12pt)


  #set list(spacing: 0.75em)

  #show title: set text(size:22pt, fill:blue, weight: "bold")

  // #show outline: upper

  // İçindekiler: bölüm satırları kalın ve aralıklı
  #show outline.entry.where(level: 1): it => {
    set text(weight: "bold")
    v(0.6em, weak: true)
    it
  }

  #doc
]
