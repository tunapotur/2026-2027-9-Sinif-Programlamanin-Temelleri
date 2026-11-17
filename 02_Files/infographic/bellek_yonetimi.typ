// Infografik: Bellek Yönetimi, RAM ve İşlemci İlişkisi  (tek sayfa)
// Kullanım: ana belgede  #include "bellek_yonetimi.typ"
#import "infografik_ortak.typ": *

// Bayt kareleri
#let bayt(n, renk) = for _ in range(n) {
  box(width: 8pt, height: 8pt, radius: 1.5pt, fill: renk, stroke: 0.4pt + renk.darken(25%))
  h(1.5pt)
}

// Efor ölçeri (5 kutu)
#let olcer(dolu, renk) = for i in range(5) {
  box(
    width: 8pt, height: 8pt, radius: 1.5pt,
    fill: if i < dolu { renk } else { luma(225) },
    stroke: 0.5pt + if i < dolu { renk.darken(20%) } else { luma(190) },
  )
  h(1.5pt)
}

// Zincir kutusu
#let zincir(c, metin) = block(
  width: 100%, fill: c.light, stroke: 1pt + c.border, radius: 4pt, inset: (x: 4pt, y: 5pt),
  align(center + horizon, text(size: 8.2pt, weight: "bold", fill: c.dark, metin)),
)

// Donanım kutusu (RAM / Veri Yolu / CPU)
#let donanim(c, ad, alt) = block(
  width: 100%, fill: c.main, radius: 4pt, inset: (x: 6pt, y: 5pt),
  align(center)[
    #text(fill: white, weight: "bold", size: 9.6pt, ad) \
    #text(fill: white.transparentize(15%), size: 7.8pt, alt)
  ],
)

// Ölçüm kutucuğu
#let olcu(etiket, deger, not-c, alt) = block(
  width: 100%, fill: white, stroke: 0.5pt + luma(210), radius: 3pt, inset: 4pt,
  align(center)[
    #text(size: 7.6pt, fill: luma(90), etiket) \
    #text(size: 10pt, weight: "bold", fill: not-c, deger) \
    #alt
  ],
)

// int / float karşılaştırma kartı
#let tur_karti(c, ad, secim, bayt-n, kod-satiri, olculer, sonuc, sonuc-c) = block(
  width: 100%, height: 100%, fill: c.light, stroke: 1pt + c.border, radius: 5pt, inset: 7pt,
  {
    grid(
      columns: (auto, 1fr, auto), column-gutter: 6pt, align: horizon,
      box(fill: c.main, radius: 3pt, inset: (x: 6pt, y: 2pt), text(fill: white, weight: "bold", size: 9.6pt, font: mono, ad)),
      text(size: 8.6pt, weight: "bold", fill: c.dark, secim),
      [#bayt(bayt-n, c.main) #text(size: 8.6pt, weight: "bold", fill: c.dark)[#bayt-n Bayt]],
    )
    v(4pt)
    kodblok(c: c, boy: 7.4pt, kod-satiri)
    v(4pt)
    grid(columns: (1fr,) * 3, column-gutter: 4pt, ..olculer)
    v(4pt)
    block(
      width: 100%, fill: sonuc-c.light, stroke: 0.5pt + sonuc-c.border, radius: 3pt, inset: 4pt,
      text(size: 8.4pt, fill: sonuc-c.dark, sonuc),
    )
  },
)

#sayfa(
  (auto, 150pt, 84pt, 204pt, 90pt, 1fr, auto),

  // ---------- BAŞLIK ----------
  baslik_bandi(
    [Bellek Yönetimi, RAM ve İşlemci İlişkisi],
    [Doğru veri türü seçimi hem RAM'de tasarruf sağlar hem de işlemcinin çalışma hızını artırır!],
    [RAM #h(3pt) ↔ #h(3pt) Veri Yolu #h(3pt) ↔ #h(3pt) CPU],
  ),

  // ---------- 1. DONANIM ----------
  bolum(1, [Donanım Mimarisi ve Bir İşlemin Yaşam Döngüsü], ipucu: [sonuc = a + b  →  Oku, İşle, Yaz], grid(
    rows: (auto, 1fr), row-gutter: 6pt,
    grid(
      columns: (1fr, 22pt, 1fr, 22pt, 1fr), align: horizon,
      donanim(c_mavi, [RAM], [Ana bellek: değişkenler burada]),
      text(size: 14pt, weight: "bold", fill: luma(120), align(center, [↔])),
      donanim(c_gri, [Veri Yolu], [Bilgi taşıyan hat (trafik)]),
      text(size: 14pt, weight: "bold", fill: luma(120), align(center, [↔])),
      donanim(c_mor, [CPU], [Hesaplayan işlemci]),
    ),
    grid(
      columns: (1fr,) * 3, column-gutter: 6pt,
      kart(c_mavi, [1. Oku (Fetch)], [
        İşlemci RAM'deki veriyi doğrudan hesaplayamaz. *a* ve *b* değişkenlerini *Veri Yolu* üzerinden kendi yazmaçlarına çeker.
      ], ikon_: daire(1, c_mavi.main)),
      kart(c_mor, [2. İşle (Execute)], [
        *ALU (Aritmetik-Mantık Birimi)* sayıları toplar: 7 + 2 = 9. Tür karmaşıklaştıkça bu adım uzar.
      ], ikon_: daire(2, c_mor.main)),
      kart(c_yesil, [3. Yaz (Store)], [
        İşlemci sonucu tutmaz; *9* değerini veri yoluyla RAM'e geri yollar ve *sonuc* adresine yazar.
      ], ikon_: daire(3, c_yesil.main)),
    ),
  )),

  // ---------- 2. BENZETME ----------
  bolum(2, [Gündelik Hayat Benzetmesi: Kurye Çantası mı, Nakliye Tırı mı?], grid(
    columns: (1fr, 1fr), column-gutter: 7pt,
    kart(c_mavi, [Doğru tür (int): çevik motokurye], [
      Bir kalemi küçük bir kurye çantasıyla taşımak gibidir: depoda yer kaplamaz, trafikte beklemez, teslimi tek hamlede biter.
    ], sol-cubuk: true),
    kart(c_turuncu, [Gereksiz büyük tür (float): nakliye tırı], [
      Tek bir kalem için dev bir tır kiralamak gibidir: depoyu gereksiz işgal eder, yolu tıkar, işlemciyi oyalar.
    ], sol-cubuk: true),
  )),

  // ---------- 3. KANIT ----------
  bolum(3, [Somut Kanıt: Aynı İşlem (7 + 2 = 9), İki Farklı Veri Türü], grid(
    columns: (1fr, 1fr), column-gutter: 7pt,
    tur_karti(c_mavi, "int", [Doğru Seçim (Tam Sayı)], 2,
      "int a = 7; int b = 2; int sonuc = a + b;",
      (
        olcu([RAM Tüketimi], [6 Bayt], c_mavi.dark, text(size: 7.4pt, fill: c_yesil.dark)[(%50 tasarruf)]),
        olcu([Veri Yolu Trafiği], [6 Bayt], c_mavi.dark, text(size: 7.4pt, fill: luma(100))[(4 oku + 2 yaz)]),
        olcu([İşlemci Eforu], [1 Çevrim], c_yesil.dark, olcer(1, c_yesil.main)),
      ),
      [*Sonuç:* Hafif bellek, açık veri yolu, yüksek işlemci hızı.], c_yesil),
    tur_karti(c_turuncu, "float", [Gereksiz Seçim (Ondalık)], 4,
      "float a = 7; float b = 2; float sonuc = a + b;",
      (
        olcu([RAM Tüketimi], [12 Bayt], c_kirmizi.dark, text(size: 7.4pt, fill: c_kirmizi.dark)[(2 kat israf)]),
        olcu([Veri Yolu Trafiği], [12 Bayt], c_kirmizi.dark, text(size: 7.4pt, fill: luma(100))[(8 oku + 4 yaz)]),
        olcu([İşlemci Eforu], [Fazla Çevrim], c_kirmizi.dark, olcer(5, c_kirmizi.main)),
      ),
      [*Sonuç:* 2 kat bellek, yoğun veri yolu, yavaşlayan hesaplama.], c_kirmizi),
  )),

  // ---------- 4. NEDEN-SONUÇ ----------
  bolum(4, [Neden-Sonuç Zinciri: Veri Türü Seçimi Sistemi Nasıl Etkiler?], grid(
    columns: (62pt, 1fr, 12pt, 1fr, 12pt, 1fr, 12pt, 1fr), row-gutter: 8pt, align: horizon,
    text(weight: "bold", size: 8.6pt, fill: c_kirmizi.dark)[✗ Hatalı tür],
    zincir(c_turuncu, [Gereksiz büyük tür (float)]), ok,
    zincir(c_turuncu, [RAM'de fazla alan (%50 israf)]), ok,
    zincir(c_kirmizi, [Veri yolunda trafik (2 kat bayt)]), ok,
    zincir(c_kirmizi, [İşlemci meşgul, sistem yavaşlar]),
    text(weight: "bold", size: 8.6pt, fill: c_yesil.dark)[✓ Doğru tür],
    zincir(c_mavi, [Doğru veri türü (int)]), ok,
    zincir(c_mavi, [RAM'de tasarruf (hafif depolama)]), ok,
    zincir(c_yesil, [Veri yolunda akış (hızlı geçiş)]), ok,
    zincir(c_yesil, [İşlemci hemen bitirir (yüksek hız)]),
  )),

  // ---------- 5. ALTIN KURALLAR ----------
  bolum(5, [Bellek Yönetiminin 3 Altın Kuralı], grid(
    columns: (1fr,) * 3, column-gutter: 6pt,
    kart(c_yesil, [1. İhtiyaç kadar boyut], [
      Küsurat içermeyen değerler (yaş, sayaç, adet, döngü) için #kod("float") kullanmayın; tam sayıyı tercih edin.
    ], ikon_: daire(1, c_yesil.main)),
    kart(c_mavi, [2. Değer aralığı analizi], [
      Değişkenin alabileceği en küçük ve en büyük değeri öngörün. 0-100 arası notlar için devasa türler seçmeyin.
    ], ikon_: daire(2, c_mavi.main)),
    kart(c_turuncu, [3. Donanım bilinci], [
      RAM tasarrufu yalnızca yer kazanmak değildir; veri yolu trafiğini azaltarak işlemci hızını doğrudan artırır.
    ], ikon_: daire(3, c_turuncu.main)),
  )),

  // ---------- ÖZET ----------
  ozet([Özet İlke], [
    İyi bir yazılımcı, kodunun yalnızca doğru sonuç vermesini değil; arka planda RAM, veri yolu ve işlemciyi en az yorup en yüksek verimle çalışmasını da sağlar.
  ]),
)
