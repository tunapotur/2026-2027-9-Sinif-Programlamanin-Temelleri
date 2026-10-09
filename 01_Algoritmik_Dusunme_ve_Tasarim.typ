#import "template.typ": *
#import "flowchart.typ": *
#import "qr_code.typ": *

#set document(title: "2026-2027 9. Sınıf Programlamanın Temelleri")

#show: conf

#title()

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

==== Örnek 1 Hatalı Giriş Kontrolü Algoritması (Sayfa 28 Örnek 4)


Kullanıcının önceden belirlediği bir şifre ile sisteme girişini kontrol eden programının sözde kodunu ve elle çalıştırma tablosunu hazırlayın. Sistem şifresi için *s_key*, kullanıcı şifresi için *k_pass* kullanılacak.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: *s_key = 1234*
3. Adım: kullanıcıdan (*k_pass*) değerini al
4. Adım: *EĞER s_key == k_pass*
          \ *EVET* ise "Sisteme Girer"
          \ *HAYIR* ise "Sisteme Giremez!"    
5. Adım: BİTİR

*Elle Çalışma Tablosu* \
*Örnek Girdiler:* s_key=1234, k_pass=9876, *Beklenen Çıktı:* Sisteme Giremez

#table(
  columns: (0.7cm, 3.4cm, 1.4cm, 1.4cm, 3.2cm, 2.2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Ad],
    table_headerCell[İşlem],
    table_headerCell[s_key],
    table_headerCell[k_pass],
    table_headerCell[Koşul\ s_key == k_pass],
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
  table_dataCell_middle[s_key = 1234],
  table_dataCell_middle[*1234*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kodun içinde sistem şifresi *s_key=1234* oluşturuldu],

  table_dataCell_middle[3],
  table_dataCell_middle[k_pass = 9876 Gir],
  table_dataCell_middle[1234],
  table_dataCell_middle[*9876*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kullanıcıdan *k_pass=9876* değeri alındı.],

  table_dataCell_middle[4],
  table_dataCell_middle[s_key == k_pass ],
  table_dataCell_middle[1234],
  table_dataCell_middle[9876],
  table_dataCell_middle[*HAYIR*],
  table_dataCell_middle[*Giriş yapılamaz!*],
  table_dataCell_left[Sistemde bulunan şifre ile kullanıcının girdiği şifre karşılaştırılır. Kullanıcı sisteme giremez!],
  
  table_dataCell_middle[5],
  table_dataCell_middle[DUR],
  table_dataCell_middle[1234],
  table_dataCell_middle[9876],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Algoritma başarıyla sonlanır.],
)

#pagebreak()

*Elle Çalışma Tablosu* \
*Örnek Girdiler:* s_key=1234, k_pass=1234, *Beklenen Çıktı:* Sisteme Girer

#table(
  columns: (0.7cm, 3.4cm, 1.4cm, 1.4cm, 3.2cm, 2.2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Ad],
    table_headerCell[İşlem],
    table_headerCell[s_key],
    table_headerCell[k_pass],
    table_headerCell[Koşul\ s_key == k_pass],
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
  table_dataCell_middle[s_key = 1234],
  table_dataCell_middle[*1234*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kodun içinde sistem şifresi *s_key=1234* oluşturuldu],

  table_dataCell_middle[3],
  table_dataCell_middle[k_pass = 1234 Gir],
  table_dataCell_middle[1234],
  table_dataCell_middle[*1234*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kullanıcıdan *k_pass=1234* değeri alındı.],

  table_dataCell_middle[4],
  table_dataCell_middle[s_key == k_pass ],
  table_dataCell_middle[1234],
  table_dataCell_middle[1234],
  table_dataCell_middle[*EVET*],
  table_dataCell_middle[*Giriş yapılır.*],
  table_dataCell_left[Sistemde bulunan şifre ile kullanıcının girdiği şifre karşılaştırılır. Kullanıcı sisteme girer.],
  
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

#pagebreak()

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

==== Örnek 3: Yaş Kontrolü ve Ehliyet Alabilme (Sayfa 25 Örnek 2)
Kullanıcıdan o günün yılını (*ST*) ve kullanıcıdan doğum yılını (*DY*) alarak kullanıcının 18 yaşından büyük olması durumunda "*Ehliyet Alır!*" küçük olması durumunda "*Ehliyet Almaz!*" yazısını ekrana yazdıran programın sözde kodunu ve elle çalışma tablosunu hazırlayınız.

*Sözde Kod*
1. Adım: BAŞLA.
2. Adım: Sistem Tarihi (*ST*) değerini oku.
3. Adım: Kullanıcının Doğum Yılı (*DY*) değerini oku.
4. Adım: *Yaş = ST - DY* işlemini yap.
5. Adım:  *Eğer Yaş >= 18* 
 \ *EVET* ise "*Ehliyet Alır!*" mesajını yazdır.   
  \ *HAYIR* ise "*Ehliyet Almaz!*" mesajını yazdır.
6. Adım: DUR.


*Elle Çalışma Tablosu*\
*Örnek Girdiler:* Sistem Tarihi (ST) = 2026, Doğum Yılı (DY) = 2005, *Beklenen Çıktı:* Ehliyet alabilirsiniz.
#table(
  columns: (1.1cm, 2.75cm, 1.2cm, 1.2cm, 1.2cm, 2.5cm, 2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[ST],
    table_headerCell[DY],
    table_headerCell[Yaş],
    table_headerCell[Koşul\ (Yaş >= 18)],
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
   table_dataCell_middle[ST oku],
   table_dataCell_middle[*2026*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Sistem tarihi alınır.],

   table_dataCell_middle[3],
   table_dataCell_middle[DY oku],
   table_dataCell_middle[2026],
   table_dataCell_middle[*2005*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[Kullanıcı 2005 sayısını girer.],

   table_dataCell_middle[4],
   table_dataCell_middle[Yaş = ST - DY],
   table_dataCell_middle[2026],
   table_dataCell_middle[2005],
   table_dataCell_middle[*21*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_left[2026 - 2005 = 21],

   table_dataCell_middle[5],
   table_dataCell_middle[Yaş >= 18],
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

#pagebreak()

*Örnek Girdiler: * Sistem Tarihi (ST) = 2026, Doğum Yılı (DY) = 2010, *Beklenen Çıktı: * Ehliyet almak için henüz küçüksünüz.

#table(
  columns: (1.1cm, 2.75cm, 1.2cm, 1.2cm, 1.2cm, 2.5cm, 2cm, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[ST],
    table_headerCell[DY],
    table_headerCell[Yaş],
    table_headerCell[Koşul\ (Yaş >= 18)],
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
  table_dataCell_middle[ST oku],
  table_dataCell_middle[*2026*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Sistem tarihi alınır.],

  table_dataCell_middle[3],
  table_dataCell_middle[DY oku],
  table_dataCell_middle[2026],
  table_dataCell_middle[*2010*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[Kullanıcı 2010 sayısını girer.],

  table_dataCell_middle[4],
  table_dataCell_middle[Yaş = ST - DY],
  table_dataCell_middle[2026],
  table_dataCell_middle[2010],
  table_dataCell_middle[*16*],
  table_dataCell_middle[-],
  table_dataCell_middle[-],
  table_dataCell_left[2026 - 2010 = 16],

  table_dataCell_middle[5],
  table_dataCell_middle[Yaş >= 18],
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

=== Akış Şeması (Flowchart) Sembolleri ve Görsel Modelleme
*Akış şeması(flowchat)*, bir algoritmanın adımlarını standart semboller ve oklarla gösteren görsel bir modeldir. Programın çalışma mantığını kolayca anlamayı ve kodlama öncesinde olası hataları fark etmeyi sağlar.

*Tablo 1.2:* Temel Akış Şeması Sembolleri, İşlevleri ve Günlük Hayat Karşılıkları.
#table(
  columns: (3cm, 3.5cm, 1fr, 1fr),
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
  table_dataCell_left[Algoritmanın başlangıcını ve bitişini temsil eder. İçine *BAŞLA* veya *DUR* yazılır.],
  table_dataCell_left[Bir işe başlama veya sonlandırma anıdır.],

  table_dataCell_middle[#giris-cikis-sembolu],
  table_dataCell_middle[Paralelkenar\ (Giriş / Çıkış)],
  table_dataCell_left[Kullanıcıdan veri alınacağını veya ekrana bilgi yazdırılacağını belirtir.],
  table_dataCell_left[Soru sormak veya cevap vermek içindir.],

  table_dataCell_middle[#islem-sembolu],
  table_dataCell_middle[Dikdörtgen\ (İşlem)],
  table_dataCell_left[Matematiksel hesaplamalar ve değişken atamaları için kullanılır.],
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

#let playlist = "https://youtube.com/playlist?list=PL9A3J9niD78dSHTvHwow4QCkQqPmJNTcs"
#let flowgorithm = "http://www.flowgorithm.org"

// breakable: false -> tablo iki sayfaya bölünmez, sığmazsa bütünüyle sonraki sayfaya geçer
#block(breakable: false)[
  #v(1em)
  *Flowgorithm Programı*
  #grid(
    columns: (3fr, 1fr, 1fr),
    gutter: 10pt,
     align: (horizon, top, top),
    [
      Derslerimizde *Flowgorithm* programının kullanarak akış şemalarını oluşturacağız.
      Flowgorithm programının web sitesine ve Atilla Çetin isimli kullanıcının hazırladığı *Flowgorithm ile Algoritma ve Akış Diyagramları* oynatım listesine yandaki kare kodlar ya da linkler üzerinden ulaşabilirsiniz.
    ],
    kare-kod-hucresi([Flowgorithm Programı], flowgorithm, "flowgorithm.org"),
    kare-kod-hucresi([Youtube Eğitimi], playlist, "kisa.link/bHGEg"),
  )
]

#pagebreak()

#block(breakable: false)[
  #grid(
    columns: (1fr,1fr),
    gutter: 5pt,
    align: (top,top),
    [
      ==== Örnek 1: İki Sayının Toplamını Bulma (Sayfa 25 Örnek 1)
Söze kodu ve elle çalışma tablosunu önceden yaptığımız kullanıcı tarafından girilen iki sayının toplamını bulan örneğin akış şemasını (flowchart) çiziniz.\
Birinci sayı ve ikinci sayı için sırasıyla *s1*, *s2*, toplam sonucu için *toplam* değişkenleri kullanılacak.

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (0pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı s1, s2, toplam]),
    cikti((0, 2), [Çıktı "Birinci Sayıyı Giriniz: "]),
    girdi((0, 3), [Giriş s1]),
    cikti((0, 4), [Çıktı "İkinci Sayıyı Giriniz: "]),
    girdi((0, 5), [Giriş s2]),
    islem((0, 6), [toplam = s1+s2]),
    cikti((0, 7), [Çıktı "İşleminizin Sonucu: "\&toplam]),
    baslangic((0, 8), [Son]),

    // Oklar
    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]
      
    ],
    [
      ==== Örnek 2: İki Sayının Ortalamasını Bulma
Kullanıcı tarafından girilen iki sayının ortalamasını bulan örneğin akış şemasını(flowchat) çiziniz.\
Birinci sayı ve ikinci sayı için sırasıyla *s1*, *s2*, ortalama sonucu için *ortalama* değişkenleri kullanılacak.\

Ortalama hesabı: 
#text(size: 14pt, weight: "semibold")[
  `ortalama = (s1 + s2) / 2`
]

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (0pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı s1, s2]),
    islem((0, 2), [Reel ortalama]),
    cikti((0, 3), [Çıktı "Birinci Sayıyı Giriniz: "]),
    girdi((0, 4), [Giriş s1]),
    cikti((0, 5), [Çıktı "İkinci Sayıyı Giriniz: "]),
    girdi((0, 6), [Giriş s2]),
    islem((0, 7), [ortalama = (s1+s2) / 2]),
    cikti((0, 8), [Çıktı "İşleminizin Sonucu: "\&ortalama]),
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
+ Dakikayı Saniyeye Çevirme: Kullanıcıdan dakika cinsinden bir süre girmesini isteyen, bu sürenin kaç saniye olduğunu hesaplayıp yazdıran akış şemasını çiziniz.
+ Diktörtgenler Prizması Hacmi: Kullanıcıdan en, boy ve yükseklik değerlerini alarak prizmanın hacmini (Hacim = en * boy * yükseklik) hesaplayıp ekrana yazdıran akış şemasını çiziniz.
+ Ağırlıklı Not Ortalaması: Bir öğrencinin 1. vize (%40) ve 2. vize (%60) notlarını alıp dönem sonu başarı puanını hesaplayan ve yazdıran akış şemasını çiziniz.
+ Birim Dönüşümü (Sıcaklık): Kullanıcıdan Celsius cinsinden sıcaklık değerini alıp Fahrenheit değerine çeviren (F = C \*1.8 + 32) ve sonucu gösteren akış şemasını çiziniz.
+ Yol, Hız ve Zaman: Bir aracın gittiği mesafeyi (km) ve bu mesafeyi aldığı süreyi (saat) kullanıcıdan alıp ortalama hızını hesaplayan ve ekrana yazdıran akış şemasını çiziniz.
+ Taksi Ücreti Hesaplama: Taksimetre açılış ücreti 30 TL, kilometre başına ücret 20 TL olan bir şehirde; gidilen kilometre bilgisini kullanıcıdan alıp ödenecek toplam tutarı hesaplayıp yazdıran akış şemasını çiziniz.
#v(2em)
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
#diagram(
  spacing: (40pt, 28pt),
  edge-stroke: 1pt,
  mark-scale: 90%,
  
  // Düğümler (sütun 0: Evet, sütun 1: orta, sütun 2: Hayır)
  baslangic((1, 0), [BAŞLA]),
  girdi((1, 1), [Sıcaklık değerini oku (*SICAKLIK*).]),
  karar((1, 2), [SICAKLIK \< 20]),
  cikti((0, 3), [Kombi Çalıştır]),
  cikti((2, 3), [Kombi Durdur]),
  birlesim((1, 4)),
  baslangic((1, 5), [DUR]),
  
  // Oklar
  edge((1, 0), (1, 1), "-|>"),
  edge((1, 1), (1, 2), "-|>"),
  edge((1, 2), (0, 2), (0, 3), "-|>", label: [Evet], label-pos: 0.3, label-side: right),
  edge((1, 2), (2, 2), (2, 3), "-|>", label: [Hayır], label-pos: 0.3, label-side: left),
  edge((0, 3), (0, 4), (1, 4), "-|>"),
  edge((1, 4), (1, 5), "-|>"),
  edge((2, 3), (2, 4), (1, 4), "-|>"),
)

#pagebreak()
==== Örnek 4 Hatalı Giriş Kontrolü Algoritması
Kullanıcının önceden belirlediği bir şifre ile sisteme girişini kontrol eden programının akış şemasını hazırlayın. Sistem şifresi için *s_key*, kullanıcı şifresi için *k_pass* kullanılacak.

*Sözde Kod*
1. Adım: BAŞLA
2. Adım: *s_key = 1234*
3. Adım: kullanıcıdan (*k_pass*) değerini al
4. Adım: *EĞER s_key == k_pass*
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
    islem((1, 1), [String sKey, kPass]),
    islem((1, 2), [sKey = "1234"]),
    cikti((1, 3), [Çıktı "Şifrenizi Giriniz: "]),
    girdi((1, 4), [Giriş kPass]),
    karar((1, 5), [sKey == kPass]),
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
Kullanıcıdan o günün yılını (*ST*) ve kullanıcıdan doğum yılını (*DY*) alarak kullanıcının 18 yaşından büyük olması durumunda "*Ehliyet Alır!*" küçük olması durumunda "*Ehliyet Almaz!*" yazısını ekrana yazdıran programın sözde kodunu ve elle çalışma tablosunu hazırlayınız.

*Sözde Kod*
2. Adım: Sistem Tarihi (*ST*) değerini oku.
3. Adım: Kullanıcının Doğum Yılı (*DY*) değerini oku.
4. Adım: *Yaş = ST - DY* işlemini yap.
5. Adım:  *Eğer Yaş >= 18* 
 \ *EVET* ise "*Ehliyet Alır!*" mesajını yazdır.   
  \ *HAYIR* ise "*Ehliyet Almaz!*" mesajını yazdır.

*Akış Şeması(Flowchart)*
#align(center)[
  #diagram(
    spacing: (40pt, 26pt),
    edge-stroke: 1pt,
    mark-scale: 90%,

    // Düğümler (sütun 0: Yanlış, sütun 1: orta, sütun 2: Doğru)
    baslangic((1, 0), [Ana]),
    islem((1, 1), [Tamsayı ST, DY, YAS]),
    cikti((1, 2), [Çıktı "Şu an ki yılı girin: "]),
    girdi((1, 3), [Giriş ST]),
    cikti((1, 4), [Çıktı "Doğum yılınızı girin: "]),
    girdi((1, 5), [Giriş DY]),
    islem((1, 6), [YAS = ST-DY]),
    cikti((1, 7), [Çıktı "Yaş :"&YAS]),
    karar((1, 8), [YAS >= 18]),
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

==== Örnek Çalışma Soruları
+ Akıllı Bahçe Sulama Sistemi (Sensör ve Eşik Değeri Mantığı): Bir seradaki toprak nem oranı sensöründen gelen değer NEM değişkeninde tutulmaktadır.
  - Nem oranı 30'un altına düştüğünde sulama vanasını açan ("Sulama Başlatıldı"),
  - 30 veya üzerinde olduğunda ise sulama vanasını kapatan ("Sulama Durduruldu") programın akış şemasını çiziniz.

+ Bakiye ve Ödeme Kontrolü (İki Değişkeni Karşılaştırma): Bir online alışveriş sisteminde kullanıcının mevcut hesap bakiyesi BAKIYE, satın almak istediği sepet tutarı ise SEPET değişkenidir.
  - Eğer BAKIYE değeri SEPET tutarına eşit veya büyükse ekrana "Ödeme Başarılı" yazdıran ve kalan yeni bakiyeyi ekranda gösteren,
  - Yetersiz ise ekrana "Yetersiz Bakiye" uyarısı veren programın akış şemasını çiziniz.

+ Vize-Final ile Dersten Geçme / Kalma (İşlem + Karar + Çalışma Tablosu): Bir öğrencinin vize notu VIZE, final notu FINAL olarak kullanıcıdan alınacaktır.
  - Ortalama formülü: ORT = (VIZE * 0.4) + (FINAL * 0.6)
  - Eğer ORT değeri 50 veya üzerinde ise ekrana "Geçti", 50'nin altında ise "Kaldı" yazdıran programın sözde kodunu (pseudo-code) ve en az iki farklı öğrenci notu için elle çalışma (izleme) tablosunu hazırlayınız.

+ Hız Sınırı ve Radar Kontrolü (Hız ve Ceza Durumu): Şehir içi yolda hız sınırını kontrol eden radar sistemi, araç hızını HIZ değişkeni olarak okumaktadır. Yasal hız sınırı 70 km/s olarak belirlenmiştir.
  - Sürücünün hızı 70'in üzerindeyse ekrana "Hız Sınırı Aşıldı - Ceza Uygulandı",
  - 70 veya altındaysa ekrana "İyi Yolculuklar" mesajını veren programın akış şemasını çiziniz.

+ Basit Kargo Ücreti Hesaplama (Eşik Değeri ve Şartlı Matematik): Bir e-ticaret sitesinde sipariş tutarı TUTAR değişkeninde tutulmaktadır.
  - Sipariş tutarı 500 TL veya üzerinde ise kargo ücretsizdir (Ödenecek tutar = TUTAR).
  - Sipariş tutarı 500 TL'nin altında ise 50 TL kargo ücreti eklenmektedir (Ödenecek tutar = TUTAR + 50). Kullanıcıya son ödenecek toplam tutarı ekrana yazdıran programın akış şemasını ve sözde kodunu hazırlayınız.

+ Pozitif / Negatif Sayı Tespiti (Temel Sayısal Karar): Kullanıcıdan bir tamsayı (SAYI) girmesini isteyen, girilen sayının 0'dan büyük olması durumunda ekrana "Pozitif Sayı", 0'dan küçük olması durumunda "Negatif Sayı" yazdıran programın akış şemasını hazırlayın.
  
#pagebreak()
==== Döngü(Loop)
Bazı işlemlerin belirli bir koşul sağlanana kadar tekrar edilmesi gerekir. Bu tür işlemler için döngüler kullanılır.

Bir sayaç kontrollü döngü üç temel bölümden oluşur:

- *Başlangıç değeri:* Sayacın başlayacağı değerdir.
- *Döngü koşulu:* Döngünün devam edip etmeyeceğini belirler.
- *Sayaç:* Her tur sonunda değeri artırır veya azaltır.

Koşul doğru olduğu sürece döngü devam eder. Koşul yanlış olduğunda döngü sona erer. Sayaç değerinin değiştirilmesi, döngünün sonsuza kadar sürmesini önler.

==== Örnek 6 Döngüsel Ekran Yazımı (Sayfa 37 Örnek 8)
Döngü kullanarak ekrana üç kez "Merhaba Geliştirici!" mesajını yazdırınız.

*Sözde Kod*
+ Adım: *sayac* tam sayı değişkenini tanımla
+ Adım: sayac = 1 ile sayac değişkenine ilk değeri olan biri ata.
+ Adım: Eğer *sayac <= 3* sayac küçük eşit 
  \ *EVET* ise 
    #pad(left: 1.5em)[
      *"Merhaba Geliştirici!"* yazdız \
      *sayac = sayac + 1 * => sayac değerini bir arttır
    ]
  *HAYIR* ise
  #pad(left: 1.5em)[*Döngüden çık*]

*Elle Çalışma Tablosu*\
*Örnek Girdiler:* sayac = 3 , *Beklenen Çıktı:* ekrana üç kere "Merhaba Geliştirici" yazdırılacak
#table(
  columns: (1.1cm, 1fr, 1.25cm, 1fr, 1fr, 1fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Adım],
    table_headerCell[İşlem],
    table_headerCell[sayac],
    table_headerCell[Döngü Koşul \ (sayac <= 3)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

   table_dataCell_middle[1],
   table_dataCell_middle[Tam sayı *sayac*],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[sayac değişkeni tanımlanır],

   table_dataCell_middle[2],
   table_dataCell_middle[sayac = 1],
   table_dataCell_middle[1],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[sayac değişkenine 1 değeri atanır],
   
   table_dataCell_middle[3],
   table_dataCell_middle[sayac <=  3 ],
   table_dataCell_middle[1],
   table_dataCell_middle[1 <= 3 *EVET*],
   table_dataCell_middle[Merhaba Geliştirici],
   table_dataCell_middle[*1<= 3* sonucu *EVET* \ ekrana yazdırılır \ sayac 1 arttırılır],
   
   table_dataCell_middle[4],
   table_dataCell_middle[sayac <=  3 ],
   table_dataCell_middle[2],
   table_dataCell_middle[2<= 3 *EVET*],
   table_dataCell_middle[Merhaba Geliştirici],
   table_dataCell_middle[*2<= 3* sonucu *EVET* \ ekrana yazdırılır \ sayac 1 arttırılır],
   
   table_dataCell_middle[5],
   table_dataCell_middle[sayac <=  3 ],
   table_dataCell_middle[3],
   table_dataCell_middle[3<= 3 *EVET*],
   table_dataCell_middle[Merhaba Geliştirici],
   table_dataCell_middle[*3<= 3* sonucu *EVET* \ ekrana yazdırılır \ sayac 1 arttırılır],   
   
   table_dataCell_middle[6],
   table_dataCell_middle[sayac <=  3 ],
   table_dataCell_middle[4],
   table_dataCell_middle[4<= 3 *HAYIR*],
   table_dataCell_middle[-],
   table_dataCell_middle[*4<= 3* sonucu *HAYIR* \ *Döngü Sonlanır*],
)


#block(breakable: false)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1pt,
    align: (top, top),
    [
      *Akış Şeması (Flowchart)*

      #diagram(
        spacing: (30pt, 24pt),
        edge-stroke: 1.2pt,
        mark-scale: 90%,

        // Ana omurga düğümleri (Sütun 0)
        baslangic((0, 0), [Ana]),
        islem((0, 1), [Tamsayı sayac], width: 90pt),
        islem((0, 2), [sayac = 1], width: 60pt),
        dongu-altigen((0, 3), [sayac <= 3], width: 75pt),

        // Döngü gövdesi düğümleri (Sütun 2)
        cikti((2, 4), [Çıktı "Merhaba Geliştirici! "\& sayac], width: 175pt),
        islem((2, 5), [sayac = sayac + 1], width: 100pt),

        // Bitiş düğümü (Sütun 0)
        baslangic((0, 6), [Son]),

        // İniş okları (Giriş adımları)
        edge((0, 0), (0, 1), "-|>"),
        edge((0, 1), (0, 2), "-|>"),
        edge((0, 2), (0, 3), "-|>"),

        // Doğru (Döngü Gövdesine Giriş)
        edge((0, 3), (2, 3), (2, 4), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
        edge((2, 4), (2, 5), "-|>"),

        // Döngü Başına Geri Dönüş (sayac = sayac + 1 -> sayac <= 3 altı)
        edge(
          (2, 5),
          (2, 5.6),
          (0.3, 5.6),
          (0.3, 3),
          "-|>",
        ),

        // Yanlış (Döngüden Çıkış ve Bitiş)
        edge((0, 3), (0, 6), "-|>", label: [Yanlış], label-pos: 0.15, label-side: right),
      )
    ],
    [
      *Ekran Çıktısı*

      #flow-konsol-ciktilari(
        [Merhaba Geliştirici! 1],
        [Merhaba Geliştirici! 2],
        [Merhaba Geliştirici! 3],
      )
    ],
  )
]

==== Örnek 7 Ardışık Sayıların Toplamı (Sayfa 38 Uygulama 4)
Birden başlayarak kullanıcının belirlediği değere kadar belirlenen dahil tüm sayıların toplamını alan kodun akış şemasını hazırlayın.
*Örnek Hesap :* #text(size: 14pt, weight: "semibold")[
  `n = 3 için toplam = 1 + 2 + 3 = 6`
]

*Sözde Kod*
+ Adım: *sayac, toplam ve n * tam sayı değişkenini tanımla
+ Adım: *sayac = 1* ile sayac değişkenine ilk değeri olan biri ata.
+ Adım: *toplam = 0* başlangıç değerini ata
+ Adım: kullanıcıdan *n* değişkenin değerini al
+ Adım: Eğer *sayac <= n* sayac küçük eşit n
  \ *EVET* ise 
    #pad(left: 1.5em)[
      *toplam = toplam + sayac * => toplama işlemini yap\
      *sayac = sayac + 1 * => sayac değerini bir arttır
    ]
  *HAYIR* ise
  #pad(left: 1.5em)[*Döngüden çık*]
+ Adım: *"Toplam = "&toplam* toplam değerini yazdır.

#pagebreak()
*Elle Çalışma Tablosu*\
*Örnek Girdiler:* n = 3 için, *Beklenen Çıktı:* toplam = 6
#table(
  columns: (0.75cm, 1fr, 1.5cm, 1.5cm, 1.5cm, 2.75cm, 2.5cm, 2fr),
  stroke:  table_Stroke,
  inset: 7pt,
  
  table.header(
    table_headerCell[Ad],
    table_headerCell[İşlem],
    table_headerCell[sayac],
    table_headerCell[toplam],
    table_headerCell[n],
    table_headerCell[Döngü Koşul \ (sayac <= n)],
    table_headerCell[Çıktı],
    table_headerCell[Açıklama],
  ),

   table_dataCell_middle[1],
   table_dataCell_middle[Tam sayı \ sayac, toplam, n],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[Kullanılacak değişkenler tanımlanır],

   table_dataCell_middle[2],
   table_dataCell_middle[sayac = 1, toplam = 0],
   table_dataCell_middle[1],
   table_dataCell_middle[0],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[-],
   table_dataCell_middle[sayac ve toplam değişkenleri ilk değerlerini alır],

   table_dataCell_middle[3],
   table_dataCell_middle[n = 3],
   table_dataCell_middle[1],
   table_dataCell_middle[0],
   table_dataCell_middle[3],
   table_dataCell_middle[1 <= 3 *evet*],
   table_dataCell_middle[-],
   table_dataCell_middle[koşul doğru\ sayac = 2,\ toplam = 0 + 1 = 1],

   table_dataCell_middle[4],
   table_dataCell_middle[n = 3],
   table_dataCell_middle[2],
   table_dataCell_middle[1],
   table_dataCell_middle[3],
   table_dataCell_middle[2 <= 3 *evet*],
   table_dataCell_middle[-],
   table_dataCell_middle[koşul doğru\ sayac = 3,\ toplam =1 + 2 = 3],

   table_dataCell_middle[5],
   table_dataCell_middle[n = 3],
   table_dataCell_middle[3],
   table_dataCell_middle[3],
   table_dataCell_middle[3],
   table_dataCell_middle[2 <= 3 *evet*],
   table_dataCell_middle[-],
   table_dataCell_middle[koşul doğru\ sayac = 4,\ toplam = 3 + 3 = 6],

   table_dataCell_middle[6],
   table_dataCell_middle[n = 3],
   table_dataCell_middle[4],
   table_dataCell_middle[6],
   table_dataCell_middle[3],
   table_dataCell_middle[4 <= 3 *HAYIR*],
   table_dataCell_middle["Toplam :" 6],
   table_dataCell_middle[koşul yanlış\ sayac = 4, toplam = 6],
)

*Akış Şeması (Flowchart)*
#align(center)[
  #diagram(
    spacing: (32pt, 22pt),
    edge-stroke: 1.2pt,
    mark-scale: 90%,

    // Ana omurga düğümleri (Sütun 0)
    // baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı sayac, toplam, n], width: 140pt),
    islem((0, 2), [sayac = 1], width: 75pt),
    islem((0, 3), [toplam = 0], width: 75pt),
    cikti((0, 4), [Çıktı "n değerini girin: "], width: 135pt),
    girdi((0, 5), [Giriş n], width: 85pt),
    dongu-altigen((0, 6), [sayac <= n], width: 95pt),

    // Döngü gövdesi düğümleri (Sütun 2)
    islem((2, 7), [toplam = toplam + sayac], width: 135pt),
    islem((2, 8), [sayac = sayac + 1], width: 100pt),

    // Çıkış ve Bitiş düğümleri (Sütun 0)
    cikti((0, 9), [Çıktı "Toplam : "\&toplam], width: 140pt),
    // baslangic((0, 10), [Son]),

    // İniş okları (Giriş bölümü)
    // edge((0, 0), (0, 1), "-|>"),
    edge((0, 1), (0, 2), "-|>"),
    edge((0, 2), (0, 3), "-|>"),
    edge((0, 3), (0, 4), "-|>"),
    edge((0, 4), (0, 5), "-|>"),
    edge((0, 5), (0, 6), "-|>"),

    // Doğru (Döngü Gövdesine Giriş)
    edge((0, 6), (2, 6), (2, 7), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 7), (2, 8), "-|>"),

    // Döngü Başına Geri Dönüş
    edge(
      (2, 8),
      (2, 8.6),
      (0.35, 8.6),
      (0.35, 6),
      "-|>",
    ),

    // Yanlış (Döngüden Çıkış -> Sonuç Çıktısı -> Son)
    edge((0, 6), (0, 9), "-|>", label: [Yanlış], label-pos: 0.12, label-side: right),
    // edge((0, 9), (0, 10), "-|>"),
  )
]
#pagebreak()

==== Örnek Çalışma Soruları
+ 1 ile 100 arasında belirlenen gizli bir sayının (örneğin 33) kullanıcının tahminleriyle bulunmaya çalışıldığı bir tahmin oyununun akış şemasını çiziniz. Döngü kontrolü için boolean tipinde dongu değişkenini kullanınız. Girilen tahmin gizli sayıdan farklı olduğu sürece kullanıcıyı "Sayı Küçük!" veya "Sayı Büyük!" şeklinde yönlendiriniz. Her tahmini sayarak doğru sonuca ulaşıldığında toplam deneme sayısını ekrana yazdırınız.

+ Geri Sayım ve Fırlatma (Geriye Doğru Sayıcı Mantığı): Bir roket fırlatma simülasyonu için 10'dan başlayıp 1'e kadar birer birer geriye doğru sayan ve her sayıyı ekrana yazdıran, döngü bittiğinde ise ekrana "Fırlatma Başarılı!" mesajı veren programın akış şemasını çiziniz. \ İpucu: Döngü sayacını her adımda 1 azaltınız (SAYAC = SAYAC - 1).

+ Çift Sayıların Çarpımı (Faktöriyel / Kümülatif Çarpım Mantığı): Kullanıcıdan pozitif bir çift sayı (N) alarak, 2'den başlayıp N değerine kadar olan (N dahil) tüm çift sayıların çarpımını hesaplayan programın akış şemasını ve sözde kodunu hazırlayınız. \ Örnek Hesap: N = 6 için Carpim = 2 \* 4 \* 6 = 48 \ Öğrenci Notu: Çarpım için başlangıç etkisiz elemanını (CARPIM = 1) ve adım artışını (SAYAC = SAYAC + 2) doğru belirleyiniz.

+ Sınıf Not Ortalaması Hesaplama (Döngü İçinde Girdi Alma ve Ortalama): Kullanıcıdan önce sınıfta kaç öğrenci olduğu bilgisini (ADET) alan, ardından döngü yardımıyla bu adet kadar öğrenci notunu (NOT) teker teker kullanıcıdan isteyip toplayan, döngü sonunda ise sınıfın genel not ortalamasını hesaplayıp ekrana yazdıran programın akış şemasını çiziniz. \ Elle Çalışma: ADET = 3 ve girilen notlar 70, 80, 90 olacak şekilde elle çalışma (izleme) tablosunu oluşturunuz.

+ PIN Kodu ile Telefon Kilidi Açma (3 Hak Sınırlı): Telefonun kayıtlı PIN kodu DOGRU_PIN = 1234 olarak belirlenmiştir. Kullanıcıya en fazla 3 deneme hakkı tanınacaktır. \ Kullanıcı doğru PIN'i girerse ekrana "Kilit Açıldı" yazıp döngü derhal sonlanmalıdır.\ Kullanıcı 3 hakkında da hatalı giriş yaparsa ekrana "Telefon Kilitlendi!" uyarısı verilmelidir. \ Bu senaryoyu gerçekleştiren programın akış şemasını çiziniz.

+ Sıfır Girilene Kadar Pozitif Sayıları Sayma: Kullanıcı klavyeden 0 (sıfır) girene kadar sürekli sayı girişi kabul eden bir program tasarlayınız.\ Girilen sayılar arasından yalnızca pozitif olanların kaç adet olduğunu saymalıdır (POZITIF_ADET).\ Kullanıcı 0 girdiğinde döngüden çıkılmalı ve toplamda kaç adet pozitif sayı girildiği ekrana yazdırılmalıdır. \ Programın sözde kodunu ve 5, -3, 12, -1, 0 test girdileri için elle çalışma tablosunu hazırlamak işinizi kolaylaştırır.

#pagebreak()
=== Algoritmalarda Metinsel Veriler ve İşlemler
Bilgisayarlar, sayılar dışında isim ve şifre gibi metinsel verileri de işler. Çift tırnak içinde yazılan metinlere
#text(size: 14pt, weight: "semibold")[`string`] (*karakter dizisi*) denir. Metinsel veriler doğrudan matematiksel işlemlerde kullanılamaz.

==== Örnek Metin Birleştirme (Sayfa 42 Örnek 9)
Kullanıcıdan aldığı isim bilgisiyle ekrana "Hoş Geldiniz Sayın :" + isim şeklinde yazı yazdıran kodun akış şemasını çiziniz?

#align(center)[
  #diagram(
    spacing: (0pt, 24pt),
    edge-stroke: 1.2pt,
    mark-scale: 90%,

    // Düğümler
    baslangic((0, 0), [Ana]),
    islem((0, 1), [String isim, mesaj], width: 135pt),
    cikti((0, 2), [Çıktı "Kullanıcı Adını Giriniz :"], width: 175pt),
    girdi((0, 3), [Giriş isim], width: 95pt),
    islem((0, 4), [mesaj = "Hoş Geldiniz Sayın "\&isim], width: 165pt),
    cikti((0, 5), [Çıktı mesaj], width: 105pt),
    baslangic((0, 6), [Son]),

    // Bağlantı Okları
    ..range(6).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]


=== Dijital Depo
Daha sonra anlatılacak.
