#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap-cizgisi(..args) = {
  let n = if args.pos().len() > 0 {
    args.pos().first()
  } else if "n" in args.named() {
    args.named().at("n")
  } else {
    1
  }
  for _ in range(n) [
    #v(0.25em)
    #line(length: 100%, stroke: 0.45pt + gray)
    #v(0.45em)
  ]
}

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

#let siklar4(a, b, c, d) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d],
)

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

=== Bölüm Soruları

#soru(1, [Bilgisayarlarda elektrik akımını geçirerek veya keserek $1$ ve $0$ değerlerinin oluşmasını sağlayan temel donanım birimi aşağıdakilerden hangisidir?])
#siklar5([Transistör], [Transformatör], [Direnç], [Kondansatör], [Diyot])

#soru(2, [Bir Byte tam olarak kaç bitten oluşur?])
#siklar5([2 bit], [8 bit], [4 bit], [16 bit], [32 bit])

#soru(3, [Onaltılık (Hexadecimal) sayı sisteminde tek bir basamak, ikilik (binary) sistemde kaç bite karşılık gelir?])
#siklar5([2 bit], [8 bit], [16 bit], [32 bit], [4 bit])

#soru(4, [Onaltılık (Hexadecimal) sayı sisteminin makine kodlarının gösteriminde kullanılmasının temel yararı aşağıdakilerden hangisidir?])
#siklar2(
  [Uzun ikili sayı dizilerini daha kısa ve okunabilir göstermesi],
  [RAM kapasitesini iki katına yükseltmesi],
  [İşlemcinin çalışma hızını doğrudan artırması],
  [Programlama dillerini otomatik olarak makine diline çevirmesi],
  [Sabit diskteki verileri otomatik olarak sıkıştırması],
)

#soru(5, [ASCII tablosunun temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Görüntü dosyalarını bellekte sıkıştırmak],
  [İşlemci komutlarının çalışmasını hızlandırmak],
  [Harf ve sembollere sayısal kodlar karşılık getirmek],
  [RAM alanındaki adresleri yönetmek],
  [Python programlama kodlarını makine diline derlemek],
)

#soru(6, [Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi sembolik kısaltmalar (*mnemonics*) kullanan programlama dili hangisidir?])
#siklar5([Makine Dili], [C++], [Python], [Assembly Dili], [Java])

#soru(7, [Assembly dilinin makine koduna göre programcıya sağladığı temel kolaylık aşağıdakilerden hangisidir?])
#siklar2(
  [Komutları yalnızca görsel simgelerle ifade etmesi],
  [Makine komutlarını daha anlaşılır sembolik isimlerle yazma imkânı vermesi],
  [Programın hiçbir çeviriciye ihtiyaç duymadan çalışması],
  [RAM kullanımını tamamen ortadan kaldırması],
  [Yazılan programın tüm işletim sistemlerinde doğrudan çalışması],
)

#soru(8, [Yazdığımız kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılımlara ne ad verilir?])
#siklar5([Derleyici], [Yorumlayıcı], [Assembler], [Editör], [İşletim Sistemi])

#soru(9, [Bilgisayarda bilginin en küçük temel veri birimine ............... denir.])

#soru(10, [8 bitin yan yana gelmesiyle oluşan veri birimine ............... adı verilir.])

#soru(11, [0–9 rakamları ile A–F harflerini kullanan sayı sistemine ............... sayı sistemi denir.])

#soru(12, [Harf ve sembolleri sayısal kodlarla temsil etmek için kullanılan standart tablonun adı ...............'dir.])

#soru(13, [İşlemci komutlarını sembolik ve hatırlanabilir kısaltmalarla ifade eden alt seviyeli dile ............... denir.])

#soru(14, [Bir Byte, bilgisayardaki en küçük veri birimidir. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(15, [8 bit bir araya gelerek 1 Byte oluşturur. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(16, [Hexadecimal sayı sisteminde 0–9 rakamları ile A–F harfleri kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(17, [Aşağıdaki numaralandırılmış kavramlar ile harflendirilmiş görev tanımlarını eşleştiriniz:])

#table(
  columns: (1fr, 3fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Kavram*], [*Açıklama / Görev*],
  [1. RAM], [A. Makine komutlarını sembolik kısaltmalarla ifade eden programlama dili],
  [2. CPU], [B. Program ve verilerin çalışma sırasında geçici tutulduğu birincil bellek],
  [3. Veri Yolu (Bus)], [C. Komutları yorumlayıp çalıştıran merkezi işlem birimi],
  [4. ASCII], [D. Karakter ve sembollere standart sayısal kodlar atayan tablo],
  [5. Assembly], [E. Donanım bileşenleri arasında veri taşınmasını sağlayan iletim hattı],
)
*Cevaplarınız:*  *1* – ..... #h(1.5em) *2* – ..... #h(1.5em) *3* – ..... #h(1.5em) *4* – ..... #h(1.5em) *5* – .....

==== Tarihteki İlk Bilgisayar Programcısı

#soru(18, [1837'de "Analitik Makine" adını verdiği cihazı tasarlayan kişi kimdir?])
#siklar5([Ada Lovelace], [Charles Babbage], [Alan Turing], [Bill Gates], [John von Neumann])

#soru(19, [Charles Babbage'ın Analitik Makine'yi hayata geçirememesinin temel nedeni nedir?])
#siklar2(
  [Yeterli matematik bilgisi olmaması],
  [Dönemin teknolojisinin yeterli olmaması],
  [Cihazın çok küçük olması],
  [Elektrik enerjisinin bulunmaması],
  [Babbage'ın çalışmaktan vazgeçmesi],
)

#soru(20, [Ada Lovelace'in Babbage'ın çalışmalarındaki rolü aşağıdakilerden hangisidir?])
#siklar2(
  [Analitik Makine'yi tek başına icat etmesi],
  [Babbage'ın en büyük destekçilerinden biri olması],
  [İlk işlemciyi tasarlaması],
  [İlk bilgisayarı üretmesi],
  [İnterneti geliştirmesi],
)

#soru(21, [Ada Lovelace neden tarihteki ilk bilgisayar programcısı olarak kabul edilir?])
#siklar2(
  [İlk bilgisayarı ürettiği için],
  [İlk algoritmayı tasarladığı için],
  [İlk işlemciyi icat ettiği için],
  [Ada programlama dilini kendisi geliştirdiği için],
  [İlk bilgisayar oyununu yaptığı için],
)

#soru(22, [Ada programlama dilinin adı nereden gelmektedir?])
#siklar5([Charles Babbage], [Ada Lovelace], [Analitik Makine], [Ada ülkesi], [İlk bilgisayar])

==== Bilgisayar Nedir? Değerlendirme

#soru(23, [Bilgisayarın temel görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Yalnızca metin yazmak],
  [Verileri depolamak, işlemek ve sonuçları çıktı olarak sunmak],
  [İnternete bağlanmak],
  [Yalnızca oyun oynamak],
  [Elektrik üretmek],
)

#soru(24, [Kullanıcı tarafından girilen işlenmemiş ham verilere ne ad verilir?])
#siklar5([Çıktı], [Girdi], [Bellek], [Algoritma], [Dosya])

#soru(25, [İşlem sonucunda elde edilen ve kullanıcıya sunulan anlamlı değere ne denir?])
#siklar5([Girdi], [Çıktı], [Komut], [Veri yolu], [Program])

#soru(26, [Aşağıdakilerden hangisi bilgisayarda gerçekleştirilen temel işlemlerden biri değildir?])
#siklar2([Giriş], [Veri işleme], [Veri saklama], [Çıkış], [Programlama])

#soru(27, [Dış dünyadan gelen verileri elektrik sinyaline çeviren birim hangisidir?])
#siklar5([İşlemci], [Bellek], [Giriş birimi], [Çıkış birimi], [Veri yolu])

#soru(28, [Bellek biriminin görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Verileri işlemek],
  [Verileri, komutları ve ara sonuçları geçici olarak saklamak],
  [Sonuçları ekrana yazmak],
  [Dış dünyadan veri almak],
  [Programları derlemek],
)

#soru(29, [Aritmetiksel ve mantıksal işlemleri yapan birim hangisidir?])
#siklar5([RAM], [Giriş birimi], [İşlemci (CPU)], [Çıkış birimi], [Sabit disk])

#soru(30, [İşlenmiş sonuçları ekran, yazıcı veya hoparlörle kullanıcıya sunan birim hangisidir?])
#siklar5([Giriş birimi], [Bellek], [İşlemci], [Çıkış birimi], [Veri yolu])

#soru(31, [Veri yolu (BUS) ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Yalnızca elektrik üretir],
  [Birimler arasında veri ve komut taşır],
  [Yalnızca ses iletir],
  [Kalıcı dosyaları saklar],
  [İşlemcinin yerini alır],
)

#soru(32, [`5 + 3` işlemi sırasında giriş biriminden gelen veriler, işlemciye ulaşmadan önce nereye yazılır?])
#siklar5([Sabit diske], [RAM'e], [Ekrana], [Yazıcıya], [Klavyeye])

#soru(33, [RAM ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Kalıcıdır, bilgisayar kapanınca silinmez],
  [Geçicidir, bilgisayar kapanınca içeriği silinir],
  [Yalnızca program dosyalarını saklar],
  [İşlemciye veri taşır],
  [Ekran çıktısını üretir],
)

#soru(34, [Bilgisayar kapatıldığında kaybolmaması gereken veriler nerede saklanmalıdır?])
#siklar5([RAM'de], [İşlemcide], [Sabit diskte], [Önbellekte], [Veri yolunda])

#iki_hucreli_satir[
==== Soru 35: Çemberin çevresi ve alanı
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

#iki_hucreli_satir(columns: (1fr, 1.7fr))[
==== Soru 36: Vücut kitle endeksi (BMI)
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

#iki_hucreli_satir(columns: (1fr, 1.4fr))[
==== Soru 37: Araç yakıt tüketimi
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

#iki_hucreli_satir(columns: (1fr, 1.6fr))[
==== Soru 38: Sayıyı iki katının beş fazlasına güncelleme
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

#iki_hucreli_satir(columns: (1fr, 1.3fr))[
==== Soru 39: Dik üçgende hipotenüs
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

