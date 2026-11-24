#import "../../pageGeneralConfig.typ": *
#import "../../lib/qr_code.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/yardimcilar.typ": *
#import "../../lib/icerik-tablo.typ": *

// #show: conf
//TODO Burada Kaldım
=== Tür Dönüşümü (Type Conversion / Type Casting)
Bilgisayarlar bellekteki verileri türlerine göre farklı formatlarda saklandığını gördük. Bir verinin türünü başka bir türe çevirme işlemine *tür dönüşümü* denir.

==== Kullanıcı Girişlerinin Sayıya Dönüştürülmesi (Metin $->$ Sayı)
Klavyeden girilen veya bir metin dosyasından okunan tüm veriler, sisteme ilk olarak karakter dizisi (metin / string) biçiminde ulaşır.

- Kullanıcı ekrana 25 yazdığında bilgisayar bunu sayısal 25 olarak değil; yan yana duran *'2'*(ASCII: 50) ve *'5'*(ASCII: 53) karakterleri olarak algılar.
- Karakter tabanlı bir veriyle matematiksel işlem yapılamaz. Örneğin iki metinsel veri toplanmak istendiğinde matematiksel toplama ($25 + 10 = 35$) yerine metin birleştirme ("25" + "10" = "2510") gerçekleşir veya derleyici hata verir.
- Bu değerlerin matematiksel işlemlere girebilmesi için metin biçiminden uygun sayı türüne (int veya float) dönüştürülmesi (parse/cast edilmesi) şarttır.

#kod-cikti(baslik: [Tam Sayı Girişi Örneği])[
  ```python
puan = int(input("Puan Giriniz: "))

print(puan)
print(type(puan))
```
][
```
Puan Giriniz: 50
50
<class 'int'>
```
]

Program, kullanıcıdan "*`Puan Giriniz:`*" iletisiyle bir tam sayı değeri beklemektedir. Python'da *`input()`* fonksiyonu klavyeden veri almak için kullanılır. Ancak daha önce belirttiğimiz gibi, *`input()`* fonksiyonu girilen veriyi ne olursa olsun her zaman bir metin (*`string`*) olarak okur. Bu metinsel değerin matematiksel hesaplamalarda veya karşılaştırmalarda kullanılabilmesi için *`int()`* fonksiyonu ile tam sayıya dönüştürülmesi şarttır.

#align(center)[
#kod-satiri(no:0, size:15pt,weight: "semibold")[
           ```Python
          puan = int(input("Puan Giriniz: "))
          ```
]
]
#v(-0.5em)
Bu satır *içten dışa* doğru çalışır: önce en içteki *`input()`*, sonra onu saran *`int()`*, en son da atama (#oprt-goster(size: 12pt)[`=`]).

#v(0.5em)
#align(center)[
  #grid(
    columns: (auto, auto),
    gutter: 8pt,
    align: top,
    [
      #stack(
        dir: ttb,
        spacing: 5pt, // Başlık ile kutu arasındaki boşluk (0pt yapabilirsin)
        align(center)[#text(weight: "semibold")[Adım 1]],
        block(
          inset: 10pt,
          radius: 4pt,
          stroke: 1pt + rgb("#d0d7de"),
          width: auto
        )[
          #islem-aciklama(
            on: "puan = ",
            degisken: "int",
            ara: "(",
            ifade: "input(\"Puan Giriniz: \")",
            son: ")",
            deger: "\"50\"",
            boyut: 15pt,
          )
        ]
      )
    ],
    [
      #stack(
        dir: ttb,
        spacing: 5pt, // Başlık ile kutu arasındaki boşluk
        align(center)[#text(weight: "semibold")[Adım 2]],
        block(
          inset: 10pt,
          radius: 4pt,
          stroke: 1pt + rgb("#d0d7de"),
          width: auto
        )[
          #islem-aciklama(
            degisken: "puan",
            ifade: "int(\"50\")",
            deger: "50",
            boyut: 15pt,
          )
        ]
      )
    ]
  )
]
#text(size: 10pt, weight: "semibold")[Adım 1: `input()` çalışır ve `int()` fonksiyonuna değer döner]\
Kullanıcı klavyeden *`50`* yazıp Enter'a basar. *`input()`* fonksiyonu bu değeri her zaman *metin* olarak döndürür; yani elimize geçen şey sayı değil, tırnak içinde *`"50"`* olur. Bu değer, dıştaki *`int()`* fonksiyonuna gider.

#text(size: 10pt, weight: "semibold")[Adım 2: `int()` çalışır ve sonuç `puan` değişkenine atanır]\
*`input()`* fonksiyonu metin *`"50"`* değerin döndürür; *`puan = int("50")`*. *`int()`* fonksiyonu *`"50"`* metnini tam sayıya çevirir ve sonuç olan *`50`* değeri *`puan`* değişkenine atanır.

      #kod-blok(width: 100%)[
    ```Python
veri = input("Puan Giriniz: ")  # 1. Aşama: Metin olarak alındı ("50")
puan = int(veri)                # 2. Aşama: Tam sayıya dönüştürüldü (50)
    ```
]

#text(size:10pt)[
#kod-cikti(
  columns: (30em,auto), 
  baslik: [Kullanıcı girişlerinin #underline(stroke: 1.25pt, offset: 2pt)[metin] türünden \ #underline(stroke: 1.25pt, offset: 2pt)[float] tipine dönüşümü yapılır #v(1.5em)], baslik-yeri: "sag")[
```Python
# Kullanıcı girişleri metin olarak alınır
birinci_sayi = input("Birinci Sayıyı Girin: ")
ikinci_sayi = input("İkinci Sayıyı Girin: ")
ucuncu_sayi = input("Üçüncü Sayıyı Girin: ")

# Girilen 3 değişken float türüne dönüştürülür
birinci_sayi = float(birinci_sayi)
ikinci_sayi = float(ikinci_sayi)
ucuncu_sayi = float(ucuncu_sayi)

bolum = (birinci_sayi + ikinci_sayi) / ucuncu_sayi
print("Bölüm:", bolum)
```
][
```text
Birinci Sayıyı Girin: 1.2
İkinci Sayıyı Girin: 1.8
Üçüncü Sayıyı Girin: 2.5
Bölüm: 1.2
```
]
]

Dileyenler bu işlemi tek satırda iç içe yapmak yerine, önce veriyi bir değişkene metin olarak alıp ardından ikinci bir satırda *`int()`* veya *`float()`* fonksiyonuyla sayıya dönüştürerek iki aşamada da gerçekleştirebilir. Fakat bu tek satır kod yazmaya göre daha uzundur.


#not_block(title: "Dikkat:")[
  *`int()`* olmasaydı *`puan`* değişkeninde *`"50"`* yani *metin* olurdu ve *`puan + 10`* gibi bir işlem hata verirdi. Sayıyla işlem yapacaksak *`int()`* (ya da ondalıklı değerler için *`float()`*) ile dönüştürmemiz gerekir.
]
==== Otomatik (Örtük / Implicit) Dönüşüm:
Farklı türler aynı matematiksel işleme girdiğinde, veri kaybını önlemek için küçük tür otomatik olarak daha geniş ve kapsayıcı olan türe yükseltilir:

// #v(1em)

#let renk-int = rgb("#2b6cb0")
#let renk-float = rgb("#c05621")
#let mono-font = "DejaVu Sans Mono" // Kod bloğunuzda kullandığınız monospace fontu yazın

// Tip adını renkli rozet olarak gösterir
#let rozet(metin, renk) = box(
  fill: renk.lighten(85%),
  stroke: 0.7pt + renk,
  radius: 3pt,
  inset: (x: 5pt, y: 3pt),
  text(font: mono-font, size: 0.9em, fill: renk.darken(20%), metin),
)

// Tek bir satır: int <op> float -> float
#let donusum-satiri(op) = (
  rozet("int", renk-int),
  text(font: mono-font, weight: "bold", size: 1.1em, op),
  rozet("float", renk-float),
  $->$,
  rozet("float", renk-float),
)

// Dört işlemi tek kartta toplar
#let donusum-karti = block(
  fill: luma(250),
  stroke: 0.7pt + luma(200),
  radius: 5pt,
  inset: 10pt,
  grid(
    columns: 5,
    column-gutter: 6pt,
    row-gutter: 9pt,
    align: horizon + center,
    ..("+", "-", "*", "/").map(donusum-satiri).flatten(),
  ),
)

#grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon + center,
    donusum-karti,
  kod-blok(width: 100%)[
  ```Python
adet = 5            # int türünde

birim_fiyat = 2.5   # float türünde

# Python arka planda 'adet' değerini 5.0 yapar
toplam_tutar = adet * birim_fiyat # 5.0 * 2.5 = 12.5(float)

print(toplam_tutar) # Çıktı: 12.5
  ```]
)

#not_block()[Tam bölünen sayılarda bile sonuç `float` türüne dönüşür]
#kod-blok(width: 100%)[
  ```python
  print(10 / 4)           # 2.5
  print(10 / 5)           # 2.0   (2 değil!)
  ```
]

==== Bilinçli (Açık / Explicit) Dönüşüm:
Programcının veri kaybını göze alarak veya işlemi yönlendirmek için türü zorla değiştirmesidir.

#grid(
  columns: (auto, auto),
  gutter: 20pt,
  align: top,
  [
*Hassasiyeti Korumak İçin Tam Sayıyı Kesirli Sayıya Çevirmek (int $-->$ float):*\
Daha hassas değerler gerektiğinde tam sayı değerleri kasten kesirli değerlere dönüştürülebilir.
// #v(1em)
#kod-blok()[
  ```Python
puan = 100

ondalikli_puan = float(puan)  # 100 -> 100.0
print(ondalikli_puan)  # Çıktı: 100.0
  ```
]
  ],
  [
*Ondalık Kısmı Atmak İçin (float $-->$ int):*\
Ondalıklı bir sayının virgülden sonraki kısmını silip yalnızca tam kısmını elde etmek gerektiğinde bu dönüşümden yararlanılır.
// #v(1em)
#kod-blok()[
  ```Python
ortalama = 85.85
# Virgülden sonrası silinir
tam_not = int(ortalama) #tam_not = 85 olur
print(tam_not)  # Çıktı: 85
  ```
]
  ]
)
