// Infografik: Fonksiyonların Kullanımı  (tek sayfa)
// Kullanım: ana belgede  #include "fonksiyon_kullanimi.typ"
// Sayfa ayarı yapmaz; pageGeneralConfig.typ (conf) ile uyumludur.
#import "infografik_ortak.typ": *

#let belirt(c, metin, govde) = block(
  width: 100%, stroke: (top: 2.2pt + c.main), fill: c.light, radius: (bottom: 3pt), inset: (x: 5pt, y: 4pt),
  align(center)[
    #text(size: 8.4pt, weight: "bold", fill: c.dark, metin) \
    #text(size: 8pt, govde)
  ]
)

#sayfa(
  (auto, 0.85fr, 1.5fr, 0.95fr, 0.85fr, auto),

  // ---------- 1. BAŞLIK ----------
  baslik_bandi(
    [Fonksiyonların Kullanımı],
    [DRY ilkesi, fonksiyon çağırma mekanizması, argümanlar, dönüş değeri ve yerleşik araçlar],
    [Argüman #h(3pt) → #h(3pt) Fonksiyon Gövdesi #h(3pt) → #h(3pt) Dönüş Değeri],
  ),

  // ---------- 2. DRY ----------
  bolum(1, [Kod Tekrarını Önleme: DRY İlkesi], ipucu: [Don't Repeat Yourself], grid(
    columns: (1fr, 1.4fr), column-gutter: 8pt,
    kart(c_turuncu, [DRY İlkesi Nedir?], [
      Aynı görevi yapan kodun projede tekrar tekrar yazılması *hata riskini artırır* ve bakımı zorlaştırır.

      *Çözüm:* İşi bir kez tanımlayıp fonksiyon yapmak ve ihtiyaç oldukça yalnızca *adıyla çağırmaktır*.
    ], ikon_: ikon("D", c_turuncu.main)),
    block(
      width: 100%, height: 100%, fill: c_gri.light, stroke: 1pt + c_gri.border, radius: 5pt, inset: 7pt,
      grid(
        columns: (1fr, 20pt, 1fr), align: horizon,
        [
          #text(size: 8.6pt, weight: "bold", fill: c_kirmizi.dark)[✗ Manuel (5 satır)]
          #v(3pt)
          #kodblok(
            c: c_kirmizi, boy: 8.4pt,
            "s = 3.14159", "s2 = s * 100", "s3 = s2 // 1", "s4 = s3 / 100", "print(s4)",
          )
        ],
        ok,
        [
          #text(size: 8.6pt, weight: "bold", fill: c_yesil.dark)[✓ Fonksiyon (1 satır)]
          #v(3pt)
          #block(
            width: 100%, fill: c_yesil.light, stroke: 1pt + c_yesil.border, radius: 4pt, inset: 7pt,
            align(center)[
              #text(font: mono, size: 9pt, weight: "bold", fill: c_yesil.dark)[round(3.14159, 2)] \
              #v(3pt)
              #text(size: 8.6pt, fill: c_yesil.dark)[Sonuç: #kod("3.14", c: c_yesil)]
            ],
          )
        ],
      ),
    ),
  )),

  // ---------- 3. ANATOMİ ----------
  bolum(2, [Fonksiyonun Anatomisi ve Bileşenleri], grid(
    rows: (auto, 1fr), row-gutter: 7pt,
    // Etiketli formül
    block(
      width: 100%, fill: c_gri.light, stroke: 0.8pt + c_gri.border, radius: 4pt, inset: (x: 10pt, y: 6pt),
      grid(
        columns: (1fr, 18pt, 1fr, 1fr), column-gutter: 8pt, row-gutter: 4pt, align: center + horizon,
        rozet("sonuc", c_gri, boy: 13pt),
        text(font: mono, size: 13pt, weight: "bold", fill: navy)[=],
        rozet("round", c_mor, boy: 13pt),
        rozet("( 3.14159, 2 )", c_mavi, boy: 13pt),
        belirt(c_gri, [Değişken], [sonuç burada saklanır]),
        [],
        belirt(c_mor, [Fonksiyon adı], [çağrılacak araç]),
        belirt(c_mavi, [Argümanlar], [girdi değerleri]),
      ),
    ),
    grid(
      columns: (1fr,) * 4, column-gutter: 6pt,
      kart(c_mor, [Çağırma ()], [
        Fonksiyon adından sonra parantez açılıp kapatılır. Parantezsiz yazılan #kod("print", c: c_mor) çalışmaz; yalnızca fonksiyonun kendisini temsil eder.
      ], ikon_: daire(1, c_mor.main)),
      kart(c_mavi, [Argüman (Girdi)], [
        Parantez içine verilen girdi değerleridir. Birden fazlaysa virgülle ayrılır: #kod("3.14159", c: c_mavi) sayısı ve #kod("2", c: c_mavi) basamak sayısı.
      ], ikon_: daire(2, c_mavi.main)),
      kart(c_turuncu, [İşlem (Gövde)], [
        Fonksiyonun kapalı kapılar ardında çalıştırdığı algoritmadır. Geliştirici iç ayrıntıyı bilmeden hazır mekanizmayı kullanır.
      ], ikon_: daire(3, c_turuncu.main)),
      kart(c_yesil, [Dönüş Değeri], [
        İşlem bitince geri verilen sonuçtur (#kod("3.14", c: c_yesil)). Atama işleci #kod("=", c: c_yesil) ile #kod("sonuc", c: c_yesil) değişkenine kaydedilir.
      ], ikon_: daire(4, c_yesil.main)),
    ),
  )),

  // ---------- 4. YERLEŞİK FONKSİYONLAR ----------
  bolum(3, [Sık Kullanılan Yerleşik (Built-in) Fonksiyonlar], grid(
    columns: (1fr, 1fr), column-gutter: 8pt,
    ..for (c, satirlar) in (
      (c_mavi, (
        ("len(s)", "Karakter sayısını verir", "len(\"Py\") → 2"),
        ("round(x, n)", "n basamağa yuvarlar", "round(2.68, 1) → 2.7"),
        ("abs(x)", "Mutlak değer", "abs(-7) → 7"),
        ("max() / min()", "En büyük / en küçük", "max(3, 9) → 9"),
      )),
      (c_mor, (
        ("type(x)", "Veri türünü bildirir", "type(5) → int"),
        ("int() / float()", "Sayıya çevirir", "int(\"25\") → 25"),
        ("str(x)", "Metne çevirir", "str(15) → \"15\""),
        ("print() / input()", "Yazdırır / okur", "Çıktı / Girdi"),
      )),
    ) {
      (block(
        width: 100%, height: 100%, fill: c.light, stroke: 0.8pt + c.border, radius: 4pt, inset: 6pt,
        grid(
          columns: (auto, 1fr), column-gutter: 7pt, rows: (1fr,) * 4, align: horizon,
          ..for (r, a, o) in satirlar {
            (
              align(left, rozet(r, c, boy: 8.6pt)),
              [
                #text(size: 8.4pt, a) \
                #text(font: mono, size: 8pt, weight: "bold", fill: c.dark, o)
              ],
            )
          },
        ),
      ),)
    },
  )),

  // ---------- 5. DÖNÜŞ TÜRLERİ ----------
  bolum(4, [Fonksiyon Türleri: Değer Döndürenler ve Görev Yapanlar], grid(
    columns: (1fr, 1fr), column-gutter: 8pt,
    kart(c_yesil, [Değer Döndürenler (return)], [
      İşlem sonucunda somut bir veri üretirler. Sonuç doğrudan bir değişkene atanabilir:
      #v(2pt)
      #kod("sonuc = round(2.678, 1)", c: c_yesil) #text(size: 8.4pt, fill: c_yesil.dark)[→ 2.7 üretir]
      #v(3pt)
      #kod("len()", c: c_yesil), #kod("abs()", c: c_yesil), #kod("max()", c: c_yesil), #kod("int()", c: c_yesil), #kod("round()", c: c_yesil) bu sınıftadır.
    ], ikon_: ikon("↓", c_yesil.main)),
    kart(c_turuncu, [Görev Yapanlar (değer yok)], [
      Amacı ekrana yazmak veya kaydetmektir; geriye işlenebilir değer vermez:
      #v(2pt)
      #kod("b = print(\"Merhaba\")", c: c_turuncu) #text(size: 8.4pt, fill: c_turuncu.dark)[→ ekrana yazar, #kod("b", c: c_turuncu) = #kod("None", c: c_turuncu)]
      #v(3pt)
      #kod("print()", c: c_turuncu) değer döndürmez.
    ], ikon_: ikon("↑", c_turuncu.main)),
  )),

  // ---------- 6. ÖZET ----------
  ozet([Özet İlke], [
    Fonksiyonlar belirli bir işi paketleyip kod tekrarını (DRY) önleyen yapı taşlarıdır. Çalışması için parantezle #kod("()", boy: 8.4pt) çağrılması şarttır. Argümanlar parantez içine verilir; hesaplanan sonuç #kod("return", boy: 8.4pt) mekanizmasıyla çağrıldığı yere aktarılır.
  ]),
)
