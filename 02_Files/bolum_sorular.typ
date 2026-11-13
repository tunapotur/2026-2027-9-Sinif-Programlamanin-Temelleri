#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/ders-tablo.typ": *
#import "/lib/yardimcilar.typ": *
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


== Python Uygulama Soruları: Cevap Anahtarı
#v(-0.5em)
Öğrencilerin değişken adları ve yazım biçimi farklı olabilir, çıktılar aynıysa doğru kabul edilebilir.

=== Tanışma ve yaş hesabı
#v(-0.5em)
#iki_hucreli_satir(columns: (auto,auto))[
#kod-blok(width: 100%)[
```python
BU_YIL = 2026
ad = input("Adınız: ")
dogum_yili = int(input("Doğum yılınız: "))
```
]
][
#kod-blok(width: 100%,ilk-satir: 4)[
```python
yas = BU_YIL - dogum_yili

print(f"Merhaba {ad}, {yas} yaşındasın.")
```
]
]

#not_block(title: "Sık hata:")[`int()` kullanmayıp `"2026" - "2010"` işlemini yapmak `TypeError` hatası verir.]

=== Dikdörtgenin alanı ve çevresi
#v(-0.5em)
#grid(
  columns: (26em, auto), 
  gutter: 10pt,
  align: top
)[
#kod-blok(width: 100%)[
```python
kisa_kenar = float(input("Kısa kenar (cm): "))
uzun_kenar = float(input("Uzun kenar (cm): "))

alan = kisa_kenar * uzun_kenar
```]
][
#kod-blok(width: 100%,ilk-satir: 5)[
```python
cevre = 2 * (kisa_kenar + uzun_kenar)

print(f"Alan: {alan:.2f} cm²")
print(f"Çevre: {cevre:.2f} cm")
```]
]

#not_block(title: "Sık hata:")[Çevre formülünde parantez unutmak (`2 * kisa + uzun` yanlış sonuç verir).]

=== Not ortalaması
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok()[
```python
yazili1 = float(input("1. yazılı: "))
yazili2 = float(input("2. yazılı: "))
perf = float(input("Performans notu: "))
ortalama = yazili1 * 0.3
ortalama += yazili2 * 0.3
ortalama += perf * 0.4
```
  ]
][
  #kod-blok(ilk-satir: 7)[
```python
gecti_mi = ortalama >= 50
takdir_mi = ortalama >= 85

print(f"Ortalama: {ortalama:.1f}")
print(f"Geçti mi: {gecti_mi}")
print(f"Takdir mi: {takdir_mi}")
```
  ]
]

#not_block(title: "Sık hata:")[`gecti_mi = ortalama = 50` yazmak (karşılaştırma yerine atama).]

=== Tür dönüşümü
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok(width: 100%)[
```python
veri = input("Bir sayı girin: ")
print(veri, type(veri))

sayi = int(veri)
print(sayi, type(sayi))

ondalikli = float(sayi)
print(ondalikli, type(ondalikli))

kesilmis = int(85.85)
print(kesilmis, type(kesilmis))
```]
][
  #kod-blok(width: 100%,ilk-satir: 12)[
```python
kesilmis = int(85.85)
print(kesilmis, type(kesilmis))

print(veri + veri)
print(sayi + sayi)

adet = 5
birim_fiyat = 2.5

toplam_tutar = adet * birim_fiyat
print(toplam_tutar, type(toplam_tutar))
```]
]

#not_block(title: "Vurgulanacak noktalar:")[Metinle toplama birleştirme yapar (`2525`); `int` ile `float` çarpılınca sonuç `float` olur; `int(85.85)` yuvarlamaz, ondalık kısmı atar.]

=== Hatalı kodu düzeltin

#icerik-tablo(
  sutunlar: (auto, 1fr, auto),
  sutun_basliklari: ("Satır", "Hata nedeni", "Düzeltme"),
  icerik_hizalama: left + horizon,
  boyut: 9pt,
  [`3etap_skor = 80`], [Değişken adı rakamla başlayamaz], [`etap3_skor`],
  [`urun fiyati = 45.5`], [Adın içinde boşluk olamaz], [`urun_fiyati`],
  [`class = "9-A"`], [`class` Python'un anahtar kelimesidir], [`sinif`],
  [`Toplam-Puan = ...`], [Tire (`-`) kullanılamaz; ayrıca `3etap_skor` adı hatalıdır], [`toplam_puan = etap3_skor + 20`],
  [`print(Toplam-Puan)`], [Tire çıkarma işlemi gibi okunur], [`print(toplam_puan)`],
)

#iki_hucreli_satir(columns: (auto,auto))[
#kod-blok(width: 100%)[
```python
etap3_skor = 80
urun_fiyati = 45.5
sinif = "9-A"
toplam_puan = etap3_skor + 20
```
]
][
#kod-blok(width: 100%, ilk-satir:5)[
```python
print(toplam_puan)

KDV_ORANI = 0.20
MAKSIMUM_DENEME_SAYISI = 3
```
]
]

#not_block(title: "Not:")[`class` bir anahtar kelime olduğu için değişken adı olamaz; yerine herhangi bir geçerli ad (`sinif`) kullanılabilir. Öğrenci her satırın hatasını doğru adlandırıyorsa tam puan verilebilir.]


=== Kod izleme
#grid(
  columns: (auto,auto,auto),
  gutter:10pt,
  align: horizon
)[
#output-box[
```text
18
28
2.5
2
2
```
]
][
#output-box[
```text
512
-9
False
True
3
```
]
][
#output-box[
```text
240
HaHaHa!
13
True
3 2
```
]
]


#not_block(title: "Tartışılacak noktalar:")[
- `a + b * 2` → önce çarpma: `10 + 8 = 18`.
- `2 ** 3 ** 2` → üs alma sağdan sola: `2 ** 9 = 512`.
- `-3 ** 2` → üs alma eksi işaretinden önce: `-(3 ** 2) = -9`.
- `not a == 10 or b == 4` → karşılaştırmalar önce: `(not True) or True` = `True`.
- `bakiye`: 100 → 150 → 120 → 240.
- `x = 7 + 3 * 2` işleminin sonucu 13'tür; `13 % 5` 3 olduğundan sonuç `True`.
]

=== Çıktı biçimlendirme
#iki_hucreli_satir(columns: (30em,auto))[
#kod-blok(width: 100%)[
```python
gun = input("Gün: ")
ay = input("Ay: ")
yil = input("Yıl: ")

print(gun, ay, yil, sep="/", end=" <- tarih biçimi\n")
```
]
][
#kod-blok(width: 100%, ilk-satir: 6)[
```python
print("Yükleniyor", end="...")
print("Tamam")
print("Ad:\tAli")
print("Yol: C:\\Okul")
print("O \"evet\" dedi")
```
]
]




#not_block(title: "Not:")[`end` verilmezse her `print()` alt satıra geçer; `sep` yalnızca virgülle ayrılan değerlerin arasını etkiler. Ters eğik çizgiyi yazdırmak için `\\`, çift tırnağı yazdırmak için `\"` gerekir.]

=== Dakikayı gün, saat ve dakikaya çevirme
#iki_hucreli_satir(align: top, columns: (auto,23em))[
#kod-blok(width: 100%)[
```python
toplam_dakika = int(input("Toplam dakika: "))

gun = toplam_dakika // 1440
kalan = toplam_dakika % 1440
saat = kalan // 60
dakika = kalan % 60

print(f"{gun} gün {saat} saat {dakika} dakika")
```
]
][
#not_block(title: "Kontrol:")[4000 = 2 × 1440 + 1120 ve 1120 = 18 × 60 + 40. Ders notundaki "135 dakika → 2 saat 15 dakika" örneğinin bir adım genişletilmiş halidir.]
]




=== Basamaklarına ayırma
#iki_hucreli_satir(align: top, columns: (auto,16em))[
  #kod-blok(width: 100%)[
```python
sayi = int(input("3 basamaklı bir sayı girin: "))

yuzler = sayi // 100
onlar = (sayi // 10) % 10
birler = sayi % 10

basamak_toplami = yuzler + onlar + birler
ters_sayi = birler * 100 + onlar * 10 + yuzler

print(f"Yüzler: {yuzler}, Onlar: {onlar}, Birler: {birler}")
print(f"Basamaklar toplamı: {basamak_toplami}")
print(f"Ters sayı: {ters_sayi}")
```
]
][
#not_block(title: "Not:")[Onlar basamağı için önce `// 10` ile son basamak atılır (487 → 48), sonra `% 10` ile son basamak alınır (8). Bu, ders notundaki "son basamağı al / at" örneğinin devamıdır.]
]




=== ATM para dağıtımı

#iki_hucreli_satir(columns: (28em, auto))[
#kod-blok(width: 100%)[
```python
tutar = int(input("Çekilecek tutar (TL): "))

yuzluk = tutar // 100
kalan = tutar % 100

ellilik = kalan // 50
kalan = kalan % 50

yirmilik = kalan // 20
kalan = kalan % 20

onluk = kalan // 10
kalan = kalan % 10
```
]
][
#kod-blok(width: 100%, ilk-satir: 14)[
```python
beslik = kalan // 5
birlik = kalan % 5

print(f"100 TL: {yuzluk} adet")

print(f"50 TL : {ellilik} adet")

print(f"20 TL : {yirmilik} adet")

print(f"10 TL : {onluk} adet")

print(f"5 TL  : {beslik} adet")
print(f"1 TL  : {birlik} adet")
```
]
]

#not_block(title: "Kontrol:")[2×100 + 50 + 20 + 10 + 5 + 2×1 = 287. Bu soru, `kalan` değişkeninin her adımda yeniden atanarak güncellendiğini göstermek için iyi bir fırsattır.]

=== Market fişi
#v(-0.5em)
#iki_hucreli_satir(columns: (20.3em,auto),gutter: 4pt)[
#kod-blok(width: 100%)[
```python
KDV_ORANI = 0.20

urun = input("Ürün adı:")
fiyat = float(input("Birim fiyat:"))
adet = int(input("Adet:"))

ara_toplam = fiyat * adet
kdv = ara_toplam * KDV_ORANI
genel_toplam = ara_toplam + kdv
```
]
][
#kod-blok(width: 100%, ilk-satir: 10)[
```python
print("-" * 28)

print(f"{urun:<12}{adet:>3} x {fiyat:>7.2f}")
print(f"{'Ara toplam':<14}{ara_toplam:>9.2f} TL")

print(f"{'KDV (%20)':<14}{kdv:>9.2f} TL")
print(f"{'GENEL TOPLAM':<14}{genel_toplam:>9.2f} TL")

print("-" * 28)
```
]
]

=== Sinema bileti
#v(-0.5em)
#kod-blok(width: 100%)[
```python
yas = int(input("Yaşınız: "))
ogrenci = input("Öğrenci misiniz? (E/H): ") == "E"

indirimli = yas < 12 or yas >= 65 or ogrenci
tam_fiyat = not indirimli

print(f"{yas=}")
print(f"{ogrenci=}")
print(f"İndirimli bilet: {indirimli}")
print(f"Tam fiyat: {tam_fiyat}")
print(0.1 + 0.2 == 0.3)
print(round(0.1 + 0.2, 2) == 0.3)
```
]

Çıktı öğrencinin girdiği değerlere göre değişir. Üç farklı deneme:
#v(-0.5em)
#icerik-tablo(
  sutunlar: (auto, auto, auto, auto),
  sutun_basliklari: ("Yaş", "Öğrenci", "İndirimli bilet", "Tam fiyat"),
  boyut: 9pt,
  [16], [E], [True], [False],
  [70], [H], [True], [False],
  [30], [H], [False], [True],
)
#v(-0.5em)
#not_block(title: "Not:")[Son iki satır her zaman `False` ve `True` yazar: ondalıklı sayılar tam kesinlikle saklanamadığı için `0.1 + 0.2` ifadesi `0.30000000000000004` olur. Bu, ders notu 18.4'teki uyarının uygulamasıdır.]
#v(-1em)
=== Üç sayının istatistiği
#v(-0.5em)
#kod-blok(width: 100%)[
```python
isim = input("İsminiz: ")
a = float(input("1. sayı: "))
b = float(input("2. sayı: "))
c = float(input("3. sayı: "))

en_buyuk = max(a, b, c)
en_kucuk = min(a, b, c)
aralik = en_buyuk - en_kucuk
ortalama = round((a + b + c) / 3, 2)
fark = abs(a - b)

print(f"İsminiz {len(isim)} harflidir.")
print(f"En büyük: {en_buyuk}")
print(f"En küçük: {en_kucuk}")
print(f"Aralık: {aralik}")
print(f"Ortalama: {ortalama}")
print(f"|1. sayı - 2. sayı| = {fark}")
```
]

#not_block(title: "Not:")[Girdiler `float()` ile çevrildiği için `3` değeri `3.0` olarak yazılır; öğrenciler bunu hata sanabilir.]
