#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#iki_hucreli_satir[
==== Soru 35: Çemberin çevresi ve alanı
#soru_bilgi[Konu: sabit, `float()`, aritmetik operatörler, üs alma, f-string · Zorluk: Kolay]

  Kullanıcıdan bir çemberin yarıçapını alın. `PI` adında bir sabit (3.14159) tanımlayın. Çemberin çevresini ve alanını hesaplayıp virgülden sonra 2 basamakla yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Yarıçap (cm): 5
Çevre: 31.42 cm
Alan: 78.54 cm²
```
]
]

#iki_hucreli_satir(columns: (1fr, 1.7fr))[
==== Soru 36: Vücut kitle endeksi (BMI)
#soru_bilgi[Konu: `float()`, `int()`, üs alma, aritmetik operatörler · Zorluk: Kolay]

  Kullanıcının girdiği boy (metre) ve kilo (kilogram) değerlerine göre vücut kitle endeksini hesaplayan programı yazın. Formül: `BMI = kilo / boy ** 2`. Boyun karesi için üs alma operatörünü kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):1.75
Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):80
Vücut Kitle Endeksiniz (BMI):
26.122448979591837
```
]
]

#iki_hucreli_satir(columns: (1fr, 1.4fr))[
==== Soru 37: Araç yakıt tüketimi
#soru_bilgi[Konu: `float()`, aritmetik operatörler, oran hesaplama · Zorluk: Orta]

  Yakıt deposu tam dolu bir araçla yola çıkıp dönüşte depoyu yeniden dolduran bir sürücünün verilerinden yakıt tüketimini hesaplayan programı yazın. Formüller:

  - 100 km'de harcanan litre = (alınan yakıt litre) / (gidilen yol km) × 100
  - 100 km'de harcanan benzin tutarı = (alınan yakıt tutarı) / (gidilen yol km) × 100][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Araç Kullanım Bilgileri Giriş Ekranı
Gidilen Yol(km):428.8
Aldığınız Yakıt Miktarı(lt):27.982
Alınan Yakıt Tutarı:146.6
100km 'de Harcanan Yakıtın Litresi:
6.525652985074625
100km 'de Harcanan Yakıtın Tutarı:
34.18843283582089
```
]
]

#iki_hucreli_satir(columns: (1fr, 1.6fr))[
==== Soru 38: Sayıyı iki katının beş fazlasına güncelleme
#soru_bilgi[Konu: `int()`, atama, önce işlem sonra atama · Zorluk: Kolay]

  Kullanıcıdan 1–20 arasında pozitif bir tam sayı alın. Sayının değerini, iki katının beş fazlası olacak şekilde güncelleyin (yeni değer = sayı × 2 + 5) ve ekrana yazdırın. Önce işlem, sonra atama kuralını kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: 12
Girilen sayının değeri 2 katının 5 fazlası
kadar arttırıldı
Sayının Yeni Değeri : 29
```
]
]

#iki_hucreli_satir(columns: (1fr, 1.3fr))[
==== Soru 39: Dik üçgende hipotenüs
#soru_bilgi[Konu: `float()`, üs alma, karekök, Pisagor bağıntısı · Zorluk: Orta]

  Kullanıcıdan bir dik üçgenin dik kenarları olan `a` ve `b` kenar uzunluklarını alın. $a^2 + b^2 = c^2$ bağıntısını kullanarak hipotenüs uzunluğu `c`'yi hesaplayıp yazdırın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
a Kenarının Uzunluğu: 3
b Kenarının Uzunluğu: 4

c Kenarının Uzunluğu(Hipotenüs):  5.0
```
]
]

#figure(
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: (x: 10pt, y: 10pt),
  )[
    #align(center)[
      #block(width: 200pt, height: 155pt, inset: 0pt)[
        #place(top + left, dx: 30pt, dy: 20pt, polygon(
          fill: rgb("#e2e8f0"),
          stroke: 1.5pt + rgb("#0f172a"),
          (0pt, 0pt),
          (0pt, 90pt),
          (120pt, 90pt),
        ))
        #place(top + left, dx: 30pt, dy: 98pt, line(length: 12pt, angle: 0deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 42pt, dy: 98pt, line(length: 12pt, angle: 90deg, stroke: 1.2pt + rgb("#0f172a")))
        #place(top + left, dx: 30pt, dy: 98pt, box(
          width: 12pt,
          height: 12pt,
          align(center + horizon, circle(radius: 1.2pt, fill: rgb("#0f172a"))),
        ))
        #place(top + left, dx: 5pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[a])
        #place(top + left, dx: 80pt, dy: 112pt, text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[b])
        #place(top + left, dx: 100pt, dy: 55pt, text(size: 16pt, weight: "bold", fill: rgb("#dc2626"))[c])
      ]
    ]
  ],
  caption: [Dik üçgende dik kenarlar a ve b, hipotenüs c],
)

