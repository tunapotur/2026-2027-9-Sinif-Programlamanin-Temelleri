#import "/pageGeneralConfig.typ": *
#import "/02_Files/infographic/degisken_ve_bellek.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#show: conf

// ----------------------------------------------------------------------------------

== Operatörler ve İşlem Önceliği
*Operatör*, bir veya birden fazla değer üzerinde *matematiksel hesaplama* yapan, değerleri *karşılaştıran* veya *mantıksal işlemler* yürüterek yeni bir sonuç üreten özel *sembol* ya da *anahtar kelimelerdir*. Operatörün üzerinde işlem yaptığı değerlere veya değişkenlere *operand* (işlenen) denir.

#v(1em)
#align(center)[
#grid(
    columns: (auto, auto),
    gutter: 20pt,
    align: horizon,
    [#text(size:14pt, weight: "semibold")[
      #kod-blok()[
  ```python
  sonuc = 5 + 3
  ```
]
    ]
      ],
      
        align(left)[
- #oprt-goster[`5`] ve #oprt-goster[`3`] → *operand* (işlenen değerler)
- #oprt-goster[`+`] → *operatör* (işlemi yapan sembol)
- #oprt-goster[`=`] → *atama operatörü* (sonucu `sonuc` değişkenine yerleştirir)]
)

]

#v(1em)
#icerik-tablo(
  tablo_baslik: "Python'daki operatörleri dört ana grupta inceleyeceğiz",
  sutunlar: (auto, 1fr, auto),
  sutun_basliklari: ("Grup", "Ne işe yarar?", "Operatörler"),
  icerik_hizalama: (center + horizon, left + horizon, left + horizon),
  [*Atama*], [Bir değişkene değer yerleştirir.], [#oprt-goster(size:12pt)[`= += -= *= /= //= %= **=`]],
  [*Aritmetik*], [Matematiksel hesap yapar.], [#oprt-goster(size:12pt)[`+ - * / // % **`]],
  [*Karşılaştırma*], [İki değeri kıyaslar; sonuç `True` veya `False` olur.], [#oprt-goster(size:12pt)[`== != > < >= <=`]],
  [*Mantıksal*], [Koşulları birleştirir veya tersine çevirir.], [#oprt-goster(size:12pt)[`and or not`]],
)

=== Atama Operatörleri
Matematikte "eşittir" anlamına gelen #oprt-goster[=] sembolü, programlama dillerinde atama operatörüdür; sağındaki değeri alır ve soldaki değişkene aktarır.

#not_block(title: "Atama Her Zaman Sağdan Sola Çalışır")[
  Eğer bir hesaplama işlemi yapılıyorsa, önce operatörün sağ tarafı hesaplanır; ardından elde edilen sonuç soldaki değişkene atanır.
]

==== Atama Operatörü (#oprt-goster[`=`]): Değişken Oluşur veya Güncellenir
Bir değişkene ilk kez değer atadığımızda, atanan değer için bellek (RAM) üzerinde bir yer ayrılır ve değer bu alana yazılır. Değişken adı ise bu bellek alanını gösteren bir *etikettir (işaretçidir)*.
#v(1em)
#kod-blok(width: 100%)[
  ```python
  yas = 15          # yas değişkeni oluştu, bellekte 15 değeri saklandı
  isim = "Ayşe"     # isim değişkeni oluştu, bellekte "Ayşe" saklandı
  pi_sayisi = 3.14  # pi_sayisi değişkeni oluştu
  ```
]
#v(1em)
Var olan bir değişkene yeniden atama yaptığımızda yeni bir değişken oluşmaz; değişkenin bulunduğu bellek alanında ki eski değerin üzerine yeni değer yazılır ve eski değer kaybolur.
#v(1em)
#kod-cikti()[
 ```python
        puan = 50
        print("Puan:", puan)
        puan = 75
        print("Güncel puan:", puan)
        ```
][
  ```
  Puan: 50 
  Güncel puan: 75
  ```
]
#v(1em)
#grid(
    columns: (1fr,2fr),
    gutter: 8pt,
    align: top,
    [Güncelleme yaparken sağ tarafta değişkenin önceki değeri ile hesaplama yapılır, sonra sonuç değişkene atanır.
    ],
    [
      #kod-blok(width: 100%)[
  ```python
  puan = 50
  puan = puan + 25 # 50 + 25 = 75 hesaplanır, puan'a atanır
  print(sayac)  # 75
  ```
]
    ]
)

  #grid(
    columns: (1fr,2fr),
    gutter: 8pt,
    align: horizon,
    [Python'da tür bilgisi değere bağlı olduğu için, değişken yeni atanan değerin türünü alır:],
    [
      #kod-blok(width: 100%)[
  ```python
  puan = 50     # int
  puan = 55.43  # artık float
  puan = "elli" # artık str
  ```
]
      ]
    
)

#align(center)[
  #block(breakable: false)[
    *Bellekte Değerin Güncellenmesi*
    #include "infographic/degisken_guncelleme.typ"
  ]
]

==== Bileşik Atama Operatörleri
#oprt-goster(size: 12pt)[`sayac = sayac + 1`] gibi #text(weight: "semibold")["değişkeni kendi değeriyle işleme sokup tekrar kendisine yazma"] işlemi o kadar sık yapılır ki bunun için kısaltmalar vardır:

#icerik-tablo(
  tablo_baslik: "Bileşik Atama Operatörleri",
  sutunlar: (auto, auto, auto, auto),
  sutun_basliklari: ("Operatör", "Kısa Yazım", "Uzun Karşılığı", [`a = 10` iken sonuç]),
  boyut: 12pt,
  [`+=`], [`a += 3`], [`a = a + 3`], [`13`],
  [`-=`], [`a -= 3`], [`a = a - 3`], [`7`],
  [`*=`], [`a *= 3`], [`a = a * 3`], [`30`],
  [`/=`], [`a /= 4`], [`a = a / 4`], [`2.5`],
  [`//=`], [`a //= 4`], [`a = a // 4`], [`2`],
  [`%=`], [`a %= 4`], [`a = a % 4`], [`2`],
  [`**=`], [`a **= 2`], [`a = a ** 2`], [`100`],
)

#kod-cikti(baslik: [Bileşik Atama Operatörleri Örnekleri], baslik-yeri: "sag")[
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
][
        ```
        Bakiye: 240 
        Merhaba Dünya
        ```
]

=== Aritmetik Operatörler

#icerik-tablo(
  tablo_baslik: "Python Aritmetik Operatörleri: Matematiksel İşlemleri Yapar",
  sutunlar: (auto, auto, auto, auto, 1fr),
  sutun_basliklari: ("Operatör", "Adı", "Örnek", "Sonuç", "Açıklama"),
  icerik_hizalama: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
  boyut: 10pt,
  bolunebilir: true,
  [#oprt-goster()[`+`]], [Toplama], [`10 + 3`], [`13`], [İki sayıyı toplar.],
  [#oprt-goster()[`-`]], [Çıkarma], [`10 - 3`], [`7`], [Soldakinden sağdakini çıkarır.],
  [#oprt-goster()[`*`]], [Çarpma], [`10 * 3`], [`30`], [İki sayıyı çarpar.],
  [#oprt-goster()[`/`]], [Bölme], [`10 / 4`], [`2.5`], [Sonuç her zaman `float` olur.],
  [#oprt-goster()[`//`]], [Tam bölme], [`10 // 4`], [`2`], [Bölümün tam sayı kısmını verir (küsuratı atar).],
  [#oprt-goster()[`%`]], [Mod (kalan)], [`10 % 4`], [`2`], [Bölmeden kalanı verir.],
  [#oprt-goster()[`**`]], [Üs alma], [`2 ** 3`], [`8`], [Soldaki sayının sağdaki kuvvetini alır.],
)
#v(1em)
#kod-cikti(baslik: [Aritmetik operatörlerin sonuçları], baslik-yeri: "sag")[
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
][
  ```
  Toplam: 22
  Fark: 12
  Çarpım: 85
  Bölüm: 3.4
  Tam bölüm: 3
  Kalan: 2
  ```
]

#grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [#not_block()[Tam bölünen sayılarda bile sonuç `float` türüne dönüşür]],
    [#kod-blok(width: 100%)[
  ```python
  print(10 / 4)           # 2.5
  print(10 / 5)           # 2.0   (2 değil!)
  ```
]]
)

#not_block(title:"Tam Bölme (`//`) ve Mod (`%`):")[Bir bölme işlemini ilkokuldaki gibi düşünün: \ *bölünen = bölen × bölüm + kalan*. `//` operatörü bölümü, `%` operatörü kalanı verir.]
#v(1em)
#kod-blok(width: 100%)[
  ```python
  print(17 // 5)   # 3   (17 içinde 3 tane 5 var)
  print(17 % 5)    # 2   (3 × 5 = 15, geriye 2 kalır)
  ```
]

#v(1em)
#icerik-tablo(
  tablo_baslik: "Tam Bölme ve Mod Örnekleri",
  sutunlar: (auto, auto, auto, auto),
  sutun_basliklari: ("Bölünen ve Bölen", [`//` (bölüm)], [`%` (kalan)], "Kontrol"),
  [`17` ve `5`], [`3`], [`2`], [`3 * 5 + 2 = 17`],
  [`20` ve `4`], [`5`], [`0`], [`5 * 4 + 0 = 20`],
  [`100` ve `30`], [`3`], [`10`], [`3 * 30 + 10 = 100`],
)

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

#v(1em)
#kod-cikti(baslik: [Dakikayı saat ve dakikayı çevirme], baslik-yeri: "sag",columns: (30em,auto))[
```python
toplam_dakika = 135
saat = toplam_dakika // 60
dakika = toplam_dakika % 60
print(saat, "saat", dakika, "dakika")
```
][
```
2 saat 15 dakika
```   
]

#v(1em)
*Üs Alma (`**`)*
#kod-blok(width: 100%)[
  ```python
  print(2 ** 3)     # 8       (2 × 2 × 2)
  print(5 ** 2)     # 25
  print(9 ** 0.5)   # 3.0     (karekök almak: 0.5 kuvveti)
  ```
]

#not_block(title:"Metinlerle `+` ve `*`:")[\ #oprt-goster()[`+`] operatörü metinleri birleştirir, #oprt-goster()[`*`] operatörü bir metni belirtilen sayı kadar tekrarlar]

#kod-cikti()[
  
        ```python
        ad = "Ali"
        soyad = "Yılmaz"
        print(ad + " " + soyad)
        print("Ha" * 3)
        print("-" * 20)
        print("Yaş: " + str(15))
        ```
][
  ```
Ali Yılmaz
HaHaHa
#("-" * 20)
Yaş: 15
```
]

=== Aritmetik Operatörlerde İşlem Önceliği
Bir ifadede birden fazla operatör varsa Python işlemleri işlem önceliğine göre matematikteki sırayla yapar. Önceliği yüksek olan işlem önce hesaplanır.

#icerik-tablo(
  tablo_baslik: "Aritmetik Operatörlerin İşlem Önceliği",
  sutunlar: (auto, auto, 1fr),
  sutun_basliklari: ("Öncelik", "Operatör", "Açıklama"),
  icerik_hizalama: (center + horizon, center + horizon, left + horizon),
  [1 (en yüksek)], [`( )`], [Parantez içi her zaman önce hesaplanır.],
  [2], [`**`], [Üs alma],
  [3], [`-x`], [Tek operandlı eksi (negatif işareti)],
  [4], [`*` `/` `//` `%`], [Çarpma, bölme, tam bölme, mod (kendi aralarında eşit öncelikli)],
  [5 (en düşük)], [`+` `-`], [Toplama, çıkarma (kendi aralarında eşit öncelikli)],
)


*Eşit öncelikli operatörler soldan sağa işlenir:*

#kod-blok(width: 100%)[
  ```python
  print(10 - 4 - 3)      # 3      ((10 - 4) - 3)
  print(100 / 10 * 5)    # 50.0   ((100 / 10) * 5)
  ```
]

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align: (horizon),
      kod-blok(width: 100%)[
        ```python
  print(2 + 3 * 4)         # 14
  # 1) 3 * 4 = 12
  # 2) 2 + 12 = 14
        ```
      ],
      kod-blok(width: 100%)[
        ```python
  print((2 + 3) * 4)       # 20
  # 1) (2 + 3) = 5
  # 2) 5 * 4 = 20
        ```
      ],
    )
  
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align: (horizon),
      kod-blok(width: 100%)[
        ```python
  print(2 + 3 ** 2 * 2)    # 20
  # 1) 3 ** 2 = 9
  # 2) 9 * 2 = 18
  # 3) 2 + 18 = 20
        ```
      ],
      kod-blok(width: 100%)[
        ```python
  print(7 + 9 / 3 * 2)    # 13.0
  # 1) 9 / 3 = 3.0
  # 2) 3.0 * 2 = 6.0
  # 3) 7 + 6.0 = 13.0
        ```
      ],
    )

#not_block(title: "İstisna: ")[
  Üs alma (#oprt-goster()[`**`]), eşit öncelikli işlemlerin aksine *sağdan sola* çalışır.\ Eksi işareti de `**` operatöründen daha düşük önceliklidir:
]

#kod-blok(width: 100%)[
    ```python
    print(2 ** 3 ** 2)     # 512  -> 2 ** (3 ** 2) = 2 ** 9
    print((2 ** 3) ** 2)   # 64
    print(-2 ** 2)         # -4   -> -(2 ** 2)
    print((-2) ** 2)       # 4
    ```
  ]

#not_block(title: "Pratik öneri: ")[
  Sıradan emin değilseniz *parantez kullanın*. Parantez hem hatayı önler hem de kodu okuyan kişiye niyetinizi gösterir.
]

#kod-cikti(baslik: [Not ortalaması ve sıcaklık dönüşümü], baslik-yeri: "sag")[
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
][
  ```
  Ortalama: 80.0
  Fahrenheit: 77.0
  ```
]

#block(breakable: false)[
  #grid(
    columns: (auto, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok(width: 100%)[
  ```python
  # Dikdörtgenin alanı ve çevresi
  en = 6
  boy = 4
  alan = en * boy         # 24
  cevre = 2 * (en + boy)  # 20
  ```
]
      
    ],
    [
      #kod-blok(width: 100%)[
  ```python
  # Bir sayının son basamağı ve
  # son basamağı atılmış hali
  sayi = 4827
  print(sayi % 10)    # 7
  print(sayi // 10)   # 482
  ```
]
      
    ]
  )
]

=== Karşılaştırma Operatörleri
Karşılaştırma operatörleri iki değeri kıyaslar ve sonuç olarak her zaman `True` (doğru) veya `False` (yanlış) üretir. Bu iki değer `bool` (mantıksal) veri türündedir.

#icerik-tablo(
  tablo_baslik: "Python Karşılaştırma Operatörleri",
  sutunlar: (auto, auto, auto, auto, 1fr),
  sutun_basliklari: ("Operatör", "Anlamı", "Örnek", "Sonuç", "Açıklama"),
  icerik_hizalama: (center + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
  [#oprt-goster()[`==`]], [Eşittir], [`5 == 5`], [`True`], [İki değer eşitse `True` olur.],
  [#oprt-goster()[`!=`]], [Eşit değildir], [`5 != 3`], [`True`], [İki değer farklıysa `True` olur.],
  [#oprt-goster()[`>`]], [Büyüktür], [`7 > 3`], [`True`], [Soldaki, sağdakinden büyükse `True` olur.],
  [#oprt-goster()[`<`]], [Küçüktür], [`7 < 3`], [`False`], [Soldaki, sağdakinden küçükse `True` olur.],
  [#oprt-goster()[`>=`]], [Büyük eşittir], [`5 >= 5`], [`True`], [Soldaki büyük *veya* eşitse `True` olur.],
  [#oprt-goster()[`<=`]], [Küçük eşittir], [`4 <= 3`], [`False`], [Soldaki küçük *veya* eşitse `True` olur.],
)
#align(center)[
#image("images/sayfa_alt_bosluklar/18_4_Karsilastirma_Operatorleri.svg", width: 100%)
]

#block(breakable: false)[
*Bir sayının çeşitli karşılaştırma sonuçları*
#kod-cikti()[
        ```python
        sayi = 15
        print(sayi > 10)
        print(sayi == 15)
        print(sayi != 15)
        print(sayi <= 14)
        print(sayi % 2 == 0)
        ```
][
        ```
        True
        True
        False
        False
        False
        ```
]
]

  #grid(
    columns: (1fr, 2fr),
    gutter: 14pt,
    align: top,
    not_block()[Karşılaştırmanın sonucu da bir değerdir; bir değişkende saklanabilir:],
    [#kod-blok(width: 100%)[
  ```python
  yas = 16
  resit_mi = yas >= 18
  print(resit_mi)   # False
  ```
]]
)

  #grid(
    columns: (1fr, 2fr),
    gutter: 14pt,
    align: top,
    [#not_block(title: "Dikkat: ")[
  `=` ve `==` aynı şey değildir.
]],
    [
      #kod-blok(width: 100%)[
    ```python
    x = 5 # ATAMA: x'e 5 değerini yerleştir
    x == 5  # KARŞILAŞTIRMA: x, 5'e eşit mi? -> True
    ```
  ]
    ]
)

*Metinleri Karşılaştırma*
Metinler de karşılaştırılabilir. `==` operatörü büyük/küçük harfe duyarlıdır:

#kod-blok(width: 100%)[
  ```python
  print("elma" == "elma")    # True
  print("elma" == "Elma")    # False  (büyük/küçük harf farklı)
  print("elma" != "armut")   # True
  print("a" < "b")           # True   (alfabetik sıra / karakter kodu)
  ```
]

*Farklı Türlerin Karşılaştırılması*
#kod-blok(width: 100%)[
  ```python
  print(3 == 3.0)        # True   (int ile float değer olarak eşit)
  print("5" == 5)        # False  (metin ile sayı aynı şey değildir)
  print(int("5") == 5)   # True   (türü dönüştürünce eşit)
  ```
]

#not_block(title: "Ondalıklı sayılarda == kullanırken dikkat: ")[
  Bilgisayar ondalıklı sayıları tam kesinlikle saklayamaz. Bu yüzden `float` değerlerin `==` ile karşılaştırılması güvenilir değildir.
]

#kod-blok(width: 100%)[
    ```python
    print(0.1 + 0.2)           # 0.30000000000000004
    print(0.1 + 0.2 == 0.3)    # False
    ```
  ]

=== Mantıksal Operatörler
Mantıksal operatörler, `True` / `False` değerlerini ve karşılaştırma sonuçlarını birleştirmek veya tersine çevirmek için kullanılır. Üç tanedir: `and` (ve), `or` (veya), `not` (değil).

#icerik-tablo(
  tablo_baslik: "Python Mantıksal Operatörleri",
  sutunlar: (auto, auto, 1fr, 1fr),
  sutun_basliklari: ("Operatör", "Anlamı", "Ne zaman True olur?", "Günlük Hayattan Örnek"),
  icerik_hizalama: (center + horizon, center + horizon, left + horizon, left + horizon),
  [#oprt-goster()[`and`]], [Ve], [İki koşul da `True` ise.], ["Hava güzel *ve* ödevim bitti ise parka giderim."],
  [#oprt-goster()[`or`]], [Veya], [En az bir koşul `True` ise.], ["Param *veya* kartım varsa alışveriş yapabilirim."],
  [#oprt-goster()[`not`]], [Değil], [Koşul `False` ise (tersine çevirir).], ["Yağmur yağmıyorsa dışarı çıkarım."],
)
#align(center)[
#image("images/sayfa_alt_bosluklar/18_5_Mantiksal_Operatorler.svg",width: 97%)
]

#block(breakable: false)[
  #align(center)[*Doğruluk Tabloları*]
  #grid(
    columns: (auto, auto, auto, auto),
    gutter: 5pt,
    align: top,
      icerik-tablo(
        tablo_baslik: "and: Hepsi doğru olmalı",
        sutunlar: (auto, auto, auto),
        sutun_basliklari: ("A", "B", [`A and B`]),
        [`True`], [`True`], [*`True`*],
        [`True`], [`False`], [`False`],
        [`False`], [`True`], [`False`],
        [`False`], [`False`], [`False`],
      )
    ,
    icerik-tablo(
        tablo_baslik: "or: Biri doğru olsa yeter",
        sutunlar: (auto, auto, auto),
        sutun_basliklari: ("A", "B", [`A or B`]),
        [`True`], [`True`], [`True`],
        [`True`], [`False`], [`True`],
        [`False`], [`True`], [`True`],
        [`False`], [`False`], [*`False`*],
      )
    ,
    icerik-tablo(
        tablo_baslik: "not:Tersine çevirir",
        sutunlar: (auto, auto),
        sutun_basliklari: ("A", [`not A`]),
        [`True`], [`False`],
        [`False`], [`True`],
      ),
      align(center)[#text(size:8.5pt)[
        #v(1em)
        *Örnek Kod*
            #kod-blok()[
  ```python
  print(True and True)  #True
  print(True and False) #False
  print(False or True) #True
  print(False or False) #False
  print(not True) #False
  print(not False) #True
  ```]
      ]]
      ,
  )
]

#kod-cikti(baslik: [Karşılaştırma operatörleriyle birlikte kullanım], baslik-yeri: "sag")[
        ```python
        yas = 20
        ehliyet = True

        print(yas >= 18 and ehliyet)
        print(yas < 18 or yas > 60)
        print(not ehliyet)
        ```
][
        ```
        True
        False
        False
        ```
]

*Örnek: Aritmetik ve Mantıksal Koşulların Birlikte Kullanımı*
#kod-blok(width: 100%)[
  ```python
  sayi = 15
  print(sayi % 3 == 0 and sayi % 5 == 0)   # True  (hem 3'e hem 5'e bölünüyor)
  print(sayi % 2 == 0 or sayi > 10)        # True  (çift değil ama 10'dan büyük)
  print(not (sayi > 20))                   # True
  ```
]

*Örnek: Adım adım mantıksal ifade*
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

#not_block(title:"Kısa Devre (Short-Circuit): ")[
  Python mantıksal ifadeyi *gereksiz yere sonuna kadar hesaplamaz*:
- #oprt-goster()[`and`] ifadesinde soldaki `False` ise sonuç kesindir (`False`); sağ taraf hiç değerlendirilmez.
- #oprt-goster()[`or`] ifadesinde soldaki `True` ise sonuç kesindir (`True`); sağ taraf hiç değerlendirilmez.
Bu özellik, hataya yol açabilecek bir işlemi önce kontrol etmek için çok kullanışlıdır.
]

#kod-blok(width: 100%)[
  ```python
x = 0
sayi = 12
metin = ""

# 1. Sıfıra bölme koruması: x != 0 False olduğu için sağdaki 20/x hiç çalışmaz (Hata vermez)
print(x != 0 and 20 / x > 2)          # False
# 2. or koruması: x == 0 True olduğu için sağdaki 100/x çalıştırılmaz
print(x == 0 or 100 / x == 5)         # True
# 3. Boş metin kontrolü: len(metin) > 0 False olduğu için metin[0] index hatası vermez
print(len(metin) > 0 and metin[0] == "A")  # False
# 4. Sol taraf True olunca and devam eder: Bu kez sağ taraf çalışır ve hesaplanır
print(sayi > 10 and sayi % 3 == 0)    # True
# 5. or ilk doğruyu bulunca durur: sayi > 5 True olduğundan sağdaki ağır koşula bakılmaz
print(sayi > 5 or sayi / x == 1)      # True
# 6. and zinciri: Sol taraf False olursa sonraki hiçbir işlem çalışmaz
print(x > 0 and sayi > 10 and 50 / x > 1)  # False
  ```
]

=== Operatörler Arası İşlem Önceliği
Bir ifadede aritmetik, karşılaştırma ve mantıksal operatörler birlikte bulunabilir. Python bunları şu sırayla işler: *önce aritmetik, sonra karşılaştırma, en son mantıksal*.

#icerik-tablo(
  tablo_baslik: "Operatörler Arası İşlem Önceliği",
  sutunlar: (auto, auto, auto, 1fr),
  sutun_basliklari: ("Sıra", "Grup", "Operatörler", "Not"),
  icerik_hizalama: (center + horizon, center + horizon, center + horizon, left + horizon),
  bolunebilir: true,
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

*Gerçek hayat, kampa katılım kuralı*
#kod-blok(width: 100%)[
        ```python
        yas = 15
        veli_izni = True
        saglik_raporu = False

        katilabilir = yas >= 14 and yas <= 17 and (veli_izni or saglik_raporu)
        # 1) yas >= 14                      ->  True
        # 2) yas <= 17                      ->  True
        # 3) (veli_izni or saglik_raporu)   ->  True or False  ->  True
        # 4) True and True and True         ->  True
        print(katilabilir)  #True
        ```
      ]

#not_block(title: "Özet: ")[
  - Operatör, değerler üzerinde işlem yapan semboldür.
  - #oprt-goster()[`=`] bir *atama* operatörüdür: ilk atamada değişken oluşur, sonraki atamalarda değeri güncellenir.
  - Aritmetik operatörler sayısal sonuç, karşılaştırma ve mantıksal operatörler `bool` sonuç üretir.
  - Öncelik sırası: *parantez $->$ aritmetik $->$ karşılaştırma $->$ `not` $->$ `and` $->$ `or`*.
  - Emin olmadığınız yerde parantez kullanın.
]

 #align(center)[
#image("images/sayfa_alt_bosluklar/18_6_Operatorler_Arasi_Islemler.jpg",width: 80%)
 ]