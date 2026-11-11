#import "/lib/template.typ": *
#show: conf

== Temel Programlama Yapıları Python Uygulama Soruları
Aşağıdaki sorular, temel programlama yapıları konusundaki bilgilere göre hazırlanmıştır. Her soruda kodun çalıştırıldığı ekran çıktısı verilmiş olup kullanıcının girdiği değerler örnek niteliğindedir. Siz de yazdığınız kodu kendi değerlerinizle deneyiniz.


#iki_hucreli_satir[
=== Tanışma ve yaş hesabı
#soru_bilgi[Konu: `input()`, `int()`, sabit, f-string · Zorluk: Kolay]

  Kullanıcıdan adını ve doğum yılını alan, yaşını hesaplayıp ekrana yazan bir program yazın. Programın en üstünde `BU_YIL` adında bir sabit (2026) tanımlayın ve çıktıyı f-string ile yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Adınız: Ayşe
Doğum yılınız: 2010
Merhaba Ayşe, 16 yaşındasın.
```
]
]

#iki_hucreli_satir[
=== Dikdörtgenin alanı ve çevresi
#soru_bilgi[Konu: `float()`, aritmetik operatörler, `:.2f` · Zorluk: Kolay]

  Kullanıcıdan bir dikdörtgenin kısa ve uzun kenar uzunluklarını (ondalıklı olabilir) alın. Alanı ve çevreyi hesaplayıp virgülden sonra 2 basamakla yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Kısa kenar (cm): 6.5
Uzun kenar (cm): 4
Alan: 26.00 cm²
Çevre: 21.00 cm
```
]
]

#iki_hucreli_satir[
=== Not ortalaması
#soru_bilgi[Konu: karşılaştırma operatörleri, `bool`, f-string · Zorluk: Kolay]

  Bir dersin ortalaması şöyle hesaplanıyor: 1. yazılı %30, 2. yazılı %30, performans %40. Üç notu kullanıcıdan alın; ortalamayı (virgülden sonra 1 basamak), dersi geçip geçmediğini (ortalama 50 veya üzeri) ve takdir alıp almadığını (ortalama 85 veya üzeri) yazdırın. Geçme ve takdir bilgisi `True` ya da `False` olarak görünmelidir.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
1. yazılı: 70
2. yazılı: 85
Performans notu: 90
Ortalama: 82.5
Geçti mi: True
Takdir mi: False
```
]
]

#iki_hucreli_satir[
=== Tür dönüşümü
#soru_bilgi[Konu: `type()`, `int()`, `float()`, otomatik dönüşüm · Zorluk: Kolay]

  Kullanıcıdan bir tam sayı alın ve aşağıdaki değerleri sırayla yazdıran bir program yazın. 1-4. ve 7. maddelerde değerin yanında `type()` ile türünü de gösterin.

  + Girilen değer, `input()`'tan geldiği haliyle
  + Aynı değerin tam sayıya çevrilmiş hali
  + Tam sayının ondalıklı sayıya çevrilmiş hali
  + `85.85` değerinin tam sayıya çevrilmiş hali
  + Girilen metnin kendisiyle toplamı (örneğin `25` için `2525`)
  + Tam sayının kendisiyle toplamı (örneğin `50`)
  + `adet = 5` ve `birim_fiyat = 2.5` değişkenlerinin çarpımı][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Bir sayı girin: 25
25 <class 'str'>
25 <class 'int'>
25.0 <class 'float'>
85 <class 'int'>
2525
50
12.5 <class 'float'>
```
]
]

#iki_hucreli_satir(columns: (auto, 18em))[
=== Hatalı kodu düzeltin
#soru_bilgi[Konu: değişken tanımlama kuralları, adlandırma, sabitler · Zorluk: Kolay]

Aşağıdaki kodda değişken tanımlama kurallarına aykırı 5 satır vardır. Her hatanın nedenini yazın ve kodu `snake_case` yazımına uygun olacak şekilde düzeltin. Ardından `KDV_ORANI` (0.20) ve `MAKSIMUM_DENEME_SAYISI` (3) için sabit tanımlarını ekleyin. Düzeltilmiş program çalıştığında ekrana `100` yazmalıdır.
][
#kod-blok(width: 100%)[
```python
3etap_skor = 80
urun fiyati = 45.5
class = "9-A"
Toplam-Puan = 3etap_skor + 20
print(Toplam-Puan)
```
]
]

#pagebreak()
=== Kod izleme
#soru_bilgi[Konu: işlem önceliği, bileşik atama, mantıksal operatörler · Zorluk: Orta]

Aşağıdaki programı *çalıştırmadan*, her `print` satırının ekrana yazacağı değeri yanına yazın.\ Sonra bilgisayarda çalıştırıp kontrol edin.

#grid(
  columns: (19em, 13em, auto), 
  gutter: 10pt,
  align: top
)[
#kod-blok(width: 100%)[
```python
a = 10
b = 4

print(a + b * 2)
print((a + b) * 2)
print(a / b)
print(a // b)
print(a % b)
print(a > 5 and b < 3)
print(not a == 10 or b == 4)
```]
][
#kod-blok(width: 100%,ilk-satir: 11)[
```python
bakiye = 100
bakiye += 50
bakiye -= 30
bakiye *= 2
print(bakiye)

mesaj = "Ha"
mesaj *= 3
mesaj += "!"
print(mesaj)
```]
][
#kod-blok(width: 100%, ilk-satir: 21)[
```python
x = 7
x = x + 3 * 2

print(x)
print(x % 5 == 3)
print(17 // 5, 17 % 5)

print(2 ** 3 ** 2)
print(-3 ** 2)
print(10 - 4 - 3)
```]
]

#iki_hucreli_satir[
=== Çıktı biçimlendirme
#soru_bilgi[Konu: `sep`, `end`, kaçış karakterleri · Zorluk: Orta]

  *a)* Kullanıcıdan gün, ay ve yılı ayrı ayrı alın. Tek bir `print()` ile, değerlerin arasına `/` koyarak ve satırın sonuna ` <- tarih biçimi` yazarak ekrana yazdırın. Bunun için `sep` ve `end` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Gün: 14
Ay: 11
Yıl: 2026
14/11/2026 <- tarih biçimi
```
]
]

#iki_hucreli_satir[
  *b)* Aşağıdaki çıktıyı `print()` ile üreten programı yazın. "Yükleniyor...Tamam" aynı satırda görünmeli, diğer satırlarda kaçış karakterleri kullanılmalıdır (ikinci satırdaki boşluk bir `Tab` boşluğudur).][
  #output-box[
```text
Yükleniyor...Tamam
Ad:	Ali
Yol: C:\Okul
O "evet" dedi
```
]
]

#iki_hucreli_satir[
=== Dakikayı gün, saat ve dakikaya çevirme
#soru_bilgi[Konu: tam bölme `//`, mod `%` · Zorluk: Orta]

  Kullanıcıdan toplam dakikayı alın; bu süreyi gün, saat ve dakika olarak yazdırın (1 gün = 1440 dakika). Yalnızca `//` ve `%` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Toplam dakika: 4000
2 gün 18 saat 40 dakika
```
]
]

#iki_hucreli_satir[
=== Basamaklarına ayırma
#soru_bilgi[Konu: tam bölme `//`, mod `%` · Zorluk: Orta]

  Kullanıcıdan 3 basamaklı bir sayı alın. Yüzler, onlar ve birler basamağını; basamakların toplamını; sayının tersini (487 için 784) ekrana yazdırın. Sayıyı metne çevirip dilimleme yapmayın, yalnızca `//` ve `%` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
3 basamaklı bir sayı girin: 487
Yüzler: 4, Onlar: 8, Birler: 7
Basamaklar toplamı: 19
Ters sayı: 784
```
]
]

#iki_hucreli_satir[
=== ATM para dağıtımı
#soru_bilgi[Konu: `//` ve `%` ile adım adım hesap, değişken güncelleme · Zorluk: Zor]

  Bir ATM'de 100, 50, 20, 10, 5 ve 1 TL'lik paralar var. Kullanıcının çekmek istediği tutarı (tam sayı) alın ve her paradan en az sayıda kullanılarak kaç adet verileceğini yazdırın. İpucu: büyük paradan başlayın; her adımda `//` ile adedi, `%` ile kalanı bulun.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Çekilecek tutar (TL): 287
100 TL: 2 adet
50 TL : 1 adet
20 TL : 1 adet
10 TL : 1 adet
5 TL  : 1 adet
1 TL  : 2 adet
```
]
]

#iki_hucreli_satir[
=== Market fişi
#soru_bilgi[Konu: sabit, f-string ile hizalama ve biçimlendirme · Zorluk: Zor]

  `KDV_ORANI = 0.20` sabitini tanımlayın. Kullanıcıdan ürün adını, birim fiyatı ve adedi alın. Ara toplamı, KDV'yi ve genel toplamı hesaplayın; aşağıdaki gibi, sütunları hizalı ve 28 tireli çizgilerle yazdırın. Ürün adı 12 karakterlik alanda sola, adet 3 karakterlik alanda sağa, fiyat 7 karakterlik alanda sağa yaslanmalıdır.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Ürün adı: Defter
Birim fiyat: 24.5
Adet: 4
----------------------------
Defter        4 x   24.50
Ara toplam        98.00 TL
KDV (%20)         19.60 TL
GENEL TOPLAM     117.60 TL
----------------------------
```
]
]

#iki_hucreli_satir[
=== Sinema bileti
#soru_bilgi[Konu: karşılaştırma ve mantıksal operatörler · Zorluk: Orta]

  Bir sinema; 12 yaşından küçük, 65 yaş ve üzeri ya da öğrenci olanlara indirim yapıyor. Kullanıcıdan yaşını ve öğrenci olup olmadığını (`E` / `H`) alın; değişkenlerin adını `yas` ve `ogrenci` yapın. İndirim hakkını ve tam fiyat ödeyip ödemeyeceğini `True` / `False` olarak yazdırın. `if` kullanmayın; öğrenci bilgisini bir karşılaştırma ile `bool` değişkene dönüştürün. Bu iki değişkenin adını ve değerini f-string'in `{değişken=}` biçimiyle yazdırın. Son olarak, `0.1 + 0.2 == 0.3` ifadesinin sonucunu ve `round()` ile düzeltilmiş halini ekrana yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Yaşınız: 16
Öğrenci misiniz? (E/H): E
yas=16
ogrenci=True
İndirimli bilet: True
Tam fiyat: False
False
True
```
]
]

#iki_hucreli_satir[
=== Üç sayının istatistiği
#soru_bilgi[Konu: yerleşik fonksiyonlar `len`, `max`, `min`, `abs`, `round` · Zorluk: Orta]

  Kullanıcıdan ismini ve üç ondalıklı sayıyı alın. Yalnızca yerleşik fonksiyonları kullanarak isminin kaç harfli olduğunu, en büyük ve en küçük sayıyı, bu ikisinin farkını, üç sayının ortalamasını (2 basamağa yuvarlanmış) ve birinci ile ikinci sayının arasındaki mutlak farkı yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
İsminiz: Mehmet
1. sayı: 7.5
2. sayı: 3
3. sayı: 9.25
İsminiz 6 harflidir.
En büyük: 9.25
En küçük: 3.0
Aralık: 6.25
Ortalama: 6.58
|1. sayı - 2. sayı| = 4.5
```
]
]
