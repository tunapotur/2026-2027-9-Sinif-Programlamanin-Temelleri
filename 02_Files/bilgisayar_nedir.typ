#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

// #show: conf

== Bilgisayar Nedir?
*Bilgisayar*, kendisine verilen bilgiler üzerinden aritmetiksel, mantıksal ve karşılaştırma işlemleri yaparak sonuçları çıktı birimlerine gönderen elektronik bir cihazdır. Bilgisayarlar çok yüksek hızlarda, bıkıp usanmadan ve tekrarlı olarak aynı işlemleri hatasız yerine getirebilen aygıtlardır.

Bilgisayarda temel olarak giriş, veri işleme, veri saklama ve çıkış işlemleri gerçekleştirilir. Kullanıcı tarafından girilen işlenmemiş ham veriler bilgisayar tarafından *"girdi"* olarak algılanır ve bu girdiler programlar tarafından işlenir. İşlem sonucunda elde edilen ve kullanıcıya geri dönen anlamlı değer ise işlenmiş veridir; bu veri de *"çıktı"* olarak adlandırılır.

#v(0.4em)

// ============================================================
// BİLGİSAYARIN ÇALIŞMA MİMARİSİ ÇİZİMİ (TYP FORMATINDA)
// ============================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#cbd5e1"),
  radius: 8pt,
  fill: rgb("#f8fafc"),
  inset: 0pt,
  clip: true,
  breakable: false,
)[
  // Üst Başlık Bandı
  #block(
    width: 100%,
    fill: rgb("#16325c"),
    inset: (x: 12pt, y: 7.5pt),
  )[
    #set align(center)
    #text(weight: "bold", size: 10.5pt, fill: white)[Bilgisayarın Temel Çalışma Mimarisi]
    #v(2pt)
    #text(size: 7.5pt, fill: rgb("#bfdbfe"))[Giriş, Bellek, İşlemci ve Çıkış Birimleri Arasındaki Veri ve Komut Akışı]
  ]

  #pad(x: 10pt, top: 10pt, bottom: 9pt)[
    // 1. KAT: İŞLEMCİ (CPU)
    #align(center)[
      #block(
        width: 230pt,
        fill: rgb("#eff6ff"),
        stroke: 1.5pt + rgb("#2563eb"),
        radius: 6pt,
        inset: (x: 8pt, y: 6pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#1d4ed8"),
            radius: 3pt,
            inset: (x: 10pt, y: 2.5pt),
            text(weight: "bold", size: 8.8pt, fill: white)[İşlemci (CPU)]
          )
          #v(3pt)
          #text(size: 7.2pt, weight: "bold", fill: rgb("#1e40af"))[Merkezi İşlem Birimi (ALU + CU)]
          #v(1.5pt)
          #text(size: 6.3pt, fill: rgb("#334155"))[
            Aritmetiksel ve mantıksal işlemleri gerçekleştiren ana birimdir.\ Komutları sırayla yorumlar, hesaplamaları yapar ve tüm sistemi denetler.
          ]
        ]
      ]
    ]

    // 2. KAT: DİKEY ÇİFT YÖNLÜ VERİ / KOMUT İLETİŞİMİ
    #align(center)[
      #block(width: 260pt, inset: (y: 3pt))[
        #grid(
          columns: (1fr, auto, 1fr),
          align: horizon,
          align(right)[
            #text(size: 6.8pt, weight: "bold", fill: rgb("#1d4ed8"))[Komut / Veri Çağırma #h(3pt) ▲]
          ],
          [
            #block(
              fill: rgb("#dbeafe"),
              stroke: 1pt + rgb("#3b82f6"),
              radius: 4pt,
              inset: (x: 8pt, y: 2.5pt),
            )[
              #set align(center)
              #text(size: 8.5pt, weight: "bold", fill: rgb("#1e40af"))[▲ ┃ ▼]
              #v(-3pt)
              #text(size: 5.5pt, weight: "bold", fill: rgb("#1e40af"))[VERİ YOLU (BUS)]
            ]
          ],
          align(left)[
            #text(size: 6.8pt, weight: "bold", fill: rgb("#0d9488"))[#h(3pt) ▼ İşlenen Veriyi Yazma]
          ]
        )
      ]
    ]]

    // 3. KAT: YATAY AKIŞ (Girdi -> Giriş Birimi -> Bellek -> Çıkış Birimi -> Çıktı)
    #grid(
      columns: (1fr, 1.85fr, 0.35fr, 3.1fr, 0.35fr, 1.85fr, 1fr),
      gutter: 0pt,
      align: horizon,
      rows: (84pt,),

      // Sütun 1: Girdi Akışı
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#e0f2fe"),
        stroke: 1pt + rgb("#7dd3fc"),
        radius: (left: 6pt, right: 0pt),
        inset: (x: 4pt, y: 6pt),
      )[
        #align(center + horizon)[
          #text(size: 7.2pt, weight: "bold", fill: rgb("#0369a1"))[Komut ve\ Veriler]
          #v(2pt)
          #text(size: 5.8pt, fill: rgb("#0284c7"))[(Ham Girdi)]
          #v(3pt)
          #text(size: 11pt, fill: rgb("#0284c7"))[▶▶]
        ]
      ],

      // Sütun 2: Giriş Birimi
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#f0fdf4"),
        stroke: 1.2pt + rgb("#22c55e"),
        radius: 6pt,
        inset: (x: 4pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#16a34a"),
            radius: 3pt,
            inset: (x: 6pt, y: 2.2pt),
            text(weight: "bold", size: 8pt, fill: white)[Giriş Birimi]
          )
          #v(2.5pt)
          #text(size: 6.2pt, fill: rgb("#15803d"))[Veri ve komut iletimi]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 2.5pt,
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Klavye]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Fare]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Kamera]),
            box(fill: white, stroke: 0.5pt + rgb("#86efac"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#166534"))[Mikrofon]),
          )
        ]
      ],

      // Sütun 3: Ara Ok (Giriş -> Bellek)
      align(center + horizon)[
        #text(size: 13pt, fill: rgb("#16a34a"))[▶]
      ],

      // Sütun 4: Bellek Birimi (Merkez)
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#f0fdfa"),
        stroke: 1.5pt + rgb("#0d9488"),
        radius: 6pt,
        inset: (x: 5pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#0d9488"),
            radius: 3pt,
            inset: (x: 9pt, y: 2.2pt),
            text(weight: "bold", size: 8.5pt, fill: white)[Bellek Birimi]
          )
          #v(2pt)
          #text(size: 6.1pt, weight: "bold", fill: rgb("#0f766e"))[Komutlar, Veriler ve Sonuçlar Burada Tutulur]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 3pt,
            block(
              fill: white,
              stroke: 0.5pt + rgb("#5eead4"),
              radius: 3pt,
              inset: 2.5pt,
              [
                #text(size: 6.2pt, weight: "bold", fill: rgb("#115e59"))[Ana Bellek (RAM)] \
                #text(size: 5.4pt, fill: rgb("#64748b"))[Çalışan programlar ve anlık veriler]
              ]
            ),
            block(
              fill: white,
              stroke: 0.5pt + rgb("#5eead4"),
              radius: 3pt,
              inset: 2.5pt,
              [
                #text(size: 6.2pt, weight: "bold", fill: rgb("#115e59"))[Sabit Disk (HDD/SSD)] \
                #text(size: 5.4pt, fill: rgb("#64748b"))[Kalıcı dosyalar ve saklanan bilgiler]
              ]
            )
          )
        ]
      ],

      // Sütun 5: Ara Ok (Bellek -> Çıkış)
      align(center + horizon)[
        #text(size: 13pt, fill: rgb("#0d9488"))[▶]
      ],

      // Sütun 6: Çıkış Birimi
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#faf5ff"),
        stroke: 1.2pt + rgb("#c084fc"),
        radius: 6pt,
        inset: (x: 4pt, y: 5pt),
      )[
        #align(center)[
          #block(
            fill: rgb("#9333ea"),
            radius: 3pt,
            inset: (x: 6pt, y: 2.2pt),
            text(weight: "bold", size: 8pt, fill: white)[Çıkış Birimi]
          )
          #v(2.5pt)
          #text(size: 6.2pt, fill: rgb("#7e22ce"))[Sonuçların dışa aktarımı]
          #v(3pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 2.5pt,
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Ekran]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Yazıcı]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Hoparlör]),
            box(fill: white, stroke: 0.5pt + rgb("#d8b4fe"), radius: 2pt, inset: 2pt, text(size: 5.6pt, weight: "bold", fill: rgb("#6b21a8"))[Projeksiyon]),
          )
        ]
      ],

      // Sütun 7: Çıktı Akışı
      block(
        width: 100%,
        height: 100%,
        fill: rgb("#fef3c7"),
        stroke: 1pt + rgb("#fcd34d"),
        radius: (left: 0pt, right: 6pt),
        inset: (x: 4pt, y: 6pt),
      )[
        #align(center + horizon)[
          #text(size: 11pt, fill: rgb("#d97706"))[▶▶]
          #v(2pt)
          #text(size: 7.2pt, weight: "bold", fill: rgb("#b45309"))[Sonuçlar]
          #v(2pt)
          #text(size: 5.8pt, fill: rgb("#d97706"))[(İşlenmiş Çıktı)]
        ]
      ],
    )

    #v(7pt)

    // ALT BANT: TEMEL İLKE AÇIKLAMASI
    #block(
      width: 100%,
      radius: 5pt,
      inset: (x: 10pt, y: 6pt),
      fill: gradient.linear(rgb("#16325c"), rgb("#0f766e"), angle: 0deg),
    )[
      #set par(spacing: 0pt)
      #align(center)[
        #text(size: 7.2pt, fill: white)[
          *Temel Çalışma Mantığı:* Giriş birimlerinden gelen veriler doğrudan işlemciye gitmez; önce *belleğe (RAM)* aktarılır. *İşlemci (CPU)* komut ve verileri bellekten okur, işler ve sonuçları tekrar belleğe yazar. Bellekteki işlenmiş sonuçlar *çıkış birimlerine* gönderilerek kullanıcıya sunulur.
        ]
      ]
    ]
  ]

#v(0.5em)

=== Giriş Birimi
Veri ve komutların bilgisayara aktarılmasını sağlayan klavye, fare, mikrofon ve kamera gibi cihazlardır. Bilgisayarın dış dünyadan veri ve talimat almasını sağlar.

=== Bellek Birimi
Veri, komut ve programların saklandığı donanımları temsil eder. Ana bellek çoğunlukla *RAM* olarak anılır. Sabit disk ise yardımcı bellek olarak kullanılır ve bilgilerin kalıcı olarak saklanmasını sağlar.

*RAM (Random Access Memory - Rastgele Erişimli Bellek)*, çalışan uygulamaların içerisindeki anlık bilgileri tutan temel bir donanım parçasıdır. RAM'in hafıza kapasitesinin büyüklüğü, aynı anda sorunsuz çalışabilecek program sayısını artırır.

#not_block(title: "Bellek Türleri Arasındaki Temel Fark:")[
  - *Ana Bellek (RAM):* Geçici bellektir. Bilgisayar çalıştığı sürece verileri tutar; bilgisayar kapandığında veya program sonlandırıldığında içindeki veriler silinir.
  - *Yardımcı Bellek (Sabit Disk / SSD):* Kalıcı depolama birimidir. Verilerin daha sonra tekrar kullanılabilmesi amacıyla dosya biçiminde kaydedilmesini sağlar.
]

=== İşlemci (CPU) Birimi
Bilgisayardaki tüm aritmetiksel ve mantıksal işlemlerin yapıldığı ana birimdir. Bilgisayar programlarının çalışmasını denetler, programda yapılan hesaplamalara göre hangi işlerin yapılacağına karar verir. Makine diline çevrilmiş bir programdaki komutları teker teker ve sırayla yorumlayıp çalıştırır.

=== Çıkış Birimi
Bilgisayarda işlenen verilerin dış ortama aktarılmasını sağlayan ekran, yazıcı ve hoparlör gibi birimlerdir. İşlemci tarafından işlenen sonuçları insanların algılayabileceği (görsel, işitsel veya basılı) biçime dönüştürür.

=== Bilgisayar Veriyi Nasıl Saklar?
Bilgisayar verileri bellekte saklar. Her bir veri için bellekte belirli bir alan ayrılır ve bu alan her seferinde tek bir değer saklayabilir. Kullanıcı var olan değer yerine yeni bir değer atadığında eski değer silinir. Programın çalışması bittiğinde ya da bilgisayar kapatıldığında bu geçici veriler silinir.

Verilerin daha sonra tekrar kullanılabilmesi gerekiyorsa sabit diske kaydedilmesi gerekir. Bu şekilde kalıcı olarak kaydedilen verilere *"dosya"* adı verilir. Temel anlamda program dosyaları ve veri dosyaları olmak üzere iki dosya türü vardır:
- *Program Dosyaları:* Bilgisayarın yapması istenen komutları ve işlem adımlarını içerir.
- *Veri Dosyaları:* Programlar çalışırken kullanılan ve işlenen verileri kapsar.

=== Program Nedir?
*Program*, bilgisayara yapması gereken işlemleri adım adım bildiren, kullanıcıların ihtiyaçlarına cevap veren ve sabit diskte depolanıp bellekte çalıştırılan komutlar bütünüdür. İnternette gezinme, oyun oynama ve mesajlaşma gibi tüm işlemler programlar aracılığıyla gerçekleştirilir.
