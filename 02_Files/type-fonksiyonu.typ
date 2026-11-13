#import "/pageGeneralConfig.typ": *
#import "../lib/fonksiyon-aciklama.typ": fonksiyon-aciklama
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/ders-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#show: conf

== Python Tür Kontrolü: `type()` ve `isinstance()` Fonksiyonları
=== `type()` Fonksiyonu
Python'da her değerin bir türü vardır; *`type()`* fonksiyonu bu türü bize söyler. Python'da her değer (sayı, metin, liste, hatta fonksiyonlar) bir *nesnedir* ve her nesne bir *türe (sınıfa)* aittir. `type()` fonksiyonu, kendisine verilen nesnenin türünü döndürür.
\ Altaki şemada *`type(10)`* çağrısının sonucu *`type()`* fonksiyonu *`int`* sınıfını döndürerek *`tur`* değişkenine atıyor.

#iki_hucreli_satir(columns: (auto,auto))[
  #align(center)[
   #block(   
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: auto
    )[
  #fonksiyon-aciklama(degisken: "tur", ifade: "type(10)", deger: "int", boyut: 20pt)
]]
][
#kod-cikti(baslik: [Temel kullanım])[
```python
print(type(10))
print(type(3.14))
print(type("Merhaba"))
print(type(True))
```
][
```
<class 'int'>
<class 'float'>
<class 'str'>
<class 'bool'>
```
]
]


Çıktıdaki *`<class 'int'>`* ifadesi şu anlama gelir: "Bu değer, *`int`* sınıfından bir nesnedir."

#ders-tablosu(
  "Sık Karşılaşılan Türler",
  (3cm, 3.5cm, 6cm),boyut:11pt,
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

Python *dinamik tipli* bir dildir. Bir değişkenin türünü önceden yazmayız; Python değere bakarak türü kendisi belirler. Üstelik aynı değişken sonradan başka türde bir değer alabilir.

#kod-cikti(baslik:"Değişkenin türü değişebilir", baslik-yeri: "sag")[
```python
x = 5
print(type(x))

x = "beş"
print(type(x))
```
][
```
<class 'int'>
<class 'str'>
```
]

Tür önceden yazılmadığı için, bir değişkenin o anda hangi türde olduğunu görmek istediğimizde `type()` kullanırız. Hata ayıklarken (debug) en sık başvurulan araçlardan biridir.

#kod-cikti(baslik: [`input()` Her Zaman `str` Döndürür], baslik-yeri: "sag")[
```python
yas = input("Yaşınız: ")
print(type(yas))

yas = int(yas)
print(type(yas))
```
][
```
Yaşınız: 15
<class 'str'>
<class 'int'>
```
]


#not_block(title: "Dikkat:")[
  Kullanıcı `15` yazsa bile `input()` bunu `"15"` yani *metin* olarak verir. Matematiksel işlem yapmadan önce `int()` veya `float()` ile dönüştürmek gerekir.
]

=== `isinstance()` Fonksiyonu
Veri veya değişken türünü görmek için `type()` fonksiyonu kullanılır. Kullanıcının girdiği veri türünü kontrol etmek için *`isinstance()`* fonksiyonu çok kullanışlı bir araçtır.

#align(center)[
   #block(   
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
    )[
  #fonksiyon-aciklama(degisken: "tamsayi", ifade: "isinstance(3, int)", deger: "True", boyut: 24pt)
]]

#kod-cikti(baslik:[`isinstance()` Fonksiyonun Kullanımı],baslik-yeri: "sag")[
```python
deger = 3
if isinstance(deger, int):
    print("Değer Bir Tamsayıdır!")

deger = 3.5
if isinstance(deger, float):
    print("Değer Kesirli Bir Sayıdır!")

if isinstance(deger, (int, float)):
    print("Değer Bir Sayıdır!")
```
][
```
Değer Bir Tamsayıdır!
Değer Kesirli Bir Sayıdır!
Değer Bir Sayıdır!
```
]

`isinstance()` fonksiyonu, değişkenlerin ve fonksiyon parametrelerinin tür kontrolü için oldukça uygundur. Aşağıdaki kodda `isinstance()` fonksiyonu, verilen değerin hem tam sayı (`int`) hem de ondalıklı sayı (`float`) olması durumunda `True` döndürecektir. Birden fazla tür kontrolü yapmanız gereken durumlar için `isinstance()` fonksiyonunu bu şekilde kullanabilirsiniz.

#align(center)[
  // #v(1em)
#kod-satiri(no:0, size: 14pt, weight: "semibold")[
  ```python
  isinstance(deger, (int, float))
  ```
]
]

#align(center)[
  #image("images/sayfa_alt_bosluklar/sy37.jpg", width: 98%)
]
