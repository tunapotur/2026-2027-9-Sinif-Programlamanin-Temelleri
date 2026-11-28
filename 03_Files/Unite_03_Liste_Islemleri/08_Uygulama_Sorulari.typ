#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": soru_bilgi

=== Uygulama Soruları

#[
*Soru 1: Liste Oluşturma ve İndis Güncelleme*\
#soru_bilgi[Konu: liste oluşturma, pozitif/negatif indis, eleman değiştirme · Zorluk: Kolay]

`gunler = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma"]` listesini oluşturun. İlk ve son elemanı yazdırın; ardından `2.` indisteki elemanı `"tatil"` olarak güncelleyip listenin son hâlini ekrana basın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
İlk gün: Pazartesi, Son gün: Cuma
Güncel liste: ['Pazartesi', 'Salı', 'tatil', 'Perşembe', 'Cuma']
```
]
]

#[
*Soru 2: Liste Dilimleme (Slicing)*\
#soru_bilgi[Konu: liste dilimleme (`[start:stop:step]`) · Zorluk: Kolay]

`sayilar = [10, 20, 30, 40, 50, 60, 70]` listesinin ilk 3 elemanını, son 2 elemanını ve listenin tersten yazılmış hâlini dilimleme kullanarak yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
İlk 3: [10, 20, 30]
Son 2: [60, 70]
Ters: [70, 60, 50, 40, 30, 20, 10]
```
]
]

#[
*Soru 3: `len()` ve `in` ile Stok Kontrolü*\
#soru_bilgi[Konu: `len()`, `in`, `if-else` · Zorluk: Kolay]

`depo = ["Klavye", "Fare", "Monitör", "Kulaklık"]` listesinde kaç ürün olduğunu yazdırın. Ardından kullanıcıdan bir ürün adı alıp stokta olup olmadığını kontrol edin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Depoda 4 ürün var.
Aranan ürün: Fare
Fare stokta mevcut.
```
]
]

#[
*Soru 4: İndis ile Liste Elemanlarına Zam Yapma*\
#soru_bilgi[Konu: `for`, `range(len())`, eleman güncelleme · Zorluk: Orta]

`fiyatlar = [100, 200, 300, 400]` listesindeki her ürünün fiyatına `%10` zam yapıp güncellenmiş listeyi yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Zamlı fiyatlar: [110.0, 220.0, 330.0, 440.0]
```
]
]

#[
*Soru 5: Sıcaklık Değerlerinin İstatistikleri*\
#soru_bilgi[Konu: döngü ile toplam, ortalama, en büyük ve en küçük · Zorluk: Orta]

`sicakliklar = [18, 24, 15, 29, 21]` listesi için `sum()`, `max()`, `min()` kullanmadan yalnızca `for` döngüsü ile ortalama sıcaklığı, en yüksek ve en düşük sıcaklığı bulun.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Ortalama: 21.4 °C
En yüksek: 29 °C, En düşük: 15 °C
```
]
]

#[
*Soru 6: Kullanıcıdan Alınan Verilerle Liste Oluşturma*\
#soru_bilgi[Konu: `append()`, `for` döngüsü · Zorluk: Kolay]

Boş bir `isimler = []` listesi oluşturun. Kullanıcıdan `for` döngüsüyle 4 öğrenci adı alıp `.append()` ile listeye ekleyin ve sonunda listeyi yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1. öğrenci: Ali
2. öğrenci: Ayşe
3. öğrenci: Mehmet
4. öğrenci: Zeynep
Sınıf listesi: ['Ali', 'Ayşe', 'Mehmet', 'Zeynep']
```
]
]

#[
*Soru 7: Araya Eleman Ekleme ve Liste Birleştirme*\
#soru_bilgi[Konu: `insert()`, `extend()` · Zorluk: Kolay]

`a = [1, 2, 4]` listesinin `2.` indisine `3` sayısını ekleyin (`insert`). Ardından `b = [5, 6]` listesini `a` listesinin sonuna ekleyin (`extend`) ve sonucu yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sonuç: [1, 2, 3, 4, 5, 6]
```
]
]

#[
*Soru 8: Görev Listesinden Eleman Silme*\
#soru_bilgi[Konu: `remove()`, `pop()` · Zorluk: Orta]

`gorevler = ["Ödev", "Spor", "Okuma", "Temizlik"]` listesinden `"Spor"` görevini adına göre silin; ardından en sondaki görevi `.pop()` ile çıkarıp çıkarılan görevi ve kalan listeyi yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Çıkarılan son görev: Temizlik
Kalan görevler: ['Ödev', 'Okuma']
```
]
]

#[
*Soru 9: Sıralama, Sayma ve Konum Bulma*\
#soru_bilgi[Konu: `count()`, `index()`, `sort()` · Zorluk: Orta]

`puanlar = [75, 90, 60, 90, 85]` listesinde `90` puanının kaç kez geçtiğini yazdırın. Ardından listeyi büyükten küçüğe sıralayın ve `85` puanının yeni sıradaki indisini ekrana basın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
90 sayısı adedi: 2
Sıralı liste: [90, 90, 85, 75, 60]
85 puanının indisi: 2
```
]
]

#[
*Soru 10: Çift Sayıları Filtreleme*\
#soru_bilgi[Konu: listede filtreleme, `for`, `if`, `append()` · Zorluk: Orta]

`sayilar = [13, 22, 7, 40, 19, 8, 55, 12]` listesindeki yalnızca çift sayıları yeni bir `ciftler` listesine aktarıp ekrana yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Çift sayılar: [22, 40, 8, 12]
```
]
]
