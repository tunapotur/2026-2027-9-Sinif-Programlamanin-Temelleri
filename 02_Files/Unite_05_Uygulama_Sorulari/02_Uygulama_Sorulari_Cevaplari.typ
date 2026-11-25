#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#pagebreak()
=== Uygulama Soruları Cevapları

*Soru 1: Çemberin çevresi ve alanı*

#kod-blok(width: 100%)[
  ```python
  PI = 3.14159

  yaricap = float(input("Yarıçap (cm): "))

  cevre = 2 * PI * yaricap
  alan = PI * yaricap ** 2

  print(f"Çevre: {cevre:.2f} cm")
  print(f"Alan: {alan:.2f} cm²")
  ```
]


*Soru 2: Vücut kitle endeksi (BMI)*

#kod-blok(width: 100%)[
  ```python
  boy = float(input("Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):"))
  kilo = int(input("Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):"))

  bmi = kilo / boy ** 2

  print("Vücut Kitle Endeksiniz (BMI):", bmi)
  ```
]

*Soru 3: Araç yakıt tüketimi*

#kod-blok(width: 100%)[
  ```python
  print("Araç Kullanım Bilgileri Giriş Ekranı")

  yol = float(input("Gidilen Yol(km):"))
  yakit = float(input("Aldığınız Yakıt Miktarı(lt):"))
  tutar = float(input("Alınan Yakıt Tutarı:"))

  yuz_km_litre = yakit / yol * 100
  yuz_km_tutar = tutar / yol * 100

  print("100km 'de Harcanan Yakıtın Litresi:", yuz_km_litre)
  print("100km 'de Harcanan Yakıtın Tutarı:", yuz_km_tutar)
  ```
]

*Soru 4: Sayıyı iki katının beş fazlasına güncelleme*

#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: "))

  sayi = sayi * 2 + 5
  print("Girilen sayının değeri 2 katının 5 fazlası kadar arttırıldı")
  print("Sayının Yeni Değeri :", sayi)
  ```
]

*Soru 5: Dik üçgende hipotenüs*

#kod-blok(width: 100%)[
  ```python
  a = float(input("a Kenarının Uzunluğu: "))
  b = float(input("b Kenarının Uzunluğu: "))

  c = (a ** 2 + b ** 2) ** 0.5
  print("c Kenarının Uzunluğu(Hipotenüs): ", c)
  ```
]


*Soru 6: Tanışma ve yaş hesabı*
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

#not_block(title: "Sık hata:")[Kullanıcıdan alınan veri metin (`str`) olduğundan `int()` ile dönüştürülmezse `2026 - "2010"` işlemi `TypeError` hatası verir.]

*Soru 7: Dikdörtgenin alanı ve çevresi*
#iki_hucreli_satir(columns: (25.1em, auto))[
#kod-blok(width: 100%)[
```python
kisa_kenar = float(input("Kısa kenar (cm): "))
uzun_kenar = float(input("Uzun kenar (cm): "))
alan = kisa_kenar * uzun_kenar
```]
][
#kod-blok(width: 100%, ilk-satir: 4)[
```python
cevre = 2 * (kisa_kenar + uzun_kenar)
print(f"Alan: {alan:.2f} cm²")
print(f"Çevre: {cevre:.2f} cm")
```]
]

*Soru 8: Not ortalaması*
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok(width: 100%)[
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
  #kod-blok(ilk-satir: 7, width: 100%)[
```python
gecti_mi = ortalama >= 50
takdir_mi = ortalama >= 85

print(f"Ortalama: {ortalama:.1f}")
print(f"Geçti mi: {gecti_mi}")
print(f"Takdir mi: {takdir_mi}")
```
  ]
]

*Soru 9: Tür dönüşümü*
#iki_hucreli_satir(columns: (auto,auto))[
  #kod-blok(width: 100%)[
```python
veri = input("Bir sayı girin: ")
print(veri, type(veri))

sayi = int(veri)
print(sayi, type(sayi))
```]
][
  #kod-blok(width: 100%, ilk-satir: 6)[
```python
ondalikli = float(sayi)
print(ondalikli, type(ondalikli))

kesilmis = int(85.85)
print(kesilmis, type(kesilmis))
```]
]

#not_block(title: "Vurgulanacak noktalar:")[Klavyeden okunan değer her zaman `str` türündedir. `int()` ve `float()` ile bilinçli (açık) tür dönüşümü yapılır. `int(85.85)` yuvarlama yapmaz, ondalık kısmı atarak tam sayıya (`85`) dönüştürür.]

*Soru 10: Hatalı kodu düzeltin*
#kod-blok(width: 100%)[
```python
etap3_skor = 80
urun_fiyati = 45.5
toplam_puan = etap3_skor + 20

print(toplam_puan)
```
]

#icerik-tablo(
  sutunlar: (auto, auto, auto),
  sutun_basliklari: ("Satır", "Hata nedeni", "Düzeltme"),
  sutun_baslik_hizalama: center,
  icerik_hizalama: left + horizon,
  // boyut: 9pt,
  // dikey-bosluk: 7.5pt,
  [`3etap_skor = 80`], [Değişken adı rakamla başlayamaz], [*`etap3_skor = 80`*],
  [`urun fiyati = 45.5`], [Değişken adında boşluk olamaz], [*`urun_fiyati = 45.5`*],
  [`Toplam-Puan = 3etap_skor + 20`], [Değişken adında tire (`-`) kullanılamaz; `snake_case` kuralına uyulmalı ve `3etap_skor` adı düzeltilmelidir], [*`toplam_puan = etap3_skor + 20`*],
  [`print(Toplam-Puan)`], [Tire çıkarma işlemi gibi algılanır; tanımlanan geçerli değişken adı yazılmalıdır], [*`print(toplam_puan)`*],
)

*Soru 11: Kod izleme*

#grid(
  columns: (19.3em, 13.5em, auto), 
  gutter: 10pt,
  align: top
)[
#kod-blok(width: 100%)[
```python
a = 10
b = 4

print(a + b * 2)  #18
print((a + b) * 2)#28
print(a / b)      #2.5
print(a // b)     #2
print(a % b)      #2
print(a > 5 and b < 3) #False
print(not a == 10 or b == 4)#True
```]
][
#kod-blok(width: 100%,ilk-satir: 11)[
```python
bakiye = 100
bakiye += 50
bakiye -= 30
bakiye *= 2
print(bakiye) #240

mesaj = "Ha"
mesaj *= 3
mesaj += "!"
print(mesaj) #HaHaHa!
```]
][
#kod-blok(width: 100%, ilk-satir: 21)[
```python
x = 7
x = x + 3 * 2

print(x) #13
print(x % 5 == 3) #True
print(17//5, 17 % 5) #3 2

print(2 ** 3 ** 2) #512
print(-3 ** 2) #-9
print(10 - 4 - 3) #3
```]
]

#grid(
  columns: (19.3em, 13.5em, auto),
  gutter:10pt,
  align: top
)[
#output-box(title: "1-10. Satırlar")[
```text
18
28
2.5
2
2
False
True
```
]
][
#output-box(title: "11-20. Satırlar")[
```text
240
HaHaHa!
```
]
][
#output-box(title: "21-30. Satırlar")[
```text
13
True
3 2
512
-9
3
```
]
]
#pagebreak()
*Soru 12: Dakikayı gün, saat ve dakikaya çevirme*

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

*Soru 13: Basamaklarına ayırma*
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

*Soru 14: ATM para dağıtımı*
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
#kod-blok(width: 100%, ilk-satir: 10)[
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

*Soru 15: Sinema bileti*
#grid(
  columns: (2fr, 1fr),
  gutter: 10pt,
  align: horizon,
  [
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
```
]
  ],
  [
#par(justify: false)[
Çıktı öğrencinin girdiği değerlere göre değişir. Üç farklı deneme:
]

#icerik-tablo(
  sutunlar: (auto, auto, auto, auto),
  sutun_basliklari: ([Yaş], [Öğrenci], [İndirimli\ Bilet], [Tam\ Fiyat]),
  baslik-boyut: 9pt,
  dikey-bosluk: 6pt,
  [16], [E], [True], [False],
  [70], [H], [True], [False],
  [30], [H], [False], [True],
)
  ]
)

*Soru 16: Çıktı biçimlendirme*
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

#pagebreak()
*Soru 17: Market fişi*
#iki_hucreli_satir(columns: (21em,auto),gutter: 4pt)[
#kod-blok(width: 100%)[
```python
KDV_ORANI = 0.20

urun = input("Ürün adı: ")
fiyat = float(input("Birim fiyat: "))
adet = int(input("Adet: "))

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

#not_block(title: "Not:")[f-string içinde `<` sola yaslama, `>` sağa yaslama, `:.2f` ise ondalık sayıyı virgülden sonra 2 basamakla göstermeyi sağlar. `"-" * 28` ifadesi 28 adet tire karakterini art arda yazdırır.]

*Soru 18: Sayı ve İsim İstatistiği*
#kod-blok(width: 100%)[
```python
isim = input("İsminizi girin: ")
sayi1 = float(input("1. Sayı: "))
sayi2 = float(input("2. Sayı: "))

harf_sayisi = len(isim)
en_buyuk = max(sayi1, sayi2)
en_kucuk = min(sayi1, sayi2)
ortalama = round((sayi1 + sayi2) / 2, 2)
mutlak_fark = round(abs(sayi1 - sayi2), 2)

print(f"İsminiz {harf_sayisi} harflidir.")
print(f"En büyük: {en_buyuk}")
print(f"En küçük: {en_kucuk}")
print(f"Ortalama: {ortalama}")
print(f"Mutlak fark: {mutlak_fark}")
```
]

#not_block(title: "Not:")[
`len()` fonksiyonu metnin karakter (harf) sayısını, `max()` ve `min()` en büyük ve en küçük sayıyı, `abs()` mutlak farkı, `round()` ise ondalıklı sayıyı istenen basamak sayısına (örnekte 2 basamak) yuvarlamayı sağlar.
]
