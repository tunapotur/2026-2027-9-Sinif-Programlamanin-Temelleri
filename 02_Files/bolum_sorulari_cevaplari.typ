// Uygulama Soruları: Cevap Anahtarı (öğretmen)
// Ana dosyanıza eklerken ilk iki satırı (import ve show) silip içeriği #include ile kullanabilirsiniz.
#import "/lib/template.typ": *
#show: conf

= Python Uygulama Soruları: Cevap Anahtarı

Cevaplar örnek çözümlerdir; öğrencilerin değişken adları ve yazım biçimi farklı olabilir, çıktılar aynıysa doğru kabul edilebilir.

== Tanışma ve yaş hesabı

#kod-blok(width: 100%)[
```python
BU_YIL = 2026
ad = input("Adınız: ")
dogum_yili = int(input("Doğum yılınız: "))
yas = BU_YIL - dogum_yili
print(f"Merhaba {ad}, {yas} yaşındasın.")
```
]

#not_block(title: "Sık hata:")[`int()` kullanmayıp `"2026" - "2010"` işlemini denemek (`TypeError`). `input()` her zaman metin döndürür.]

== Dikdörtgenin alanı ve çevresi

#kod-blok(width: 100%)[
```python
kisa_kenar = float(input("Kısa kenar (cm): "))
uzun_kenar = float(input("Uzun kenar (cm): "))

alan = kisa_kenar * uzun_kenar
cevre = 2 * (kisa_kenar + uzun_kenar)

print(f"Alan: {alan:.2f} cm²")
print(f"Çevre: {cevre:.2f} cm")
```
]

#not_block(title: "Sık hata:")[Çevre formülünde parantez unutmak (`2 * kisa + uzun` yanlış sonuç verir).]

== Not ortalaması

#kod-blok(width: 100%)[
```python
yazili1 = float(input("1. yazılı: "))
yazili2 = float(input("2. yazılı: "))
performans = float(input("Performans notu: "))

ortalama = yazili1 * 0.3 + yazili2 * 0.3 + performans * 0.4
gecti_mi = ortalama >= 50
takdir_mi = ortalama >= 85

print(f"Ortalama: {ortalama:.1f}")
print(f"Geçti mi: {gecti_mi}")
print(f"Takdir mi: {takdir_mi}")
```
]

#not_block(title: "Sık hata:")[`gecti_mi = ortalama = 50` yazmak (karşılaştırma yerine atama).]

== Tür dönüşümü

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

print(veri + veri)
print(sayi + sayi)

adet = 5
birim_fiyat = 2.5
toplam_tutar = adet * birim_fiyat
print(toplam_tutar, type(toplam_tutar))
```
]

#not_block(title: "Vurgulanacak noktalar:")[Metinle toplama birleştirme yapar (`2525`); `int` ile `float` çarpılınca sonuç `float` olur; `int(85.85)` yuvarlamaz, ondalık kısmı atar.]

== Hatalı kodu düzeltin

#ders-tablosu(
  none,
  (auto, 1fr, auto),
  ("Satır", "Hata nedeni", "Düzeltme"),
  hizalama: left + horizon,
  boyut: 9pt,
  [`3etap_skor = 80`], [Değişken adı rakamla başlayamaz], [`etap3_skor`],
  [`urun fiyati = 45.5`], [Adın içinde boşluk olamaz], [`urun_fiyati`],
  [`class = "9-A"`], [`class` Python'un anahtar kelimesidir], [`sinif`],
  [`Toplam-Puan = ...`], [Tire (`-`) kullanılamaz; ayrıca `3etap_skor` adı hatalıdır], [`toplam_puan = etap3_skor + 20`],
  [`print(Toplam-Puan)`], [Tire çıkarma işlemi gibi okunur], [`print(toplam_puan)`],
)

#kod-blok(width: 100%)[
```python
etap3_skor = 80
urun_fiyati = 45.5
sinif = "9-A"
toplam_puan = etap3_skor + 20
print(toplam_puan)

KDV_ORANI = 0.20
MAKSIMUM_DENEME_SAYISI = 3
```
]

#not_block(title: "Not:")[`class` bir anahtar kelime olduğu için değişken adı olamaz; yerine herhangi bir geçerli ad (`sinif`) kullanılabilir. Öğrenci her satırın hatasını doğru adlandırıyorsa tam puan verilebilir.]

== Kod izleme

#output-box[
```text
18
28
2.5
2
2
512
-9
False
True
3
240
HaHaHa!
13
True
3 2
```
]

#not_block(title: "Tartışılacak noktalar:")[
- `a + b * 2` → önce çarpma: `10 + 8 = 18`.
- `2 ** 3 ** 2` → üs alma sağdan sola: `2 ** 9 = 512`.
- `-3 ** 2` → üs alma eksi işaretinden önce: `-(3 ** 2) = -9`.
- `not a == 10 or b == 4` → karşılaştırmalar önce: `(not True) or True` = `True`.
- `bakiye`: 100 → 150 → 120 → 240.
- `x = 7 + 3 * 2` işleminin sonucu 13'tür; `13 % 5` 3 olduğundan sonuç `True`.
]

== Çıktı biçimlendirme

#kod-blok(width: 100%)[
```python
gun = input("Gün: ")
ay = input("Ay: ")
yil = input("Yıl: ")

print(gun, ay, yil, sep="/", end=" <- tarih biçimi\n")
```
]

#kod-blok(width: 100%)[
```python
print("Yükleniyor", end="...")
print("Tamam")
print("Ad:\tAli")
print("Yol: C:\\Okul")
print("O \"evet\" dedi")
```
]

#not_block(title: "Not:")[`end` verilmezse her `print()` alt satıra geçer; `sep` yalnızca virgülle ayrılan değerlerin arasını etkiler. Ters eğik çizgiyi yazdırmak için `\\`, çift tırnağı yazdırmak için `\"` gerekir.]

== Dakikayı gün, saat ve dakikaya çevirme

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

#not_block(title: "Kontrol:")[4000 = 2 × 1440 + 1120 ve 1120 = 18 × 60 + 40. Ders notundaki "135 dakika → 2 saat 15 dakika" örneğinin bir adım genişletilmiş halidir.]

== Basamaklarına ayırma

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

#not_block(title: "Not:")[Onlar basamağı için önce `// 10` ile son basamak atılır (487 → 48), sonra `% 10` ile son basamak alınır (8). Bu, ders notundaki "son basamağı al / at" örneğinin devamıdır.]

== ATM para dağıtımı

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

#not_block(title: "Kontrol:")[2×100 + 50 + 20 + 10 + 5 + 2×1 = 287. Bu soru, `kalan` değişkeninin her adımda yeniden atanarak güncellendiğini göstermek için iyi bir fırsattır.]

== Market fişi

#kod-blok(width: 100%)[
```python
KDV_ORANI = 0.20

urun = input("Ürün adı: ")
fiyat = float(input("Birim fiyat: "))
adet = int(input("Adet: "))

ara_toplam = fiyat * adet
kdv = ara_toplam * KDV_ORANI
genel_toplam = ara_toplam + kdv

print("-" * 28)
print(f"{urun:<12}{adet:>3} x {fiyat:>7.2f}")
print(f"{'Ara toplam':<14}{ara_toplam:>9.2f} TL")
print(f"{'KDV (%20)':<14}{kdv:>9.2f} TL")
print(f"{'GENEL TOPLAM':<14}{genel_toplam:>9.2f} TL")
print("-" * 28)
```
]

#not_block(title: "Not:")[Biçimde `<` sola, `>` sağa yaslar; `:>7.2f` ise "7 karakter genişliği, sağa yaslı, 2 ondalık" demektir. Metnin kendisini süslü parantez içine koyarken dış tırnak çift, iç tırnak tek olmalıdır (`{'Ara toplam':<14}`).]

== Sinema bileti

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

#ders-tablosu(
  none,
  (auto, auto, auto, auto),
  ("Yaş", "Öğrenci", "İndirimli bilet", "Tam fiyat"),
  boyut: 9pt,
  [16], [E], [True], [False],
  [70], [H], [True], [False],
  [30], [H], [False], [True],
)

#not_block(title: "Not:")[Son iki satır her zaman `False` ve `True` yazar: ondalıklı sayılar tam kesinlikle saklanamadığı için `0.1 + 0.2` ifadesi `0.30000000000000004` olur. Bu, ders notu 18.4'teki uyarının uygulamasıdır.]

== Üç sayının istatistiği

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
