// Infografik: Bölüm Kapak ve Rehber Sayfası (tek sayfa)
// Kullanım: ana belgede  #include "02_Files/infographic/infografikler.typ"
#import "/pageGeneralConfig.typ": *
#import "infografik_ortak.typ": *

== İnfografikler

#v(2pt)

// ---------- BAŞLIK BANDI ----------
#baslik_bandi(
  [Temel Programlama Yapıları — Görsel Kavram Haritaları],
  [Donanım temellerinden Python fonksiyonlarına: Konuların tek sayfalık görsel referans kartları],
  [10 İnfografik · Tam Sayfa Referans],
)

#v(4pt)

// ---------- GİRİŞ VE KAPSAM KUTUSU ----------
#block(
  width: 100%, fill: c_mavi.light, stroke: (left: 3.5pt + c_mavi.main), radius: (right: 5pt),
  inset: (x: 9pt, y: 5.5pt),
)[
  #text(size: 8.6pt)[
    *Bölümün Amacı ve Kapsamı:* Bu bölümde yer alan infografikler; donanım mimarisinden yazılımın mantıksal katmanlarına uzanan temel programlama kavramlarını zihinde somutlaştırmak, kavram yanılgılarını önlemek ve sınav/uygulama öncesinde hızlı tekrar sağlamak amacıyla hazırlanmıştır. Her infografik, karmaşık bir konuyu tek bir sayfada anlaşılır kılmak üzere tasarlanmış bağımsız bir görsel rehberdir.
  ]
]

#v(4pt)

// ---------- KART YARDIMCISI ----------
#let kart_ozet(no, baslik, dosya, aciklama, c) = block(
  width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 5pt,
  inset: (x: 7pt, y: 5pt), breakable: false,
)[
  #grid(
    columns: (auto, 1fr, auto), column-gutter: 5pt, align: horizon,
    daire(no, c.main),
    text(weight: "bold", size: 8.8pt, fill: c.dark, baslik),
    box(
      fill: white, stroke: 0.5pt + c.border, radius: 3pt, inset: (x: 4pt, y: 1.5pt),
      text(font: mono, size: 6.5pt, fill: c.dark, dosya),
    ),
  )
  #v(2.5pt)
  #set text(size: 7.8pt, fill: rgb("#334155"))
  #set par(justify: false, leading: 0.4em)
  #aciklama
]

// ---------- İNFOGRAFİK REHBERİ (2 SÜTUN HALİNDE 10 KART) ----------
#grid(
  columns: (1fr, 1fr),
  column-gutter: 8pt,
  row-gutter: 5pt,

  // SÜTUN BAŞLIKLARI
  text(weight: "bold", size: 9pt, fill: navy, [Donanım, Sistem ve Bellek Mimarisi (1 – 5)]),
  text(weight: "bold", size: 9pt, fill: navy, [Bellek Yönetimi ve Python Dili (6 – 10)]),

  // 1 & 6
  kart_ozet(
    1, [Bilgisayarın Dili (Donanım)], "bilgisayarin_dili.typ",
    [Transistörlerin elektrik akımını geçirme/kesme (1/0) mantığı, switch ve LED benzetimi, ikili sistem (binary), bit ve bayt temelleri.],
    c_turuncu,
  ),
  kart_ozet(
    6, [Bellek Yönetimi ve Nesne Yaşamı], "bellek_yonetimi.typ",
    [Python'da dinamik bellek, nesne kimliği (#kod("id()", c: c_kirmizi)), referans sayımı ve kullanılmayan nesnelerin temizlenmesi (Garbage Collector).],
    c_kirmizi,
  ),

  // 2 & 7
  kart_ozet(
    2, [Bilgisayarın Dili (Dillerin Evrimi)], "bilgisayarin_dili_2.typ",
    [Programlamanın tarihsel yolculuğu: Makine dili (0-1) → 16'lık (Hexadecimal) → Assembly (#kod("MOV"), #kod("ADD")) → Yüksek seviyeli diller (Python).],
    c_mor,
  ),
  kart_ozet(
    7, [Tür Dönüşümü (Type Casting)], "tur_donusumu.typ",
    [Açık ve örtük tür dönüşümü, #kod("int()"), #kod("float()"), #kod("str()") fonksiyonları ve klavye girdisindeki (#kod("input()")) metin tuzağı.],
    c_mavi,
  ),

  // 3 & 8
  kart_ozet(
    3, [Değişkenler ve Bellek (RAM)], "degisken_ve_bellek.typ",
    [Değişken tanımlama, atama operatörü (=), RAM bellek hücreleri, onaltılık adresler ve bellekteki değerin güncellenme adımları.],
    c_mavi,
  ),
  kart_ozet(
    8, [Operatörler ve İşlem Önceliği], "operatorler.typ",
    [Aritmetik, ilişkisel ve mantıksal (#kod("and"), #kod("or"), #kod("not")) operatörler; PEMDAS kuralına göre işlem öncelik hiyerarşisi.],
    c_mor,
  ),

  // 4 & 9
  kart_ozet(
    4, [Veri Türleri ve RAM Kullanımı], "veri_turleri.typ",
    [Temel türler (#kod("bool", c: c_yesil), #kod("int", c: c_mavi), #kod("float", c: c_turuncu), #kod("str", c: c_mor)), RAM'de kapladıkları bayt boyutları ve hafıza yerleşimleri.],
    c_yesil,
  ),
  kart_ozet(
    9, [Fonksiyonların Kullanımı], "fonksiyon_kullanimi.typ",
    [Kod tekrarını önleme (DRY ilkesi), fonksiyon çağırma anatomisi, parametre/argüman ayrımı, #kod("return") değeri ve yerleşik araçlar.],
    c_yesil,
  ),

  // 5 & 10
  kart_ozet(
    5, [RAM ve İşlemci İlişkisi], "ram_islemci_iliskisi.typ",
    [İşlemci mimarisi (ALU, Kontrol Birimi, Yazmaçlar), CPU-RAM veri yolu (Bus), önbellek (Cache) seviyeleri ve veri getirme döngüsü.],
    c_turuncu,
  ),
  kart_ozet(
    10, [input() ve print() Fonksiyonları], "input_print.typ",
    [Girdi-İşlem-Çıktı (IPO) yaşam döngüsü, program akışının durması, f-string biçimlendirme ve #kod("sep") / #kod("end") parametreleri.],
    c_mavi,
  ),
)

#v(5pt)

// ---------- ÇALIŞMA REHBERİ (3 SÜTUN) ----------
#block(
  width: 100%, fill: white, stroke: 1pt + c_gri.border, radius: 6pt, inset: (x: 9pt, y: 6pt),
)[
  #text(weight: "bold", size: 9pt, fill: navy)[İnfografiklerle Nasıl Çalışmalısınız? (Öğrenci Kılavuzu)]
  #v(3pt)
  #grid(
    columns: (1fr, 1fr, 1fr), column-gutter: 8pt,
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("1", c_mavi.main, r: 6pt),
        text(weight: "bold", size: 8.2pt, fill: c_mavi.dark, [Görsel Bağlantı Kurun]),
      )
      #v(2pt)
      #text(size: 7.6pt)[
        Yazdığınız Python kodunun donanımı (transistör, CPU, RAM) nasıl etkilediğini şemalar üzerinden zihninizde canlandırın.
      ]
    ],
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("2", c_yesil.main, r: 6pt),
        text(weight: "bold", size: 8.2pt, fill: c_yesil.dark, [Kodla Birlikte Deneyin]),
      )
      #v(2pt)
      #text(size: 7.6pt)[
        İnfografiklerdeki kısa kodları Python kabuğunda (`IDLE`) yazarak `type()`, `id()` ve operatör çıktılarını bizzat gözlemleyin.
      ]
    ],
    [
      #grid(columns: (auto, 1fr), column-gutter: 4pt, align: horizon,
        ikon("3", c_turuncu.main, r: 6pt),
        text(weight: "bold", size: 8.2pt, fill: c_turuncu.dark, [Hızlı Referans Kartı]),
      )
      #v(2pt)
      #text(size: 7.6pt)[
        Uygulama çözerken takıldığınızda (işlem sırası, kaçış dizileri, tür dönüşümü vb.) doğrudan ilgili infografiği açıp başvurun.
      ]
    ],
  )
]

#v(3pt)

// ---------- ALT İPUCU BANDI ----------
#align(center)[
  #block(
    fill: c_gri.light, stroke: 0.6pt + c_gri.border, radius: 4pt, inset: (x: 10pt, y: 3pt),
  )[
    #text(size: 7.5pt, fill: c_gri.dark)[
      *İpucu:* Her infografik tek bir sayfaya sığacak şekilde tasarlanmıştır. Konuları sırayla inceleyebilir veya doğrudan ihtiyacınız olan infografiğe geçebilirsiniz.
    ]
  ]
]
