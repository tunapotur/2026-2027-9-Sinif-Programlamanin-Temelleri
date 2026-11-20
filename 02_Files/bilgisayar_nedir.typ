#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/islem-aciklama.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge

#show: conf


== Bilgisayar Nedir? Değerlendirme Soruları

Aşağıdaki sorular; bilgisayarın tanımı, temel çalışma mimarisi, birimleri ve veri saklama konularını kapsar.

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

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

#soru(1, [Bilgisayarın temel görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Yalnızca metin yazmak],
  [Verileri depolamak, işlemek ve sonuçları çıktı olarak sunmak],
  [İnternete bağlanmak],
  [Yalnızca oyun oynamak],
  [Elektrik üretmek],
)

#soru(2, [Kullanıcı tarafından girilen işlenmemiş ham verilere ne ad verilir?])
#siklar5([Çıktı], [Girdi], [Bellek], [Algoritma], [Dosya])

#soru(3, [İşlem sonucunda elde edilen ve kullanıcıya sunulan anlamlı değere ne denir?])
#siklar5([Girdi], [Çıktı], [Komut], [Veri yolu], [Program])

#soru(4, [Aşağıdakilerden hangisi bilgisayarda gerçekleştirilen temel işlemlerden biri değildir?])
#siklar2([Giriş], [Veri işleme], [Veri saklama], [Çıkış], [Programlama])

#soru(5, [Dış dünyadan gelen verileri elektrik sinyaline çeviren birim hangisidir?])
#siklar5([İşlemci], [Bellek], [Giriş birimi], [Çıkış birimi], [Veri yolu])

#soru(6, [Bellek biriminin görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Verileri işlemek],
  [Verileri, komutları ve ara sonuçları geçici olarak saklamak],
  [Sonuçları ekrana yazmak],
  [Dış dünyadan veri almak],
  [Programları derlemek],
)

#soru(7, [Aritmetiksel ve mantıksal işlemleri yapan birim hangisidir?])
#siklar5([RAM], [Giriş birimi], [İşlemci (CPU)], [Çıkış birimi], [Sabit disk])

#soru(8, [İşlenmiş sonuçları ekran, yazıcı veya hoparlörle kullanıcıya sunan birim hangisidir?])
#siklar5([Giriş birimi], [Bellek], [İşlemci], [Çıkış birimi], [Veri yolu])



#soru(10, [Veri yolu (BUS) ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Yalnızca elektrik üretir],
  [Birimler arasında veri ve komut taşır],
  [Yalnızca ses iletir],
  [Kalıcı dosyaları saklar],
  [İşlemcinin yerini alır],
)

#soru(11, [`5 + 3` işlemi sırasında giriş biriminden gelen veriler, işlemciye ulaşmadan önce nereye yazılır?])
#siklar5([Sabit diske], [RAM'e], [Ekrana], [Yazıcıya], [Klavyeye])

#soru(12, [RAM ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Kalıcıdır, bilgisayar kapanınca silinmez],
  [Geçicidir, bilgisayar kapanınca içeriği silinir],
  [Yalnızca program dosyalarını saklar],
  [İşlemciye veri taşır],
  [Ekran çıktısını üretir],
)

#soru(13, [Bilgisayar kapatıldığında kaybolmaması gereken veriler nerede saklanmalıdır?])
#siklar5([RAM'de], [İşlemcide], [Sabit diskte], [Önbellekte], [Veri yolunda])





=== Tarihteki İlk Bilgisayar Programcısı: Değerlendirme Soruları

#soru(1, [1837'de "Analitik Makine" adını verdiği cihazı tasarlayan kişi kimdir?])
#siklar5([Ada Lovelace], [Charles Babbage], [Alan Turing], [Bill Gates], [John V. Neumann])

#soru(2, [Charles Babbage'ın Analitik Makine'yi hayata geçirememesinin temel nedeni nedir?])
#siklar2(
  [Yeterli matematik bilgisi olmaması],
  [Dönemin teknolojisinin yeterli olmaması],
  [Cihazın çok küçük olması],
  [Elektrik enerjisinin bulunmaması],
  [Babbage'ın çalışmaktan vazgeçmesi],
)

#soru(3, [Ada Lovelace'in Babbage'ın çalışmalarındaki rolü aşağıdakilerden hangisidir?])
#siklar2(
  [Analitik Makine'yi tek başına icat etmesi],
  [Babbage'ın en büyük destekçilerinden biri olması],
  [İlk işlemciyi tasarlaması],
  [İlk bilgisayarı üretmesi],
  [İnterneti geliştirmesi],
)

#soru(5, [Ada Lovelace neden tarihteki ilk bilgisayar programcısı olarak kabul edilir?])
#siklar2(
  [İlk bilgisayarı ürettiği için],
  [İlk algoritmayı tasarladığı için],
  [İlk işlemciyi icat ettiği için],
  [Ada programlama dilini kendisi geliştirdiği için],
  [İlk bilgisayar oyununu yaptığı için],
)

#soru(7, [Ada programlama dilinin adı nereden gelmektedir?])
#siklar5([Charles Babbage], [Ada Lovelace], [Analitik Makine], [Ada ülkesi], [İlk bilgisayar])


=== Matematik İşleminin Sonucunu Değişkene Atama (Önce İşlem, Sonra Atama)

Programlamada `=` işareti, matematikteki "eşittir" anlamından farklı olarak *atama* anlamında kullanılır. Eşittir operatörünün sağındaki ifade önce hesaplanır; elde edilen sonuç, sol taraftaki değişkene atanır. Yani önce işlem yapılır, sonra sonuç değişkene atanır.

#let atama-sema(..args) = align(center)[
  #block(
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: auto,
  )[#islem-aciklama(..args)]
]

==== Örnek 1: x = 3 + 5 \* 2

#iki_hucreli_satir(
  columns: (auto, auto),
  align: top+left,
  [
    #atama-sema(degisken: "x", ifade: "3 + 5 * 2", deger: "13", boyut: 12pt)
  ],[
    #align(center)[
      #kod-blok(width: auto, satir-no: false)[
  ```python
  x = 3 + 5 * 2
  ```]
    ]

    `x = 3 + 5 * 2` örneğinde önce çarpma işlemi yapılır: `5 * 2 = 10`.\ 
    Ardından toplama yapılır: `3 + 10 = 13`.\ 
    Son olarak `13` değeri `x` değişkenine atanır.
  ]
)

==== Örnek 2: ozkutle = kutle / hacim

#kod-blok(width: 100%)[
  ```python
  kutle = 100
  hacim = 25
  ozkutle = kutle / hacim
  ```
]

`kutle = 100` ve `hacim = 25` satırlarında değişkenlere değerler atanır. `ozkutle = kutle / hacim` satırında ise önce `kutle / hacim` işlemi yapılır. Python'da `/` operatörü ondalıklı bölme yaptığı için sonuç `4.0` olur. Ardından bu sonuç `ozkutle` (özkütle) değişkenine atanır.

#atama-sema(degisken: "ozkutle", ifade: "kutle / hacim", deger: "4.0", boyut: 12pt)

==== Örnek 3: x = x \* 2 + 3

#kod-blok(width: 100%)[
  ```python
  x = 5
  x = x * 2 + 3
  ```
]

`x = 5` satırıyla `x` değişkenine `5` değeri atanır. `x = x * 2 + 3` satırı ise bir denklem değil, bir atama komutudur. Eşittir operatörünün sağındaki ifade önce hesaplanır; buradaki `x`, değişkenin o anki değeri olan `5`'tir. `5 * 2 + 3 = 13` olduğundan yeni değer `13` olur ve bu değer yine `x` değişkenine atanır.

#atama-sema(degisken: "x", ifade: "x * 2 + 3", deger: "13", boyut: 12pt)

#not_block(title: "Önemli: ")[
  Programlamada `=` atama, `==` ise karşılaştırma operatörüdür. Bu nedenle `x = x * 2 + 3` satırı matematikteki bir denklem gibi çözülmez; "x'in yeni değerini hesapla ve x'e ata" anlamına gelir.
]

=== Mod Alma (%) ve Tam Bölme (`//`) Operatörleri

Python'da bölme işlemi yapılırken üç farklı operatör kullanılabilir. Bunların anlamlarını, 13 sayısının 3'e bölünmesi üzerinden inceleyelim.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    align: horizon,
    [
      #align(center)[
        #block(width: 210pt, height: 145pt, inset: 0pt)[
          #place(top + left, dx: 25pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölünen])
          #place(top + left, dx: 145pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölen])
          #place(top + left, dx: 30pt, dy: 14pt, text(size: 28pt, weight: "bold", fill: rgb("#1d4ed8"))[13])
          #place(top + left, dx: 150pt, dy: 14pt, text(size: 28pt, weight: "bold", fill: rgb("#dc2626"))[3])
          #place(top + left, dx: 115pt, dy: 6pt, line(length: 64pt, angle: 90deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 115pt, dy: 70pt, line(length: 85pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 150pt, dy: 72pt, text(size: 28pt, weight: "bold", fill: rgb("#7e22ce"))[4])
          #place(top + left, dx: 30pt, dy: 48pt, text(size: 28pt, weight: "bold", fill: rgb("#4d7c0f"))[12])
          #place(top + left, dx: 15pt, dy: 88pt, line(length: 92pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
          #place(top + left, dx: 30pt, dy: 92pt, text(size: 28pt, weight: "bold", fill: rgb("#d97706"))[1])
          #place(top + left, dx: 140pt, dy: 108pt, text(size: 8pt, fill: rgb("#334155"))[Bölüm])
          #place(top + left, dx: 25pt, dy: 128pt, text(size: 8pt, fill: rgb("#334155"))[Kalan])
        ]
      ]
    ],
    [
      #align(center)[
        #block(width: 210pt, height: 145pt, inset: 0pt)[
          #place(top + left, dx: 25pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Bölünen])
          #place(top + left, dx: 35pt, dy: 14pt, text(size: 30pt, weight: "bold", fill: rgb("#1d4ed8"))[13])
          #place(top + left, dx: 20pt, dy: 52pt, line(length: 85pt, angle: 0deg, stroke: 1.5pt + rgb("#0f172a")))
          #place(top + left, dx: 48pt, dy: 58pt, text(size: 30pt, weight: "bold", fill: rgb("#dc2626"))[3])
          #place(top + left, dx: 30pt, dy: 98pt, text(size: 8pt, fill: rgb("#334155"))[Bölen])
          #place(top + left, dx: 115pt, dy: 37pt, text(size: 30pt, weight: "bold")[=])
          #place(top + left, dx: 145pt, dy: 0pt, text(size: 8pt, fill: rgb("#334155"))[Sonuç])
          #place(top + left, dx: 135pt, dy: 28pt, line(length: 72pt, angle: 0deg, stroke: 2pt + rgb("#7e22ce")))
          #place(top + left, dx: 135pt, dy: 32pt, text(size: 18pt, weight: "bold", fill: rgb("#7e22ce"))[4.333333])
        ]
      ]
    ],
  ),
  caption: [13 sayısının 3'e bölümü: solda tam bölme ve kalan, sağda ondalıklı bölme],
)

Uzun bölmede *13* bölünen, *3* bölen, *4* bölüm ve *1* kalandır. Buna göre:

$ "bölünen" = "bölen" times "bölüm" + "kalan" $

$ 13 = 3 times 4 + 1 $

Python'da bu üç sonuç farklı operatörlerle elde edilir:

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center, left, center, center),
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  [*Operatör*], [*Anlamı*], [*Örnek*], [*Sonuç*],
  [`/`], [Ondalıklı bölme], [`13 / 3`], [`4.333333`],
  [`//`], [Tam bölme (bölüm)], [`13 // 3`], [`4`],
  [`%`], [Mod alma (kalan)], [`13 % 3`], [`1`],
)

- `/` operatörü ondalıklı bölme yapar; `13 / 3` işleminin sonucu `4.333333...` olur.
- `//` operatörü tam bölme yapar ve bölümü verir; `13 // 3` işleminin sonucu `4` olur.
- `%` operatörü mod alır ve bölümden kalanı verir; `13 % 3` işleminin sonucu `1` olur.

#kod-blok(width: 100%)[
  ```python
  bolunen = 13
  bolen = 3

  print(bolunen / bolen)   # 4.333333333333333
  print(bolunen // bolen)  # 4
  print(bolunen % bolen)   # 1
  ```
]

#not_block(title: "Not: ")[
  `//` operatörü, pozitif sayılarda bölümün tam kısmını verir. `%` operatörünün sonucu ise pozitif sayılarda her zaman bölenden küçüktür. Örneğin `13 % 3 = 1` ve `1 < 3` olur.
]

=== Bölme İşleminin Şematik Gösterimi

Aşağıdaki şema, 17 sayısının 5'e ondalıklı bölümünü özetler.

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 10pt, y: 20pt),
  )[
    #align(center)[
      #grid(
        columns: (auto, 70pt, auto, auto),
        rows: (auto, auto, auto),
        column-gutter: 6pt,
        align: (right + horizon, center + horizon, center + horizon, center + horizon),
        grid.cell(x: 0, y: 0, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Bölünen →]),
        grid.cell(x: 1, y: 0, text(size: 24pt)[$17$]),
        grid.cell(x: 1, y: 1, line(length: 70pt, stroke: 1.5pt + rgb("#0f172a"))),
        grid.cell(x: 2, y: 1, text(size: 24pt)[$=$]),
        grid.cell(x: 3, y: 1, text(size: 24pt)[$3.4$]),
        grid.cell(x: 0, y: 2, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Bölen →]),
        grid.cell(x: 1, y: 2, text(size: 24pt)[$5$]),
        grid.cell(x: 3, y: 2, block(pad(top: 10pt, text(size: 12pt, weight: "bold", fill: rgb("#475569"))[Sonuç]))),
      )
    ]
  ],
  caption: [17'nin 5'e ondalıklı bölümü],
)

=== Bölme İşleminin Elemanları (Bölünen, Bölen, Bölüm ve Kalan)

Bir bölme işleminde yer alan dört temel terim (*Bölünen*, *Bölen*, *Bölüm* ve *Kalan*) ile matematiksel sağlaması ($17 = 5 times 3 + 2$) aşağıdaki klasik bölme algoritması şemasında gösterilmiştir:

#figure(
  block(
    width: 100%,
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    fill: rgb("#ffffff"),
    clip: true,
    breakable: false,
  )[
    // 1) Üst Başlık Bandı
    #block(
      width: 100%,
      fill: rgb("#16325c"),
      inset: (x: 14pt, y: 10pt),
    )[
      #align(center)[
        #text(weight: "bold", size: 11pt, fill: white)[Bölme İşleminin Temel Elemanları]
      ]
    ]

    #pad(x: 20pt, top: 18pt, bottom: 16pt)[
      #align(center)[
        #text(size: 9.5pt, weight: "bold", fill: rgb("#475569"))[Klasik Bölme Algoritması Şeması (17 ÷ 5)]
        #v(16pt)

        // Bölme Şeması Tablosu
        #box[
          #table(
            columns: (auto, auto),
            stroke: (x, y) => if x == 1 and y == 0 {
              (left: 2.2pt + rgb("#334155"), bottom: 2.2pt + rgb("#334155"))
            } else if x == 1 and y == 1 {
              (left: 2.2pt + rgb("#334155"))
            } else {
              none
            },
            inset: (x, y) => if x == 0 and y == 0 {
              (right: 8pt, bottom: 10pt, left: 14pt, top: 6pt)
            } else if x == 1 and y == 0 {
              (left: 8pt, bottom: 10pt, right: 14pt, top: 6pt)
            } else if x == 0 and y == 1 {
              (right: 8pt, top: 10pt, left: 14pt, bottom: 8pt)
            } else {
              (left: 8pt, top: 10pt, right: 14pt, bottom: 8pt)
            },
            align: (x, y) => if x == 0 { right + top } else { left + top },

            // --- SOL ÜST: Bölünen solda, 17 dikey çizgiye bitişik ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 14pt, weight: "bold", fill: rgb("#1d4ed8"))[Bölünen],
                text(size: 26pt, weight: "bold", fill: rgb("#1d4ed8"))[17],
              )
            ],

            // --- SAĞ ÜST: 5 dikey çizgiye bitişik, Bölen sağda ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 26pt, weight: "bold", fill: rgb("#dc2626"))[5],
                text(size: 14pt, weight: "bold", fill: rgb("#dc2626"))[Bölen],
              )
            ],

            // --- SOL ALT: - 15 ve 2 dikey çizgiye bitişik, Kalan solda ---
            [
              #align(right)[
                #grid(
                  columns: (auto, auto),
                  gutter: 4pt,
                  align: horizon,
                  text(size: 18pt, weight: "bold", fill: rgb("#64748b"))[−],
                  text(size: 26pt, weight: "bold", fill: rgb("#64748b"))[15],
                )
                #v(-3pt)
                #line(length: 46pt, stroke: 1.5pt + rgb("#64748b"))
                #v(4pt)
                #grid(
                  columns: (auto, auto),
                  gutter: 14pt,
                  align: horizon,
                  text(size: 14pt, weight: "bold", fill: rgb("#d97706"))[Kalan],
                  text(size: 26pt, weight: "bold", fill: rgb("#d97706"))[2],
                )
              ]
            ],

            // --- SAĞ ALT: 3 dikey çizgiye bitişik, Bölüm sağda ---
            [
              #grid(
                columns: (auto, auto),
                gutter: 14pt,
                align: horizon,
                text(size: 26pt, weight: "bold", fill: rgb("#7e22ce"))[3],
                text(size: 14pt, weight: "bold", fill: rgb("#7e22ce"))[Bölüm],
              )
            ],
          )
        ]
      ]

      #v(18pt)

      // Alt Bilgi Bandı: Matematiksel Denklem ve Altın Kural (17 ve 5 ile)
      #block(
        width: 100%,
        fill: rgb("#f1f5f9"),
        stroke: 1pt + rgb("#cbd5e1"),
        radius: 6pt,
        inset: (x: 12pt, y: 10pt),
      )[
        #grid(
          columns: (1.2fr, 1fr),
          gutter: 14pt,
          align: horizon,
          [
            #align(center)[
              #text(size: 8.5pt, weight: "bold", fill: rgb("#475569"))[Bölme İşleminin Matematiksel Sağlaması:]
              #v(3pt)
              #text(size: 12pt, weight: "bold", fill: rgb("#0f172a"))[
                $ "Bölünen" = ("Bölen" times "Bölüm") + "Kalan" $
              ]
              #v(2pt)
              #text(size: 10.5pt, fill: rgb("#1d4ed8"), weight: "bold")[
                $ 17 = (5 times 3) + 2 $
              ]
            ]
          ],
          [
            #block(
              fill: white,
              stroke: 1pt + rgb("#e2e8f0"),
              radius: 5pt,
              inset: (x: 10pt, y: 8pt),
            )[
              #text(size: 8pt, weight: "bold", fill: rgb("#0f172a"))[💡 Unutmayınız (Altın Kural):]
              #v(2pt)
              #text(size: 7.5pt, fill: rgb("#334155"))[
                Bir bölme işleminde *kalan* daima sıfır veya sıfırdan büyük, ancak *bölenden kesinlikle küçük* olmak zorundadır:
              ]
              #v(3pt)
              #align(center)[
                #text(size: 9.5pt, weight: "bold", fill: rgb("#d97706"))[
                  $ 0 <= "Kalan" < "Bölen" quad (0 <= 2 < 5) $
                ]
              ]
            ]
          ]
        )
      ]
    ]
  ],
  caption: [Bölme işleminin temel elemanları (Bölünen, Bölen, Bölüm, Kalan)],
)

#include "bolme-islemi.typ"

#set text(font: "Noto Sans", lang: "tr")

Aşağıdaki uygulama soruları, bu bölümde öğrendiğiniz değişken, tür dönüşümü ve aritmetik operatörleri pekiştirmek için hazırlanmıştır. Örnek çıktılardaki değerler kullanıcı girişi olarak alınmıştır.

#iki_hucreli_satir[
=== Çemberin çevresi ve alanı
#soru_bilgi[Konu: sabit, `float()`, aritmetik operatörler, üs alma, f-string · Zorluk: Kolay]

  Kullanıcıdan bir çemberin yarıçapını alın. `PI` adında bir sabit (3.14159) tanımlayın. Çemberin çevresini ve alanını hesaplayıp virgülden sonra 2 basamakla yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Yarıçap (cm): 5
Çevre: 31.42 cm
Alan: 78.54 cm²
```
]
]

#kod-blok(width: 100%)[
  ```python
  PI = 3.14159

  yaricap = float(input("Yarıçap (cm): "))

  cevre = 2 * PI * yaricap
  alan = PI * yaricap ** 2

  print(f"Çevre: {cevre:.2f} cm")
  print(f"Alan: {alan:.2f} cm²")
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.7fr))[
=== Vücut kitle endeksi (BMI)
#soru_bilgi[Konu: `float()`, `int()`, üs alma, aritmetik operatörler · Zorluk: Kolay]

  Kullanıcının girdiği boy (metre) ve kilo (kilogram) değerlerine göre vücut kitle endeksini hesaplayan programı yazın. Formül: `BMI = kilo / boy ** 2`. Boyun karesi için üs alma operatörünü kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):1.75
Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):80
Vücut Kitle Endeksiniz (BMI):
26.122448979591837
```
]
]

#kod-blok(width: 100%)[
  ```python
  boy = float(input("Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):"))
  kilo = int(input("Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):"))

  bmi = kilo / boy ** 2

  print("Vücut Kitle Endeksiniz (BMI):", bmi)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.4fr))[
=== Araç yakıt tüketimi
#soru_bilgi[Konu: `float()`, aritmetik operatörler, oran hesaplama · Zorluk: Orta]

  Yakıt deposu tam dolu bir araçla yola çıkıp dönüşte depoyu yeniden dolduran bir sürücünün verilerinden yakıt tüketimini hesaplayan programı yazın. Formüller:

  - 100 km'de harcanan litre = (alınan yakıt litre) / (gidilen yol km) × 100
  - 100 km'de harcanan benzin tutarı = (alınan yakıt tutarı) / (gidilen yol km) × 100][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Araç Kullanım Bilgileri Giriş Ekranı
Gidilen Yol(km):428.8
Aldığınız Yakıt Miktarı(lt):27.982
Alınan Yakıt Tutarı:146.6
100km 'de Harcanan Yakıtın Litresi:
6.525652985074625
100km 'de Harcanan Yakıtın Tutarı:
34.18843283582089
```
]
]

#kod-blok(width: 100%)[
  ```python
  print("Araç Kullanım Bilgileri Giriş Ekranı")

  yol = float(input("Gidilen Yol(km):"))
  yakit = float(input("Aldığınız Yakıt Miktarı(lt):"))
  tutar = float(input("Alınan Yakıt Tutarı:"))

  yuz_km_litre = yakit / yol * 100
  yuz_km_tutar = tutar / yol * 100

  print("100km 'de Harcanan Yakıtın Litresi:", yuz_km_litre)
  print("100km 'de Harcanan Yakıtın Tutarı:", yuz_km_tutar)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.6fr))[
=== Sayıyı iki katının beş fazlasına güncelleme
#soru_bilgi[Konu: `int()`, atama, önce işlem sonra atama · Zorluk: Kolay]

  Kullanıcıdan 1–20 arasında pozitif bir tam sayı alın. Sayının değerini, iki katının beş fazlası olacak şekilde güncelleyin (yeni değer = sayı × 2 + 5) ve ekrana yazdırın. Önce işlem, sonra atama kuralını kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: 12
Girilen sayının değeri 2 katının 5 fazlası
kadar arttırıldı
Sayının Yeni Değeri : 29
```
]
]

#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: "))

  sayi = sayi * 2 + 5

  print("Girilen sayının değeri 2 katının 5 fazlası kadar arttırıldı")
  print("Sayının Yeni Değeri :", sayi)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.3fr))[
=== Dik üçgende hipotenüs
#soru_bilgi[Konu: `float()`, üs alma, karekök, Pisagor bağıntısı · Zorluk: Orta]

  Kullanıcıdan bir dik üçgenin dik kenarları olan `a` ve `b` kenar uzunluklarını alın. $a^2 + b^2 = c^2$ bağıntısını kullanarak hipotenüs uzunluğu `c`'yi hesaplayıp yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
a Kenarının Uzunluğu: 3
b Kenarının Uzunluğu: 4

c Kenarının Uzunluğu(Hipotenüs):  5.0
```
]
]

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 10pt, y: 10pt),
  )[
    #align(center)[
      #block(width: 200pt, height: 155pt, inset: 0pt)[
        #place(top + left, dx: 30pt, dy: 20pt, polygon(
          fill: rgb("#e2e8f0"),
          stroke: 1.5pt + rgb("#0f172a"),
          (0pt, 0pt),
          (0pt, 90pt),
          (120pt, 90pt),
        ))
        #place(top + left, dx: 30pt, dy: 98pt, line(length: 12pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 42pt, dy: 98pt, line(length: 12pt, angle: 90deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 30pt, dy: 98pt, box(
          width: 12pt,
          height: 12pt,
          align(center + horizon, circle(radius: 1.2pt, fill: rgb("#0f172a"))),
        ))
        #place(top + left, dx: 5pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[a])
        #place(top + left, dx: 80pt, dy: 112pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[b])
        #place(top + left, dx: 100pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#dc2626"))[c])
      ]
    ]
  ],
  caption: [Dik üçgende dik kenarlar a ve b, hipotenüs c],
)

#kod-blok(width: 100%)[
  ```python
  a = float(input("a Kenarının Uzunluğu: "))
  b = float(input("b Kenarının Uzunluğu: "))

  c = (a ** 2 + b ** 2) ** 0.5

  print("c Kenarının Uzunluğu(Hipotenüs): ", c)
  ```
]