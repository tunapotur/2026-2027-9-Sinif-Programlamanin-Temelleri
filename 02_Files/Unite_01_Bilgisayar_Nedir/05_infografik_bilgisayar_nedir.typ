// Infografik: Bilgisayarın Dili - Transistörden Yüksek Seviyeli Dillere  (tek sayfa)
// Kullanım: ana belgede  #include "bilgisayarin_dili.typ"
#import "/02_Files/infografik_ortak.typ":*

// ---------- Bu sayfaya özgü küçük bileşenler ----------
#let koyu = rgb("#1e293b")        // koyu kod bloğu zemini
#let acik_yesil = rgb("#86efac")
#let acik_mavi = rgb("#93c5fd")
#let sari_vurgu = rgb("#fcd34d")

// Tek bit kutusu. bos: true ise içi beyaz, çerçeve ve rakam renkli (okunaklı)
#let bitbox(v, c, w: 11pt, y: 13pt, boy: 7.6pt, bos: false) = box(
  width: w, height: y, radius: 2.5pt,
  fill: if bos { white } else if v == 1 { c.main } else { c.light },
  stroke: if bos { 1.2pt + c.main } else { 0.6pt + c.border },
  align(center + horizon, text(
    fill: if bos or v == 0 { c.dark } else { white }, weight: "bold", size: boy, font: mono, str(v))),
)
#let bits(s, c, ..a) = {
  for ch in s.clusters() {
    if ch == " " { h(7pt) } else { bitbox(int(ch), c, ..a); h(1.5pt) }
  }
}

// LED lamba ve anahtar (çizim)
#let lamp(on) = box(
  width: 13pt, height: 13pt, radius: 7pt,
  fill: if on { sari_vurgu } else { luma(215) },
  stroke: 1pt + if on { c_turuncu.main } else { luma(130) },
)
#let sw(v) = box(
  width: 11pt, height: 20pt, radius: 2pt, fill: luma(232), stroke: 0.6pt + luma(130),
  align(if v == 1 { top } else { bottom },
    rect(width: 100%, height: 9pt, radius: 2pt, fill: if v == 1 { c_yesil.main } else { luma(130) }, stroke: none)),
)

// Programlamanın evrim aşaması
#let asama(n, ad, ornek, artı, eksi, c) = block(
  width: 100%, height: 100%, fill: c.light, stroke: 1pt + c.border, radius: 5pt, inset: 5pt, breakable: false,
)[
  #grid(columns: (auto, 1fr), column-gutter: 5pt, align: horizon,
    daire(n, c.main, r: 6.5pt),
    text(weight: "bold", size: 9.2pt, fill: c.dark, ad))
  #v(3pt)
  #align(center, kod(ornek, c: c, boy: 10.5pt))
  #v(2pt)
  #set text(size: 7.2pt)
  #set par(justify: false, leading: 0.35em)
  #grid(
    columns: (9pt, 1fr), row-gutter: 3pt, align: top,
    text(weight: "bold", fill: c_yesil.main)[+], artı,
    text(weight: "bold", fill: c_kirmizi.main)[–], eksi,
  )
]

// Kapsül etiket
#let pill(t, c) = box(
  fill: c.light, stroke: 0.8pt + c.border, radius: 8pt, inset: (x: 6pt, y: 2.5pt),
  text(weight: "bold", size: 8.4pt, fill: c.dark, t),
)

// Küçük etiket kutusu
#let minik(metin, c) = block(
  width: 100%, fill: c.light, stroke: 0.6pt + c.border, radius: 3pt,
  inset: (x: 2pt, y: 3pt),
  align(center + horizon, text(size: 7.2pt, weight: "bold", fill: c.dark, metin)),
)

// Tablo yardımcıları
#let tablo-baslik(c, ..t) = table.header(..t.pos().map(x => text(fill: white, weight: "bold", size: 7.8pt, x)))
#let satir-dolgu(c) = (_, y) => if y == 0 { c.main } else if calc.odd(y) { white } else { c.light }

#sayfa(
  // Sabit pt yerine oransal (fr) yükseklikler: sayfa ölçüsü değişse de sığar.
  // Sıra: başlık, 1-2, 3-4, 5-6 (Altair/Hex), 7 (ASCII), 8 (evrim), 9. Ağırlıklar = asgari ihtiyaç (toplam ≈ 605pt).
  (auto, 90fr, 74fr, 140fr, 124fr, 98fr, 78fr),

  // ---------- BAŞLIK ----------
  baslik_bandi(
    [=== Bilgisayar Nedir? İnfografik],
    [Transistörden yüksek seviyeli programlama dillerine: 1 ve 0'ın yolculuğu],
    [Transistör #h(3pt) → #h(3pt) Bit #h(3pt) → #h(3pt) Python],
  ),

  // ---------- 1-2: BİLGİSAYAR NEDİR + MİMARİ ----------
  grid(
    columns: (1fr, 1.15fr), column-gutter: 6pt,
    bolum(1, [Bilgisayar Nedir], [
      #set text(size: 8.1pt)
      Kendisine verilen bilgilerle aritmetiksel, mantıksal ve karşılaştırma işlemleri yapıp sonuçları çıktı birimlerine gönderen elektronik cihazdır.
      #v(3pt)
      #grid(
        columns: (1fr,) * 4, gutter: 3pt,
        minik([Giriş], c_yesil), minik([İşleme], c_mavi),
        minik([Saklama], c_turuncu), minik([Çıkış], c_mor),
      )
      #v(2pt)
      #text(size: 7.5pt)[Ham veri = *girdi*; işlenmiş anlamlı değer = *çıktı*]
    ]),
    bolum(2, [Bilgisayarın Temel Çalışma Mimarisi], [
      #set text(size: 8pt)
      #align(center, block(
        width: 100%, fill: c_mavi.light, stroke: 0.7pt + c_mavi.border, radius: 3pt, inset: 3pt,
        align(center, text(weight: "bold", size: 8pt, fill: c_mavi.dark)[İşlemci (CPU)]),
      ))
      #align(center)[#text(size: 10pt, fill: c_gri.dark)[↕]]
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr), gutter: 2pt, align: horizon,
        block(width: 100%, fill: c_yesil.light, stroke: 0.6pt + c_yesil.border, radius: 3pt, inset: 2.5pt,
          align(center, text(size: 7.2pt, weight: "bold", fill: c_yesil.dark)[Giriş])),
        text(size: 8pt)[→],
        block(width: 100%, fill: c_turuncu.light, stroke: 0.6pt + c_turuncu.border, radius: 3pt, inset: 2.5pt,
          align(center, text(size: 7.2pt, weight: "bold", fill: c_turuncu.dark)[Bellek])),
        text(size: 8pt)[→],
        block(width: 100%, fill: c_mor.light, stroke: 0.6pt + c_mor.border, radius: 3pt, inset: 2.5pt,
          align(center, text(size: 7.2pt, weight: "bold", fill: c_mor.dark)[Çıkış])),
      )
      #v(2pt)
      #align(center, text(size: 7.3pt, weight: "bold", fill: c_gri.dark)[VERİ YOLU (BUS)])
    ]),
  ),

  // ---------- 1-2: TRANSİSTÖR + BİT ----------
  grid(
    columns: (1.55fr, 1fr), column-gutter: 6pt,
    bolum(3, [Transistör: Akımı Geçirir / Keser], grid(
      rows: (auto, 1fr), row-gutter: 4pt,
      text(size: 8.4pt)[Bilgisayarın en temel donanım birimi; işlemci ve hafızada *milyarlarca* transistör vardır.],
      grid(
        columns: (1fr, 1fr), column-gutter: 5pt,
        block(width: 100%, height: 100%, fill: c_turuncu.light, stroke: 0.8pt + c_turuncu.border, radius: 4pt, inset: 5pt,
          grid(columns: (auto, 1fr), column-gutter: 5pt, align: horizon, lamp(true),
            text(size: 7.8pt)[#text(weight: "bold", fill: c_turuncu.dark)[AÇIK · Çıkış 1] \ Base: HIGH (5V), LED yanar])),
        block(width: 100%, height: 100%, fill: c_gri.light, stroke: 0.8pt + c_gri.border, radius: 4pt, inset: 5pt,
          grid(columns: (auto, 1fr), column-gutter: 5pt, align: horizon, lamp(false),
            text(size: 7.8pt)[#text(weight: "bold", fill: c_gri.dark)[KAPALI · Çıkış 0] \ Base: LOW (0V), LED söner])),
      ),
    )),
    bolum(4, [Bit (Binary Digit)], grid(
      rows: (1fr, auto), row-gutter: 3pt,
      text(size: 8.2pt)[En küçük bilgi birimi. Yazılım, video, oyun ve metin; hepsi fiziksel olarak yalnızca 1 ve 0'dır.],
      align(center, bits("1 0 1 1", c_mor, w: 24pt, y: 28pt, boy: 15pt)),
    )),
  ),

  // ---------- 3-4: ALTAIR + HEX ----------
  grid(
    columns: (1.1fr, 1fr), column-gutter: 6pt,
    bolum(5, [Altair 8800 (1970'lerin ortası)], grid(
      rows: (auto, 1fr, auto), row-gutter: 4pt,
      text(size: 8.2pt)[Klavye ve ekran yoktu; ön panelde *toggle switch* ve LED'ler vardı. Her 8 bitlik komut anahtarlarla belleğe yüklenirdi: yukarı = 1, aşağı = 0.],
      block(width: 100%, height: 100%, fill: c_gri.light, stroke: 1pt + c_gri.border, radius: 4pt, inset: 5pt,
        align(center + horizon, grid(
          columns: (auto,) + (auto,) * 9, column-gutter: 3pt, row-gutter: 5pt, align: center + horizon,
          ..{
            let v = (0, 1, 0, 0, 1, 1, 0, 1)
            let satir(etiket, f) = {
              let r = (align(right, text(size: 7.4pt, weight: "bold", fill: c_gri.dark, etiket)),)
              for (i, x) in v.enumerate() {
                if i == 4 { r.push(h(5pt)) }
                r.push(f(x))
              }
              r
            }
            (
              ..satir([LED (çıkış)], x => lamp(x == 1)),
              ..satir([], x => text(font: mono, size: 7.6pt, weight: "bold", fill: c_gri.dark, str(x))),
              ..satir([Anahtar (giriş)], x => sw(x)),
            )
          },
        ))),
      text(size: 7.8pt)[İki sayıyı toplamak için bile onlarca komut hatasız girilmeliydi: yavaş, yorucu, hataya açık.],
    )),
    bolum(6, [Hexadecimal Sistemi], grid(
      rows: (auto, 1fr, auto), row-gutter: 4pt,
      text(size: 8.2pt)[2#super[4] = 16 olduğundan 4 bit, tek bir hex karakterine (0–9, A–F) karşılık gelir.],
      grid(
        columns: (1fr,) * 8, rows: (1fr, 1fr), gutter: 2.5pt,
        ..range(16).map(i => block(
          width: 100%, height: 100%, fill: c_turuncu.light, stroke: 0.6pt + c_turuncu.border, radius: 3pt, inset: (x: 1pt, y: 2pt),
          align(center + horizon)[
            #text(weight: "bold", size: 8.6pt, fill: c_turuncu.dark)[#upper(str(i, base: 16))]#text(size: 6.2pt, fill: luma(110))[ (#i)] \
            #text(font: mono, size: 6.4pt)[#("0000" + str(i, base: 2)).slice(-4)]
          ],
        )),
      ),
      align(center, grid(
        columns: (auto,) * 7, column-gutter: 4pt, align: horizon,
        kod("1011 0000", c: c_turuncu, boy: 7.8pt), text(size: 9pt)[→], text(size: 9pt, weight: "bold")[B0], h(8pt),
        kod("0110 0001", c: c_turuncu, boy: 7.8pt), text(size: 9pt)[→], text(size: 9pt, weight: "bold")[61],
      )),
    )),
  ),

  // ---------- 5: ASCII ----------
  bolum(7, [Metin Temsili: 8 Bit = 1 Byte ve ASCII], grid(
    rows: (1fr, auto), row-gutter: 5pt,
    grid(
      columns: (1fr, 1.25fr), column-gutter: 8pt,
      [
        #set text(size: 7.9pt)
        Harf ve sembolleri sayılarla temsil etmek için *ASCII* standardı geliştirildi. 1 karakter = *1 Byte* (8 bit) yer kaplar ve iki hex karakterle yazılır. Örnek: *0100 0001* = *41* = *65* = *"A"*.
        #v(2pt)
        #align(center)[
          #box(fill: white, radius: 5pt, stroke: 1pt + c_yesil.border, inset: 5pt, bits("0100 0001", c_yesil, w: 18pt, y: 21pt, boy: 11pt, bos: true))
        ]
      ],
      // Tablo, bölüm başlığıyla aynı hizadan başlar: başlık satırı hizasına gelecek kadar yukarı alınır.
      block(width: 100%, height: 100%, place(top + left, dy: -11pt, block(width: 100%, height: 100% + 11pt, table(
        columns: (auto, 1fr, 1fr, 2fr), rows: (auto,) + (1fr,) * 5, align: center + horizon, inset: 2pt,
        fill: satir-dolgu(c_yesil), stroke: 0.4pt + c_yesil.border,
        tablo-baslik(c_yesil, [Karakter], [Onluk], [Hex], [İkilik]),
        ..for (a, b, c, d) in (
          ("SP", "32", "20", "0010 0000"), ("0", "48", "30", "0011 0000"), ("A", "65", "41", "0100 0001"),
          ("a", "97", "61", "0110 0001"), ("DEL", "127", "7F", "0111 1111"),
        ) {
          (a, b, c, d).map(x => text(font: mono, size: 7.8pt, x))
        },
      )))),
    ),
    grid(
      columns: (1.2fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 3pt,
      ..(
        ("0–31 ve 127", "Kontrol karakterleri", c_mor),
        ("32–47", "Boşluk ve semboller", c_turuncu),
        ("48–57", "Rakamlar 0–9", c_mavi),
        ("65–90", "Büyük harfler A–Z", c_yesil),
        ("97–122", "Küçük harfler a–z", c_yesil),
      ).map(((r, t, c)) => block(fill: c.light, stroke: 0.7pt + c.border, radius: 3pt, inset: 3.5pt, width: 100%,
        align(center)[#text(weight: "bold", size: 8pt, fill: c.dark, r) \ #text(size: 7pt, t)])),
    ),
  )),

  // ---------- 8: EVRİM ----------
  bolum(8, [Programlamanın Evrimi], grid(
    columns: (1fr, 12pt, 1fr, 12pt, 1fr, 12pt, 1fr), align: horizon,
    asama(1, [Makine Dili], "1011 0000", [Çeviri gerekmez], [Yazması çok zor], c_mor), ok,
    asama(2, [Hexadecimal], "B0 61", [4 bit = 1 karakter], [Kodlar ezberlenir], c_turuncu), ok,
    asama(3, [Assembly], "MOV AL, 61H", [Anlamlı kısaltmalar], [İşlemciye özel], c_yesil), ok,
    asama(4, [Yüksek Seviyeli], "sonuc = a + b", [Kolay, taşınabilir], [Derleyici gerekir], c_mavi),
  )),

  // ---------- 9: DERLEYİCİ / YORUMLAYICI ----------
  bolum(9, [Programlama Dilleri: Derleyici ve Yorumlayıcı], grid(
    rows: (auto, 1fr), row-gutter: 3pt,
    text(size: 7.9pt)[Fortran, COBOL ve C gibi yüksek seviyeli diller, `sonuc = a + b` gibi okunabilir ifadelerle program yazmayı sağlar.],
    grid(
      columns: (1fr, 1fr), column-gutter: 6pt,
      block(width: 100%, height: 100%, fill: c_mavi.light, stroke: 0.8pt + c_mavi.border, radius: 4pt, inset: 5pt)[
        #pill([Derleyici (Compiler)], c_mavi) \
        #v(2pt)
        #text(size: 7.5pt)[Kodun *tamamını* okur, denetler ve bütünü makine diline çevirir. Hata varsa derleme tamamlanmaz.]
      ],
      block(width: 100%, height: 100%, fill: c_mor.light, stroke: 0.8pt + c_mor.border, radius: 4pt, inset: 5pt)[
        #pill([Yorumlayıcı (Interpreter)], c_mor) \
        #v(2pt)
        #text(size: 7.5pt)[Kodu *satır satır* okuyup anında çalıştırır; hatalı satırda durur (Python, Ruby).]
      ],
    ),
  )),
)
