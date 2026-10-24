#import "../template.typ": *
#import "../flowchart.typ": *
#import "../qr_code.typ": *

#set page(numbering: "1")

#set document(title: "2026-2027 9. Sınıf Programlamanın Temelleri 1.Dönem 1.Sınav Ders Notları")

#show: conf
#align(center)[
  #title()
]

= Öğrenme Birimi Algoritmik Düşünme ve Tasarım

== Problem Analizi ve Bileşenleri

#bilgi-kutusu("ANALİZ")[
  Bir olayı veya durumu incelemek ve ayrıntılı biçimde anlamaya çalışmaktır.
]
Programlama sürecinde problem analizi, çözülmesi gereken sorunu dikkatlice inceleme aşamasıdır. Bu aşamada sorunun ne olduğu, çözüm için hangi bilgilere ihtiyaç duyulduğu, bu bilgilerle neler yapılacağı ve sonunda hangi sonucun elde edilmek istendiği belirlenir.
Örneğin okul kantinindeki sıra sorununda öğrenci sayısı ve alışveriş süreleri incelenir. Daha sonra bekleme süresini azaltacak bir sıra düzeni planlanır.

=== Algoritma ve Tasarım Kriterleri
Algoritma, belirli bir problemi çözmek veya hedeflenen bir amaca ulaşmak için tasarlanan, açık ve sıralı adımlardır. Algoritmadaki adımlar açık olmalı, sırayla uygulanmalı ve bir sonuca ulaşmalıdır.

*Örnek:* İki sayının toplamını bulma;
+ Birinci sayıyı al.
+ İkinci sayıyı al.
+ İki sayıyı topla.
+ Sonucu ekrana yazdır.
Örneğin girilen sayılar 8 ve 5 ise, ekranda 13 sonucu gösterilir.

=== Problemi Bileşenlerine Ayırma
Problemi Bileşenlerine Ayırma, büyük ve karmaşık bir problemi daha küçük ve yönetilebilir parçalara bölme yöntemidir. Her parça ayrı ayrı incelenir ve çözülür. Bu yöntem, hataları bulmayı, sistemi geliştirmeyi ve güncellemeyi kolaylaştırır.

*Örnek: Dijital oyun tasarlama :* Oyunun karakter hareketleri, sesleri ve puan sistemi ayrı bölümler olarak hazırlanır. Bu bölümler daha sonra birleştirilir. Böylece oyunu geliştirmek ve hataları bulmak kolaylaşır.

=== Girdi-İşlem-Çıktı Modeli
Bilgisayarda problemler genellikle Girdi–İşlem–Çıktı modeliyle çözülür.

*#underline[Girdi]:* Sisteme verilen bilgiler veya verilerdir.

*#underline[İşlem]:* Bu bilgiler üzerinde yapılan hesaplama ve kontrollerdir.

*#underline[Çıktı]:* İşlem sonunda elde edilen sonuçtur.

*Örnek:* Bankamatikten para çekme
Kullanıcının kartı, şifresi ve çekmek istediği para miktarı girdidir. Bankamatik şifreyi kontrol eder ve yeterli bakiye olup olmadığına bakar; bu bölüm işlemdir. Para, makbuz ve ekranda gösterilen yeni bakiye ise çıktıdır.
#pagebreak()

== Akış Şeması (Flowchart)
Akış şeması, bir algoritmanın kod yazılmadan önce semboller ve çizimler kullanılarak gösterilmesidir. Çözüm adımlarını daha kolay anlamayı, kontrol etmeyi ve hataları kodlamaya başlamadan fark etmeyi sağlar.

=== Sözde Kod ve Elle Çalıştırma
*Sözde kod,* bir algoritmayı herhangi bir programlama dilinin kurallarına bağlı kalmadan, günlük dile yakın ve açık komutlarla yazma yöntemidir. Sözde kodlar, programcının mantık hatalarına odaklanmasını kolaylaştırır.

*Dry run(Elle Çalıştırma),* bir algoritmayı kodlamadan önce kağıt üzerinde adım adım çalıştırma yöntemidir. Bu sırada değişkenlerin değerleri takip edilir ve sonucun doğru olup olmadığı kontrol edilir. Böylece mantık hataları erken fark edilir.

==== Örnek 1: İki Sayının Toplamını Bulma (Sayfa 25 Örnek 1)
Kullanıcı tarafından girilen iki sayının toplamını ekrana yazdıran sözde kodu ve elle çalıştırma tablosunu hazırlayın. Birinci ve ikinci sayı için kullanıcıdan alınan değerler için sırasıyla *s1* ve *s2* değişkenlerini, toplam için *toplam* değişkenini kullanın.

*Sözde Kod*
1. Adım: BAŞLA.
2. Adım: Birinci sayıyı (*s1*) kullanıcıdan al.
3. Adım: İkinci sayıyı (*s2*) kullanıcıdan al.
4. Adım: *toplam = s1 + s2* işlemini yap.
5. Adım: toplam *sonucunu ekrana yazdır*.
6. Adım: DUR.

*Elle Çalıştırma Tablosu* \
*Örnek Girdiler:* s1 = 15, s2 = 25  *Beklenen Çıktı:* toplam = 40
#table(
  columns: (1.25cm, 5cm, 1cm, 1cm,2cm, 1fr),
    stroke: table_Stroke,
    inset: 7pt,
  
    table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[s1],
    table_headerCell[s2],
    table_headerCell[toplam],
    table_headerCell[Açıklama],
  ),
    table_dataCell_middle[1],
    table_dataCell_middle[BAŞLA],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Algoritma başlar],
    
    table_dataCell_middle[2],
    table_dataCell_middle[*s1* değerini oku.],
    table_dataCell_middle[*15*],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Kullanıcı 15 sayısını girer],
    
    table_dataCell_middle[3],
    table_dataCell_middle[*s2* değerini oku.],
    table_dataCell_middle[15],[*25*],
    table_dataCell_middle[-],
    table_dataCell_left[Kullanıcı 25 sayısını girer],
    
    table_dataCell_middle[4],
    table_dataCell_middle[*toplam = s1 + s2*],
    table_dataCell_middle[15],
    table_dataCell_middle[25],
    table_dataCell_middle[*40*],
    table_dataCell_left[15 + 25 = 40 işlemi gerçekleşir],
    
    table_dataCell_middle[5],
    table_dataCell_middle[toplam değerini yazdır],
    table_dataCell_middle[15],
    table_dataCell_middle[25],
    table_dataCell_middle[40],
    table_dataCell_left[Ekrana 40 sonucu yazılır],
    
    table_dataCell_middle[6],
    table_dataCell_middle[DUR],
    table_dataCell_middle[15],
    table_dataCell_middle[25],
    table_dataCell_middle[40],
    table_dataCell_left[Algoritma başarıyla sonlanır],
)

#pagebreak()
==== Karşılaştırma Operatörleri ve Kullanım Örnekleri

Algoritmalar; günlük hayatta olduğu gibi belirli koşullara göre farklı yollara sapabilir. Yazılımcılar, iki veriyi birbiriyle kıyaslayan ve aralarındaki mantıksal ilişkiyi belirleyen *karşılaştırma operatörlerini* kullanarak *Doğru*(True) veya *Yanlış*(False) mantıksal sonucunu hesaplar.

Aşağıda ki tabloda sık karşılaştırma operatörleri ve kullanımı gösterilmektedir.

#table(
  columns: (2cm, 2.6cm, 3.5cm, 1fr),
  stroke: table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Operatör],
    table_headerCell[Anlamı],
    table_headerCell[Örnek Kullanım],
    table_headerCell[Bilgisayar Dilindeki Karşılığı ve Açıklama]
  ),

  table_dataCell_middle[==],
  table_dataCell_middle[Eşittir],
  table_dataCell_middle[tahmin == 1234],
  table_dataCell_left[*tahmin* değeri, *1234* sayısına eşitse sonuç *Doğru* olur.],

  table_dataCell_middle[!=],
  table_dataCell_middle[Eşit Değildir],
  table_dataCell_middle[sifre != "123"],
  table_dataCell_left[Şifre, "123" değerine eşit değilse sonuç *Doğru* olur.],

  table_dataCell_middle[>],
  table_dataCell_middle[Büyüktür],
  table_dataCell_middle[yas > 18],
  table_dataCell_left[Yaş değeri, 18’den büyükse sonuç *Doğru* olur.],

  table_dataCell_middle[<],
  table_dataCell_middle[Küçüktür],
  table_dataCell_middle[sicaklik < 0],
  table_dataCell_left[Sıcaklık, 0’dan küçükse sonuç *Doğru* olur.],

  table_dataCell_middle[>=],
  table_dataCell_middle[Büyük Eşittir],
  table_dataCell_middle[puan >= 50],
  table_dataCell_left[Puan, 50 veya 50’den daha büyükse sonuç *Doğru* olur.],

  table_dataCell_middle[<=],
  table_dataCell_middle[Küçük Eşittir],
  table_dataCell_middle[hiz <= 90],
  table_dataCell_left[Hız, 90 veya 90’dan daha küçükse sonuç *Doğru* olur.],
)

===== Karşılaştırma Operatörleri İle Yapılan İşlem Örnekleri
#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
    *EŞİTTİR (==)*
    - *5 == 5* #sym.arrow.r Sonuç: true (1)
    - *12 == 20* #sym.arrow.r Sonuç: false (0)
    - *"Tuna" == "Tuna"* #sym.arrow.r Sonuç: true (1)
    - *"Ahmet" == "ahmet"* #sym.arrow.r Sonuç:\ false (0) (Büyük/küçük harf duyarlılığı)
    - *-10 == 10* #sym.arrow.r Sonuç: false (0)
    ],
    [
      *EŞİT DEĞİLDİR (!=)*
      - *10 != 5* #sym.arrow.r Sonuç: true (1)
      - *7 != 7* #sym.arrow.r Sonuç: false (0)
      - *"Java" != "Python"* #sym.arrow.r Sonuç: true (1)
      - *"Okul" != "Okul"* #sym.arrow.r Sonuç: false (0)
      - *-4 != 4* #sym.arrow.r Sonuç: true (1)
    ]
  )
]
#v(0.5em)
#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
    *BÜYÜKTÜR (>)*
    - *15 > 8*  #sym.arrow.r Sonuç: true (1)
    - *3 > 10*  #sym.arrow.r Sonuç: false (0)
    - *5 > 5*  #sym.arrow.r Sonuç: false (0)
    - *-2 > -10*  #sym.arrow.r Sonuç: true (1)
    - *0.5 > 0.2*  #sym.arrow.r Sonuç: true (1)
    ],
    [
      *KÜÇÜKTÜR (<)*
      - *4 < 9*  #sym.arrow.r Sonuç: true (1)
      - *25 < 12*  #sym.arrow.r Sonuç: false (0)
      - *7 < 7*  #sym.arrow.r Sonuç: false (0)
      - *-15 < -3*  #sym.arrow.r Sonuç: true (1)
      - *1.25 < 1.30*  #sym.arrow.r Sonuç: true (1)
    ]
  )
]
#v(0.5em)
#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
    *BÜYÜK EŞİTTİR (>=)*
    - *18 >= 18* #sym.arrow.r Sonuç: true (1)
    - *20 >= 15* #sym.arrow.r Sonuç: true (1)
    - *6 >= 10* #sym.arrow.r Sonuç: false (0)
    - *0 >= 0* #sym.arrow.r Sonuç: true (1)
    - *-5 >= -5* #sym.arrow.r Sonuç: true (1)
    ],
    [
    *KÜÇÜK EŞİTTİR (<=)*
    - *5 <= 5* #sym.arrow.r Sonuç: true (1)
    - *3 <= 8* #sym.arrow.r Sonuç: true (1)
    - *14 <= 9* #sym.arrow.r Sonuç: false (0)
    - *-8 <= -2* #sym.arrow.r Sonuç: true (1)
    - *100 <= 99* #sym.arrow.r Sonuç: false (0)
    ]
  )
]

#pagebreak()
==== Örnek 1 Hatalı Giriş Kontrolü Algoritması (Sayfa 28 Örnek 4)

Kullanıcının önceden belirlediği bir şifre ile sisteme girişini kontrol eden programının sözde kodunu ve elle çalıştırma tablosunu hazırlayın. Sistem şifresi için *sistemKey*, kullanıcı şifresi için *kullaniciKey* kullanılacak.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: *sistemKey = 1234*
3. Adım: kullanıcıdan (*kullaniciKey*) değerini al
4. Adım: *EĞER sistemKey == kullaniciKey*
          \ *EVET* ise "Sisteme Girer"
          \ *HAYIR* ise "Sisteme Giremez!"    
5. Adım: BİTİR

*Elle Çalışma Tablosu* \
*Örnek Girdiler:* sistemKey=1234, kullaniciKey=9876, *Beklenen Çıktı:* Sisteme Giremez

  #table(
    columns: (0.7cm, 3.4cm, 1.4cm, 1.4cm, 2.5cm, 2.2cm, 1fr),
    stroke:  table_Stroke,
    inset: 7pt,
    
    table.header(
      table_headerCell[Ad],
      table_headerCell[İşlem],
      table_headerCell[sistem Key],
      table_headerCell[kullanici Key],
      table_headerCell[Koşul\ sistemKey == kullaniciKey],
      table_headerCell[Çıktı],
      table_headerCell[Açıklama],
    ),

    table_dataCell_middle[1],
    table_dataCell_middle[BAŞLA],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Algoritma başlar.],

    table_dataCell_middle[2],
    table_dataCell_middle[sistemKey = 1234],
    table_dataCell_middle[*1234*],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Kodun içinde sistem şifresi *sistemKey=1234* oluşturuldu],

    table_dataCell_middle[3],
    table_dataCell_middle[kullaniciKey = 9876 Gir],
    table_dataCell_middle[1234],
    table_dataCell_middle[*9876*],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Kullanıcıdan *kullaniciKey=9876* değeri alındı.],

    table_dataCell_middle[4],
    table_dataCell_middle[sistemKey == kullaniciKey ],
    table_dataCell_middle[1234],
    table_dataCell_middle[9876],
    table_dataCell_middle[*HAYIR*],
    table_dataCell_middle[*Giriş yapılamaz!*],
    table_dataCell_left[
      #text(size:9pt)[
      Sistemde bulunan şifre ile kullanıcının girdiği şifre karşılaştırılır. Kullanıcı sisteme giremez!
      ]
      ],
    
    table_dataCell_middle[5],
    table_dataCell_middle[DUR],
    table_dataCell_middle[1234],
    table_dataCell_middle[9876],
    table_dataCell_middle[-],
    table_dataCell_middle[-],
    table_dataCell_left[Algoritma başarıyla sonlanır.],
  )


*Elle Çalışma Tablosu* \
*Örnek Girdiler:* sistemKey=1234, kullaniciKey=1234, *Beklenen Çıktı:* Sisteme Girer

#table(
  columns: (0.7cm, 3.4cm, 1.4cm, 1.4cm, 2.5cm, 2.2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Ad],
    table_headerCell[İşlem],
    table_headerCell[sistem Key],
    table_headerCell[kullanici Key],
    table_headerCell[Koşul\ sistemKey == kullaniciKey],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

  table_dataCell_middle[1],
  table_dataCell_middle[BAŞLA],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başlar.],

  table_dataCell_middle[2],
  table_dataCell_middle[sistemKey = 1234],
  table_dataCell_middle[*1234*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kodun içinde sistem şifresi *sistemKey=1234* oluşturuldu],

  table_dataCell_middle[3],
  table_dataCell_middle[kullaniciKey = 1234 Gir],
  table_dataCell_middle[1234],
  table_dataCell_middle[*1234*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kullanıcıdan *kullaniciKey=1234* değeri alındı.],

  table_dataCell_middle[4],
  table_dataCell_middle[sistemKey == kullaniciKey ],
  table_dataCell_middle[1234],
  table_dataCell_middle[1234],
  table_dataCell_middle[*EVET*],
  table_dataCell_middle[*Giriş yapılır.*],
  table_dataCell_left[
    #text(size:9pt)[
    Sistemde bulunan şifre ile kullanıcının girdiği şifre karşılaştırılır. Kullanıcı sisteme girer.
    ]
    ],
  
  table_dataCell_middle[5],
  table_dataCell_middle[DUR],
  table_dataCell_middle[1234],
  table_dataCell_middle[1234],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başarıyla sonlanır.],
)


==== Örnek 2 Sıcaklık Kontrolü (Sayfa 28 Örnek 3)
Ortam sıcaklığı (*SICAKLIK*) 20 derecenin altına düştüğünde kombiyi çalıştıran, 20 derecenin üzerine çıktığında ise kombiyi durduran bir termostat programının sözde kodunu ve elle çalıştırma tablosunu hazırlayın.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: Sıcaklık değeri oku *SICAKLIK*
3. Adım: *EĞER SICAKLIK < 20*
          \ *EVET* ise "Kombi Çalıştır"
          \ *HAYIR* ise "Kombi Durdu"    
4. Adım: BİTİR

*Elle Çalışma Tablosu*\
*Örnek Girdiler:* SICAKLIK = 18, *Beklenen Çıktı:* Kombi Çalışır
#table(
  columns: (1.1cm, 3cm, 2cm, 3.5cm, 2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[SICAKLIK],
    table_headerCell[Koşul\ (SICAKLIK < 20)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

  table_dataCell_middle[1],
  table_dataCell_middle[BAŞLA],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başlar.],

  table_dataCell_middle[2],
  table_dataCell_middle[SICAKLIK oku],
  table_dataCell_middle[*18*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Ortamdaki sıcaklık değeri okunur, SICAKLIK değerine atanır],

  table_dataCell_middle[3],
  table_dataCell_middle[SICAKLIK < 20],
  table_dataCell_middle[18],
  table_dataCell_middle[*EVET*],
  table_dataCell_middle[*Kombi Çalışır!*],
  table_dataCell_left[Koşul Evet],

  table_dataCell_middle[4],
  table_dataCell_middle[DUR],
  table_dataCell_middle[18],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başarıyla sonlanır.],
)

*Örnek Girdiler:* SICAKLIK = 22, *Beklenen Çıktı:* Kombi Durur
#table(
  columns: (1.1cm, 3cm, 2cm, 3.5cm, 2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[SICAKLIK],
    table_headerCell[Koşul\ (SICAKLIK < 20)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

  table_dataCell_middle[1],
  table_dataCell_middle[BAŞLA],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başlar.],

  table_dataCell_middle[2],
  table_dataCell_middle[SICAKLIK oku],
  table_dataCell_middle[*20*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Ortamdaki sıcaklık değeri okunur, SICAKLIK değerine atanır],

  table_dataCell_middle[3],
  table_dataCell_middle[SICAKLIK < 20],
  table_dataCell_middle[20],
  table_dataCell_middle[*HAYIR*],
  table_dataCell_middle[*Kombi Durur!*],
  table_dataCell_left[Koşul Hayır],

  table_dataCell_middle[4],
  table_dataCell_middle[DUR],
  table_dataCell_middle[18],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başarıyla sonlanır.],
)

#pagebreak()
==== Örnek 3: Yaş Kontrolü ve Ehliyet Alabilme (Sayfa 25 Örnek 2)
Kullanıcıdan o günün yılını (*sistemYil*) ve kullanıcıdan doğum yılını (*dogumYil*) alarak kullanıcının 18 yaşından büyük olması durumunda "*Ehliyet Alır!*" küçük olması durumunda "*Ehliyet Almaz!*" yazısını ekrana yazdıran programın sözde kodunu ve elle çalışma tablosunu hazırlayınız.

*Sözde Kod*
1. Adım: BAŞLA.
2. Adım: Sistem Tarihi (*sistemYil*) değerini oku.
3. Adım: Kullanıcının Doğum Yılı (*dogumYil*) değerini oku.
4. Adım: *yas = sistemYil - dogumYil* işlemini yap.
5. Adım:  *Eğer yas >= 18* 
 \ *EVET* ise "*Ehliyet Alır!*" mesajını yazdır.   
  \ *HAYIR* ise "*Ehliyet Almaz!*" mesajını yazdır.
6. Adım: DUR.

*Elle Çalışma Tablosu*\
*Örnek Girdiler:* Sistem Tarihi (sistemYil) = 2026, Doğum Yılı (dogumYil) = 2005, *Beklenen Çıktı:* Ehliyet alabilirsiniz.
#table(
  columns: (1.1cm, 3.9cm, 1.3cm, 1.3cm, 1.2cm, 2.4cm, 1.4cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[#text(size:7pt)[sistemYil]],
    table_headerCell[#text(size:7pt)[dogumYil]],
    table_headerCell[yas],
    table_headerCell[Koşul\ (yas >= 18)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

   table_dataCell_middle[1],
   table_dataCell_middle[BAŞLA],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Algoritma başlar.],

   table_dataCell_middle[2],
   table_dataCell_middle[sistemYil oku],
   table_dataCell_middle[*2026*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Sistem tarihi alınır.],

   table_dataCell_middle[3],
   table_dataCell_middle[dogumYil oku],
   table_dataCell_middle[2026],
   table_dataCell_middle[*2005*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Kullanıcı 2005 sayısını girer.],

   table_dataCell_middle[4],
   table_dataCell_middle[#text(size:8pt)[yas =\sistemYil - dogumYil]],
   table_dataCell_middle[2026],
   table_dataCell_middle[2005],
   table_dataCell_middle[*21*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[2026 - 2005 = 21],

   table_dataCell_middle[5],
   table_dataCell_middle[yas >= 18],
   table_dataCell_middle[2026],
   table_dataCell_middle[2005],
   table_dataCell_middle[21],
   table_dataCell_middle[*Evet*],
   table_dataCell_middle[*Ehliyet Alır!*],
   table_dataCell_left[Koşul doğru $->$ mesaj yazdırılır.],

   table_dataCell_middle[6],
   table_dataCell_middle[DUR],
   table_dataCell_middle[2026],
   table_dataCell_middle[2005],
   table_dataCell_middle[21],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Algoritma başarıyla sonlanır.],
)

*Örnek Girdiler: * Sistem Tarihi (sistemYil) = 2026, Doğum Yılı (dogumYil) = 2010, *Beklenen Çıktı: * Ehliyet almak için henüz küçüksünüz.

#table(
  columns: (1.1cm, 3.9cm, 1.3cm, 1.3cm, 1.2cm, 2.4cm, 1.4cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[#text(size:7pt)[sistemYil]],
    table_headerCell[#text(size:7pt)[dogumYil]],
    table_headerCell[yas],
    table_headerCell[Koşul\ (yas >= 18)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

  table_dataCell_middle[1],
  table_dataCell_middle[BAŞLA],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başlar.],

  table_dataCell_middle[2],
  table_dataCell_middle[sistemYil oku],
  table_dataCell_middle[*2026*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Sistem tarihi alınır.],

  table_dataCell_middle[3],
  table_dataCell_middle[dogumYil oku],
  table_dataCell_middle[2026],
  table_dataCell_middle[*2010*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kullanıcı 2010 sayısını girer.],

  table_dataCell_middle[4],
  table_dataCell_middle[#text(size:8pt)[yas =\sistemYil - dogumYil]],
  table_dataCell_middle[2026],
  table_dataCell_middle[2010],
  table_dataCell_middle[*16*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[2026 - 2010 = 16],

  table_dataCell_middle[5],
  table_dataCell_middle[yas >= 18],
  table_dataCell_middle[2026],
  table_dataCell_middle[2010],
  table_dataCell_middle[16],
  table_dataCell_middle[*Hayır*],
  table_dataCell_middle[*Ehliyet Almaz!*],
  table_dataCell_left[Koşul yanlış $->$ mesaj yazdırılır.],

  table_dataCell_middle[6],
  table_dataCell_middle[DUR],
  table_dataCell_middle[2026],
  table_dataCell_middle[2010],
  table_dataCell_middle[16],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başarıyla sonlanır.],
)

#pagebreak()

#let flowgorithmYoutubeEgitim = "https://youtube.com/playlist?list=PL9A3J9niD78dSHTvHwow4QCkQqPmJNTcs"
#let flowgorithm = "http://www.flowgorithm.org"
#let thonny = "https://thonny.org/"
#let githubDersPdf = "https://tunapotur.github.io/2026-2027-9-Sinif-Programlamanin-Temelleri/2026_2027_9_programlamanin_temelleri.pdf"
#let githubDersPdfKisa = "kisa.link/hpYCg"

#v(2em)
==== Flowgorithm ve Thonny Uygulamaları
Derslerimizde kullanacağımız yazılımların kurulum bağlantılarına ve destekleyici eğitim videolarına yan taraftaki karekodları taratarak veya altlarındaki bağlantılara tıklayarak doğrudan erişebilirsiniz.

// breakable: false -> tablo iki sayfaya bölünmez, sığmazsa bütünüyle sonraki sayfaya geçer
#block(breakable: false)[
  #v(1em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Flowgorithm Programı*

      Algoritmik düşünme becerimizi geliştirmek ve tasarladığımız mantıksal adımları görselleştirmek için Flowgorithm yazılımını kullanacağız. Bu program sayesinde yazdığımız akış şemalarını adım adım çalıştırabilir, değişkenlerin değer değişimlerini anlık olarak izleyebilir ve algoritmalarımızı kod yazmadan önce test edebiliriz.
    ],
    kare-kod-hucresi([Flowgorithm Programı], flowgorithm, "flowgorithm.org"),
  )
]

#block(breakable: false)[
  #v(1em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Flowgorithm Youtube Eğitimi*

      Derste işlediğimiz konuları pekiştirmek ve kendi hızınızda pratik yapabilmeniz için Atilla Çetin tarafından hazırlanan Flowgorithm ile Algoritma ve Akış Diyagramları video serisinden yararlanabilirsiniz. Temel kavramlardan uygulamalı örneklere kadar uzanan bu oynatma listesine sağdaki karekodu okutarak veya bağlantıya tıklayarak ulaşabilirsiniz.
    ],
    kare-kod-hucresi([Youtube Eğitimi], flowgorithmYoutubeEgitim, "kisa.link/bHGEg"),
  )
]

#block(breakable: false)[
  #v(1em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Thonny IDE*

      Akış şemalarından kodlamaya geçerken, Python öğrenimi için özel olarak tasarlanmış Thonny IDE'yi kullanacağız. Sade arayüzü ve adım adım kod takibi sunan hata ayıklama (debug) özellikleriyle başlangıç seviyesine son derece uygundur. Dahili Python desteği sayesinde harici bir kurulum gerektirmez; yalnızca Thonny'yi kurarak kodlarınızı hemen çalıştırmaya başlayabilirsiniz.
    
    ],
    kare-kod-hucresi([Thonny], thonny, "thonny.org"),
  )
]

#block(breakable: false)[
  #v(2em)
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
     align: (top),
    [
      *Programlamanın Temelleri Ders Notları*

      Derslerimizde işlediğimiz konuları düzenli takip edebilmeniz ve tekrar yapabilmeniz için hazırladığım bu doküman; MEB'in 14 Eylül 2026 tarihli *'Programlamanın Temelleri 9'* müfredatını temel almaktadır. Konu anlatımları, akış şemaları ve örnek kod uygulamalarıyla ders içi kazanımları pekiştirmeyi amaçlayan kapsamlı bir çalışma kaynağıdır
    
    ],
    kare-kod-hucresi([Ders Notları], githubDersPdf, githubDersPdfKisa),
  )
]

#pagebreak()
==== Değişkenler ve Veri Tipleri
#bilgi-kutusu("DEĞİŞKEN NEDİR?")[
  Programın çalışması sırasında kullanıcıdan alınan, hesaplanan veya geçici olarak hafızada (RAM) tutulması gereken verileri saklayan isimlendirilmiş bellek alanlarıdır.
]

Flowgorithm üzerinde bir değişkeni kullanmadan önce mutlaka *Tanımlama (Declare)* adımıyla bilgisayara tanıtmak gerekir. Aynı türdeki birden fazla değişken aralarına virgül konularak tek seferde tanımlanabilir (Örn: `sistemYil, dogumYil, yas`).

===== Temel Veri Tipleri
Flowgorithm içerisinde en sık kullanılan 4 temel veri tipi bulunur:

#table(
  columns: (2.2cm, 2.5cm, 2.8cm, 1fr),
  stroke: table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Veri Tipi],
    table_headerCell[Türü],
    table_headerCell[Örnek Değerler],
    table_headerCell[Açıklama],
  ),

  table_dataCell_middle[*Tamsayı* \ (Integer)],
  table_dataCell_middle[Tam Sayı],
  table_dataCell_middle[`15`, `0`, `-8`, `2026`],
  table_dataCell_left[Küsüratsız, negatif veya pozitif tam sayı değerlerini tutar. Yaş, adet, sayaç gibi veriler için kullanılır.],

  table_dataCell_middle[*Reel* \ (Real / Float)],
  table_dataCell_middle[Ondalıklı Sayı],
  table_dataCell_middle[`3.14`, `18.5`, `-0.75`],
  table_dataCell_left[Kesirli veya ondalıklı sayıları tutar. Ortalama, boy, sıcaklık veya fiyat gibi hassas hesaplamalarda tercih edilir.],

  table_dataCell_middle[*String*],
  table_dataCell_middle[Metinsel Veri],
  table_dataCell_middle[`"Ahmet"`, `"1234"`, `"A"`],
  table_dataCell_left[Çift tırnak içinde yazılan her türlü yazı, harf, sembol ve rakamı saklar. *Matematiksel işlemlere girmez.*],

  table_dataCell_middle[*Boolean*],
  table_dataCell_middle[Mantıksal],
  table_dataCell_middle[`true(1)`, `false(0)`],
  table_dataCell_left[Yalnızca iki değerden birini alabilir: *Doğru (true(1))* ya da *Yanlış (false(0))*. Karar ve döngü kontrollerinde kullanılır.],
)

===== Değişken İsimlendirme Kuralları
Değişken tanımlarken programların hata vermemesi ve kodun düzenli olması için belirli kurallara uymak şarttır.

#block(breakable: false)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 4pt,
    align: (top, top),
    [
      *Türkçe Karakter Kullanımı*

Kodlama dillerinin ve yazılım araçlarının küresel standardı gereği, değişken isimlendirirken\ * Türkçe'ye özgü harfleri kullanmaktan kesinlikle kaçınınız!*.\
Aşağıdaki tabloda büyük ve küçük Türkçe karakterlerin yerine İngilizce alfabe karşılıkları tercih edilmelidir:
    ],
    [
      #table(
  columns: (2cm, 2cm, 2cm),
  stroke: table_Stroke,
  inset: 6pt,
  table.header(
    table_headerCell[Türkçe Karakter],
    table_headerCell[Doğru Kullanım],
    table_headerCell[İngilizce Karakte],
  ),
  table_dataCell_middle[*ç / Ç*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*c / C*],
  
  table_dataCell_middle[*ğ / Ğ*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*g / G*],
    
  table_dataCell_middle[*ı / İ*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*i / I*],
    
  table_dataCell_middle[*ö / Ö*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*o / O*],
    
  table_dataCell_middle[*ş / Ş*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*s / S*],
    
  table_dataCell_middle[*ü / Ü*],
  table_dataCell_middle[#sym.arrow.r],
  table_dataCell_middle[*u / U*],
)

    ],
  )
]

*Camel Case (Deve Notasyonu) Kuralı*

Değişken adları tanımlanırken kelimeler arasında **boşluk bırakılamaz**. Birden fazla kelimeden oluşan değişkenleri okunaklı kılmak için dünya çapında standart olan *camelCase* yöntemi kullanılır.\
*Kural:* İlk kelimenin tüm harfleri küçük başlar. Sonraki her kelimenin ilk harfi büyük yazılır (kelimelerin ortasındaki hörgüç görünümü gibi).

#table(
  columns: (4cm, 4cm, 1fr),
  stroke: table_Stroke,
  inset: 6pt,
  table.header(
    table_headerCell[Yanlış Biçim],
    table_headerCell[camelCase],
    table_headerCell[Açıklama],
  ),
  table_dataCell_middle[#text(fill: red)[`sistem yil`]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[`sistemYil`]],
  table_dataCell_left[Boşluk yerine birleşik yazılır],

  table_dataCell_middle[#text(fill: red)[`dogumyil`]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[`dogumYil`]],
  table_dataCell_left[İkinci kelimenin baş harfi büyük],

  table_dataCell_middle[#text(fill: red)[`ogrencinotortalamasi`]],
  table_dataCell_middle[#text(fill: green.darken(30%), weight: "extrabold")[`ogrenciNotOrtalamasi`]],
  table_dataCell_left[Okunabilirlik artırılır],
)




#pagebreak()
=== Akış Şeması (Flowchart) Sembolleri ve Görsel Modelleme
*Akış şeması(flowchat)*, bir algoritmanın adımlarını semboller ve oklarla gösteren görsel bir modeldir. Programın çalışma mantığını kolayca anlamayı ve kodlama öncesinde olası hataları fark etmeyi sağlar.

*Tablo 1.2:* Temel Akış Şeması Sembolleri, İşlevleri ve Günlük Hayat Karşılıkları.
#table(
  columns: (3cm, 3.2cm, 1fr, 1fr),
  stroke: table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Sembol],
    table_headerCell[Adı],
    table_headerCell[İşlevi],
    table_headerCell[Günlük Hayat Karşılığı],
  ),

  table_dataCell_middle[#terminal-sembolu],
  table_dataCell_middle[Oval \ (Terminal)],
  table_dataCell_left[Algoritmanın başlangıcını ve bitişini temsil eder.],
  table_dataCell_left[Bir işe başlama veya sonlandırma anıdır.],

  table_dataCell_middle[#giris-cikis-sembolu],
  table_dataCell_middle[Paralelkenar\ (Giriş / Çıkış)],
  table_dataCell_left[#text(size: 8pt)[Kullanıcıdan veri alınacağını veya ekrana bilgi yazdırılacağını belirtir.]],
  table_dataCell_left[Soru sormak veya cevap vermek içindir.],

  table_dataCell_middle[#islem-sembolu],
  table_dataCell_middle[Dikdörtgen\ (İşlem)],
  table_dataCell_left[#text(size: 8pt)[Matematiksel hesaplamalar ve değişken atamaları için kullanılır.]],
  table_dataCell_left[Bir eylemi gerçekleştirmek içindir.],

  table_dataCell_middle[#karar-sembolu],
  table_dataCell_middle[Eşkenar Dörtgen \(Karar)],
  table_dataCell_left[Bir koşulun kontrol edildiği noktadır. Sonuca göre akış Evet veya Hayır yönünde ilerler.],
  table_dataCell_left[Yol ayrımında karar vermek içindir.],

  table_dataCell_middle[#akis-sembolu],
  table_dataCell_middle[Oklar\ (Akış Yönü)],
  table_dataCell_left[Adımlar arasındaki ilerleme yönünü gösterir.],
  table_dataCell_left[İzlenecek yolu gösteren oklardır.],
)


#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [

==== Örnek 1: İki Sayının Toplamını Bulma (Sayfa 25 Örnek 1)
Kullanıcı tarafından girilen iki sayının toplamını bulan örneğin akış şemasını (flowchart) çiziniz.\
Birinci ve ikinci sayı ve toplam için sırasıyla *s1*, *s2*, *toplam* değişkenleri kullanılacak.

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 70%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı s1, s2, toplam]),
    cikti((0, 2), [Çıktı "Birinci Sayıyı Giriniz: "], width: 140pt),
    girdi((0, 3), [Giriş s1]),
    cikti((0, 4), [Çıktı "İkinci Sayıyı Giriniz: "], width: 140pt),
    girdi((0, 5), [Giriş s2]),
    islem((0, 6), [toplam = s1+s2]),
    cikti((0, 7), [Çıktı "İşleminizin Sonucu: "&toplam], width: 180pt),
    baslangic((0, 8), [Son]),

    // Oklar
    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
    ],
    [
      ==== Örnek 2: İki Sayının Ortalamasını Bulma
Kullanıcı tarafından girilen iki sayının ortalamasını bulan örneğin akış şemasını(flowchat) çiziniz.\
Birinci ve ikinci sayı ve ortalama için sırasıyla *s1*, *s2*, *ortalama* değişkenleri kullanılacak.\
      
Ortalama hesabı: 
#text(size: 12pt, weight: "semibold")[
  `ortalama = (s1 + s2) / 2`
]

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (0pt, 12pt),
    edge-stroke: 1pt,
    mark-scale: 70%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı s1, s2]),
    islem((0, 2), [Reel ortalama]),
    cikti((0, 3), [Çıktı "Birinci Sayıyı Giriniz: "], width: 140pt),
    girdi((0, 4), [Giriş s1]),
    cikti((0, 5), [Çıktı "İkinci Sayıyı Giriniz: "], width: 140pt),
    girdi((0, 6), [Giriş s2]),
    islem((0, 7), [ortalama = (s1+s2) / 2]),
    cikti((0, 8), [Çıktı "İşleminizin Sonucu: "&ortalama], width: 200pt),
    baslangic((0, 9), [Son]),
    // Oklar
    ..range(9).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
    ]
  )
]

==== Örnek Çalışma Soruları
+ Yaş Hesaplama: Kullanıcıdan doğum yılını ve mevcut yılı alıp yaşını hesaplayan ve ekrana yazdıran akış şemasını çiziniz.
+ Kare Alan ve Çevre: Bir kenar uzunluğu kullanıcıdan girilen karenin alanını ve çevresini hesaplayıp ekrana yazdıran akış şemasını çiziniz.
+ KDV Hesaplama: Fiyatı girilen bir ürünün %20 KDV tutarını ve KDV dahil toplam satış fiyatını hesaplayıp ekrana yazdıran akış şemasını çiziniz.
+ Birim Dönüşümü (Sıcaklık): Kullanıcıdan Celsius cinsinden sıcaklık değerini alıp Fahrenheit değerine çeviren (F = C \*1.8 + 32) ve sonucu gösteren akış şemasını çiziniz.
+ Taksi Ücreti Hesaplama: Taksimetre açılış ücreti 30 TL, kilometre başına ücret 20 TL olan bir şehirde; gidilen kilometre bilgisini kullanıcıdan alıp ödenecek toplam tutarı hesaplayıp yazdıran akış şemasını çiziniz.

#v(1em)
==== Karar Yapıları
Karar yapıları, programın bir koşulu kontrol ederek hangi adımı izleyeceğini belirler. Akış şemasında eşkenar dörtgen ile gösterilir. Koşul doğruysa bir yola, yanlışsa başka bir yola devam edilir. Altta ki şemada görüldüğü gibi eğer işlemi ile yapılan kontrolün sonunda kod doğru ya da yanlış ihtimale doğru hareket edecektir.

#align(center)[
  #diagram(
    spacing: (40pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    // Düğümler (sütun 0: Yanlış, sütun 1: orta, sütun 2: Doğru)
    
    cikti((1, 1), [Karardan önce ki kodlar...]),
    karar((1, 2), [Eğer]),
    girdi((0, 3), [Koşul işlemi sonucu *YANLIŞ* olursa çalışacak kodlar...]),
    girdi((2, 3), [Koşul işlemi sonucu *DOĞRU* olursa çalışacak kodlar...]),
    birlesim((1, 4)),
    girdi((1, 5), [Programın devam eden kodları...]),
    

    // Oklar
    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (0, 2), (0, 3), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 2), (2, 2), (2, 3), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 3), (0, 4), (1, 4), "-|>"),
    edge((2, 3), (2, 4), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (1, 6), "-|>"),
  )
]
#pagebreak()

==== Örnek 3 Sıcaklık Kontrolü

Ortam sıcaklığı (*SICAKLIK*) 20 derecenin altına düştüğünde kombiyi çalıştıran, 20 derecenin üzerine çıktığında ise kombiyi durduran bir termostat programının akış şemasını hazırlayın.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: Sıcaklık değeri oku *SICAKLIK*
3. Adım: *EĞER SICAKLIK < 20*
          \ *EVET* ise "Kombi Çalıştır"
          \ *HAYIR* ise "Kombi Durdu"    
4. Adım: BİTİR

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (40pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    // Düğümler (Sütun 0: Yanlış, Sütun 1: Orta Omurga, Sütun 2: Doğru)
    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel SICAKLIK], width: 110pt),
    cikti((1, 2), [Çıktı "Sıcaklık Değerini Giriniz: "], width: 160pt),
    girdi((1, 3), [Giriş SICAKLIK], width: 110pt),
    karar((1, 4), [SICAKLIK < 20], width: 115pt),
    cikti((0, 5), [Çıktı "Kombi DURDUR!"], width: 135pt),
    cikti((2, 5), [Çıktı "Kombi Çalıştır"], width: 130pt),
    birlesim((1, 6)),
    baslangic((1, 7), [Son]),

    // Orta omurga iniş okları
    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),

    // Karar dalları (Görselde: Sol -> Yanlış, Sağ -> Doğru)
    edge((1, 4), (0, 4), (0, 5), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 4), (2, 4), (2, 5), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),

    // Birleşme noktası ve bitiş
    edge((0, 5), (0, 6), (1, 6), "-|>"),
    edge((2, 5), (2, 6), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),
  )
]

#pagebreak()
==== Örnek 4 Hatalı Giriş Kontrolü Algoritması
Kullanıcının önceden belirlediği bir şifre ile sisteme girişini kontrol eden programının akış şemasını hazırlayın. Sistem şifresi için *sistemKey*, kullanıcı şifresi için *kullaniciKey* kullanılacak.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: *sistemKey = 1234*
3. Adım: kullanıcıdan (*kullaniciKey*) değerini al
4. Adım: *EĞER sistemKey == kullaniciKey*
          \ *EVET* ise "Sisteme Girer"
          \ *HAYIR* ise "Sisteme Giremez!"    
5. Adım: BİTİR

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (40pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    // Düğümler (sütun 0: Yanlış, sütun 1: orta, sütun 2: Doğru)
    baslangic((1, 0), [Ana]),
    islem((1, 1), [String sistemKey, kullaniciKey]),
    islem((1, 2), [sistemKey = "1234"]),
    cikti((1, 3), [Çıktı "Şifrenizi Giriniz: "]),
    girdi((1, 4), [Giriş kullaniciKey]),
    karar((1, 5), [sistemKey == kullaniciKey], width:135pt),
    cikti((0, 6), [Çıktı "Sisteme GİREMEZ!"]),
    cikti((2, 6), [Çıktı "Sisteme Girer"]),
    birlesim((1, 7)),
    baslangic((1, 8), [Son]),

    // Oklar
    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (0, 5), (0, 6), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 5), (2, 5), (2, 6), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 6), (0, 7), (1, 7), "-|>"),
    edge((2, 6), (2, 7), (1, 7), "-|>"),
    edge((1, 7), (1, 8), "-|>"),
  )
]

#pagebreak()
==== Örnek 5: Yaş Kontrolü ve Ehliyet Alabilme
Kullanıcıdan o günün yılını (*sistemYil*) ve kullanıcıdan doğum yılını (*dogumYil*) alarak kullanıcının 18 yaşından büyük olması durumunda "*Ehliyet Alır!*" küçük olması durumunda "*Ehliyet Almaz!*" yazısını ekrana yazdıran programın sözde kodunu ve elle çalışma tablosunu hazırlayınız.

*Sözde Kod*
2. Adım: Sistem Tarihi (*sistemYil*) değerini oku.
3. Adım: Kullanıcının Doğum Yılı (*dogumYil*) değerini oku.
4. Adım: *yas = sistemYil - dogumYil* işlemini yap.
5. Adım:  *Eğer yas >= 18* 
 \ *EVET* ise "*Ehliyet Alır!*" mesajını yazdır.   
  \ *HAYIR* ise "*Ehliyet Almaz!*" mesajını yazdır.

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (20pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    // Düğümler (sütun 0: Yanlış, sütun 1: orta, sütun 2: Doğru)
    baslangic((1, 0), [Ana]),
    islem((1, 1), [Tamsayı sistemYil, dogumYil, yas],width:180pt),
    cikti((1, 2), [Çıktı "Şu an ki yılı girin: "], width: 140pt),
    girdi((1, 3), [Giriş sistemYil]),
    cikti((1, 4), [Çıktı "Doğum yılınızı girin: "], width:140pt),
    girdi((1, 5), [Giriş dogumYil]),
    islem((1, 6), [yas = sistemYil-dogumYil], width:140pt),
    cikti((1, 7), [Çıktı "Yaş :"&yas]),
    karar((1, 8), [yas >= 18], width:90pt),
    cikti((0, 9), [Çıktı "Ehliyet ALMAZ!"]),
    cikti((2, 9), [Çıktı "Ehliyet Alır"]),
    birlesim((1, 10)),
    baslangic((1, 11), [Son]),

    // Oklar: Ana'dan karar kutusuna kadar düz aşağı
    ..range(8).map(i => edge((1, i), (1, i + 1), "-|>")),

    // Karar dalları
    edge((1, 8), (0, 8), (0, 9), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 8), (2, 8), (2, 9), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),

    // Birleşim ve son
    edge((0, 9), (0, 10), (1, 10), "-|>"),
    edge((2, 9), (2, 10), (1, 10), "-|>"),
    edge((1, 10), (1, 11), "-|>"),
  )
]

==== Örnek Çalışma Soruları Karar Yapıları
+ Akıllı Bahçe Sulama Sistemi (Sensör ve Eşik Değeri Mantığı): Bir seradaki toprak nem oranı sensöründen gelen değer *nem* değişkeninde tutulmaktadır.
  - Nem oranı 30'un altına düştüğünde sulama vanasını açan (*"Sulama Başlatıldı"*),
  - 30 veya üzerinde olduğunda ise sulama vanasını kapatan (*"Sulama Durduruldu"*) programın akış şemasını çiziniz.

+ Bakiye ve Ödeme Kontrolü (İki Değişkeni Karşılaştırma): Bir online alışveriş sisteminde kullanıcının mevcut hesap bakiyesi *bakiye*, satın almak istediği sepet tutarı ise *sepet* değişkenidir.
  - Eğer *bakiye* değeri *sepet* tutarına eşit veya büyükse ekrana *"Ödeme Başarılı"* yazdıran ve kalan yeni bakiyeyi ekranda gösteren,
  - Yetersiz ise ekrana *"Yetersiz Bakiye"* uyarısı veren programın akış şemasını çiziniz.

+ Bir öğrencinin vize ve final notunu kullanıcıdan alarak, öğrencinin not ortalamasını hesaplayan programın akış şemasını çizin.
  - Ortalama formülü: ortalama = (vize * 0.4) + (final * 0.6)
  - Eğer ortalama değeri 50 veya üzerinde ise ekrana *"Geçti"*, 50'nin altında ise *"Kaldı"* yazdırılacak

+ Web sitesi kargo ücreti hesaplama;
  - Sipariş tutarı 500 TL veya üzerinde ise kargo ücretsizdir
  - Sipariş tutarı 500 TL'nin altında ise 50 TL kargo ücreti eklenmektedir. 
  Kullanıcıya son ödenecek toplam tutarı ekrana yazdıran programın akış şemasını hazırlayınız.

+ Kullanıcıdan bir tamsayı (*sayi*) girmesini isteyen, girilen sayının 0'dan büyük olması durumunda ekrana *"Pozitif Sayı"*, 0'dan küçük olması durumunda *"Negatif Sayı"* yazdıran programın akış şemasını hazırlayın.


#text(size:8pt)[
#align(center)[#text(size:16pt, weight: "bold")[Çalışma Sorularının Cevapları]]

*1.2.2.3. Örnek Çalışma Soruları*

#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
1.Doğum Yılı
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    // Düğümler
    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı gunumuzYili, dogumYili, yas], width: 150pt),
    cikti((0, 2), [Çıktı "Günümüz Yılını Girin: "], width: 120pt),
    girdi((0, 3), [Giriş gunumuzYili], width: 90pt),
    cikti((0, 4), [Çıktı "Doğum Yılını Girin: "], width: 120pt),
    girdi((0, 5), [Giriş dogumYili], width: 90pt),
    islem((0, 6), [yas = gunumuzYili - dogumYili], width: 130pt),
    cikti((0, 7), [Çıktı "Yaş :" & yas], width: 120pt),
    baslangic((0, 8), [Son]),

    // Bağlantı Okları
    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
    ],
    [
2.Kare Alan Çevre 
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel kenar, alan, cevre], width: 100pt),
    cikti((0, 2), [Çıktı "Karenin Bir Kenar Uzunluğunu Girin: "], width: 180pt),
    girdi((0, 3), [Giriş kenar], width: 90pt),
    islem((0, 4), [alan = kenar \* kenar], width: 130pt),
    islem((0, 5), [cevre = kenar \* 4], width: 120pt),
    cikti((0, 6), [Çıktı "Karenin Alanı: " & alan], width: 160pt),
    cikti((0, 7), [Çıktı "Karenin Çevresi: " & cevre], width: 160pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
    ]
  )
]

#v(2em)
#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
3.Urun KDV'li Fiyat
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel urunFiyat, kdvOran, kdvTutar, toplam], width: 220pt),
    islem((0, 2), [kdvOran = 0.20], width: 110pt),
    cikti((0, 3), [Çıktı "Ürün Fiyatını Giriniz: "], width: 160pt),
    girdi((0, 4), [Giriş urunFiyat], width: 100pt),
    islem((0, 5), [kdvTutar = urunFiyat \* kdvOran], width: 180pt),
    cikti((0, 6), [Çıktı "Ürün Kdv Tutar: " & kdvTutar], width: 170pt),
    islem((0, 7), [toplam = urunFiyat + kdvTutar], width: 180pt),
    cikti((0, 8), [Çıktı "Ürün Toplam Fiyat: " & toplam], width: 180pt),
    baslangic((0, 9), [Son]),

    ..range(9).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
    ],
    [
4.Celsius, Fahrenheit Dönüşümü
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel c, f], width: 90pt),
    cikti((0, 2), [Çıktı "Celsius :"], width: 110pt),
    girdi((0, 3), [Giriş c], width: 80pt),
    islem((0, 4), [f = c \* 1.8 + 32], width: 130pt),
    cikti((0, 5), [Çıktı "Fahrenheit :" & f], width: 140pt),
    baslangic((0, 6), [Son]),

    ..range(6).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

    ]
  )
]

5.Taksimerte Açlış, Taksi Tutarı
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel taksiMetreAcilisTutar, kilometreBasiTutar, \ kilometreYol, odenecekTutar], width: 185pt),
    islem((0, 2), [taksiMetreAcilisTutar = 30], width: 120pt),
    islem((0, 3), [kilometreBasiTutar = 20], width: 110pt),
    cikti((0, 4), [Çıktı "Gidilen Kilometre :"], width: 110pt),
    girdi((0, 5), [Giriş kilometreYol], width: 90pt),
    islem((0, 6), [odenecekTutar = taksimetreAcilisTutar + \ kilometreYol \* kilometreBasiTutar], width: 160pt),
    cikti((0, 7), [Çıktı "Ödenecek Tutar :" & odenecekTutar], width: 170pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

#pagebreak()
*1.2.2.8. Örnek Çalışma Soruları Karar Yapıları*
1. Akıllı Bahçe Sulama Sistemi
#align(center)[
  #diagram(
    spacing: (1pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 65%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel nem], width: 80pt),
    cikti((1, 2), [Çıktı "Sıcaklık Değerini Giriniz: "], width: 130pt),
    girdi((1, 3), [Giriş nem], width: 80pt),
    karar((1, 4), [nem > 30], width: 50pt, height:30pt),
    cikti((0, 5), [Çıktı "Sulama Başlatıldı"], width: 120pt),
    cikti((2, 5), [Çıktı "Sulama Durduruldu!"], width: 120pt),
    birlesim((1, 6)),
    baslangic((1, 7), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (0, 4), (0, 5), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 4), (2, 4), (2, 5), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 5), (0, 6), (1, 6), "-|>"),
    edge((2, 5), (2, 6), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),
  )
]

2. Bakiye ve Ödeme Kontrolü
#align(center)[
  #diagram(
    spacing: (15pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel bakiye, sepet, kalanBakiye], width: 170pt),
    islem((1, 2), [kalanBakiye = 0], width: 100pt),
    cikti((1, 3), [Çıktı "Bakiye Değerini Girin: "], width: 150pt),
    girdi((1, 4), [Giriş bakiye], width: 90pt),
    cikti((1, 5), [Çıktı "Sepet Tutarını Girin: "], width: 150pt),
    girdi((1, 6), [Giriş sepet], width: 90pt),
    karar((1, 7), [bakiye >= sepet], width: 110pt),

    // Yanlış kolu (Sol)
    cikti((0, 8), [Çıktı "Yetersiz Bakiye"], width: 80pt),

    // Doğru kolu (Sağ)
    islem((2, 8), [kalanBakiye = bakiye - sepet], width: 155pt),
    cikti((2, 9), [Çıktı "Ödeme Başarılı. Kalan Bakiye :" & kalanBakiye], width: 150pt),

    birlesim((1, 10)),
    baslangic((1, 11), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),

    edge((1, 7), (0, 7), (0, 8), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((0, 8), (0, 10), (1, 10), "-|>"),

    edge((1, 7), (2, 7), (2, 8), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((2, 8), (2, 9), "-|>"),
    edge((2, 9), (2, 10), (1, 10), "-|>"),

    edge((1, 10), (1, 11), "-|>"),
  )
]

#pagebreak()
3. Vize ve final notunu
#align(center)[
  #diagram(
    spacing: (1pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 55%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel vize, final, ortalama], width: 150pt),
    cikti((1, 2), [Çıktı "Vize Notunu Girin: "], width: 140pt),
    girdi((1, 3), [Giriş vize], width: 85pt),
    cikti((1, 4), [Çıktı "Final Notunu Girin :"], width: 140pt),
    girdi((1, 5), [Giriş final], width: 85pt),
    islem((1, 6), [ortalama = vize \* 0.4 + final \* 0.6], width: 160pt),
    karar((1, 7), [ortalama >= 50], width: 70pt, height:25pt),
    cikti((0, 8), text(size:7pt)[Çıktı "Kaldınız! Ortalamanız: " & ortalama], width: 150pt),
    cikti((2, 8), text(size:7pt)[Çıktı "Geçtiniz Tebrikler! Ortalamanız: " & ortalama], width: 180pt),
    birlesim((1, 9)),
    baslangic((1, 10), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),
    edge((1, 7), (0, 7), (0, 8), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 7), (2, 7), (2, 8), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 8), (0, 9), (1, 9), "-|>"),
    edge((2, 8), (2, 9), (1, 9), "-|>"),
    edge((1, 9), (1, 10), "-|>"),
  )
]

4. Web sitesi kargo ücreti hesaplama
#align(center)[
  #diagram(
    spacing: (20pt, 14pt),
    edge-stroke: 1pt,
    mark-scale: 65%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel siparisTutar, kargoTutar, toplam], width: 195pt),
    cikti((1, 2), [Çıktı "Sipariş Tutarınızı Giriniz: "], width: 165pt),
    girdi((1, 3), [Giriş siparisTutar], width: 115pt),
    islem((1, 4), [kargoTutar = 50], width: 105pt),
    karar((1, 5), [siparisTutar >= 500], width: 90pt, height:30pt),
    islem((2, 6), [kargoTutar = 0], width: 100pt),
    birlesim((1, 7)),
    islem((1, 8), [toplam = siparisTutar + kargoTutar], width: 185pt),
    cikti((1, 9), [Çıktı "Sipariş Bedeli: " & toplam], width: 155pt),
    baslangic((1, 10), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (0, 5), (0, 7), (1, 7), "-|>", label: [Yanlış], label-pos: 0.25, label-side: right),
    edge((1, 5), (2, 5), (2, 6), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 6), (2, 7), (1, 7), "-|>"),
    edge((1, 7), (1, 8), "-|>"),
    edge((1, 8), (1, 9), "-|>"),
    edge((1, 9), (1, 10), "-|>"),
  )
]

#pagebreak()
5. Pozitif Negatif
#align(center)[
  #diagram(
    spacing: (1pt, 22pt),
    edge-stroke: 1pt,
    mark-scale: 85%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Tamsayı sayi], width: 90pt),
    cikti((1, 2), [Çıktı "Bir Tamsayı Giriniz"], width: 140pt),
    girdi((1, 3), [Giriş sayi], width: 85pt),
    karar((1, 4), [sayi == 0], width: 90pt),

    // sayi == 0 Doğru
    cikti((2, 5), [Çıktı sayi & " Sayısı Girildi!"], width: 140pt),

    // sayi == 0 Yanlış -> İç Karar
    karar((0, 5), [sayi > 0], width: 85pt),
    cikti((-1, 6), [Çıktı sayi & " Sayısı Negatif Bir Sayıdır"], width: 150pt),
    cikti((1, 6), [Çıktı sayi & " Sayısı Pozitif Bir Sayıdır"], width: 150pt),
    birlesim((0, 7)),

    birlesim((1, 8)),
    baslangic((1, 9), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),

    // Dış Karar
    edge((1, 4), (2, 4), (2, 5), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((2, 5), (2, 8), (1, 8), "-|>"),

    edge((1, 4), (0, 4), (0, 5), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),

    // İç Karar
    edge((0, 5), (-1, 5), (-1, 6), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((0, 5), (1, 5), (1, 6), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((-1, 6), (-1, 7), (0, 7), "-|>"),
    edge((1, 6), (1, 7), (0, 7), "-|>"),

    edge((0, 7), (0, 8), (1, 8), "-|>"),
    edge((1, 8), (1, 9), "-|>"),
  )
]

]
