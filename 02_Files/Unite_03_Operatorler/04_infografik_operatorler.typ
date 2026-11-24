// Infografik: Operatörler ve İşlem Önceliği  (tek sayfa)
// Kullanım: ana belgede  #include "operatorler.typ"
#import "/02_Files/infografik_ortak.typ":*

// Operatör kutucuğu (sağ sütundaki dikey operatör ızgarası için)
#let op_kutu(t, c) = block(
  width: 100%, fill: white, stroke: 1pt + c.border, radius: 3pt, inset: (y: 3pt),
  align(center, text(font: mono, size: 10pt, weight: "bold", fill: c.dark, t)),
)

// Operatör grubu kartı: solda başlık + notlar, sağda operatörler iki sütun halinde
#let grup(c, baslik, simge, ops, giris, ..notlar) = block(
  width: 100%, height: 100%, fill: c.light, stroke: 1pt + c.border, radius: 5pt, inset: 7pt, breakable: false,
  grid(
    columns: (1fr, 76pt), column-gutter: 8pt, align: horizon,
    [
      #grid(columns: (auto, 1fr), column-gutter: 5pt, align: horizon,
        ikon(simge, c.main), text(weight: "bold", size: 9.6pt, fill: c.dark, baslik))
      #v(2pt)
      #set text(size: 8.6pt)
      #set par(justify: false, leading: 0.45em)
      #set list(marker: text(fill: c.main)[•], tight: true, indent: 0pt, body-indent: 4pt, spacing: 0.7em)
      #for n in notlar.pos() [- #n]
    ],
    grid(columns: (1fr, 1fr), gutter: 3pt, ..ops.map(o => op_kutu(o, c))),
  ),
)

// Öncelik satırı
#let seviye(no, c, op, aciklama, yon, yon-c: none) = (
  block(width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 4pt, inset: (y: 4pt),
    align(center + horizon, text(size: 8.6pt, weight: "bold", fill: c.dark, no))),
  align(left + horizon, rozet(op, c, boy: 8.6pt)),
  text(size: 8.6pt, aciklama),
  align(right + horizon, text(size: 8pt, weight: "bold", fill: if yon-c == none { c.dark } else { yon-c }, yon)),
)

#sayfa(
  (auto, 212pt, 164pt, 160pt, 1fr, auto),

  // ---------- BAŞLIK ----------
  baslik_bandi(
    [=== Operatörler İnfografik],
    [Değerleri işleyen semboller, 4 temel operatör grubu ve Python'un hesaplama hiyerarşisi],
    [Parantez #h(2pt) → #h(2pt) Aritmetik #h(2pt) → #h(2pt) Karşılaştırma #h(2pt) → #h(2pt) Mantık #h(2pt) → #h(2pt) Atama],
  ),

  // ---------- 1. DÖRT GRUP ----------
  bolum(1, [Python'daki Dört Temel Operatör Grubu], ipucu: [sonuc = 5 + 3  →  5, 3: operand · +: operatör · =: atama], grid(
    columns: (1fr, 1fr), rows: (1fr, 1fr), column-gutter: 6pt, row-gutter: 6pt,
    grup(c_mavi, [Aritmetik], "+", ("+", "-", "*", "/", "//", "%", "**"), [Matematiksel hesap yapar:],
      [#kod("/") her zaman #kod("float") üretir],
      [#kod("//") tam bölüm, #kod("%") kalan],
      [#kod("**") üs alır: #kod("2 ** 3") = 8],
    ),
    grup(c_mor, [Atama ve Bileşik], "=", ("=", "+=", "-=", "*=", "/=", "//=", "%="), [Değişkene değer aktarır:],
      [*Sağdan sola* çalışır],
      [#kod("a += 3") demek #kod("a = a + 3")],
      [Önce sağ taraf hesaplanır],
    ),
    grup(c_yesil, [Karşılaştırma], "?", ("==", "!=", ">", "<", ">=", "<="), [İki değeri kıyaslar:],
      [Sonuç daima #kod("True") / #kod("False")],
      [#kod("==") eşit mi?  #kod("!=") farklı mı?],
      [#kod("=") ile #kod("==") karıştırılmaz!],
    ),
    grup(c_turuncu, [Mantıksal], "&", ("not", "and", "or"), [Koşulları birbirine bağlar:],
      [#kod("and") ikisi de #kod("True") ise],
      [#kod("or") en az biri #kod("True") ise],
      [#kod("not") doğruyu yanlışa çevirir],
    ),
  )),

  // ---------- 2. ÖNCELİK ----------
  bolum(2, [Operatörler Arası İşlem Önceliği], ipucu: [En yüksek öncelik (1) → en düşük (Son)], grid(
    columns: (30pt, 128pt, 1fr, 74pt), column-gutter: 5pt, rows: (1fr,) * 7, align: horizon,
    ..seviye("1", c_kirmizi, "( )", [*Parantez içi:* her zaman en başta; en içteki önce.], [En yüksek]),
    ..seviye("2", c_turuncu, "**", [*Üs alma:* sağdan sola! #kod("2 ** 3 ** 2 = 512", boy: 7.8pt)], [Sağdan sola]),
    ..seviye("3", c_mavi, "*  /  //  %", [*Çarpma, bölme, tam bölme, mod* (eşit öncelik)], [Soldan sağa]),
    ..seviye("4", c_mavi, "+  -", [*Toplama ve çıkarma* (eşit öncelik)], [Soldan sağa]),
    ..seviye("5", c_yesil, "==  !=  >  <  >=  <=", [*Karşılaştırma:* #kod("bool") üretir], [True / False]),
    ..seviye("6", c_mor, "not → and → or", [*Mantıksal:* önce #kod("not"), sonra #kod("and"), en son #kod("or")], [not > and > or]),
    ..seviye("Son", c_gri, "=  +=  -=", [*Atama:* her şey bittikten sonra belleğe yazar], [En son]),
  )),

  // ---------- 3. ADIM ADIM ----------
  bolum(3, [Örneklerle Adım Adım İşlem Çözümlemesi], grid(
    columns: (1fr, 1.15fr), column-gutter: 7pt,
    block(width: 100%, height: 100%, fill: c_mavi.light, stroke: 1pt + c_mavi.border, radius: 5pt, inset: 7pt, {
      text(weight: "bold", size: 9.4pt, fill: c_mavi.dark)[A. Aritmetik ifade]
      v(3pt)
      kodblok(c: c_mavi, boy: 8.8pt, "sonuc = 2 + 3 ** 2 * 2")
      v(4pt)
      set text(size: 8.6pt)
      grid(
        columns: (auto, 1fr), column-gutter: 5pt, row-gutter: 6pt, align: horizon,
        daire(1, c_turuncu.main, r: 6.5pt), [Üs alma: #kod("3 ** 2 = 9", c: c_turuncu, boy: 8pt)],
        daire(2, c_mavi.main, r: 6.5pt), [Çarpma: #kod("9 * 2 = 18", c: c_mavi, boy: 8pt)],
        daire(3, c_yesil.main, r: 6.5pt), [Toplama: #kod("2 + 18 = 20", c: c_yesil, boy: 8pt)],
        daire(4, c_gri.main, r: 6.5pt), [Atama: #kod("sonuc = 20", c: c_gri, boy: 8pt)],
      )
    }),
    block(width: 100%, height: 100%, fill: c_mor.light, stroke: 1pt + c_mor.border, radius: 5pt, inset: 7pt, {
      text(weight: "bold", size: 9.4pt, fill: c_mor.dark)[B. Karşılaştırma + mantık]
      v(3pt)
      kodblok(c: c_mor, boy: 8.4pt, "yas = 16; izin = True", "sonuc = yas >= 18 or (izin and not False)")
      v(4pt)
      set text(size: 8.6pt)
      grid(
        columns: (auto, 1fr), column-gutter: 5pt, row-gutter: 6pt, align: horizon,
        daire(1, c_mor.main, r: 6.5pt), [Parantez içi #kod("not"): #kod("not False → True", c: c_mor, boy: 8pt)],
        daire(2, c_mor.main, r: 6.5pt), [Parantez içi #kod("and"): #kod("True and True → True", c: c_mor, boy: 8pt)],
        daire(3, c_yesil.main, r: 6.5pt), [Karşılaştırma: #kod("16 >= 18 → False", c: c_yesil, boy: 8pt)],
        daire(4, c_turuncu.main, r: 6.5pt), [En son #kod("or"): #kod("False or True → True", c: c_turuncu, boy: 8pt)],
      )
    }),
  )),

  // ---------- 4. TUZAKLAR ----------
  bolum(4, [Sık Yapılan Hatalar ve Kritik Tuzaklar], grid(
    columns: (1fr,) * 3, column-gutter: 6pt,
    kart(c_kirmizi, [`=` ile `==` aynı değildir!], [
      #kod("x = 5") #strong[atama]dır; #kod("x == 5") #strong[karşılaştırma]dır ve #kod("True") / #kod("False") üretir.
    ], ikon_: ikon("!", c_kirmizi.main)),
    kart(c_turuncu, [Üs alma sağdan sola], [
      Soldan sağa değil: #kod("2 ** 3 ** 2") = 512. 64 için: #kod("(2 ** 3) ** 2")
    ], ikon_: ikon("!", c_turuncu.main)),
    kart(c_yesil, [Kısa devre koruması], [
      Sonuç belli olunca sağ taraf çalışmaz; sıfıra bölmeyi önler: #kod("x != 0 and 10/x > 1")
    ], ikon_: ikon("!", c_yesil.main)),
  )),

  // ---------- ÖZET ----------
  ozet([Altın Kural], [
    İşlem önceliğinden emin olmadığınızda ya da kodun kolay okunmasını istediğinizde *parantez ( )* kullanın. Parantez hem hesap hatalarını önler hem de niyetinizi netleştirir.
  ]),
)
