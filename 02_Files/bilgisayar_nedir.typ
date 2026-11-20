#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/islem-aciklama.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge

// #show: conf


== Bilgisayar Nedir? Değerlendirme Soruları

Aşağıdaki sorular; bilgisayarın tanımı, temel çalışma mimarisi, birimleri ve veri saklama konularını kapsar.

#let soru(no, metin) = block(breakable: false, below: 0.65em)[
  *#no.* #metin
]

#let siklar2(a, b, c, d, ..rest) = {
  let e = if rest.pos().len() > 0 { rest.pos().first() } else { none }
  if e != none {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
      grid.cell(colspan: 2)[E) #e],
    )
  } else {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
    )
  }
}

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

#soru(1, [Bilgisayarın temel görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Yalnızca metin yazmak],
  [Verileri depolamak, işlemek ve sonuçları çıktı olarak sunmak],
  [İnternete bağlanmak],
  [Yalnızca oyun oynamak],
  [Elektrik üretmek],
)

#soru(2, [Kullanıcı tarafından girilen işlenmemiş ham verilere ne ad verilir?])
#siklar5([Çıktı], [Girdi], [Bellek], [Algoritma], [Dosya])

#soru(3, [İşlem sonucunda elde edilen ve kullanıcıya sunulan anlamlı değere ne denir?])
#siklar5([Girdi], [Çıktı], [Komut], [Veri yolu], [Program])

#soru(4, [Aşağıdakilerden hangisi bilgisayarda gerçekleştirilen temel işlemlerden biri değildir?])
#siklar2([Giriş], [Veri işleme], [Veri saklama], [Çıkış], [Programlama])

#soru(5, [Dış dünyadan gelen verileri elektrik sinyaline çeviren birim hangisidir?])
#siklar5([İşlemci], [Bellek], [Giriş birimi], [Çıkış birimi], [Veri yolu])

#soru(6, [Bellek biriminin görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Verileri işlemek],
  [Verileri, komutları ve ara sonuçları geçici olarak saklamak],
  [Sonuçları ekrana yazmak],
  [Dış dünyadan veri almak],
  [Programları derlemek],
)

#soru(7, [Aritmetiksel ve mantıksal işlemleri yapan birim hangisidir?])
#siklar5([RAM], [Giriş birimi], [İşlemci (CPU)], [Çıkış birimi], [Sabit disk])

#soru(8, [İşlenmiş sonuçları ekran, yazıcı veya hoparlörle kullanıcıya sunan birim hangisidir?])
#siklar5([Giriş birimi], [Bellek], [İşlemci], [Çıkış birimi], [Veri yolu])



#soru(10, [Veri yolu (BUS) ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Yalnızca elektrik üretir],
  [Birimler arasında veri ve komut taşır],
  [Yalnızca ses iletir],
  [Kalıcı dosyaları saklar],
  [İşlemcinin yerini alır],
)

#soru(11, [`5 + 3` işlemi sırasında giriş biriminden gelen veriler, işlemciye ulaşmadan önce nereye yazılır?])
#siklar5([Sabit diske], [RAM'e], [Ekrana], [Yazıcıya], [Klavyeye])

#soru(12, [RAM ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Kalıcıdır, bilgisayar kapanınca silinmez],
  [Geçicidir, bilgisayar kapanınca içeriği silinir],
  [Yalnızca program dosyalarını saklar],
  [İşlemciye veri taşır],
  [Ekran çıktısını üretir],
)

#soru(13, [Bilgisayar kapatıldığında kaybolmaması gereken veriler nerede saklanmalıdır?])
#siklar5([RAM'de], [İşlemcide], [Sabit diskte], [Önbellekte], [Veri yolunda])





=== Tarihteki İlk Bilgisayar Programcısı: Değerlendirme Soruları

#soru(1, [1837'de "Analitik Makine" adını verdiği cihazı tasarlayan kişi kimdir?])
#siklar5([Ada Lovelace], [Charles Babbage], [Alan Turing], [Bill Gates], [John V. Neumann])

#soru(2, [Charles Babbage'ın Analitik Makine'yi hayata geçirememesinin temel nedeni nedir?])
#siklar2(
  [Yeterli matematik bilgisi olmaması],
  [Dönemin teknolojisinin yeterli olmaması],
  [Cihazın çok küçük olması],
  [Elektrik enerjisinin bulunmaması],
  [Babbage'ın çalışmaktan vazgeçmesi],
)

#soru(3, [Ada Lovelace'in Babbage'ın çalışmalarındaki rolü aşağıdakilerden hangisidir?])
#siklar2(
  [Analitik Makine'yi tek başına icat etmesi],
  [Babbage'ın en büyük destekçilerinden biri olması],
  [İlk işlemciyi tasarlaması],
  [İlk bilgisayarı üretmesi],
  [İnterneti geliştirmesi],
)

#soru(5, [Ada Lovelace neden tarihteki ilk bilgisayar programcısı olarak kabul edilir?])
#siklar2(
  [İlk bilgisayarı ürettiği için],
  [İlk algoritmayı tasarladığı için],
  [İlk işlemciyi icat ettiği için],
  [Ada programlama dilini kendisi geliştirdiği için],
  [İlk bilgisayar oyununu yaptığı için],
)

#soru(7, [Ada programlama dilinin adı nereden gelmektedir?])
#siklar5([Charles Babbage], [Ada Lovelace], [Analitik Makine], [Ada ülkesi], [İlk bilgisayar])



#iki_hucreli_satir[
=== Çemberin çevresi ve alanı
#soru_bilgi[Konu: sabit, `float()`, aritmetik operatörler, üs alma, f-string · Zorluk: Kolay]

  Kullanıcıdan bir çemberin yarıçapını alın. `PI` adında bir sabit (3.14159) tanımlayın. Çemberin çevresini ve alanını hesaplayıp virgülden sonra 2 basamakla yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Yarıçap (cm): 5
Çevre: 31.42 cm
Alan: 78.54 cm²
```
]
]

#kod-blok(width: 100%)[
  ```python
  PI = 3.14159

  yaricap = float(input("Yarıçap (cm): "))

  cevre = 2 * PI * yaricap
  alan = PI * yaricap ** 2

  print(f"Çevre: {cevre:.2f} cm")
  print(f"Alan: {alan:.2f} cm²")
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.7fr))[
=== Vücut kitle endeksi (BMI)
#soru_bilgi[Konu: `float()`, `int()`, üs alma, aritmetik operatörler · Zorluk: Kolay]

  Kullanıcının girdiği boy (metre) ve kilo (kilogram) değerlerine göre vücut kitle endeksini hesaplayan programı yazın. Formül: `BMI = kilo / boy ** 2`. Boyun karesi için üs alma operatörünü kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):1.75
Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):80
Vücut Kitle Endeksiniz (BMI):
26.122448979591837
```
]
]

#kod-blok(width: 100%)[
  ```python
  boy = float(input("Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):"))
  kilo = int(input("Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):"))

  bmi = kilo / boy ** 2

  print("Vücut Kitle Endeksiniz (BMI):", bmi)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.4fr))[
=== Araç yakıt tüketimi
#soru_bilgi[Konu: `float()`, aritmetik operatörler, oran hesaplama · Zorluk: Orta]

  Yakıt deposu tam dolu bir araçla yola çıkıp dönüşte depoyu yeniden dolduran bir sürücünün verilerinden yakıt tüketimini hesaplayan programı yazın. Formüller:

  - 100 km'de harcanan litre = (alınan yakıt litre) / (gidilen yol km) × 100
  - 100 km'de harcanan benzin tutarı = (alınan yakıt tutarı) / (gidilen yol km) × 100][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Araç Kullanım Bilgileri Giriş Ekranı
Gidilen Yol(km):428.8
Aldığınız Yakıt Miktarı(lt):27.982
Alınan Yakıt Tutarı:146.6
100km 'de Harcanan Yakıtın Litresi:
6.525652985074625
100km 'de Harcanan Yakıtın Tutarı:
34.18843283582089
```
]
]

#kod-blok(width: 100%)[
  ```python
  print("Araç Kullanım Bilgileri Giriş Ekranı")

  yol = float(input("Gidilen Yol(km):"))
  yakit = float(input("Aldığınız Yakıt Miktarı(lt):"))
  tutar = float(input("Alınan Yakıt Tutarı:"))

  yuz_km_litre = yakit / yol * 100
  yuz_km_tutar = tutar / yol * 100

  print("100km 'de Harcanan Yakıtın Litresi:", yuz_km_litre)
  print("100km 'de Harcanan Yakıtın Tutarı:", yuz_km_tutar)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.6fr))[
=== Sayıyı iki katının beş fazlasına güncelleme
#soru_bilgi[Konu: `int()`, atama, önce işlem sonra atama · Zorluk: Kolay]

  Kullanıcıdan 1–20 arasında pozitif bir tam sayı alın. Sayının değerini, iki katının beş fazlası olacak şekilde güncelleyin (yeni değer = sayı × 2 + 5) ve ekrana yazdırın. Önce işlem, sonra atama kuralını kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: 12
Girilen sayının değeri 2 katının 5 fazlası
kadar arttırıldı
Sayının Yeni Değeri : 29
```
]
]

#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: "))

  sayi = sayi * 2 + 5

  print("Girilen sayının değeri 2 katının 5 fazlası kadar arttırıldı")
  print("Sayının Yeni Değeri :", sayi)
  ```
]

#iki_hucreli_satir(columns: (1fr, 1.3fr))[
=== Dik üçgende hipotenüs
#soru_bilgi[Konu: `float()`, üs alma, karekök, Pisagor bağıntısı · Zorluk: Orta]

  Kullanıcıdan bir dik üçgenin dik kenarları olan `a` ve `b` kenar uzunluklarını alın. $a^2 + b^2 = c^2$ bağıntısını kullanarak hipotenüs uzunluğu `c`'yi hesaplayıp yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
a Kenarının Uzunluğu: 3
b Kenarının Uzunluğu: 4

c Kenarının Uzunluğu(Hipotenüs):  5.0
```
]
]

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 10pt, y: 10pt),
  )[
    #align(center)[
      #block(width: 200pt, height: 155pt, inset: 0pt)[
        #place(top + left, dx: 30pt, dy: 20pt, polygon(
          fill: rgb("#e2e8f0"),
          stroke: 1.5pt + rgb("#0f172a"),
          (0pt, 0pt),
          (0pt, 90pt),
          (120pt, 90pt),
        ))
        #place(top + left, dx: 30pt, dy: 98pt, line(length: 12pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 42pt, dy: 98pt, line(length: 12pt, angle: 90deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 30pt, dy: 98pt, box(
          width: 12pt,
          height: 12pt,
          align(center + horizon, circle(radius: 1.2pt, fill: rgb("#0f172a"))),
        ))
        #place(top + left, dx: 5pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[a])
        #place(top + left, dx: 80pt, dy: 112pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[b])
        #place(top + left, dx: 100pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#dc2626"))[c])
      ]
    ]
  ],
  caption: [Dik üçgende dik kenarlar a ve b, hipotenüs c],
)

#kod-blok(width: 100%)[
  ```python
  a = float(input("a Kenarının Uzunluğu: "))
  b = float(input("b Kenarının Uzunluğu: "))

  c = (a ** 2 + b ** 2) ** 0.5

  print("c Kenarının Uzunluğu(Hipotenüs): ", c)
  ```
]