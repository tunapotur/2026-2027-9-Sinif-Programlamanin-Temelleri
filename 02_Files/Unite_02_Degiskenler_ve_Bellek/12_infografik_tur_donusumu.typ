// Infografik: Tür Dönüşümü (Type Conversion / Casting)  (tek sayfa)
// Kullanım: ana belgede  #include "tur_donusumu.typ"
#import "/02_Files/infografik_ortak.typ":*

// Kod satırı + sonuç kutusu (beyaz, renkli çerçeveli)
#let ornek(c, baslik, baslik-c, ..satirlar) = block(
  width: 100%, fill: white, stroke: 0.6pt + c.border, radius: 3pt, inset: (x: 6pt, y: 4pt),
  [#text(weight: "bold", size: 8.6pt, fill: baslik-c, baslik) \ #satirlar.pos().join(linebreak())]
)

#sayfa(
  (auto, 124pt, 140pt, 262pt, 1fr, auto),

  // ---------- BAŞLIK ----------
  baslik_bandi(
    [=== Tür Dönüşümü (Type Conversion / Casting) İnfografik],
    [Metinden sayıya, örtükten açık dönüşüme: verinin tür dönüşüm yolculuğu],
    [#text(font: mono)[str] #h(3pt) ↔ #h(3pt) #text(font: mono)[int] #h(3pt) ↔ #h(3pt) #text(font: mono)[float]],
  ),

  // ---------- 1. NEDEN ----------
  bolum(1, [Neden Tür Dönüşümü? (Metin Tuzağı)], ipucu: [Klavye girişi → karakter dizisi (str)], grid(
    columns: (1fr, 1.1fr, 1.1fr), column-gutter: 6pt,
    kart(c_mavi, [Klavyeden Giriş (input)], [
      #kod("input()") veriyi *daima metin* alır. Kullanıcı #kod("25") yazsa bile bilgisayar bunu sayı değil, #kod("'25'") karakteri olarak görür.
    ], ikon_: ikon("⌨", c_mavi.main)),
    kart(c_kirmizi, [Metin Bitiştirme Faciası], [
      Dönüşüm yoksa #kod("+") toplamaz, *uca ekler*:
      #v(1pt)
      #kod("\"25\" + \"10\" → \"2510\"", c: c_kirmizi) \
      Beklenen 35 yerine yanlış bir metin çıkar!
    ], ikon_: ikon("✗", c_kirmizi.main)),
    kart(c_yesil, [Doğru Çözüm], [
      Hesaplamadan önce metin sayıya çevrilir:
      #v(1pt)
      #kod("int(\"25\") + int(\"10\") → 35", c: c_yesil) \
      #kod("int()") veya #kod("float()") şarttır.
    ], ikon_: ikon("✓", c_yesil.main)),
  )),

  // ---------- 2. INT(INPUT()) ----------
  bolum(2, [int(input()) Nasıl Çalışır? İçten Dışa Prensibi], ipucu: [İç fonksiyon → dış fonksiyon → atama], grid(
    rows: (auto, 1fr), row-gutter: 6pt,
    block(
      width: 100%, fill: c_gri.light, stroke: 0.8pt + c_gri.border, radius: 4pt, inset: (x: 8pt, y: 5pt),
      align(center, {
        text(font: mono, size: 11pt, weight: "bold", fill: navy)[puan = ]
        h(2pt)
        rozet("int(", c_mor, boy: 11pt)
        rozet("input(\"Puan Giriniz: \")", c_mavi, boy: 11pt)
        rozet(")", c_mor, boy: 11pt)
      }),
    ),
    grid(
      columns: (1fr, 14pt, 1fr, 14pt, 1fr), align: horizon,
      kart(c_mavi, [1. Aşama: input()], [
        Kullanıcı #kod("50") yazıp Enter'a basar. #kod("input()") bunu *metin* olarak üretir: #kod("\"50\" (str)", c: c_mavi)
      ], ikon_: daire(1, c_mavi.main)),
      ok,
      kart(c_mor, [2. Aşama: int()], [
        Dıştaki #kod("int()") gelen #kod("\"50\"") metnini tam sayıya çevirir: #kod("50 (int)", c: c_mor)
      ], ikon_: daire(2, c_mor.main)),
      ok,
      kart(c_yesil, [3. Aşama: Atama (=)], [
        Atama işleci #kod("50") değerini #kod("puan") değişkeninin RAM adresine yazar: #kod("puan = 50", c: c_yesil)
      ], ikon_: daire(3, c_yesil.main)),
    ),
  )),

  // ---------- 3. ÖRTÜK / AÇIK ----------
  bolum(3, [Dönüşüm Çeşitleri: Otomatik (Örtük) ve Bilinçli (Açık)], grid(
    columns: (1.1fr, 1fr), column-gutter: 7pt,
    block(width: 100%, height: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 5pt, inset: 7pt, {
      grid(
        columns: (1fr, auto), align: horizon,
        text(weight: "bold", size: 9.8pt, fill: c_mavi.dark)[A. Otomatik (Örtük)],
        box(fill: c_mavi.main, radius: 3pt, inset: (x: 5pt, y: 2pt), text(fill: white, size: 8pt, weight: "bold", "Python")),
      )
      v(4pt)
      set text(size: 8.6pt)
      set par(justify: false, leading: 0.45em)
      [Farklı sayı türleri aynı işleme girince, *veri kaybını önlemek için* #kod("int") otomatik olarak #kod("float")'a yükseltilir:]
      v(5pt)
      align(center, {
        rozet("int", c_mavi, boy: 9pt); h(4pt)
        text(font: mono, weight: "bold", size: 9pt, "+  -  *  /"); h(4pt)
        rozet("float", c_turuncu, boy: 9pt); h(5pt)
        text(weight: "bold")[→]; h(5pt)
        rozet("float", c_turuncu, boy: 9pt)
      })
      v(5pt)
      kodblok(c: c_gri, boy: 8pt,
        "adet = 5                         # 5(int)",
        "birim_fiyat = 2.5                # 2.5(float)",
        "tutar = adet * birim_fiyat       # 12.5(float)",
        "                                 ",
        "# adet → 5.0 olur, tutar = 12.5",
      )
      v(4pt)
      text(size: 8.4pt, fill: c_mavi.dark)[*Kural:* İşlemde tek bir #kod("float") bile varsa sonuç #kod("float") olur!]
    }),
    block(width: 100%, height: 100%, fill: c_turuncu.light, stroke: 1pt + c_turuncu.border, radius: 5pt, inset: 7pt, {
      grid(
        columns: (1fr, auto), align: horizon,
        text(weight: "bold", size: 9.8pt, fill: c_turuncu.dark)[B. Bilinçli (Açık)],
        box(fill: c_turuncu.main, radius: 3pt, inset: (x: 5pt, y: 2pt), text(fill: white, size: 8pt, weight: "bold", "Programcı")),
      )
      v(4pt)
      set text(size: 8.6pt)
      set par(justify: false, leading: 0.45em)
      [Dönüşüm için #kod("int()"), #kod("float()"), #kod("str()") çağrılır.]
      v(4pt)
      ornek(c_turuncu, [1. Hassasiyet kazanma (int → float)], c_turuncu.dark,
        text(font: mono, size: 8pt)[puan = 100  →  float(puan)  →  100.0])
      v(3pt)
      ornek(c_turuncu, [2. Ondalığı kesip atma (float → int)], c_kirmizi.dark,
        text(font: mono, size: 8pt)[85.85  →  int(85.85)  →  85],
        text(size: 8pt, fill: c_kirmizi.dark)[Dikkat: 86'ya yuvarlamaz, virgülden sonrasını siler!])
      v(3pt)
      ornek(c_turuncu, [3. Metinle birleştirme (sayı → str)], c_mor.dark,
        text(font: mono, size: 8pt)["Puan: " + str(85)  →  "Puan: 85"])
    }),
  )),

  // ---------- 4. TUZAKLAR ----------
  bolum(4, [Kritik Uyarılar ve Sık Yapılan Hatalar], grid(
    columns: (1fr,) * 3, column-gutter: 6pt,
    kart(c_kirmizi, [int() yuvarlama yapmaz!], [
      #kod("int(9.99)") sonucu #kod("10") değil #kod("9")'dur; ondalığı budar. Yuvarlamak için #kod("round()") kullanılır.
    ], ikon_: ikon("!", c_kirmizi.main)),
    kart(c_turuncu, [Doğrudan ValueError], [
      #kod("int(\"3.14\")") ve #kod("int(\"abc\")") hata verir. Ondalık metin için önce #kod("float(\"3.14\")"), sonra gerekirse #kod("int()").
    ], ikon_: ikon("!", c_turuncu.main)),
    kart(c_mavi, [#kod("/") daima float üretir], [
      #kod("6 / 2") → #kod("3.0"). Tam sayı kalsın isteniyorsa taban bölme: #kod("6 // 2") → #kod("3").
    ], ikon_: ikon("!", c_mavi.main)),
  )),

  // ---------- ÖZET ----------
  ozet([Özet İlke], [
    Klavye ve dosya girişleri sisteme daima #kod("str") olarak ulaşır; hesap için #kod("int()") / #kod("float()") ile dönüştürülür. İşlemde #kod("float") varsa sonuç otomatik #kod("float") olur; #kod("int()") ise ondalığı yuvarlamaz, siler!
  ]),
)
