#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": soru_bilgi

== Bölüm Kod Uygulamaları
=== Genel Uygulama Soruları (Ünite 1–4)

#[
*Soru 1: Elektrik Faturası Kademe Hesabı*\
#soru_bilgi[Ünite 1 (Koşul Yapıları) · Konu: `if-elif-else`, aralık kontrolü · Zorluk: Orta]

Bir evde aylık tüketilen elektrik miktarına (kWh) göre birim fiyat şu şekildedir: `0–150` kWh arası `1.50 TL`, `151–300` kWh arası `2.20 TL`, `300` kWh üzeri `3.00 TL`. Kullanıcıdan tüketim miktarını alıp toplam fatura tutarını yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Aylık tüketim (kWh): 220
Birim fiyat: 2.20 TL
Fatura tutarı: 484.00 TL
```
]
]

#[
*Soru 2: İndirim Kuponu ve Üyelik Kontrolü*\
#soru_bilgi[Ünite 1 (Koşul Yapıları) · Konu: `.upper()`, iç içe `if` / `and` · Zorluk: Orta]

Kullanıcıdan alışveriş tutarını ve kupon kodunu isteyin. Kupon kodu `"INDIRIM20"` (büyük/küçük harf duyarsız) ise ve alışveriş tutarı 250 TL veya üzerindeyse `%20` indirim uygulayın; aksi halde indirimsiz tutarı yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Alışveriş tutarı (TL): 400
Kupon kodu: indirim20
İndirim uygulandı! Ödenecek tutar: 320.00 TL
```
]
]

#[
*Soru 3: Artık Yıl (Leap Year) Kontrolü*\
#soru_bilgi[Ünite 1 (Koşul Yapıları) · Konu: `%`, `and`, `or` mantıksal operatörleri · Zorluk: Orta]

Bir yılın artık yıl olması için `4`'e tam bölünüp `100`'e bölünmemesi veya doğrudan `400`'e tam bölünmesi gerekir. Kullanıcıdan alınan yılın artık yıl olup olmadığını yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Yıl giriniz: 2024
2024 bir artık yıldır.
```
]
]

#[
*Soru 4: Faktöriyel Hesaplama*\
#soru_bilgi[Ünite 2 (Döngü Yapıları) · Konu: `for`, `range()`, `*=` · Zorluk: Kolay]

Kullanıcıdan alınan pozitif tam sayının faktöriyelini ($n! = 1 times 2 times dots times n$) `for` döngüsü kullanarak hesaplayıp yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Faktöriyeli hesaplanacak sayı: 5
5! = 120
```
]
]

#[
*Soru 5: Sayı Tahmin Hakkı (3 Hak)*\
#soru_bilgi[Ünite 2 (Döngü Yapıları) · Konu: `while`, sayaç ve bayrak değişkeni · Zorluk: Orta]

Gizli sayıyı `42` olarak belirleyin. Kullanıcıya en fazla 3 tahmin hakkı tanıyın. Doğru bilirse `"Tebrikler, bildiniz!"` yazdırıp döngüyü sonlandırın; 3 hakta da bilemezse `"Hakkınız bitti, sayı 42 idi."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Tahmininiz (Kalan hak 3): 25
Tahmininiz (Kalan hak 2): 42
Tebrikler, bildiniz!
```
]
]

#[
*Soru 6: İç İçe Döngü ile Ters Yıldız Üçgeni*\
#soru_bilgi[Ünite 2 (Döngü Yapıları) · Konu: iç içe `for`, geriye `range()` · Zorluk: Orta]

İç içe `for` döngüsü kullanarak ilk satırda 5 yıldız, son satırda 1 yıldız olacak şekilde ters dik üçgen çizin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
* * * * * 
* * * * 
* * * 
* * 
* 
```
]
]

#[
*Soru 7: Alışveriş Sepeti Yönetimi*\
#soru_bilgi[Ünite 3 (Liste İşlemleri) · Konu: `append()`, `remove()`, `len()` · Zorluk: Kolay]

`sepet = ["Ekmek", "Süt", "Yumurta"]` listesine `"Peynir"` ekleyin, `"Süt"` ürününü listeden çıkarın ve sepetin son hâli ile ürün sayısını yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Güncel sepet: ['Ekmek', 'Yumurta', 'Peynir']
Sepetteki ürün sayısı: 3
```
]
]

#[
*Soru 8: En Yüksek 3 Notu Bulma*\
#soru_bilgi[Ünite 3 (Liste İşlemleri) · Konu: `sort(reverse=True)`, liste dilimleme · Zorluk: Kolay]

`notlar = [55, 92, 74, 88, 63, 98, 70]` listesini büyükten küçüğe sıralayın ve dilimleme kullanarak en yüksek 3 notu ekrana yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
En yüksek 3 not: [98, 92, 88]
```
]
]

#[
*Soru 9: Tekrar Eden Kelimeyi Sayma*\
#soru_bilgi[Ünite 3 (Liste İşlemleri) · Konu: `count()`, `in`, `index()` · Zorluk: Orta]

`kelimeler = ["python", "kod", "python", "veri", "python", "döngü"]` listesinde `"python"` kelimesinin kaç kez geçtiğini ve ilk hangi indiste yer aldığını yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
'python' kelimesi 3 kez geçiyor.
İlk bulunduğu indis: 0
```
]
]

#[
*Soru 10: Turtle ile Hedef Tahtası (İç İçe Daireler)*\
#soru_bilgi[Ünite 4 (Grafiksel Görselleştirme) · Konu: `circle()`, `penup()`, `goto()` · Zorluk: Orta]

Merkezi `(0, 0)` olacak şekilde yarıçapları `30`, `60` ve `90` piksel olan 3 adet eş merkezli çemberi Turtle ile çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
Merkezi (0, 0) olan yarıçapı 30, 60 ve 90 piksel 3 adet iç içe çember çizilir.
```
]
]

#[
*Soru 11: Turtle ile Beşgen Yıldız Deseni*\
#soru_bilgi[Ünite 4 (Grafiksel Görselleştirme) · Konu: `for`, `forward()`, `right(144)` · Zorluk: Orta]

`for` döngüsüyle 5 kez `120` piksel ileri gidip `144°` sağa dönerek içi `"gold"` rengiyle boyalı 5 köşeli bir yıldız çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
İçi altın sarısı (gold) dolgulu, 5 köşeli yıldız çizilir.
```
]
]

#[
*Soru 12: Turtle ile Dönen Üçgenler*\
#soru_bilgi[Ünite 4 (Grafiksel Görselleştirme) · Konu: iç içe `for`, şekil döndürme · Zorluk: Orta]

Kenar uzunluğu `100` piksel olan eşkenar üçgeni, her çizimden sonra `36°` sağa döndürerek `10` kez tekrarlayın.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
10 adet eşkenar üçgen merkez etrafında 36° aralıklarla dönerek tam dairesel desen oluşturur.
```
]
]

=== Karma Uygulamalar (Ünite 1, 2 ve 3 Birlikte)

#[
*Soru 13: Dinamik Not Girişi ve Geçen/Kalan Analizi*\
#soru_bilgi[Ünite 1 + 2 + 3 · Konu: `while`, liste, `append()`, `if-else`, filtreleme · Zorluk: Orta]

Kullanıcı `q` yazana kadar öğrenci notları alın (`while`). Girilen geçerli notları (`0–100` arası) bir listeye ekleyin; geçersiz notları uyarı vererek reddedin. Giriş bitince toplam öğrenci sayısını, sınıf ortalamasını ve `50` ve üzeri alan (geçen) notların listesini yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Not giriniz (Çıkış için q): 75
Not giriniz (Çıkış için q): 120
Geçersiz not! 0-100 arası giriniz.
Not giriniz (Çıkış için q): 40
Not giriniz (Çıkış için q): 85
Not giriniz (Çıkış için q): q
Toplam geçerli not: 3, Ortalama: 66.7
Geçen notlar: [75, 85]
```
]
]

#[
*Soru 14: Tek ve Çift Sayıları Ayırma ve Sıralama*\
#soru_bilgi[Ünite 1 + 2 + 3 · Konu: `for`, `%`, `if-else`, `append()`, `sort()` · Zorluk: Orta]

`sayilar = [45, 12, 7, 28, 33, 4, 19, 60]` listesini döngüyle tarayarak tek sayıları `tekler`, çift sayıları `ciftler` listesine ayırın. Her iki listeyi küçükten büyüğe sıralayıp yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Çiftler: [4, 12, 28, 60]
Tekler: [7, 19, 33, 45]
```
]
]

#[
*Soru 15: Günlük Harcama Takibi ve Bütçe Uyarısı*\
#soru_bilgi[Ünite 1 + 2 + 3 · Konu: `for`, `append()`, en büyük bulma, `if-else` · Zorluk: Orta]

Kullanıcıdan 5 günlük harcama tutarını alıp bir listeye kaydedin. Toplam harcamayı ve en yüksek harcamanın yapıldığı günü (1–5. gün) bulun. Toplam harcama `1000 TL` üzerindeyse `"Bütçe aşıldı!"`, değilse `"Bütçe kontrol altında."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1. gün harcaması: 200
2. gün harcaması: 350
3. gün harcaması: 150
4. gün harcaması: 400
5. gün harcaması: 100
Toplam harcama: 1200.0 TL
En yüksek harcama: 4. gün (400.0 TL)
Bütçe aşıldı!
```
]
]

#[
*Soru 16: Etkileşimli Yapılacaklar Listesi Menüsü*\
#soru_bilgi[Ünite 1 + 2 + 3 · Konu: `while`, `if-elif-else`, `append()`, `remove()`, `in` · Zorluk: Zor]

Kullanıcıya `1-Ekle`, `2-Sil`, `3-Listele`, `4-Çıkış` seçeneklerini sunan bir menü oluşturun. Kullanıcı `4` girene kadar seçime göre görev listesini güncelleyin; silinecek görev listede yoksa uyarı verin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1-Ekle, 2-Sil, 3-Listele, 4-Çıkış: 1
Eklenecek görev: Matematik ödevi
1-Ekle, 2-Sil, 3-Listele, 4-Çıkış: 3
Görevler: ['Matematik ödevi']
1-Ekle, 2-Sil, 3-Listele, 4-Çıkış: 4
Programdan çıkılıyor.
```
]
]

=== Bütünleşik Turtle Uygulamaları (Ünite 1, 2, 3 ve 4 Birlikte)

#[
*Soru 17: Kullanıcı Listesinden Çokgen Çizimi*\
#soru_bilgi[Ünite 1 + 2 + 3 + 4 · Konu: `while`, liste, `if`, Turtle çokgen · Zorluk: Orta]

Kullanıcıdan `0` girene kadar kenar sayıları alın (`3` ile `10` arasında olanları `kenarlar` listesine ekleyin, diğerlerini reddedin). Ardından listedeki her kenar sayısı için Turtle ekranında yan yana düzgün çokgenler çizin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Kenar sayısı (3-10, Çıkış 0): 3
Kenar sayısı (3-10, Çıkış 0): 4
Kenar sayısı (3-10, Çıkış 0): 6
Kenar sayısı (3-10, Çıkış 0): 0
[Turtle Penceresi: Ekranda yan yana üçgen, kare ve altıgen çizilir]
```
]
]

#[
*Soru 18: Veri Listesinden Renkli Sütun Grafiği*\
#soru_bilgi[Ünite 1 + 2 + 3 + 4 · Konu: `for`, `if-else`, liste, Turtle `begin_fill()` · Zorluk: Zor]

`veriler = [45, 85, 30, 95, 60]` listesindeki her değer için Turtle ekranında yan yana dikey sütunlar çizin. Değer `50` ve üzerindeyse sütunu `"green"`, `50`'nin altındaysa `"red"` renkle doldurun (yükseklik: `deger * 2` piksel).
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
5 adet dikey sütun çizilir; 50 altı değerler (45, 30) kırmızı, 50 ve üzeri (85, 95, 60) yeşil boyanır.
```
]
]

#[
*Soru 19: Koordinat Listesi ve Koşullu Renkli Noktalar*\
#soru_bilgi[Ünite 1 + 2 + 3 + 4 · Konu: iç içe liste/koordinat, `for`, `if-else`, `dot()` · Zorluk: Orta]

`noktalar = [[-120, 60], [80, 90], [-50, -70], [110, -40], [0, 50]]` listesindeki her `(x, y)` noktasına Turtle'ı götürün (`penup()` + `goto()`). Eğer `x >= 0` ise `"blue"`, `x < 0` ise `"orange"` renkte `16` piksel çapında nokta (`dot(16)`) çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
Y ekseninin sağındaki noktalar mavi, solundaki noktalar turuncu daire olarak işaretlenir.
```
]
]

#[
*Soru 20: Renk Listesiyle Koşullu Spiral Matris*\
#soru_bilgi[Ünite 1 + 2 + 3 + 4 · Konu: iç içe `for`, `if-elif-else`, renk listesi, `%` · Zorluk: Zor]

`renkler = ["crimson", "royalblue", "forestgreen", "gold"]` listesini kullanarak 5×5'lik bir ızgarada küçük şekiller çizin. Eğer `satir == sutun` (ana köşegen) ise içi `"black"` dolu kare, değilse `renkler[(satir + sutun) % len(renkler)]` renginde çember çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
5x5 ızgarada ana köşegen boyunca siyah dolu kareler, diğer hücrelerde ise 4 renkten oluşan çemberler çizilir.
```
]
]
