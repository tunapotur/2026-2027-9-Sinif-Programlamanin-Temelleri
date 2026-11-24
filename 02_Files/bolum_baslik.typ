#import "infografik_ortak.typ":*

= Temel Programlama Yapıları

#v(4pt)

// ---------- BAŞLIK BANDI ----------
#baslik_bandi(
  [Temel Programlama Yapıları — Görsel Kavram Haritaları],
  [Donanım temellerinden Python fonksiyonlarına: 9 konunun tek sayfalık görsel referans kartları],
  [9 İnfografik · Tam Sayfa Referans],
)

#v(6pt)

// ---------- GİRİŞ VE KAPSAM KUTUSU ----------
#block(
  width: 100%, fill: c_mavi.light, stroke: (left: 3.5pt + c_mavi.main), radius: (right: 5pt),
  inset: (x: 10pt, y: 7.5pt),
)[
  #text(size: 8.8pt, fill: rgb("#0f172a"))[
    *Bölümün Amacı ve Kapsamı:* Bu bölümde yer alan 9 infografik; donanım mimarisinden (transistör ve ikili sistem) başlayarak Python programlamanın temel yapı taşlarına (değişkenler, bellek modelleri, operatörler, fonksiyonlar ve Girdi/Çıktı döngüsü) uzanan soyut kavramları zihinde somutlaştırmak amacıyla hazırlanmıştır. Her sayfa, karmaşık bir konuyu tek başına ele alan bağımsız bir *görsel referans kartı (Cheat Sheet)* niteliğindedir.
  ]
]

#v(7pt)

// ---------- SÜTUN BAŞLIĞI YARDIMCISI ----------
#let sutun_baslik(baslik, c) = block(
  width: 100%,
  fill: c.light,
  stroke: 1pt + c.border,
  radius: 4pt,
  inset: (x: 6pt, y: 4.5pt),
  align(center, text(weight: "bold", size: 8.5pt, fill: c.dark, baslik)),
)

// ---------- KART YARDIMCISI (EŞİT SABİT BOYUTLU) ----------
#let kart_ozet(no, baslik, aciklama, c, yukseklik: 96pt) = block(
  width: 100%,
  height: yukseklik,
  fill: c.light,
  stroke: 1pt + c.border,
  radius: 6pt,
  inset: (x: 8pt, y: 7.5pt),
  breakable: false,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 6pt,
    align: horizon,
    daire(no, c.main),
    text(weight: "bold", size: 9pt, fill: c.dark, baslik),
  )
  #v(4.5pt)
  #set text(size: 7.8pt, fill: rgb("#1e293b"))
  #set par(justify: false, leading: 0.44em)
  #aciklama
]

// ---------- 3x3 MATRİS (9 EŞİT KART) ----------
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 8pt,
  row-gutter: 7pt,

  // Sütun Başlıkları
  sutun_baslik([1. Donanım & Dillerin Evrimi], c_turuncu),
  sutun_baslik([2. Sistem & Bellek Yönetimi], c_kirmizi),
  sutun_baslik([3. Python Programlama Yapıları], c_mor),

  // 1. Satır: Kart 1, Kart 4, Kart 7
  kart_ozet(
    1, [Bilgisayarın Dili],
    [Transistörden Python'a 1 ve 0'ın yolculuğu: Makine dili (0-1) → Hexadecimal → Assembly → Yüksek seviyeli diller. Bit/bayt mantığı, Altair komut girişi ve ASCII metin temsili.],
    c_turuncu,
  ),
  kart_ozet(
    4, [RAM ve İşlemci],
    [İşlemci birimleri (ALU, Kontrol, Yazmaçlar), CPU ile RAM arasındaki veri yolu (Bus), önbellek (Cache) seviyeleri ve veri getirme döngüsü.],
    c_turuncu,
  ),
  kart_ozet(
    7, [Operatörler & Öncelik],
    [Aritmetik, ilişkisel ve mantıksal (#kod("and"), #kod("or"), #kod("not")) operatörler; PEMDAS kuralına göre işlem öncelik hiyerarşisi.],
    c_mor,
  ),

  // 2. Satır: Kart 2, Kart 5, Kart 8
  kart_ozet(
    2, [Değişkenler ve Bellek],
    [Değişken tanımlama mantığı, atama operatörü (#kod("=")), RAM adresleme mimarisi, bellek hücreleri ve bellekteki değerin güncellenme adımları.],
    c_mavi,
  ),
  kart_ozet(
    5, [Bellek Yönetimi],
    [Python'da dinamik bellek tahsisi, nesne kimliği (#kod("id()")), referans sayımı, nesne yaşam döngüsü ve Çöp Toplayıcı (Garbage Collector).],
    c_kirmizi,
  ),
  kart_ozet(
    8, [Fonksiyon Kullanımı],
    [Kod tekrarını önleme (DRY ilkesi), fonksiyon çağırma anatomisi, parametre ve argüman ayrımı, #kod("return") mekanizması ve yerleşik araçlar.],
    c_yesil,
  ),

  // 3. Satır: Kart 3, Kart 6, Kart 9
  kart_ozet(
    3, [Veri Türleri ve RAM],
    [Temel türler (#kod("bool"), #kod("int"), #kod("float"), #kod("str")), kapladıkları bayt boyutları ve verilerin RAM'deki fiziksel kutu dizilimi.],
    c_yesil,
  ),
  kart_ozet(
    6, [Tür Dönüşümü],
    [Açık ve örtük tür dönüşümü, #kod("int()"), #kod("float()"), #kod("str()") işlevleri ve klavye girdisindeki (#kod("input()")) metin tuzağını aşma.],
    c_mavi,
  ),
  kart_ozet(
    9, [input() ve print()],
    [Girdi-İşlem-Çıktı (IPO) yaşam döngüsü, program akışını dondurma, f-string biçimlendirme ve #kod("sep") / #kod("end") parametreleri.],
    c_mavi,
  ),
)

#v(8pt)

// ---------- ÇALIŞMA REHBERİ (3 SÜTUN) ----------
#block(
  width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: (x: 10pt, y: 8pt),
)[
  #text(weight: "bold", size: 9.2pt, fill: navy)[İnfografiklerle Nasıl Çalışmalısınız? (Öğrenci Kılavuzu)]
  #v(4pt)
  #grid(
    columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("1", c_mavi.main, r: 6.5pt),
        text(weight: "bold", size: 8.4pt, fill: c_mavi.dark, [Görsel Bağlantı Kurun]),
      )
      #v(2.5pt)
      #text(size: 7.7pt, fill: rgb("#334155"))[
        Yazdığınız Python kodunun arka planda donanımı (transistör, CPU, RAM) nasıl etkilediğini şemalar üzerinden zihninizde canlandırın.
      ]
    ],
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("2", c_yesil.main, r: 6.5pt),
        text(weight: "bold", size: 8.4pt, fill: c_yesil.dark, [Kodla Birlikte Deneyin]),
      )
      #v(2.5pt)
      #text(size: 7.7pt, fill: rgb("#334155"))[
        İnfografiklerdeki kısa kodları Python kabuğunda (`IDLE`) yazarak `type()`, `id()` ve operatör çıktılarını bizzat gözlemleyin.
      ]
    ],
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("3", c_turuncu.main, r: 6.5pt),
        text(weight: "bold", size: 8.4pt, fill: c_turuncu.dark, [Hızlı Referans Kartı]),
      )
      #v(2.5pt)
      #text(size: 7.7pt, fill: rgb("#334155"))[
        Uygulama çözerken takıldığınızda (işlem sırası, kaçış dizileri, tür dönüşümü vb.) doğrudan ilgili infografiği açıp başvurun.
      ]
    ],
  )
]

#v(6pt)

// ---------- RENK REHBERİ ----------
#block(
  width: 100%, fill: rgb("#f8fafc"), stroke: 0.8pt + c_gri.border, radius: 5pt, inset: (x: 10pt, y: 5.5pt),
)[
  #grid(
    columns: (auto, 1fr), column-gutter: 8pt, align: horizon,
    text(weight: "bold", size: 8pt, fill: navy)[İnfografik Renk Dili:],
    grid(
      columns: (auto, auto, auto, auto, auto), column-gutter: 7pt, align: horizon,
      rozet("Turuncu: Donanım & CPU", c_turuncu, boy: 7.2pt),
      rozet("Mavi: Mantık & Değişken", c_mavi, boy: 7.2pt),
      rozet("Yeşil: Bellek & Fonksiyon", c_yesil, boy: 7.2pt),
      rozet("Kırmızı: GC & Dikkat", c_kirmizi, boy: 7.2pt),
      rozet("Mor: Operatör & Sözdizimi", c_mor, boy: 7.2pt),
    ),
  )
]

#v(5pt)

// ---------- ALT İPUCU BANDI ----------
#align(center)[
  #block(
    fill: c_gri.light, stroke: 0.6pt + c_gri.border, radius: 4pt, inset: (x: 14pt, y: 3.5pt),
  )[
    #text(size: 7.7pt, fill: c_gri.dark)[
      *İpucu:* Her infografik sonraki sayfalarda tek bir sayfayı tam dolduracak şekilde yer almaktadır. İhtiyacınıza göre doğrudan ilgili sayfaya geçebilirsiniz.
    ]
  ]
]
