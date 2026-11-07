#import "/lib/template.typ": *
#import "/02_Files/degiskenler_bellek.typ": *

// ---- Bu dosyaya özel yardımcılar (isterseniz template.typ içine taşıyabilirsiniz) ----



// Bellekteki bir değişkeni gösteren küçük kutu (isim üstte, değer kutunun içinde)
#let degisken-kutusu(isim, deger, renk: rgb("#2563eb")) = stack(
  dir: ttb,
  spacing: 3pt,
  align(center, text(size: 8pt, weight: "bold", fill: renk)[#isim]),
  rect(
    width: 2.2cm,
    height: 0.9cm,
    stroke: 1pt + renk,
    fill: renk.lighten(88%),
    radius: 3pt,
    align(center + horizon, text(weight: "bold")[#deger]),
  ),
)

// ----------------------------------------------------------------------------------

== Operatörler ve İşlem Önceliği
*Operatör*, bir veya birden fazla değer üzerinde *matematiksel hesaplama* yapan, değerleri *karşılaştıran* veya *mantıksal işlemler* yürüterek yeni bir sonuç üreten özel *sembol* ya da *anahtar kelimelerdir*. Operatörün üzerinde işlem yaptığı değerlere veya değişkenlere *operand* (işlenen) denir.

#v(0.5em)
#grid(
    columns: (auto, auto),
    gutter: 20pt,
    align: top,
        [
- #show-op[`5`] ve #show-op[`3`] → *operand* (işlenen değerler)
- #show-op[`+`] → *operatör* (işlemi yapan sembol)
- #show-op[`=`] → *atama operatörü* (sonucu `sonuc` değişkenine yerleştirir)],
    [#text(size:14pt, weight: "semibold")[
      #kod-blok()[
  ```python
  sonuc = 5 + 3
  ```
]
    ]
      ]
)

#v(0.5em)
Python'daki operatörleri dört ana grupta inceleyeceğiz:

#ders-tablosu(
  "Python Operatör Grupları",
  (auto, 1fr, auto),
  ("Grup", "Ne işe yarar?", "Operatörler"),
  hizalama: (center + horizon, left + horizon, left + horizon),
  [*Atama*], [Bir değişkene değer yerleştirir.], [#show-op(size:12pt)[`= += -= *= /= //= %= **=`]],
  [*Aritmetik*], [Matematiksel hesap yapar.], [#show-op(size:12pt)[`+ - * / // % **`]],
  [*Karşılaştırma*], [İki değeri kıyaslar; sonuç `True` veya `False` olur.], [#show-op(size:12pt)[`== != > < >= <=`]],
  [*Mantıksal*], [Koşulları birleştirir veya tersine çevirir.], [#show-op(size:12pt)[`and or not`]],
)

=== Atama Operatörleri
Matematikte "eşittir" anlamına gelen #show-op[=] sembolü, programlama dillerinde atama operatörüdür; sağındaki değeri alır ve soldaki değişkene aktarır.

#not_block(title: "Atama Her Zaman Sağdan Sola Çalışır")[
  Eğer bir hesaplama işlemi yapılıyorsa, önce operatörün sağ tarafı hesaplanır; ardından elde edilen sonuç soldaki değişkene atanır.
]

==== Atama Operatörü (#show-op[`=`]): Değişken Oluşur veya Güncellenir
Bir değişkene ilk kez değer atadığımızda, atanan değer için bellek (RAM) üzerinde bir yer ayrılır ve değer bu alana yazılır. Değişken adı ise bu bellek alanını gösteren bir *etikettir (işaretçidir)*. Python'da ilk atama otomatik olarak yapılır ve önceden bir değişken tanımlaması gerektirmez.

#kod-blok(width: 100%)[
  ```python
  yas = 15          # yas değişkeni oluştu, bellekte 15 değeri saklandı
  isim = "Ayşe"     # isim değişkeni oluştu, bellekte "Ayşe" saklandı
  pi_sayisi = 3.14  # pi_sayisi değişkeni oluştu
  ```
]

Henüz atama yapılmamış bir değişkeni kullanmaya çalışırsak Python hata verir:

#kod-blok(width: 100%)[
  ```python
  print(puan)   # NameError: name 'puan' is not defined
  ```
]

Var olan bir değişkene yeniden atama yaptığımızda yeni bir değişken oluşmaz; değişkenin bulunduğu bellek alanında ki eski değerin üzerine yeni değer yazılır ve eski değer kaybolur.

#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Aynı değişkene iki kez atama yapılır.
      #kod-blok[
        ```python
        puan = 50
        print("Puan:", puan)
        puan = 75
        print("Güncel puan:", puan)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Puan: 50 \
        Güncel puan: 75
      ]
    ]
  )
]

Güncelleme yaparken değişkenin kendi eski değerini de kullanabiliriz. Önce sağ taraf hesaplanır, sonra sonuç değişkene yazılır:

#kod-blok(width: 100%)[
  ```python
  puan = 50
  puan = puan + 25 # önce 50 + 25 = 75 hesaplanır, sonra puan'a yazılır
  print(sayac)     # 75
  ```
]

Bir değişkene yeni bir değer atandığında türü de değişebilir. Python'da tür bilgisi değere bağlı olduğu için, değişken yeni atanan değerin türünü alır:

#kod-blok(width: 100%)[
  ```python
  puan = 50     # int
  puan = 55.43  # artık float
  puan = "elli" # artık str
  ```
]

#align(center)[
  #v(0.5em)
  *Bellekte Değerin Güncellenmesi*
  #v(0.5em)
 #include "degisken_guncelleme.typ"
]

==== Çoklu Atama
#kod-blok(width: 100%)[
  ```python
  a = b = c = 0        # üçüne de 0 atanır
  x, y = 3, 7          # x = 3, y = 7
  x, y = y, x          # iki değişkenin değerini takas et
  print(x, y)          # 7 3
  ```
]

==== Bileşik Atama Operatörleri
`sayac = sayac + 1` gibi "değişkeni kendi değeriyle işleme sokup tekrar kendisine yazma" işlemi o kadar sık yapılır ki bunun için kısaltmalar vardır:

#ders-tablosu(
  "Bileşik Atama Operatörleri",
  (auto, auto, auto, auto),
  ("Operatör", "Kısa Yazım", "Uzun Karşılığı", [`a = 10` iken sonuç]),
  [`+=`], [`a += 3`], [`a = a + 3`], [`13`],
  [`-=`], [`a -= 3`], [`a = a - 3`], [`7`],
  [`*=`], [`a *= 3`], [`a = a * 3`], [`30`],
  [`/=`], [`a /= 4`], [`a = a / 4`], [`2.5`],
  [`//=`], [`a //= 4`], [`a = a // 4`], [`2`],
  [`%=`], [`a %= 4`], [`a = a % 4`], [`2`],
  [`**=`], [`a **= 2`], [`a = a ** 2`], [`100`],
)

#v(0.5em)
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Bakiye üzerinde bileşik atama operatörleri kullanılır.
      #kod-blok[
        ```python
        bakiye = 100
        bakiye += 50
        bakiye -= 30
        bakiye *= 2
        print("Bakiye:", bakiye)

        mesaj = "Merhaba"
        mesaj += " Dünya"
        print(mesaj)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Bakiye: 240 \
        Merhaba Dünya
      ]
    ]
  )
]

#not_block(title: "Dikkat: ")[
  `=` değer *atar*, `==` ise iki değeri *karşılaştırır*. Bunları karıştırmak programlamada en sık yapılan hatalardan biridir. `==` operatörünü karşılaştırma operatörleri bölümünde göreceğiz.
]

=== Aritmetik Operatörler
Aritmetik operatörler matematiksel işlemleri yaptırır. Sayılarla çalışırlar; `+` ve `*` operatörlerinin metinlerle de özel bir davranışı vardır.

#ders-tablosu(
  "Python Aritmetik Operatörleri",
  (auto, auto, auto, auto, 1fr),
  ("Operatör", "Adı", "Örnek", "Sonuç", "Açıklama"),
  hizalama: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
  [`+`], [Toplama], [`10 + 3`], [`13`], [İki sayıyı toplar.],
  [`-`], [Çıkarma], [`10 - 3`], [`7`], [Soldakinden sağdakini çıkarır.],
  [`*`], [Çarpma], [`10 * 3`], [`30`], [İki sayıyı çarpar.],
  [`/`], [Bölme], [`10 / 4`], [`2.5`], [Sonuç her zaman `float` olur.],
  [`//`], [Tam bölme], [`10 // 4`], [`2`], [Bölümün tam sayı kısmını verir (küsuratı atar).],
  [`%`], [Mod (kalan)], [`10 % 4`], [`2`], [Bölmeden kalanı verir.],
  [`**`], [Üs alma], [`2 ** 3`], [`8`], [Soldaki sayının sağdaki kuvvetini alır.],
)

==== Dört İşlem ve Diğer Aritmetik İşlemler
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      İki sayı üzerinde aritmetik operatörlerin sonuçları.
      #kod-blok[
        ```python
        a = 17
        b = 5

        print("Toplam:", a + b)
        print("Fark:", a - b)
        print("Çarpım:", a * b)
        print("Bölüm:", a / b)
        print("Tam bölüm:", a // b)
        print("Kalan:", a % b)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Toplam: 22 \
        Fark: 12 \
        Çarpım: 85 \
        Bölüm: 3.4 \
        Tam bölüm: 3 \
        Kalan: 2
      ]
    ]
  )
]

==== Bölme (`/`): Sonuç Her Zaman float
Tam bölünen sayılarda bile sonuç `float` türünde gelir:

#kod-blok(width: 100%)[
  ```python
  print(10 / 4)           # 2.5
  print(10 / 5)           # 2.0   (2 değil!)
  print(type(10 / 5))     # <class 'float'>
  ```
]

==== Tam Bölme (`//`) ve Mod (`%`)
Bir bölme işlemini ilkokuldaki gibi düşünün: *bölünen = bölen × bölüm + kalan*. `//` operatörü bölümü, `%` operatörü kalanı verir.

#kod-blok(width: 100%)[
  ```python
  print(17 // 5)   # 3   (17 içinde 3 tane 5 var)
  print(17 % 5)    # 2   (3 × 5 = 15, geriye 2 kalır)
  ```
]

#ders-tablosu(
  "Tam Bölme ve Mod Örnekleri",
  (auto, auto, auto, auto),
  ("Bölünen ve Bölen", [`//` (bölüm)], [`%` (kalan)], "Kontrol"),
  [`17` ve `5`], [`3`], [`2`], [`3 * 5 + 2 = 17`],
  [`20` ve `4`], [`5`], [`0`], [`5 * 4 + 0 = 20`],
  [`3` ve `7`], [`0`], [`3`], [`0 * 7 + 3 = 3`],
  [`100` ve `30`], [`3`], [`10`], [`3 * 30 + 10 = 100`],
)

Mod operatörünün en sık kullanıldığı iki yer:

#kod-blok(width: 100%)[
  ```python
  # 1) Tek mi çift mi?
  sayi = 7
  print(sayi % 2)    # 1  -> kalan 1 ise sayı tektir
  print(10 % 2)      # 0  -> kalan 0 ise sayı çifttir

  # 2) Bir sayı diğerine tam bölünüyor mu?
  print(15 % 5)      # 0  -> 15, 5'e tam bölünür
  print(15 % 4)      # 3  -> tam bölünmez
  ```
]

`//` ve `%` birlikte kullanıldığında birim dönüşümleri kolaylaşır:

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Dakikayı saat ve dakikaya çevirir.
      #kod-blok[
        ```python
        toplam_dakika = 135
        saat = toplam_dakika // 60
        dakika = toplam_dakika % 60
        print(saat, "saat", dakika, "dakika")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        2 saat 15 dakika
      ]
    ]
  )
]

#not_block(title: "Negatif sayılarla dikkat: ")[
  `//` operatörü sonucu sıfıra değil, *aşağıya* yuvarlar. Bu davranışı şimdilik bilmeniz yeterli; ilk aşamada pozitif sayılarla çalışacağız.
  #kod-blok(width: 100%)[
    ```python
    print(7 // 2)     # 3
    print(-7 // 2)    # -4   (-3.5'in altındaki tam sayı)
    print(-7 % 3)     # 2
    ```
  ]
]

==== Üs Alma (`**`)
#kod-blok(width: 100%)[
  ```python
  print(2 ** 3)     # 8       (2 × 2 × 2)
  print(5 ** 2)     # 25
  print(10 ** 3)    # 1000
  print(9 ** 0.5)   # 3.0     (karekök almak: 0.5 kuvveti)
  ```
]

==== Metinlerle `+` ve `*`
`+` operatörü metinleri *birleştirir*, `*` operatörü bir metni belirtilen sayı kadar *tekrarlar*:

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        ad = "Ali"
        soyad = "Yılmaz"
        print(ad + " " + soyad)
        print("Ha" * 3)
        print("-" * 20)
        print("Yaş: " + str(15))
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Ali Yılmaz \
        HaHaHa \
        #("-" * 20) \
        Yaş: 15
      ]
    ]
  )
]

#not_block(title: "Dikkat: ")[
  Metin ile sayı doğrudan toplanamaz. `"Yaş: " + 15` ifadesi hata verir; sayıyı önce `str()` ile metne çevirmek gerekir.
]

==== Aritmetik Operatörlerde İşlem Önceliği
Bir ifadede birden fazla operatör varsa Python işlemleri matematikteki sırayla yapar. Önceliği yüksek olan işlem önce hesaplanır.

#ders-tablosu(
  "Aritmetik Operatörlerin İşlem Önceliği",
  (auto, auto, 1fr),
  ("Öncelik", "Operatör", "Açıklama"),
  hizalama: (center + horizon, center + horizon, left + horizon),
  [1 (en yüksek)], [`( )`], [Parantez içi her zaman önce hesaplanır.],
  [2], [`**`], [Üs alma],
  [3], [`-x`], [Tek operandlı eksi (negatif işareti)],
  [4], [`*` `/` `//` `%`], [Çarpma, bölme, tam bölme, mod (kendi aralarında eşit öncelikli)],
  [5 (en düşük)], [`+` `-`], [Toplama, çıkarma (kendi aralarında eşit öncelikli)],
)

*Eşit öncelikli operatörler soldan sağa* işlenir:

#kod-blok(width: 100%)[
  ```python
  print(10 - 4 - 3)      # 3      ((10 - 4) - 3)
  print(100 / 10 * 5)    # 50.0   ((100 / 10) * 5)
  ```
]

#ornek_baslik[Örnek: Adım adım işlem önceliği]
#kod-blok(width: 100%)[
  ```python
  print(2 + 3 * 4)         # 14
  # 1) 3 * 4 = 12
  # 2) 2 + 12 = 14

  print((2 + 3) * 4)       # 20
  # 1) parantez: 2 + 3 = 5
  # 2) 5 * 4 = 20

  print(2 + 3 ** 2 * 2)    # 20
  # 1) 3 ** 2 = 9
  # 2) 9 * 2 = 18
  # 3) 2 + 18 = 20

  print(7 + 8 // 3 * 2)    # 11
  # 1) 8 // 3 = 2
  # 2) 2 * 2 = 4
  # 3) 7 + 4 = 11
  ```
]

#not_block(title: "İstisna: ")[
  Üs alma (`**`), eşit öncelikli işlemlerin aksine *sağdan sola* çalışır. Eksi işareti de `**` operatöründen daha düşük önceliklidir:
  #kod-blok(width: 100%)[
    ```python
    print(2 ** 3 ** 2)     # 512  -> 2 ** (3 ** 2) = 2 ** 9
    print((2 ** 3) ** 2)   # 64
    print(-2 ** 2)         # -4   -> -(2 ** 2)
    print((-2) ** 2)       # 4
    ```
  ]
]

#not_block(title: "Pratik öneri: ")[
  Sıradan emin değilseniz *parantez kullanın*. Parantez hem hatayı önler hem de kodu okuyan kişiye niyetinizi gösterir.
]

==== Gerçek Hayattan Örnekler
#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Not ortalaması ve sıcaklık dönüşümü.
      #kod-blok[
        ```python
        n1 = 80
        n2 = 90
        n3 = 70
        ortalama = (n1 + n2 + n3) / 3
        print("Ortalama:", ortalama)

        c = 25
        f = c * 9 / 5 + 32
        print("Fahrenheit:", f)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Ortalama: 80.0 \
        Fahrenheit: 77.0
      ]
    ]
  )
]

#kod-blok(width: 100%)[
  ```python
  # Dikdörtgenin alanı ve çevresi
  en = 6
  boy = 4
  alan = en * boy                   # 24
  cevre = 2 * (en + boy)            # 20

  # Bir sayının son basamağı ve son basamağı atılmış hali
  sayi = 4827
  print(sayi % 10)                  # 7
  print(sayi // 10)                 # 482
  ```
]

#not_block(title: "Dikkat: ")[
  Ortalama hesabında parantezi unutursak `n1 + n2 + n3 / 3` yazmış oluruz. Bu durumda önce yalnızca `n3 / 3` hesaplanır ve sonuç yanlış çıkar.
]

=== Karşılaştırma Operatörleri
Karşılaştırma operatörleri iki değeri kıyaslar ve sonuç olarak her zaman `True` (doğru) veya `False` (yanlış) üretir. Bu iki değer `bool` (mantıksal) veri türündedir.

#ders-tablosu(
  "Python Karşılaştırma Operatörleri",
  (auto, auto, auto, auto, 1fr),
  ("Operatör", "Anlamı", "Örnek", "Sonuç", "Açıklama"),
  hizalama: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
  [`==`], [Eşittir], [`5 == 5`], [`True`], [İki değer eşitse `True` olur.],
  [`!=`], [Eşit değildir], [`5 != 3`], [`True`], [İki değer farklıysa `True` olur.],
  [`>`], [Büyüktür], [`7 > 3`], [`True`], [Soldaki, sağdakinden büyükse `True` olur.],
  [`<`], [Küçüktür], [`7 < 3`], [`False`], [Soldaki, sağdakinden küçükse `True` olur.],
  [`>=`], [Büyük eşittir], [`5 >= 5`], [`True`], [Soldaki büyük *veya* eşitse `True` olur.],
  [`<=`], [Küçük eşittir], [`4 <= 3`], [`False`], [Soldaki küçük *veya* eşitse `True` olur.],
)

#v(0.5em)
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Bir sayının çeşitli karşılaştırma sonuçları.
      #kod-blok[
        ```python
        sayi = 15
        print(sayi > 10)
        print(sayi == 15)
        print(sayi != 15)
        print(sayi <= 14)
        print(sayi % 2 == 0)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        True \
        True \
        False \
        False \
        False
      ]
    ]
  )
]

Karşılaştırmanın sonucu da bir değerdir; bir değişkende saklanabilir:

#kod-blok(width: 100%)[
  ```python
  yas = 16
  resit_mi = yas >= 18
  print(resit_mi)           # False
  print(type(resit_mi))     # <class 'bool'>
  ```
]

#not_block(title: "Dikkat: ")[
  `=` ve `==` aynı şey değildir.
  #kod-blok(width: 100%)[
    ```python
    x = 5      # ATAMA: x'e 5 değerini yerleştir
    x == 5     # KARŞILAŞTIRMA: x, 5'e eşit mi? -> True
    ```
  ]
]

==== Metinleri Karşılaştırma
Metinler de karşılaştırılabilir. `==` operatörü büyük/küçük harfe duyarlıdır:

#kod-blok(width: 100%)[
  ```python
  print("elma" == "elma")    # True
  print("elma" == "Elma")    # False  (büyük/küçük harf farklı)
  print("elma" != "armut")   # True
  print("a" < "b")           # True   (alfabetik sıra / karakter kodu)
  ```
]

==== Farklı Türlerin Karşılaştırılması
#kod-blok(width: 100%)[
  ```python
  print(3 == 3.0)        # True   (int ile float değer olarak eşit)
  print("5" == 5)        # False  (metin ile sayı aynı şey değildir)
  print(int("5") == 5)   # True   (türü dönüştürünce eşit)
  ```
]

==== Zincirleme Karşılaştırma
Python'da karşılaştırmaları matematikteki gibi arka arkaya yazabiliriz:

#kod-blok(width: 100%)[
  ```python
  x = 5
  print(1 < x < 10)     # True   (x, 1 ile 10 arasında mı?)
  print(1 < x < 3)      # False
  ```
]

#not_block(title: "Ondalıklı sayılarda == kullanırken dikkat: ")[
  Bilgisayar ondalıklı sayıları tam kesinlikle saklayamaz. Bu yüzden `float` değerlerin `==` ile karşılaştırılması güvenilir değildir.
  #kod-blok(width: 100%)[
    ```python
    print(0.1 + 0.2)           # 0.30000000000000004
    print(0.1 + 0.2 == 0.3)    # False
    ```
  ]
]

=== Mantıksal Operatörler
Mantıksal operatörler, `True` / `False` değerlerini ve karşılaştırma sonuçlarını birleştirmek veya tersine çevirmek için kullanılır. Üç tanedir: `and` (ve), `or` (veya), `not` (değil).

#ders-tablosu(
  "Python Mantıksal Operatörleri",
  (auto, auto, 1fr, 1fr),
  ("Operatör", "Anlamı", "Ne zaman True olur?", "Günlük Hayattan Örnek"),
  hizalama: (center + horizon, center + horizon, left + horizon, left + horizon),
  [`and`], [Ve], [İki koşul da `True` ise.], ["Hava güzel *ve* ödevim bitti ise parka giderim."],
  [`or`], [Veya], [En az bir koşul `True` ise.], ["Param *veya* kartım varsa alışveriş yapabilirim."],
  [`not`], [Değil], [Koşul `False` ise (tersine çevirir).], ["Yağmur yağmıyorsa dışarı çıkarım."],
)

==== Doğruluk Tabloları
#align(center)[
  #grid(
    columns: (auto, auto, auto),
    gutter: 14pt,
    align: top,
    [
      #ders-tablosu(
        "and: Hepsi doğru olmalı",
        (auto, auto, auto),
        ("A", "B", [`A and B`]),
        [`True`], [`True`], [*`True`*],
        [`True`], [`False`], [`False`],
        [`False`], [`True`], [`False`],
        [`False`], [`False`], [`False`],
      )
    ],
    [
      #ders-tablosu(
        "or: Biri doğru olsa yeter",
        (auto, auto, auto),
        ("A", "B", [`A or B`]),
        [`True`], [`True`], [`True`],
        [`True`], [`False`], [`True`],
        [`False`], [`True`], [`True`],
        [`False`], [`False`], [*`False`*],
      )
    ],
    [
      #ders-tablosu(
        "not: Tersine çevirir",
        (auto, auto),
        ("A", [`not A`]),
        [`True`], [`False`],
        [`False`], [`True`],
      )
    ],
  )
]

==== Örnekler
#kod-blok(width: 100%)[
  ```python
  print(True and True)     # True
  print(True and False)    # False
  print(False or True)     # True
  print(False or False)    # False
  print(not True)          # False
  print(not False)         # True
  ```
]

Karşılaştırma operatörleriyle birlikte kullanım:

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Yaş ve ehliyet durumuna göre koşul kontrolü.
      #kod-blok[
        ```python
        yas = 20
        ehliyet = True

        print(yas >= 18 and ehliyet)
        print(yas < 18 or yas > 60)
        print(not ehliyet)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        True \
        False \
        False
      ]
    ]
  )
]

#kod-blok(width: 100%)[
  ```python
  sayi = 15
  print(sayi % 3 == 0 and sayi % 5 == 0)   # True  (hem 3'e hem 5'e bölünüyor)
  print(sayi % 2 == 0 or sayi > 10)        # True  (çift değil ama 10'dan büyük)
  print(not (sayi > 20))                   # True
  ```
]

#ornek_baslik[Örnek: Adım adım mantıksal ifade]
#kod-blok(width: 100%)[
  ```python
  not_degeri = 65
  devam = 20

  gecti = not_degeri >= 50 and devam <= 30
  # 1) not_degeri >= 50  ->  65 >= 50  ->  True
  # 2) devam <= 30       ->  20 <= 30  ->  True
  # 3) True and True     ->  True
  print(gecti)   # True
  ```
]

==== Kısa Devre (Short-Circuit)
Python mantıksal ifadeyi *gereksiz yere sonuna kadar hesaplamaz*:
- `and` ifadesinde soldaki `False` ise sonuç kesindir (`False`); sağ taraf hiç değerlendirilmez.
- `or` ifadesinde soldaki `True` ise sonuç kesindir (`True`); sağ taraf hiç değerlendirilmez.

#kod-blok(width: 100%)[
  ```python
  x = 0
  print(x != 0 and 10 / x > 2)   # False
  # x != 0 zaten False -> 10 / x hiç çalışmaz, sıfıra bölme hatası oluşmaz

  print(x == 0 or 10 / x > 2)    # True
  # x == 0 zaten True -> sağ taraf hiç çalışmaz
  ```
]

Bu özellik, hataya yol açabilecek bir işlemi önce kontrol etmek için çok kullanışlıdır.

=== Operatörler Arası İşlem Önceliği
Bir ifadede aritmetik, karşılaştırma ve mantıksal operatörler birlikte bulunabilir. Python bunları şu sırayla işler: *önce aritmetik, sonra karşılaştırma, en son mantıksal*.

#ders-tablosu(
  "Operatörler Arası İşlem Önceliği",
  (auto, auto, auto, 1fr),
  ("Sıra", "Grup", "Operatörler", "Not"),
  hizalama: (center + horizon, center + horizon, center + horizon, left + horizon),
  [1 (en yüksek)], [Parantez], [`( )`], [Her zaman en başta işlenir.],
  [2], [Aritmetik], [`**`], [Sağdan sola işlenir.],
  [3], [Aritmetik], [`-x`], [Tek operandlı eksi.],
  [4], [Aritmetik], [`*` `/` `//` `%`], [Soldan sağa işlenir.],
  [5], [Aritmetik], [`+` `-`], [Soldan sağa işlenir.],
  [6], [Karşılaştırma], [`==` `!=` `>` `<` `>=` `<=`], [Hepsi eşit öncelikli.],
  [7], [Mantıksal], [`not`], [Mantıksal operatörler içinde en yüksek öncelikli.],
  [8], [Mantıksal], [`and`], [`not` operatöründen sonra işlenir.],
  [9 (en düşük)], [Mantıksal], [`or`], [En son işlenir.],
  [En sonda], [Atama], [`=` `+=` `-=` ...], [Sağ taraf tamamen hesaplanır, sonra atanır.],
)

#not_block(title: "Hatırlama kolaylığı: ")[
  *Aritmetik $->$ Karşılaştırma $->$ not $->$ and $->$ or $->$ Atama* \
  Önce sayıları hesapla, sonra kıyasla, sonra mantıksal karar ver, en son sonucu değişkene yaz.
]

==== Örnekler (Adım Adım)
#ornek_baslik[Örnek 1: Aritmetik, karşılaştırma ve atama]
#kod-blok(width: 100%)[
  ```python
  sonuc = 2 + 3 * 4 == 14
  # 1) Aritmetik:      3 * 4 = 12   ->  2 + 12 = 14
  # 2) Karşılaştırma:  14 == 14     ->  True
  # 3) Atama:          sonuc = True
  print(sonuc)   # True
  ```
]

#ornek_baslik[Örnek 2: Aritmetik, karşılaştırma ve mantıksal operatörler birlikte]
#kod-blok(width: 100%)[
  ```python
  print(5 + 3 > 2 * 4 and not False)
  # 1) Aritmetik:      5 + 3 = 8   ve   2 * 4 = 8
  # 2) Karşılaştırma:  8 > 8       ->  False
  # 3) not:            not False   ->  True
  # 4) and:            False and True  ->  False
  # Sonuç: False
  ```
]

#ornek_baslik[Örnek 3: Mod ile koşul]
#kod-blok(width: 100%)[
  ```python
  sayi = 10
  print(sayi % 2 == 0 or sayi > 20)
  # 1) sayi % 2        ->  0
  # 2) 0 == 0          ->  True
  # 3) True or ...     ->  True  (kısa devre: sağ tarafa hiç bakılmaz)
  # Sonuç: True
  ```
]

#ornek_baslik[Örnek 4: Mantıksal operatörlerin kendi arasındaki sıra]
#kod-blok(width: 100%)[
  ```python
  print(True or False and False)
  # and, or'dan önce işlenir:
  # 1) False and False  ->  False
  # 2) True or False    ->  True
  # Sonuç: True

  print((True or False) and False)
  # Parantez ile sırayı değiştirdik:
  # 1) True or False    ->  True
  # 2) True and False   ->  False
  # Sonuç: False

  print(not True or True)
  # not, or'dan önce işlenir:
  # 1) not True         ->  False
  # 2) False or True    ->  True
  # Sonuç: True

  print(not (True or True))
  # 1) parantez: True or True  ->  True
  # 2) not True                ->  False
  # Sonuç: False
  ```
]

#ornek_baslik[Örnek 5: Gerçek hayat, kampa katılım kuralı]
#block(breakable: false)[
  #grid(
    columns: (34em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        yas = 15
        veli_izni = True
        saglik_raporu = False

        katilabilir = yas >= 14 and yas <= 17 and (veli_izni or saglik_raporu)
        # 1) yas >= 14                      ->  True
        # 2) yas <= 17                      ->  True
        # 3) (veli_izni or saglik_raporu)   ->  True or False  ->  True
        # 4) True and True and True         ->  True
        print(katilabilir)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        True
      ]
    ]
  )
]

#not_block(title: "Özet: ")[
  - Operatör, değerler üzerinde işlem yapan semboldür; üzerinde işlem yapılan değerlere operand denir.
  - `=` bir *atama* operatörüdür: ilk atamada değişken oluşur, sonraki atamalarda değeri güncellenir.
  - Aritmetik operatörler sayısal sonuç, karşılaştırma ve mantıksal operatörler `bool` sonuç üretir.
  - Öncelik sırası: *parantez $->$ aritmetik $->$ karşılaştırma $->$ `not` $->$ `and` $->$ `or`*.
  - Emin olmadığınız yerde parantez kullanın.
]
