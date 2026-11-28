#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": soru_bilgi

=== Uygulama Soruları

#[
*Soru 1: Ekran Ayarları ve Koordinatlara Çizgi Çizme*\
#soru_bilgi[Konu: `Screen()`, `setup()`, `bgcolor()`, `goto()` · Zorluk: Kolay]

500×500 piksel boyutunda, arka planı `"lightcyan"` olan bir Turtle penceresi oluşturun. Başlangıç noktasından `(100, 100)` noktasına, oradan `(-100, 100)` noktasına ve tekrar `(0, 0)` noktasına çizgi çizerek bir üçgen oluşturun.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi: 500x500, Açık Camgöbeği Arka Plan]
(0,0) -> (100,100) -> (-100,100) -> (0,0) noktalarını birleştiren üçgen çizilir.
```
]
]

#[
*Soru 2: Hareket ve Yön Komutlarıyla Merdiven Çizimi*\
#soru_bilgi[Konu: `forward()`, `left()`, `right()` · Zorluk: Kolay]

Döngü kullanmadan (yalnızca hareket ve 90° dönme komutlarıyla) her basamağı 40 piksel genişliğinde ve 40 piksel yüksekliğinde olan 3 basamaklı bir merdiven çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
Sağa 40px -> Yukarı 40px -> Sağa 40px -> Yukarı 40px -> Sağa 40px -> Yukarı 40px
3 basamaklı merdiven şekli çizilir.
```
]
]

#[
*Soru 3: Kalem Kaldırma ve İki Ayrı Şekil*\
#soru_bilgi[Konu: `penup()`, `pendown()`, `pencolor()`, `pensize()` · Zorluk: Kolay]

Kalem kalınlığını `4` ve rengini `"blue"` yaparak `(-120, 0)` noktasından itibaren 60 piksel uzunluğunda yatay bir çizgi çizin. Ardından kalemi kaldırıp `(60, 0)` noktasına gidin, rengi `"red"` yapıp 60 piksel uzunluğunda ikinci bir yatay çizgi çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
Sol tarafta mavi, sağ tarafta kırmızı olmak üzere aralarında boşluk bulunan 2 yatay çizgi çizilir.
```
]
]

#[
*Soru 4: İçi Boyalı Üçgen (Dolgu Ayarları)*\
#soru_bilgi[Konu: `fillcolor()`, `begin_fill()`, `end_fill()` · Zorluk: Kolay]

Kenar rengi `"darkgreen"`, iç dolgu rengi `"lightgreen"` olan ve kenar uzunluğu `120` piksel olan bir eşkenar üçgeni `for` döngüsüyle çizip içini boyayın.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
120px kenarlı, koyu yeşil çerçeveli ve içi açık yeşil boyalı eşkenar üçgen çizilir.
```
]
]

#[
*Soru 5: Kullanıcı Girdisine Göre Düzgün Çokgen*\
#soru_bilgi[Konu: `for`, `360 / kenar` formülü · Zorluk: Orta]

Kullanıcıdan kenar sayısı (`n >= 3`) ve kenar uzunluğu değerlerini `int(input(...))` ile alın. Girilen değerlere uygun düzgün çokgeni Turtle ekranında çizin ve açıyı konsola yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Kenar sayısı: 5
Kenar uzunluğu: 80
Dönüş açısı: 72.0 derece
[Turtle Penceresi: 80px kenarlı düzgün beşgen çizilir]
```
]
]

#[
*Soru 6: İç İçe Büyüyen Altıgenler*\
#soru_bilgi[Konu: iç içe `for` döngüsü · Zorluk: Orta]

İç içe `for` döngüsü kullanarak merkezde ortak başlangıç noktasından çıkan, kenar uzunluğu `20` pikselden başlayıp her seferinde `15` piksel artan `6` adet iç içe altıgen çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
Kenar uzunlukları 20, 35, 50, 65, 80, 95 piksel olan 6 adet altıgen çizilir.
```
]
]

#[
*Soru 7: Kareyi Döndürerek Çiçek Deseni Oluşturma*\
#soru_bilgi[Konu: şekil döndürme, `360 / tekrar` · Zorluk: Orta]

Kenar uzunluğu `90` piksel olan bir kareyi, her çizimden sonra `20°` sağa döndürerek toplam `18` kez tekrarlayın ve dairesel bir mandala deseni oluşturun.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
18 adet 90x90 kare, merkez etrafında 20° aralıklarla dönerek tam dairesel desen oluşturur.
```
]
]

#[
*Soru 8: 3×4 Kare Izgara (Satır-Sütun) Deseni*\
#soru_bilgi[Konu: iç içe döngü, ızgara koordinat hesaplama · Zorluk: Orta]

3 satır ve 4 sütundan oluşan, her hücresinde `30×30` piksel boyutunda bir kare bulunan ve kareler arasında `45` piksel aralık olan bir ızgara deseni çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
3 satır x 4 sütun = 12 adet düzenli aralıklı kare ızgara biçiminde çizilir.
```
]
]

#[
*Soru 9: Renk Listesi ile Çokgen Spirali*\
#soru_bilgi[Konu: `list`, `%` mod operatörü, `for` · Zorluk: Orta]

`renkler = ["red", "blue", "green", "orange"]` listesini tanımlayın. `for` döngüsüyle `24` adım boyunca her adımda `renkler[i % len(renkler)]` ile rengi değiştirerek `adim * 5` piksel ilerleyin ve `90°` sağa dönün.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
4 farklı renkte kenarlarla merkezden dışa büyüyen kare spiral çizilir.
```
]
]

#[
*Soru 10: Koşul ile İki Renkli Satranç Tahtası (4×4)*\
#soru_bilgi[Konu: iç içe döngü, `if-else`, `%`, `begin_fill()` · Zorluk: Zor]

4×4'lük bir ızgarada `(satir + sutun) % 2 == 0` koşulu sağlanıyorsa kareyi `"black"`, sağlanmıyorsa `"white"` renkle doldurarak 4×4 satranç tahtası çizin.
#output-box(title: "Örnek Ekran Çıktısı (Görsel Beklenti)")[
```text
[Turtle Penceresi]
4x4 boyutunda siyah ve beyaz karelerin dama düzeninde sıralandığı satranç tahtası çizilir.
```
]
]
