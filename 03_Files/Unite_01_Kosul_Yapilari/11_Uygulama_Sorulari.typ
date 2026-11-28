#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": soru_bilgi

=== Uygulama Soruları

#[
*Soru 1: Pozitif / Negatif Kontrolü*\
#soru_bilgi[Konu: `if`, tek yönlü karar, girinti kuralı · Zorluk: Kolay]

Kullanıcıdan bir tam sayı alın. Sayı `0`'dan büyükse ekrana `"Pozitif sayı girdiniz."` yazdırın. Sayı `0` veya negatifse yalnızca `"Program sona erdi."` mesajını gösterin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Bir tam sayı giriniz: 14
Pozitif sayı girdiniz.
Program sona erdi.
```
]
]

#[
*Soru 2: Reşitlik Kontrolü*\
#soru_bilgi[Konu: `if-else`, çift yönlü karar · Zorluk: Kolay]

Kullanıcıdan yaşını tam sayı olarak alın. Yaşı 18 veya daha büyükse `"Oy kullanabilirsiniz."`, 18'den küçükse `"Oy kullanmak için X yıl beklemelisiniz."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Yaşınız: 15
Oy kullanmak için 3 yıl beklemelisiniz.
```
]
]

#[
*Soru 3: Tek mi Çift mi?*\
#soru_bilgi[Konu: `%` mod operatörü, `if-else` · Zorluk: Kolay]

Kullanıcıdan alınan tam sayının tek mi yoksa çift mi olduğunu belirleyip ekrana yazdıran programı yazın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sayı giriniz: 29
29 tek sayıdır.
```
]
]

#[
*Soru 4: 3 ve 5'e Bölünebilme*\
#soru_bilgi[Konu: `%` operatörü, `and` mantıksal operatörü, `if-else` · Zorluk: Kolay]

Kullanıcıdan bir tam sayı alın. Sayı hem 3'e hem de 5'e tam bölünüyorsa `"15'in katıdır."`, aksi halde `"15'in katı değildir."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sayı giriniz: 45
15'in katıdır.
```
]
]

#[
*Soru 5: Komut Doğrulama (Büyük/Küçük Harf Duyarsız)*\
#soru_bilgi[Konu: `.lower()`, `if-else` · Zorluk: Kolay]

Kullanıcıdan `"BAŞLAT"` veya `"DURDUR"` komutunu girmesini isteyin. Kullanıcı harfleri nasıl yazarsa yazsın (`"baslat"`, `"Başlat"` vb. — İngilizce karakter `baslat` kabul edilecek), `"baslat"` ise `"Sistem başlatılıyor..."`, değilse `"Sistem durduruldu."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Komut giriniz (baslat/durdur): BaSlAt
Sistem başlatılıyor...
```
]
]

#[
*Soru 6: Su Sıcaklığına Göre Madde Hâli*\
#soru_bilgi[Konu: `if-elif-else`, çok kriterli karar · Zorluk: Kolay]

Kullanıcıdan suyun sıcaklığını (°C) alın. Sıcaklık 0 veya altındaysa `"Katı (Buz)"`, 100 veya üzerindeyse `"Gaz (Buhar)"`, ikisinin arasındaysa `"Sıvı (Su)"` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sıcaklık (°C): 24
Suyun hâli: Sıvı (Su)
```
]
]

#[
*Soru 7: Kargo Ücreti Hesaplama*\
#soru_bilgi[Konu: `if-elif-else`, koşul sırası · Zorluk: Orta]

Bir e-ticaret sitesinde sepet tutarına göre kargo ücreti şöyledir: 500 TL ve üzeri ücretsiz (0 TL), 200 TL ile 499.99 TL arası 30 TL, 200 TL altı 50 TL. Sepet tutarını alıp toplam ödenecek tutarı yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sepet tutarı (TL): 350
Kargo ücreti: 30 TL
Toplam ödeme: 380.00 TL
```
]
]

#[
*Soru 8: İç İçe Koşul ile Sinema Bileti*\
#soru_bilgi[Konu: iç içe `if`, `.lower()` · Zorluk: Orta]

Kullanıcıdan önce yaşını, ardından 18 yaşından küçükse öğrenci olup olmadığını (`evet`/`hayır`) sorun. 18 yaş ve üzeri için bilet 150 TL; 18 yaş altı öğrenciler için 80 TL, öğrenci olmayan 18 yaş altı için 100 TL olarak yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Yaşınız: 15
Öğrenci misiniz? (evet/hayır): Evet
Bilet ücreti: 80 TL
```
]
]

#[
*Soru 9: Üçgen Oluşturma ve Çeşit Belirleme*\
#soru_bilgi[Konu: karşılaştırma ve mantıksal operatörler (`and`, `or`) · Zorluk: Orta]

Kullanıcıdan alınan `a`, `b`, `c` kenar uzunluklarının tümü pozitifse ve iki kenarın toplamı diğer kenardan büyükse (`a + b > c and a + c > b and b + c > a`) üçgen oluşabilir. Oluşabiliyorsa `"Üçgen oluşturulabilir."`, değilse `"Üçgen oluşturulamaz."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1. kenar: 5
2. kenar: 6
3. kenar: 10
Üçgen oluşturulabilir.
```
]
]

#[
*Soru 10: Güvenli Bölme (Kısa Devre Mantığı)*\
#soru_bilgi[Konu: kısa devre (short-circuit) değerlendirmesi, `and` · Zorluk: Orta]

Kullanıcıdan `bolunen` ve `bolen` tam sayılarını alın. Tek bir `if` satırında kısa devre mantığını kullanarak `bolen != 0` ve `bolunen / bolen >= 2` şartını kontrol edin. Şart sağlanıyorsa bölümü yazdırın, aksi halde `"Bölme yapılamadı veya sonuç 2'den küçük."` mesajını gösterin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Bölünen: 50
Bölen: 0
Bölme yapılamadı veya sonuç 2'den küçük.
```
]
]
