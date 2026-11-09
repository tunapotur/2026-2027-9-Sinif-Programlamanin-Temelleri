#import "/lib/template.typ": *
#import "fonksiyon-aciklama.typ": fonksiyon-aciklama

#show: conf

= Python `type()` Fonksiyonu

#ders-notu[Python'da her değerin bir türü vardır; `type()` bu türü bize söyler.]

== `type()` Nedir?

Python'da her değer (sayı, metin, liste, hatta fonksiyonlar) bir *nesnedir* ve her nesne bir *türe (sınıfa)* aittir. `type()` fonksiyonu, kendisine verilen nesnenin türünü döndürür.

#bilgi-kutusu("Tanım")[
  `type(nesne)` ifadesi, nesnenin ait olduğu sınıfı döndürür. Dönen değer bir değişkene atanabilir veya doğrudan yazdırılabilir.
]

Aşağıdaki şemada `type(10)` çağrısının sonucu `tur` değişkenine nasıl aktarılıyor, görebilirsin. Fonksiyon `int` sınıfını döndürür.

#align(center)[
  #fonksiyon-aciklama(degisken: "tur", ifade: "type(10)", deger: "int", boyut: 22pt)
]

#ornek_baslik[Örnek 1: Temel kullanım]

#kod-blok[
```python
print(type(10))
print(type(3.14))
print(type("Merhaba"))
print(type(True))
```
]

#output-box[
```
<class 'int'>
<class 'float'>
<class 'str'>
<class 'bool'>
```
]

Çıktıdaki `<class 'int'>` ifadesi şu anlama gelir: "Bu değer, `int` sınıfından bir nesnedir."

== Temel Veri Türleri

#ders-tablosu(
  "Sık Karşılaşılan Türler",
  (3cm, 3.5cm, 6cm),
  ("Değer", "type() sonucu", "Açıklama"),
  hizalama: (center + horizon, center + horizon, left + horizon),
  [`42`], [`int`], [Tam sayı],
  [`3.14`], [`float`], [Ondalıklı sayı],
  [`"Python"`], [`str`], [Metin (string)],
  [`True`], [`bool`], [Mantıksal değer],
  [`[1, 2, 3]`], [`list`], [Liste],
  [`(1, 2, 3)`], [`tuple`], [Demet],
  [`{"a": 1}`], [`dict`], [Sözlük],
  [`{1, 2, 3}`], [`set`], [Küme],
  [`None`], [`NoneType`], [Değer yokluğu],
)

== Neden İhtiyaç Duyarız?

Python *dinamik tipli* bir dildir. Bir değişkenin türünü önceden yazmayız; Python değere bakarak türü kendisi belirler. Üstelik aynı değişken sonradan başka türde bir değer alabilir.

#ornek_baslik[Örnek 2: Değişkenin türü değişebilir]

#kod-blok[
```python
x = 5
print(type(x))

x = "beş"
print(type(x))
```
]

#output-box[
```
<class 'int'>
<class 'str'>
```
]

Tür önceden yazılmadığı için, bir değişkenin o anda hangi türde olduğunu görmek istediğimizde `type()` kullanırız. Hata ayıklarken (debug) en sık başvurulan araçlardan biridir.

=== Tipik hata: `input()` her zaman `str` döndürür

#kod-blok[
```python
yas = input("Yaşınız: ")
print(type(yas))

yas = int(yas)
print(type(yas))
```
]

#output-box(title: "Ekran Çıktısı (kullanıcı 15 girdiğinde)")[
```
Yaşınız: 15
<class 'str'>
<class 'int'>
```
]

#not_block(title: "Dikkat:")[
  Kullanıcı `15` yazsa bile `input()` bunu `"15"` yani *metin* olarak verir. Matematiksel işlem yapmadan önce `int()` veya `float()` ile dönüştürmek gerekir.
]

== Tür Kontrolü: `type()` ve `isinstance()`

Bir değerin belirli bir türde olup olmadığını kontrol etmek için iki yol vardır.

#kod-blok[
```python
sayi = 10

# Yöntem 1: type() ile karşılaştırma
if type(sayi) == int:
    print("Bu bir tam sayı")

# Yöntem 2: isinstance() ile kontrol
if isinstance(sayi, int):
    print("Bu bir tam sayı")
```
]

İkisi de aynı sonucu verir, ancak aralarında önemli bir fark vardır: `isinstance()` *miras (inheritance)* ilişkisini de dikkate alır, `type() ==` almaz.

#kod-blok[
```python
print(type(True) == int)
print(isinstance(True, int))
```
]

#output-box[
```
False
True
```
]

Python'da `bool` sınıfı, `int` sınıfından türetilmiştir. Yani `True` aslında özel bir tam sayıdır. `isinstance()` bunu doğru şekilde `True` olarak döndürür.

#ders-notu[Tür kontrolü için `isinstance()`, türü görmek için `type()` kullan.]

=== Birden fazla tür kontrol etmek

#kod-blok[
```python
deger = 3.5
if isinstance(deger, (int, float)):
    print("Bu bir sayı")
```
]

== Türü Kullanarak Nesne Oluşturmak

`type()` ile elde ettiğimiz tür, aslında çağrılabilir bir sınıftır. Dolayısıyla türün kendisini kullanarak yeni bir nesne üretebiliriz.

#kod-blok[
```python
a = 5
b = type(a)("12")    # type(a) -> int, yani int("12")
print(b)
print(type(b))
```
]

#output-box[
```
12
<class 'int'>
```
]

== İleri Düzey: Üç Argümanlı `type()`

`type()` aslında iki farklı biçimde çalışır.

#ders-tablosu(
  none,
  (5.5cm, 9cm),
  ("Kullanım", "Ne yapar?"),
  hizalama: (left + horizon, left + horizon),
  [`type(nesne)`], [Nesnenin türünü döndürür.],
  [`type(ad, tabanlar, ozellikler)`], [Dinamik olarak yeni bir *sınıf* oluşturur.],
)

Aşağıdaki iki tanım birbirine eşdeğerdir.

#kod-blok[
```python
# Klasik yol
class Ogrenci:
    okul = "MAETMTAL"

# type() ile aynı sınıf
Ogrenci = type("Ogrenci", (), {"okul": "MAETMTAL"})

o = Ogrenci()
print(o.okul)
print(type(o))
```
]

#output-box[
```
MAETMTAL
<class '__main__.Ogrenci'>
```
]

Şimdilik bilmen gereken şey, Python'da *sınıfların da birer nesne olduğu* ve onların türünün `type` olduğudur.

#kod-blok[
```python
print(type(int))
print(type(type))
```
]

#output-box[
```
<class 'type'>
<class 'type'>
```
]

#bilgi-kutusu("Özet")[
  - `type(nesne)` nesnenin türünü döndürür.
  - Python dinamik tipli olduğu için değişkenin türü sonradan değişebilir.
  - `input()` her zaman `str` döndürür; dönüşüm yapmayı unutma.
  - Tür kontrolü için `isinstance()` daha güvenlidir.
  - `type()` üç argümanla çağrılırsa yeni sınıf üretir (ileri düzey).
]

== Alıştırmalar

+ Aşağıdaki değerlerin türlerini tahmin et, sonra `type()` ile kontrol et: `7`, `7.0`, `"7"`, `[7]`, `(7,)`, `(7)`.
+ Kullanıcıdan iki sayı alıp toplayan bir program yaz. Önce dönüşüm yapmadan çalıştır, sonucu açıkla; ardından `type()` ile türleri yazdırarak hatayı düzelt.
+ `isinstance(True, int)` ifadesi neden `True` döndürür? Kendi cümlelerinle açıkla.
+ `type(5) == type(5.0)` ifadesinin sonucu nedir? Neden?
