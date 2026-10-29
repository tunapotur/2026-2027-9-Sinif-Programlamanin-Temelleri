#pagebreak()
// Kendi belgenizin yazı boyutu büyükse taşmayı önlemek için tüm infografiği kapsayan yerel metin ayarı:
#block[
  #set text(size: 8.5pt)
  #set par(justify: true, leading: 0.45em)

  // Başlık Alanı
  #align(center)[
    #block(
      fill: rgb("#1e293b"),
      inset: (x: 14pt, y: 8pt),
      radius: 4pt,
      width: 100%,
      [
        #text(fill: white, weight: "bold", size: 13pt)[TEMEL PROGRAMLAMA YAPILARI — İNFOGRAFİK ÖZET] \
        // #text(fill: rgb("#94a3b8"), size: 8pt)[1.1. Değişkenler, Sabitler ve Veri Türleri: Donanımdan Yüksek Seviyeli Dillere Evrim]
      ]
    )
  ]

  #v(4pt)

  // 1. ve 2. Bölüm: İkili Sütun
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    block(
      stroke: 1pt + rgb("#cbd5e1"),
      radius: 4pt,
      inset: 7pt,
      width: 100%,
      height: 12.5em,
      [
        #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[Transistör ve İkili Sistem (Binary)]
        #v(2pt)
        Bilgisayarın en temel donanım birimi olan *transistör*, akımı geçirerek veya keserek en küçük bilgi birimi olan *Bit*'i oluşturur:
        - *Açık (ON - 5V):* Elektrik akımı var $->$ *1 (Bit)*
        - *Kapalı (OFF - 0V):* Elektrik akımı yok $->$ *0 (Bit)*
        İşlemcinin tek doğal dili *Makine Dili (Binary)*'dir.
      ]
    ),
    block(
      stroke: 1pt + rgb("#cbd5e1"),
      radius: 4pt,
      inset: 7pt,
      width: 100%,
      height: 12.5em,
      [
        #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[İlk Bilgisayara Örnek: Altair 8800 (8-Bit)]
        #v(2pt)
        Klavye veya ekran olmadan, komutlar ön paneldeki 8 bitlik fiziksel anahtarlarla (`^` = 1, `v` = 0) belleğe elle yükleniyordu:
        #align(center)[
          #block(fill: rgb("#f8fafc"), inset: 4pt, radius: 3pt, stroke: 0.5pt + rgb("#94a3b8"))[
            #text(size: 7.5pt)[
              `LED (Çıkış)   : (O) (X) (O) (O)  (X) (X) (O) (X) -> 0100 1101` \
              `Anahtar(Giriş): [v] [^] [v] [v]  [^] [^] [v] [^] -> 0100 1101`
            ]
          ]
        ]
        Sadece `1` ve `0` ile işlem yapmak karmaşık ve hataya yapma olasılığı yüksekti
      ]
    )
  )

  #v(4pt)

  // 3. ve 4. Bölüm: İkili Sütun
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    block(
      stroke: 1pt + rgb("#cbd5e1"),
      radius: 4pt,
      inset: 7pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[Gruplama: 4 Bit ve Hexadecimal (16'lık)]
        #v(2pt)
        Uzun 0 ve 1 dizilerini kısaltmak için $2^4 = 16$ esasına dayalı *Hexadecimal* sistem kullanılır (`1011 0000` $->$ `B0`).
        #v(2pt)
        #table(
          columns: (1fr, 1fr, 1.3fr, 1fr, 1fr, 1.3fr),
          inset: 2.5pt,
          align: center,
          fill: (x, y) => if y == 0 { rgb("#e2e8f0") },
          [*Hex*], [*Dec*], [*Binary*], [*Hex*], [*Dec*], [*Binary*],
          [0], [0], [0000], [8], [8], [1000],
          [1], [1], [0001], [9], [9], [1001],
          [2], [2], [0010], [A], [10], [1010],
          [4], [4], [0100], [B], [11], [1011],
          [7], [7], [0111], [F], [15], [1111],
        )
      ]
    ),
    block(
      stroke: 1pt + rgb("#cbd5e1"),
      radius: 4pt,
      inset: 7pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[Metin Temsili: 8 Bit = 1 Byte ve ASCII]
        #v(2pt)
        - *8 Bit = 1 Byte:* Bellekte her karakter 1 Byte yer kaplar ($2^8 = 256$ durum: 0–255).
        - *0–31 ve 127 (DEL):* Basılamayan *Kontrol Karakterleri*.
        - *32–127:* Standart basılabilir karakterler (Harf, rakam, sembol).
        - *128–255:* Genişletilmiş ASCII (Bölgesel harfler, özel semboller).
        - *Örnek:* `A` $->$ Dec: *65* | Hex: *41* | Bin: *0100 0001* (Alt+65) \
          `a` $->$ Dec: *97* | Hex: *61* | Bin: *0110 0001*
      ]
    )
  )

  #v(4pt)

  // 5. Bölüm: Veri Büyüklükleri
  #block(
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 4pt,
    inset: 7pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[1.1.5. Dijital Ölçü Birimleri: Bit'ten Exabyte'a ($2^(10) = 1024$ Kat)]
      #v(2pt)
      #table(
        columns: (1.1fr, 1.1fr, 2.2fr, 1.1fr, 1.1fr, 2.4fr),
        inset: 3pt,
        align: (left, center, left, left, center, left),
        fill: (x, y) => if y == 0 { rgb("#e2e8f0") },
        [*Birim*], [*Kapasite*], [*Somut Karşılığı*], [*Birim*], [*Kapasite*], [*Somut Karşılığı*],
        [*Bit (b)*], [0 veya 1], [Tek bir transistör sinyali], [*Gigabyte (GB)*], [1024 MB], [~1 saatlik HD film],
        [*Byte (B)*], [8 Bit], [Tek bir karakter (Örn: "A")], [*Terabyte (TB)*], [1024 GB], [Geniş harici yedekleme diski],
        [*Kilobyte (KB)*], [1024 B], [1 sayfalık düz metin belgesi], [*Petabyte (PB)*], [1024 TB], [Büyük veri merkezleri / bulut],
        [*Megabyte (MB)*], [1024 KB], [1 dk MP3 veya telefon fotoğrafı], [*Exabyte (EB)*], [1024 PB], [Küresel aylık internet trafiği],
      )
    ]
  )

  #v(4pt)

  // 6. ve 7. Bölüm: Assembly ve Dillerin Evrimi
  #block(
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 4pt,
    inset: 7pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("#0f172a"), size: 9.5pt)[1.1.6. & 1.1.7. Makine Kodundan Assembly ve Yüksek Seviyeli Programlama Dillerine Evrim]
      #v(2pt)
      - *Assembler (Çevirici):* Sembolik kısaltmalarla (*Mnemonic*: `MOV`, `ADD`, `SUB`) yazılan Assembly kodunu makine koduna çevirir.
      - *Derleyici (Compiler):* Tüm kodu baştan sona okuyup tek seferde makine diline çevirir (Örn: C, Fortran, COBOL).
      - *Yorumlayıcı (Interpreter):* Kodu satır satır okuyarak anında çalıştırır; hata olan satıra gelince durur (Örn: Python, Ruby).
      #v(2pt)
      #table(
        columns: (1.5fr, 1.3fr, 1.3fr, 2.4fr, 2.4fr),
        inset: 3pt,
        align: (left+horizon, left, center, left, left),
        fill: (x, y) => if y == 0 { rgb("#e2e8f0") },
        [*Evrim Aşaması*], [*Temsil Biçimi*], [*Örnek Kod*], [*Temel Avantajı*], [*Temel Zorluğu*],
        [*1. Makine Dili*], [0 ve 1 dizileri], [`1011 0000`], [İşlemci doğrudan çalıştırır.], [Okunması ve yazılması çok zordur.],
        [*2. Hexadecimal*], [0-9 ve A-F], [`B0 61`], [4'lü gruplarla yazım kolaylığı sağlar.], [Sayısal kodları ezberlemek gerekir.],
        [*3. Assembly Dili*], [Mnemonic kısaltma], [`MOV AL, 61h`], [Anlamlı komutlarla ifade edilir.], [Donanıma bağımlıdır, büyük projede uzar.],
        [*4. Yüksek Seviye*], [Matematiksel ifade], [`int a = 97;`], [Öğrenmesi kolay, donanımdan bağımsız.], [Derleyici veya yorumlayıcı çevirisi gerekir.],
      )
    ]
  )
]