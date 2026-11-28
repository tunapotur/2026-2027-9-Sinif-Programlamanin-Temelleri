#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": soru_bilgi

=== Uygulama Soruları

#[
*Soru 1: `for` Döngüsü ile Sayı Aralığı Yazdırma*\
#soru_bilgi[Konu: `for`, `range(baslangic, bitis)` · Zorluk: Kolay]

`for` döngüsü ve `range()` fonksiyonu kullanarak `1`'den `6`'ya kadar (6 dâhil) olan sayıları yan yana ekrana yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1 2 3 4 5 6
```
]
]

#[
*Soru 2: İkişer Artan ve Geriye Sayım*\
#soru_bilgi[Konu: `range(baslangic, bitis, adim)` · Zorluk: Kolay]

İlk satırda `0`'dan `10`'a kadar çift sayıları (`10` dâhil), ikinci satırda ise `10`'dan `2`'ye kadar (`2` dâhil) ikişer geriye doğru yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
0 2 4 6 8 10
10 8 6 4 2
```
]
]

#[
*Soru 3: 1'den N'e Kadar Sayıların Toplamı*\
#soru_bilgi[Konu: `for`, `range()`, `+=` biriktirme · Zorluk: Kolay]

Kullanıcıdan pozitif bir `n` tam sayısı alın. `1`'den `n`'e kadar (`n` dâhil) olan tüm tam sayıların toplamını hesaplayıp yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Bir sayı giriniz: 5
1'den 5'e kadar toplam: 15
```
]
]

#[
*Soru 4: Metindeki Sesli Harfleri Sayma*\
#soru_bilgi[Konu: `for` ile metin üzerinde gezinme, `in` · Zorluk: Orta]

Kullanıcıdan bir kelime alın. `for` döngüsüyle kelimenin her harfini kontrol ederek içinde kaç adet sesli harf (`a, e, ı, i, o, ö, u, ü`) olduğunu bulun.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Kelime giriniz: Programlama
Sesli harf sayısı: 4
```
]
]

#[
*Soru 5: `while` ile Geri Sayım*\
#soru_bilgi[Konu: `while` döngüsü, `-=` güncelleme · Zorluk: Kolay]

Kullanıcıdan bir başlangıç sayısı alın ve `while` döngüsü kullanarak `1`'e kadar geriye doğru sayın; döngü bittiğinde `"Kalkış!"` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Başlangıç sayısı: 4
4
3
2
1
Kalkış!
```
]
]

#[
*Soru 6: Çıkış Değeri (`-1`) Gelene Kadar Ortalama*\
#soru_bilgi[Konu: `while`, nöbetçi (sentinel) değer · Zorluk: Orta]

Kullanıcı `-1` girene kadar pozitif tam sayılar alın. `-1` girildiğinde o ana kadar girilen sayıların adedini ve ortalamasını yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Sayı (Çıkış için -1): 10
Sayı (Çıkış için -1): 20
Sayı (Çıkış için -1): 30
Sayı (Çıkış için -1): -1
3 sayı girildi, ortalama: 20.0
```
]
]

#[
*Soru 7: Geçerli Şifre Uzunluğu Kontrolü*\
#soru_bilgi[Konu: `while`, girdi doğrulama, `len()` · Zorluk: Orta]

Kullanıcıdan en az 6 karakterli bir şifre belirlemesini isteyin. Şifre 6 karakterden kısa olduğu sürece uyarı verip tekrar isteyin; geçerli şifre girildiğinde `"Şifre kabul edildi."` yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Şifre belirleyiniz: 123
Hata! Şifre en az 6 karakter olmalıdır.
Şifre belirleyiniz: python123
Şifre kabul edildi.
```
]
]

#[
*Soru 8: `continue` Kullanmadan 3'ün Katlarını Atlama*\
#soru_bilgi[Konu: döngü kontrolü, `if` ile filtreleme · Zorluk: Orta]

`1`'den `10`'a kadar (`10` dâhil) olan sayıları `for` döngüsüyle gezin; `continue` ifadesini *kullanmadan*, yalnızca `if` koşuluyla 3'e tam bölünen sayıları atlayıp diğerlerini yan yana yazdırın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1 2 4 5 7 8 10
```
]
]

#[
*Soru 9: İç İçe Döngü ile Dikdörtgen Yıldız Deseni*\
#soru_bilgi[Konu: iç içe `for` döngüsü · Zorluk: Orta]

Kullanıcıdan satır ve sütun sayısı alın. İç içe `for` döngüsü kullanarak belirtilen boyutlarda `*` karakterlerinden oluşan bir dikdörtgen çizin.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
Satır sayısı: 3
Sütun sayısı: 5
* * * * * 
* * * * * 
* * * * * 
```
]
]

#[
*Soru 10: Sayı Piramidi Deseni*\
#soru_bilgi[Konu: iç içe `for` döngüsü, dış döngüye bağlı iç döngü · Zorluk: Zor]

`1`'den `5`'e kadar her satırda satır numarası kadar o sayıyı yan yana yazdıran sayı piramidi programını iç içe döngüyle yazın.
#output-box(title: "Örnek Ekran Çıktısı")[
```text
1 
2 2 
3 3 3 
4 4 4 4 
5 5 5 5 5 
```
]
]
