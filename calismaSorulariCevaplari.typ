#import "template.typ": *
#import "flowchart.typ": *

*1.2.2.3. Örnek Çalışma Soruları*
1.
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    // Düğümler
    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı gunumuzYili, dogumYili, yas], width: 190pt),
    cikti((0, 2), [Çıktı "Günümüz Yılını Girin: "], width: 160pt),
    girdi((0, 3), [Giriş gunumuzYili], width: 120pt),
    cikti((0, 4), [Çıktı "Doğum Yılını Girin: "], width: 160pt),
    girdi((0, 5), [Giriş dogumYili], width: 110pt),
    islem((0, 6), [yas = gunumuzYili - dogumYili], width: 170pt),
    cikti((0, 7), [Çıktı "Yaş :" & yas], width: 120pt),
    baslangic((0, 8), [Son]),

    // Bağlantı Okları
    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

2. 
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel kenar, alan, cevre], width: 150pt),
    cikti((0, 2), [Çıktı "Karenin Bir Kenar Uzunluğunu Girin: "], width: 220pt),
    girdi((0, 3), [Giriş kenar], width: 90pt),
    islem((0, 4), [alan = kenar \* kenar], width: 130pt),
    islem((0, 5), [cevre = kenar \* 4], width: 120pt),
    cikti((0, 6), [Çıktı "Karenin Alanı: " & alan], width: 160pt),
    cikti((0, 7), [Çıktı "Karenin Çevresi: " & cevre], width: 160pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

#pagebreak()
3.
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

4.
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

#pagebreak()
5.
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel taksiMetreAcilisTutar, kilometreBasiTutar, \ kilometreYol, odenecekTutar], width: 220pt),
    islem((0, 2), [taksiMetreAcilisTutar = 30], width: 140pt),
    islem((0, 3), [kilometreBasiTutar = 20], width: 130pt),
    cikti((0, 4), [Çıktı "Gidilen Kilometre :"], width: 140pt),
    girdi((0, 5), [Giriş kilometreYol], width: 110pt),
    islem((0, 6), [odenecekTutar = taksimetreAcilisTutar + \ kilometreYol \* kilometreBasiTutar], width: 220pt),
    cikti((0, 7), [Çıktı "Ödenecek Tutar :" & odenecekTutar], width: 170pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

*1.2.2.8. Örnek Çalışma Soruları*
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

*1.2.2.12. Örnek Çalışma Soruları*
+ 1 ile 100 arasında belirlenen gizli bir sayının (örneğin 33) kullanıcının tahminleriyle bulunmaya çalışıldığı bir tahmin oyununun akış şemasını çiziniz. Döngü kontrolü için boolean tipinde dongu değişkenini kullanınız. Girilen tahmin gizli sayıdan farklı olduğu sürece kullanıcıyı "Sayı Küçük!" veya "Sayı Büyük!" şeklinde yönlendiriniz. Her tahmini sayarak doğru sonuca ulaşıldığında toplam deneme sayısını ekrana yazdırınız.

+ Geri Sayım ve Fırlatma (Geriye Doğru Sayıcı Mantığı): Bir roket fırlatma simülasyonu için 10'dan başlayıp 1'e kadar birer birer geriye doğru sayan ve her sayıyı ekrana yazdıran, döngü bittiğinde ise ekrana "Fırlatma Başarılı!" mesajı veren programın akış şemasını çiziniz. \ İpucu: Döngü sayacını her adımda 1 azaltınız (SAYAC = SAYAC - 1).

+ Çift Sayıların Çarpımı (Faktöriyel / Kümülatif Çarpım Mantığı): Kullanıcıdan pozitif bir çift sayı (N) alarak, 2'den başlayıp N değerine kadar olan (N dahil) tüm çift sayıların çarpımını hesaplayan programın akış şemasını ve sözde kodunu hazırlayınız. \ Örnek Hesap: N = 6 için Carpim = 2 \* 4 \* 6 = 48 \ Öğrenci Notu: Çarpım için başlangıç etkisiz elemanını (CARPIM = 1) ve adım artışını (SAYAC = SAYAC + 2) doğru belirleyiniz.

+ Sınıf Not Ortalaması Hesaplama (Döngü İçinde Girdi Alma ve Ortalama): Kullanıcıdan önce sınıfta kaç öğrenci olduğu bilgisini (ogrenciAdet) alan, ardından döngü yardımıyla bu adet kadar öğrenci notunu (ogrenciNot) teker teker kullanıcıdan isteyip toplayan, döngü sonunda ise sınıfın genel not ortalamasını hesaplayıp ekrana yazdıran programın akış şemasını çiziniz. \ Elle Çalışma: ogrenciAdet = 3 ve girilen notlar 70, 80, 90 olacak şekilde elle çalışma (izleme) tablosunu oluşturunuz.

+ PIN Kodu ile Telefon Kilidi Açma (3 Hak Sınırlı): Telefonun kayıtlı PIN kodu dogruPin = 1234 olarak belirlenmiştir. Kullanıcıya en fazla 3 deneme hakkı tanınacaktır. \ Kullanıcı doğru PIN'i girerse ekrana "Kilit Açıldı" yazıp döngü derhal sonlanmalıdır.\ Kullanıcı 3 hakkında da hatalı giriş yaparsa ekrana "Telefon Kilitlendi!" uyarısı verilmelidir. \ Bu senaryoyu gerçekleştiren programın akış şemasını çiziniz.

+ Sıfır Girilene Kadar Pozitif Sayıları Sayma: Kullanıcı klavyeden 0 (sıfır) girene kadar sürekli sayı girişi kabul eden bir program tasarlayınız.\ Girilen sayılar arasından yalnızca pozitif olanların kaç adet olduğunu saymalıdır (pozitifAdet).\ Kullanıcı 0 girdiğinde döngüden çıkılmalı ve toplamda kaç adet pozitif sayı girildiği ekrana yazdırılmalıdır.