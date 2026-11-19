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

=== Bilgisayarın Temel Çalışma Mimarisi

Yukarıdaki şema, günümüz bilgisayarlarının büyük çoğunluğunda kullanılan *von Neumann mimarisini* özetler. Bu mimarinin en ayırt edici özelliği, *komutların da verilerin de aynı bellekte* saklanmasıdır. İşlemci, çalıştıracağı komutu da işleyeceği veriyi de bellekten okur. Bu nedenle giriş biriminden gelen bir veri, işlemciye ulaşmadan önce mutlaka *bellekte (RAM)* bir alana yazılır.

Dört temel birim arasındaki görev paylaşımı şöyledir:

+ *Giriş Birimi:* Dış dünyadan gelen verileri ve kullanıcı komutlarını, bilgisayarın anlayacağı elektrik sinyallerine dönüştürür.
+ *Bellek Birimi:* Gelen verileri, çalıştırılacak programın komutlarını ve ara sonuçları geçici olarak saklar.
+ *İşlemci (CPU):* Bellekten okuduğu komutları yorumlar; aritmetiksel ve mantıksal işlemleri yaparak yeni sonuçlar üretir.
+ *Çıkış Birimi:* İşlenmiş sonuçları ekran, yazıcı veya hoparlör gibi araçlarla insanın algılayabileceği biçime çevirir.

Birimler arasındaki bu alışveriş, şemadaki *VERİ YOLU (BUS)* üzerinden gerçekleşir. Veri yolu, birimler arasında veri ve komut taşıyan ortak bir otoyol gibidir. Aynı anda yalnızca sınırlı miktarda veri taşıyabildiği için bilgisayarın hızını belirleyen önemli etkenlerden biridir.

==== Adım Adım Veri Akışı: "5 + 3" İşlemi

Bir bilgisayarda `5 + 3` gibi basit görünen bir toplama işleminin arka planda nasıl gerçekleştiğini izleyelim. Aşağıdaki tablo, şemadaki okları adım adım takip eder:

#icerik-tablo(
  tablo_baslik: "Bir Toplama İşleminin Bilgisayardaki Yolculuğu",
  sutunlar: (auto, auto, 1fr, auto),
  sutun_basliklari: ("Adım", "Sorumlu Birim", "Gerçekleşen İşlem", "Örnek"),
  icerik_hizalama: (center + horizon, center + horizon, left + horizon, center + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon, center + horizon),
  boyut: 9pt,
  dikey-bosluk: 6pt,
  [`1`], [Giriş Birimi], [Kullanıcı klavyeden `5` ve `3` tuşlarına basar; klavye bu tuşları elektrik sinyallerine çevirir.], [`5`, `3`],
  [`2`], [Bellek Birimi], [Sinyaller ikilik sisteme dönüştürülerek RAM'de ayrılan hücrelere yazılır.], [`0000 0101` \ `0000 0011`],
  [`3`], [İşlemci (CPU)], [İşlemci, bellekten "topla" komutunu ve toplanacak iki sayıyı okur (getirir).], [`topla`],
  [`4`], [İşlemci (ALU)], [Aritmetik mantık birimi iki sayıyı toplar ve sonucu üretir.], [`5 + 3 = 8`],
  [`5`], [Bellek Birimi], [Elde edilen sonuç, daha sonra kullanılmak üzere tekrar RAM'e yazılır.], [`0000 1000`],
  [`6`], [Çıkış Birimi], [Ekran, RAM'deki sonucu insanın okuyabileceği bir görüntüye dönüştürür.], [`8`],
)

==== Komut Döngüsü: Getir, Çöz, Yürüt, Yaz

İşlemci bir komutu tek hamlede çalıştırmaz. Her komut için aynı dört aşamalı döngüyü tekrarlar. Bu döngü, saniyede milyarlarca kez gerçekleşir:

#let dongu-adimi(no, baslik, aciklama, renk) = block(
  width: 100%,
  fill: renk.lighten(92%),
  stroke: 1pt + renk.lighten(35%),
  radius: 4pt,
  inset: (x: 5pt, y: 6pt),
)[
  #align(center)[
    #text(size: 13pt, weight: "bold", fill: renk)[#no]
    #v(1pt)
    #text(size: 8.3pt, weight: "bold", fill: renk.darken(25%))[#baslik]
  ]
  #v(3pt)
  #text(size: 7.6pt)[#aciklama]
]

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  dongu-adimi("1", "Getir (Fetch)", "İşlemci, sıradaki komutu bellekten okur.", rgb("#1d4ed8")),
  dongu-adimi("2", "Çöz (Decode)", "Okunan ikilik komut çözümlenir; hangi işlemin, hangi verilerle yapılacağı belirlenir.", rgb("#0d9488")),
  dongu-adimi("3", "Yürüt (Execute)", "ALU, komutun gerektirdiği aritmetiksel veya mantıksal işlemi gerçekleştirir.", rgb("#7e22ce")),
  dongu-adimi("4", "Yaz (Write Back)", "Sonuç, belleğe veya işlemcinin içindeki yazmaçlara kaydedilir.", rgb("#b45309")),
)

#not_block(title: "Neden Girdiler Doğrudan İşlemciye Gitmez?")[
  Çünkü işlemci, yalnızca bellekten okuma ve belleğe yazma yapabilecek şekilde tasarlanmıştır. Ayrıca klavye, fare ve mikrofon gibi giriş birimleri işlemciden çok daha yavaş çalışır. Veriler önce RAM'de toplanır; işlemci hazır olduğunda onları hızla alır. Böylece yavaş cihazlar, hızlı işlemciyi uzun süre bekletmek zorunda kalmaz.
]

==== Von Neumann Şişe Boynu

Komutlar ve veriler aynı bellekte tutulduğu ve tek bir veri yolu üzerinden taşındığı için işlemci, bir komutu çalıştırırken aynı anda yeni bir komut getiremez. Bu bekleme durumuna *von Neumann şişe boynu* denir. Günümüz işlemcileri, komut ve veriler için ayrı önbellekler kullanarak bu darboğazı büyük ölçüde azaltır.

#not_block(title: "Özetle:")[
  Bilgisayarda bir işlem gerçekleşirken veri akışı şu sırayı izler: *Giriş Birimi → Bellek (RAM) → İşlemci (CPU) → Bellek (RAM) → Çıkış Birimi*. Ekranda gördüğümüz `8` sonucu, aslında ikilik sistemdeki elektrik sinyallerinin bu yol üzerinde izlediği uzun yolculuğun son hâlidir.
]

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
