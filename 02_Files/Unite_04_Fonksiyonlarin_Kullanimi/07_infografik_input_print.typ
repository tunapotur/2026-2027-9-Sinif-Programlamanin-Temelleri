// Infografik: input() ve print() Fonksiyonları  (tek sayfa)
// Kullanım: ana belgede  #include "input_print.typ"
#import "/02_Files/infografik_ortak.typ":*

// Girdi → İşlem → Çıktı adım kartı
#let adim(n, c, baslik, govde) = kart(c, baslik, govde, ikon_: daire(n, c.main))

#sayfa(
  (auto, 0.85fr, 0.95fr, 1.5fr, 1.5fr, auto),

  // ---------- BAŞLIK ----------
  baslik_bandi(
    [=== input() ve print() Fonksiyonları İnfografik],
    [Girdi-İşlem-Çıktı modeli, f-string biçimlendirme, sep / end ve kaçış dizileri],
    [Girdi (input) #h(3pt) → #h(3pt) İşlem (CPU / RAM) #h(3pt) → #h(3pt) Çıktı (print)],
  ),

  // ---------- 1. IPO ----------
  bolum(1, [Programın Temel Yaşam Döngüsü: Girdi → İşlem → Çıktı], grid(
    columns: (1fr, 14pt, 1fr, 14pt, 1fr), align: horizon,
    adim(1, c_mavi, [Girdi (input)], [
      Program klavyeden veri bekler. Kullanıcı yazıp Enter'a basınca veri *metin (#kod("str", c: c_mavi, boy: 8pt))* olarak teslim alınır.
    ]),
    ok,
    adim(2, c_mor, [İşlem (CPU / RAM)], [
      Gerekirse #kod("int()", c: c_mor, boy: 8pt) / #kod("float()", c: c_mor, boy: 8pt) ile sayıya çevrilir; matematiksel veya mantıksal hesaplama tamamlanır.
    ]),
    ok,
    adim(3, c_yesil, [Çıktı (print)], [
      Hesaplanan sonuçlar biçimlendirilerek ekrana yazdırılır ve kullanıcıya geri yansıtılır.
    ]),
  )),

  // ---------- 2. INPUT KURALLARI ----------
  bolum(2, [input() Fonksiyonunun 3 Kritik Kuralı], grid(
    columns: (1fr,) * 3, column-gutter: 6pt,
    kart(c_turuncu, [Program Akışı Durur], [
      #kod("input()", c: c_turuncu, boy: 8pt) satırına gelince Python çalışmayı dondurur. Kullanıcı bir metin yazıp *Enter*'a basana kadar program bekler.
    ], ikon_: ikon("II", c_turuncu.main)),
    kart(c_kirmizi, [Daima Metin (str) Döndürür], [
      Klavyeden #kod("15", c: c_kirmizi, boy: 8pt) yazılsa bile gelen veri #kod("\"15\"", c: c_kirmizi, boy: 8pt) metnidir. Hesap için #kod("int(input())", c: c_kirmizi, boy: 8pt) ya da #kod("float(input())", c: c_kirmizi, boy: 8pt) kullanılır.
    ], ikon_: ikon("!", c_kirmizi.main)),
    kart(c_mavi, [Yönlendirme İletisi], [
      #kod("input(\"Adınız: \")" , c: c_mavi, boy: 8pt) içindeki metin ekranda görünür. Sonuna bir boşluk bırakmak, cevabın soruya yapışmasını önler.
    ], ikon_: ikon("?", c_mavi.main)),
  )),

  // ---------- 3. PRINT + F-STRING ----------
  bolum(3, [print() ve f-string Biçimlendirme], ipucu: [Virgülle yazdırma ve f-string {değişken}], grid(
    columns: (1fr, 1.35fr), column-gutter: 7pt,
    block(
      width: 100%, height: 100%, fill: c_gri.light, stroke: 1pt + c_gri.border, radius: 5pt, inset: 7pt,
      {
        set par(justify: false, leading: 0.5em)
        text(weight: "bold", size: 9.6pt, fill: navy)[İki Temel Yazdırma Yolu]
        v(4pt)
        text(size: 8.6pt)[*Virgül (,) ile:*]
        v(1pt)
        kodblok(c: c_gri, boy: 7.8pt, "print(\"Ad:\", ad, \"Yaş:\", yas)")
        v(1pt)
        text(size: 8.4pt)[Değerler arasına *otomatik 1 boşluk* koyar.]
        v(5pt)
        text(size: 8.6pt)[*f-string ile:*]
        v(1pt)
        kodblok(c: c_mor, boy: 7.8pt, "print(f\"Merhaba {ad}, {yas} yaşındasın.\")")
        v(1pt)
        text(size: 8.4pt)[En okunaklı, esnek ve standart yöntemdir.]
      },
    ),
    block(
      width: 100%, height: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 5pt, inset: 7pt,
      {
        text(weight: "bold", size: 9.6pt, fill: c_mor.dark)[f-string'in 4 Süper Yeteneği]
        v(4pt)
        grid(
          columns: (1fr, 1fr), column-gutter: 5pt, row-gutter: 5pt,
          ..for (b, satirlar) in (
            ([1. Sayı biçimi (:)], ("{pi:.2f} → 3.14", "{1234567:,} → 1,234,567", "{0.256:.1%} → 25.6%")),
            ([2. Tablo hizalama], ("{ad:<10}  sola yasla", "{fiyat:>8.2f}  sağa yasla", "{kod:^8}  ortala")),
            ([3. İfade hesaplama], ("f\"{a} + {b} = {a+b}\"", "f\"{ad.upper()}\"", "f\"{len(ad)} harf\"")),
            ([4. Kolay debug (=)], ("print(f\"{puan=}\")", "Çıktı: puan=75", "ad ve değeri birlikte")),
          ) {
            (block(
              width: 100%, fill: white, stroke: 0.6pt + c_mor.border, radius: 3pt, inset: 5pt,
              {
                text(size: 8.4pt, weight: "bold", fill: c_mor.dark, b)
                linebreak()
                text(font: mono, size: 7.2pt, fill: c_gri.dark, satirlar.join(linebreak()))
              },
            ),)
          },
        )
      },
    ),
  )),

  // ---------- 4. sep/end + KAÇIŞ ----------
  bolum(4, [print() Parametreleri (sep, end) ve Kaçış Karakterleri], grid(
    columns: (1.1fr, 1fr), column-gutter: 7pt,
    kart(c_mavi, [sep ve end Parametreleri], [
      *sep (ayırıcı):* Değerlerin arasına ne gelsin? Varsayılan: boşluk #kod("\" \"", c: c_mavi, boy: 7.8pt)
      #v(2pt)
      #kodblok(c: c_mavi, boy: 7.6pt, "print(15, 11, 2026, sep=\"/\")  →  15/11/2026", "print(\"A\", \"B\", \"C\", sep=\"-\")  →  A-B-C")
      #v(4pt)
      *end (bitiş):* Satır nasıl bitsin? Varsayılan: #kod("\"\\n\"", c: c_mavi, boy: 7.8pt) (alt satıra geç)
      #v(2pt)
      #kodblok(c: c_mavi, boy: 7.6pt, "print(\"Yükleniyor\", end=\"...\")", "print(\"Tamam\")  →  Yükleniyor...Tamam")
    ], ikon_: ikon("⚙", c_mavi.main)),
    kart(c_turuncu, [Kaçış Karakterleri (\\)], [
      #grid(
        columns: (auto, 1fr), column-gutter: 6pt, row-gutter: 5pt, align: horizon,
        ..for (r, a, o) in (
          ("\\n", "Yeni satıra geçer (Enter)", "\"A\\nB\"  →  2 satır"),
          ("\\t", "Sekme (Tab) boşluğu bırakır", "\"A\\tB\"  →  A    B"),
          ("\\\"", "Metin içinde çift tırnak yazar", "\"O \\\"evet\\\" dedi\""),
          ("\\\\", "Ters eğik çizginin kendisini yazar", "\"C:\\\\Okul\"  →  C:\\Okul"),
        ) {
          (
            rozet(r, c_turuncu, boy: 9.6pt),
            [
              #text(size: 8.4pt, a) \
              #text(font: mono, size: 7.4pt, weight: "bold", fill: c_turuncu.dark, o)
            ],
          )
        },
      )
    ], ikon_: ikon("\\", c_turuncu.main)),
  )),

  // ---------- ÖZET ----------
  ozet([Özet İlke], [
    #kod("input()", boy: 8.2pt) kullanıcıdan daima #kod("str", boy: 8.2pt) alır; matematik için #kod("int()", boy: 8.2pt) veya #kod("float()", boy: 8.2pt) ile sarılmalıdır. #kod("print()", boy: 8.2pt) ekrana bilgi yansıtır; hizalama, basamak yuvarlama ve değişken gömme için en temiz yöntem #kod("f\"{fiyat:.2f}\"", boy: 8.2pt) biçimindeki f-string'dir.
  ]),
)
