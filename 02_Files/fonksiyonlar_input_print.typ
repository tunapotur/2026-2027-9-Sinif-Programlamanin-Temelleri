#import "/lib/template.typ": *

// ---- Bu dosyaya özel yardımcılar (operatorler.typ içindekiyle aynı; template.typ'ye taşıyabilirsiniz) ----
#let ders-tablosu(baslik, sutunlar, basliklar, hizalama: center + horizon, ..satirlar) = align(center)[
  #block(breakable: false)[
    *#baslik*
    #table(
      columns: sutunlar,
      fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
      stroke: 0.5pt + rgb("#cbd5e1"),
      align: hizalama,
      inset: 6pt,
      table.header(..basliklar.map(b => [*#b*])),
      ..satirlar,
    )
  ]
]

// Şemalarda kullanılan renkli küçük kutu
#let sema-kutusu(renk, icerik) = rect(
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt + renk,
  fill: renk.lighten(88%),
  align(center + horizon, icerik),
)

#let sema-oku = text(size: 16pt)[$->$]
// ----------------------------------------------------------------------------------

== Fonksiyonlar
Matematikte $f(x) = x + 1$ gibi bir fonksiyon, kendisine verilen bir değerle işlem yapıp sonuç üretir. Programlamada da fikir aynıdır:

#not_block()[Fonksiyon, belirli bir işi yapmak için hazırlanmış ve kendisine isim verilmiş kod parçasıdır. İşi her seferinde baştan yazmak yerine fonksiyonun adını yazıp çağırırız.]

Fonksiyonu küçük bir makine gibi düşünebiliriz: içine bir şey verilir, makine işini yapar, gerekirse bir sonuç geri verir.

#align(center)[
  #v(0.5em)
  #grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 8pt,
    align: center + horizon,
    sema-kutusu(rgb("#6c8ebf"))[*Girdi* \ (argüman) \ #text(size: 9pt)[`3.14159, 2`]],
    sema-oku,
    sema-kutusu(rgb("#a3a35c"))[*Fonksiyon* \ #text(size: 9pt)[`round( )`]],
    sema-oku,
    sema-kutusu(rgb("#82b366"))[*Sonuç* \ (dönüş değeri) \ #text(size: 9pt)[`3.14`]],
  )
  #v(0.5em)
]

#ders-tablosu(
  "Fonksiyon Kavramları",
  (auto, 1fr, auto),
  ("Kavram", "Açıklama", "Örnek"),
  hizalama: (center + horizon, left + horizon, left + horizon),
  [*Fonksiyon çağırma*], [Fonksiyonun adını yazıp yanına parantez koyarak çalıştırmak.], [`print()`],
  [*Argüman*], [Fonksiyonun parantezi içine verilen değer. Birden fazlaysa virgülle ayrılır.], [`round(3.14159, 2)`],
  [*Dönüş değeri*], [Fonksiyonun işini bitirince geri verdiği sonuç. Bir değişkene atanabilir.], [`sonuc = round(3.14159, 2)`],
)

#kod-blok(width: 100%)[
  ```python
  sonuc = round(3.14159, 2)   # round fonksiyonu çağrıldı; 3.14159 ve 2 birer argüman
  print(sonuc)                # 3.14
  ```
]

#not_block(title: "Dikkat: ")[
  Parantez olmadan yazılan `print` ifadesi fonksiyonu çalıştırmaz. Fonksiyonun *çalışması* için `print()` biçiminde parantezle çağrılması gerekir.
]

=== Yerleşik (Built-in) Fonksiyonlar
Python'la birlikte hazır gelen, herhangi bir şey eklemeden kullanabildiğimiz fonksiyonlara *yerleşik fonksiyon* denir. Bu konuda göreceğimiz `print()` ve `input()` de birer yerleşik fonksiyondur. Tür dönüşümünde kullandığımız `int()`, `float()` ve `str()` de öyle.

#ders-tablosu(
  "Sık Kullanılan Yerleşik Fonksiyonlar",
  (auto, 1fr, auto, auto),
  ("Fonksiyon", "Ne yapar?", "Örnek", "Sonuç"),
  hizalama: (center + horizon, left + horizon, left + horizon, left + horizon),
  [`print()`], [Değerleri ekrana yazdırır.], [`print("Merhaba")`], [Ekrana `Merhaba` yazar],
  [`input()`], [Kullanıcıdan klavyeyle veri alır.], [`input("Adınız: ")`], [Yazılan metin],
  [`int()`], [Değeri tam sayıya çevirir.], [`int("25")`], [`25`],
  [`float()`], [Değeri ondalıklı sayıya çevirir.], [`float("2.5")`], [`2.5`],
  [`str()`], [Değeri metne çevirir.], [`str(15)`], [`"15"`],
  [`type()`], [Değerin türünü verir.], [`type(5)`], [`<class 'int'>`],
  [`len()`], [Metnin karakter sayısını verir.], [`len("Python")`], [`6`],
  [`round()`], [Sayıyı yuvarlar.], [`round(3.14159, 2)`], [`3.14`],
  [`abs()`], [Mutlak değer verir.], [`abs(-7)`], [`7`],
  [`max()` / `min()`], [En büyük / en küçük değeri verir.], [`max(3, 9, 5)`], [`9`],
)

#v(0.5em)
#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Birkaç yerleşik fonksiyonun sonuçları.
      #kod-blok[
        ```python
        print(len("Python"))
        print(max(3, 9, 5))
        print(min(3, 9, 5))
        print(abs(-7))
        print(round(3.14159, 2))
        print(type(5))
        print(type("5"))
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        6 \
        9 \
        3 \
        7 \
        3.14 \
        `<class 'int'>` \
        `<class 'str'>`
      ]
    ]
  )
]

==== Dönüş Değeri Olan ve Olmayan Fonksiyonlar
`round()` gibi fonksiyonlar bir sonuç *geri verir* ve bu sonucu bir değişkene atayabiliriz. `print()` ise sonuç üretmez, işi ekrana yazmaktır. Bu yüzden `print()` çağrısının sonucunu bir değişkene atarsak `None` (yani "değer yok") elde ederiz.

#kod-blok(width: 100%)[
  ```python
  a = round(2.678, 1)
  print(a)          # 2.7

  b = print("Merhaba")   # ekrana Merhaba yazılır
  print(b)               # None
  ```
]

#not_block(title: "Ders notu: ")[
  Bir fonksiyonun ekrana yazdığı şey ile geri verdiği değer farklı kavramlardır. Ekrandaki yazıyı değişkende saklayamayız; ancak dönüş değerini saklayabiliriz.
]

== input() ve print() Fonksiyonları
Çoğu program şu üç adımı izler: *veriyi al* (girdi), *işle*, *sonucu göster* (çıktı). `input()` girdi adımını, `print()` çıktı adımını yapar.

#align(center)[
  #v(0.5em)
  #grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 8pt,
    align: center + horizon,
    sema-kutusu(rgb("#6c8ebf"))[*Girdi* \ #text(size: 9pt)[`input()`]],
    sema-oku,
    sema-kutusu(rgb("#a3a35c"))[*İşlem* \ #text(size: 9pt)[hesaplama, karşılaştırma]],
    sema-oku,
    sema-kutusu(rgb("#82b366"))[*Çıktı* \ #text(size: 9pt)[`print()`]],
  )
  #v(0.5em)
]

=== print(): Ekrana Yazdırma
`print()` fonksiyonu, parantez içine verilen değerleri ekrana yazar ve ardından bir alt satıra geçer. Metinler tırnak içinde yazılır; sayılar ve değişkenler tırnaksız yazılır.

#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Metin, sayı ve değişken yazdırma.
      #kod-blok[
        ```python
        print("Merhaba Dünya")
        print(2026)
        print(7 + 3)

        isim = "Ayşe"
        print(isim)
        print("isim")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Merhaba Dünya \
        2026 \
        10 \
        Ayşe \
        isim
      ]
    ]
  )
]

#not_block(title: "Dikkat: ")[
  `print(isim)` değişkenin içindeki değeri (`Ayşe`) yazdırır. `print("isim")` ise tırnak içindeki metni (`isim`) olduğu gibi yazdırır.
]

Boş `print()` çağrısı ekrana hiçbir şey yazmaz, yalnızca bir satır boşluk bırakır:

#kod-blok(width: 100%)[
  ```python
  print("Birinci satır")
  print()
  print("Üçüncü satır")
  ```
]

=== input(): Kullanıcıdan Veri Alma
`input()` fonksiyonu program çalışırken klavyeden veri almamızı sağlar. Arka planda üç aşama gerçekleşir:

+ Python `input()` satırına gelince programın akışı *durur*.
+ Kullanıcı klavyeden bir şey yazıp *Enter* tuşuna basana kadar program bekler.
+ Enter'a basılınca yazılan her şey bir *metin (str)* olarak geri verilir ve sol taraftaki değişkene atanır. Program bir alt satırdan devam eder.

#kod-blok(width: 100%)[
  ```python
  ad = input("Adınız nedir? ")
  print("Merhaba", ad)
  ```
]

Parantez içine yazdığımız metin (`"Adınız nedir? "`) kullanıcıya gösterilen *yönlendirme mesajıdır*. Sonuna bir boşluk bırakmak, kullanıcının yazdığı cevabın mesaja yapışmamasını sağlar.

#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Kullanıcının adını alıp selamlama.
      #kod-blok[
        ```python
        ad = input("Adınız nedir? ")
        print("Merhaba", ad)
        print("Tanıştığımıza memnun oldum!")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Adınız nedir? Ayşe \
        Merhaba Ayşe \
        Tanıştığımıza memnun oldum!
      ]
    ]
  )
]

#not_block(title: "Not: ")[
  Çıktı kutularında kullanıcının klavyeden yazdığı kısım, mesajın hemen yanında görünür. Yukarıdaki örnekte kullanıcı `Ayşe` yazmıştır.
]

==== input() Her Zaman Metin Verir
Kullanıcı `15` yazsa bile `input()` bunu sayı olarak değil, `"15"` *metni* olarak verir. Bu, tür dönüşümü konusunda gördüğümüz önemli bir kuraldır:

#block(breakable: false)[
  #grid(
    columns: (22em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        yas = input("Yaşınız: ")
        print(type(yas))
        print(yas + yas)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Yaşınız: 15 \
        `<class 'str'>` \
        1515
      ]
    ]
  )
]

Metinlerde `+` toplama değil *birleştirme* yaptığı için `"15" + "15"` sonucu `1515` olur. Sayısal işlem yapacaksak `int()` veya `float()` ile dönüştürmemiz gerekir:

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Doğum yılından yaş hesaplama.
      #kod-blok[
        ```python
        dogum_yili = int(input("Doğum yılınız: "))
        yas = 2026 - dogum_yili
        print("Yaşınız:", yas)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Doğum yılınız: 2010 \
        Yaşınız: 16
      ]
    ]
  )
]

#ders-tablosu(
  "Girilen Veriye Göre Dönüştürme",
  (auto, auto, 1fr),
  ("Beklenen veri", "Kullanılacak yazım", "Örnek"),
  hizalama: (left + horizon, left + horizon, left + horizon),
  [Metin (ad, şehir, mesaj)], [`input("...")`], [`sehir = input("Şehir: ")`],
  [Tam sayı (yaş, adet)], [`int(input("..."))`], [`adet = int(input("Adet: "))`],
  [Ondalıklı sayı (not, fiyat, boy)], [`float(input("..."))`], [`boy = float(input("Boy (m): "))`],
)

#not_block(title: "Dikkat: ")[
  Kullanıcı `abc` gibi sayıya çevrilemeyecek bir şey yazarsa `int()` veya `float()` hata verir (`ValueError`) ve program durur. Hata yönetimini ileride göreceğiz; şimdilik kullanıcıdan doğru türde veri girildiğini varsayıyoruz.
]

=== print() ile Metin ve Değişkenleri Birlikte Yazdırma
Gerçek programlarda çoğu zaman sabit metin ile değişken değerlerini aynı satırda göstermek isteriz. Örneğin `Merhaba Ayşe, 16 yaşındasın.` Bunu yapmanın üç yolu vardır.

==== 1. Virgül (,) ile Yazdırma
`print()` içindeki argümanlar virgülle ayrılır. Python aralarına *otomatik bir boşluk* koyar ve her değeri kendi türüne dokunmadan yazar. Bu yüzden sayı ile metni karıştırmak sorun çıkarmaz.

#kod-blok(width: 100%)[
  ```python
  ad = "Ayşe"
  yas = 16
  print("Merhaba", ad, "yaşın", yas)   # Merhaba Ayşe yaşın 16
  ```
]

==== 2. Artı (+) ile Birleştirme
`+` operatörü iki *metni* yan yana yapıştırır. Araya otomatik boşluk koymaz; boşluğu kendimiz eklemeliyiz. Sayıları birleştirmeden önce `str()` ile metne çevirmek gerekir, aksi hâlde `TypeError` hatası alınır.

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        ad = "Ayşe"
        yas = 16
        print("Merhaba " + ad)
        print("Yaşın: " + str(yas))
        # print("Yaşın: " + yas)   # HATA!
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Merhaba Ayşe \
        Yaşın: 16
      ]
    ]
  )
]

#kod-blok(width: 100%)[
  ```python
  print("Yaşın: " + 16)
  # TypeError: can only concatenate str (not "int") to str
  ```
]

==== 3. f-string (Formatlı Metin)
Modern ve en okunaklı yöntemdir. Metnin tırnağının hemen önüne *`f`* harfi yazılır; metnin içinde değişkenler *süslü parantez `{ }`* arasına konur. Python çalışırken süslü parantezin içindeki değişkeni değeriyle değiştirir.

#not_block()[f-string yazımı: `f"... {degisken} ..."`. Tırnaktan hemen önce `f` olmalıdır.]

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Aynı çıktının f-string ile yazılışı.
      #kod-blok[
        ```python
        ad = "Ayşe"
        yas = 16
        print(f"Merhaba {ad}, {yas} yaşındasın.")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Merhaba Ayşe, 16 yaşındasın.
      ]
    ]
  )
]

f-string'in avantajları:
- Boşlukları ve tırnakları tek tek düşünmeyiz; cümle nasıl görünecekse öyle yazarız.
- Sayıları `str()` ile dönüştürmemiz gerekmez.
- Kod, okunduğunda yazdığımız cümleye çok benzer.

#kod-blok(width: 100%)[
  ```python
  # Aynı iş, üç farklı yazım
  ad = "Ayşe"
  yas = 16

  print("Merhaba", ad + ",", yas, "yaşındasın.")        # virgül ve + karışık
  print("Merhaba " + ad + ", " + str(yas) + " yaşındasın.")   # sadece +
  print(f"Merhaba {ad}, {yas} yaşındasın.")             # f-string
  ```
]

#ders-tablosu(
  "Üç Yöntemin Karşılaştırılması",
  (auto, 1fr, 1fr, 1fr),
  ("Özellik", "Virgül (,)", "Artı (+)", "f-string"),
  hizalama: (left + horizon, left + horizon, left + horizon, left + horizon),
  [*Araya boşluk*], [Otomatik koyar.], [Koymaz, biz yazarız.], [Metinde ne yazdıysak o.],
  [*Sayı yazdırma*], [Doğrudan yazılabilir.], [Önce `str()` gerekir.], [Doğrudan yazılabilir.],
  [*Okunabilirlik*], [İyi], [Uzun satırlarda karışık], [En iyi],
  [*Biçimlendirme*], [Yok], [Yok], [Var (`:.2f` gibi)],
  [*Hata riski*], [Düşük], [`TypeError` riski yüksek], [Düşük],
)

==== f-string İçinde İşlem Yapmak
Süslü parantezin içine yalnızca değişken değil, *her türlü ifade* yazabiliriz: işlem, fonksiyon çağrısı, karşılaştırma.

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Süslü parantez içinde ifade kullanımı.
      #kod-blok[
        ```python
        a = 8
        b = 5
        ad = "ayşe"

        print(f"{a} + {b} = {a + b}")
        print(f"{a} * {b} = {a * b}")
        print(f"{a} sayısı çift mi? {a % 2 == 0}")
        print(f"Ad: {ad.upper()}")
        print(f"Ad {len(ad)} harflidir.")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        8 + 5 = 13 \
        8 \* 5 = 40 \
        8 sayısı çift mi? True \
        Ad: AYŞE \
        Ad 4 harflidir.
      ]
    ]
  )
]

==== f-string ile Sayıları Biçimlendirme
Süslü parantezin içinde değişkenin yanına `:` (iki nokta) koyup nasıl gösterileceğini belirtebiliriz. En çok kullanılanlar:

#ders-tablosu(
  "f-string Biçimlendirme Kalıpları",
  (auto, auto, auto, 1fr),
  ("Kalıp", "Örnek", "Sonuç", "Açıklama"),
  hizalama: (center + horizon, left + horizon, center + horizon, left + horizon),
  [`:.2f`], [`f"{3.14159:.2f}"`], [`3.14`], [Virgülden sonra 2 basamak göster (yuvarlar).],
  [`:.0f`], [`f"{2.5678:.0f}"`], [`3`], [Virgülden sonra basamak gösterme.],
  [`:,`], [`f"{1234567:,}"`], [`1,234,567`], [Binlik ayırıcı koy.],
  [`:,.2f`], [`f"{1234567.891:,.2f}"`], [`1,234,567.89`], [Binlik ayırıcı ve 2 basamak.],
  [`:.1%`], [`f"{0.256:.1%}"`], [`25.6%`], [Yüzde olarak göster.],
  [`:03d`], [`f"{7:03d}"`], [`007`], [Toplam 3 basamak olacak şekilde başa sıfır ekle.],
)

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Fiyat hesabında biçimlendirme.
      #kod-blok[
        ```python
        fiyat = 249.9
        adet = 3
        toplam = fiyat * adet

        print(f"Toplam: {toplam}")
        print(f"Toplam: {toplam:.2f} TL")
        print(f"Toplam: {toplam:,.2f} TL")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Toplam: 749.7 \
        Toplam: 749.70 TL \
        Toplam: 749.70 TL
      ]
    ]
  )
]

#not_block(title: "İpucu: ")[
  Para, ortalama, ölçüm gibi değerlerde `{deger:.2f}` kalıbı çok kullanılır. `0.1 + 0.2` gibi işlemlerde çıkan `0.30000000000000004` türü uzun sayıları da `:.2f` ile düzgün gösterebiliriz.
]

==== f-string ile Hizalama
Metni belirli bir genişlikte sola (`<`), sağa (`>`) veya ortaya (`^`) hizalayabiliriz. Tablo gibi düzenli çıktılar için kullanılır.

#ders-tablosu(
  "f-string Hizalama Kalıpları",
  (auto, auto, auto, 1fr),
  ("Kalıp", "Örnek", "Sonuç (| işaretleri sınırı gösterir)", "Açıklama"),
  hizalama: (center + horizon, left + horizon, left + horizon, left + horizon),
  [`:<10`], [`f"{'Elma':<10}"`], [`|Elma      |`], [10 karakterlik alanda sola yasla.],
  [`:>10`], [`f"{'Elma':>10}"`], [`|      Elma|`], [10 karakterlik alanda sağa yasla.],
  [`:^10`], [`f"{'Elma':^10}"`], [`|   Elma   |`], [10 karakterlik alanda ortala.],
)

#block(breakable: false)[
  #grid(
    columns: (30em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Hizalı fiyat listesi.
      #kod-blok[
        ```python
        print(f"{'Ürün':<10}{'Fiyat':>8}")
        print(f"{'Elma':<10}{12.5:>8.2f}")
        print(f"{'Armut':<10}{9.75:>8.2f}")
        print(f"{'Muz':<10}{30:>8.2f}")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        ```text
        Ürün         Fiyat
        Elma         12.50
        Armut         9.75
        Muz          30.00
        ```
      ]
    ]
  )
]

==== f-string'de Süslü Parantez ve Tırnak Kullanımı
- Metnin içinde süslü parantezin kendisini göstermek istersek *iki kez* yazarız: `{{` ve `}}`.
- f-string'in içinde, f-string'in kendi tırnak türünü tekrar kullanmamak daha güvenlidir. Dışta çift tırnak varsa içeride tek tırnak kullanırız.

#kod-blok(width: 100%)[
  ```python
  print(f"Küme: {{1, 2, 3}}")           # Küme: {1, 2, 3}

  sozluk = {"ad": "Ayşe"}
  print(f"Ad: {sozluk['ad']}")          # Ad: Ayşe  (dışta " içeride ')
  ```
]

==== Hata Ayıklarken Kullanışlı: {degisken=}
Süslü parantez içine değişkenin sonuna `=` koyarsak Python hem değişkenin *adını* hem *değerini* yazar. Kodu test ederken çok işe yarar.

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        puan = 75
        ort = 82.5
        print(f"{puan=}")
        print(f"{ort=}")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        puan=75 \
        ort=82.5
      ]
    ]
  )
]

=== print() Fonksiyonunun sep ve end Parametreleri
`print()` fonksiyonunun, biz yazmasak da varsayılan değerlerle çalışan iki isteğe bağlı parametresi vardır. Bunları yazarak çıktının biçimini değiştirebiliriz.

#ders-tablosu(
  "print() Parametreleri",
  (auto, auto, 1fr),
  ("Parametre", "Varsayılan değer", "Ne işe yarar?"),
  hizalama: (center + horizon, center + horizon, left + horizon),
  [`sep` (separator)], [`" "` (bir boşluk)], [Virgülle ayrılan değerlerin arasına ne konacağını belirler.],
  [`end`], [`"\n"` (alt satıra geç)], [Yazdırma bittikten sonra satırın nasıl sonlanacağını belirler.],
)

==== sep: Değerler Arasına Ne Gelsin?
#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Farklı ayırıcılarla yazdırma.
      #kod-blok[
        ```python
        print("Pazartesi", "Salı", "Çarşamba")
        print("Pazartesi", "Salı", "Çarşamba", sep="-")
        print("Pazartesi", "Salı", "Çarşamba", sep=", ")
        print("Pazartesi", "Salı", "Çarşamba", sep="")
        print(14, 30, 45, sep=":")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Pazartesi Salı Çarşamba \
        Pazartesi\-Salı\-Çarşamba \
        Pazartesi, Salı, Çarşamba \
        PazartesiSalıÇarşamba \
        14:30:45
      ]
    ]
  )
]

==== end: Satır Nasıl Bitsin?
Normalde her `print()` işini bitirince alt satıra geçer. `end` ile bu davranışı değiştirebiliriz.

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      *Örnek Python Kodu*
      Aynı satırda yazdırmaya devam etme.
      #kod-blok[
        ```python
        print("Yükleniyor", end="...")
        print("Tamam")

        print("A", end=" ")
        print("B", end=" ")
        print("C")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Yükleniyor...Tamam \
        A B C
      ]
    ]
  )
]

`sep` ve `end` birlikte de kullanılabilir:

#kod-blok(width: 100%)[
  ```python
  print("Gün", "Ay", "Yıl", sep="/", end=" <- tarih biçimi\n")
  # Gün/Ay/Yıl <- tarih biçimi
  ```
]

=== Kaçış Karakterleri (Escape Characters)
Metin içinde yeni satır, sekme (tab) veya tırnak işareti gibi özel karakterler kullanmak için ters eğik çizgi `\` ile başlayan *kaçış karakterleri* kullanılır.

#ders-tablosu(
  "Sık Kullanılan Kaçış Karakterleri",
  (auto, 1fr, auto),
  ("Karakter", "Anlamı", "Örnek"),
  hizalama: (center + horizon, left + horizon, left + horizon),
  [`\n`], [Yeni satıra geç.], [`print("A\nB")`],
  [`\t`], [Sekme (tab) boşluğu bırak.], [`print("A\tB")`],
  [`\\`], [Ters eğik çizgi karakterini yazdır.], [`print("C:\\Okul")`],
  [`\"`], [Çift tırnak karakterini yazdır.], [`print("O \"evet\" dedi")`],
  [`\'`], [Tek tırnak karakterini yazdır.], [`print('Ali\'nin kitabı')`],
)

#block(breakable: false)[
  #grid(
    columns: (26em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        print("Birinci\nİkinci")
        print("Ad:\tAyşe")
        print("Yol: C:\\Okul")
        print("O \"evet\" dedi")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Birinci \
        İkinci \
        Ad:#h(1.5em)Ayşe \
        Yol: C:\\Okul \
        O \"evet\" dedi
      ]
    ]
  )
]

=== Uygulama Örnekleri
#ornek_baslik[Örnek 1: Daire alanı hesaplama]
#block(breakable: false)[
  #grid(
    columns: (30em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        pi = 3.14159
        r = float(input("Yarıçap (cm): "))
        alan = pi * r * r
        print(f"Yarıçapı {r} cm olan dairenin alanı {alan:.2f} cm²'dir.")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Yarıçap (cm): 5 \
        Yarıçapı 5.0 cm olan dairenin alanı 78.54 cm²\'dir.
      ]
    ]
  )
]

#ornek_baslik[Örnek 2: Not ortalaması]
#block(breakable: false)[
  #grid(
    columns: (30em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        ad = input("Öğrenci adı: ")
        vize = float(input("Vize notu: "))
        final = float(input("Final notu: "))

        ortalama = vize * 0.4 + final * 0.6

        print(f"Öğrenci : {ad}")
        print(f"Ortalama: {ortalama:.1f}")
        print(f"Geçti mi: {ortalama >= 50}")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Öğrenci adı: Ayşe \
        Vize notu: 70 \
        Final notu: 90 \
        Öğrenci : Ayşe \
        Ortalama: 82.0 \
        Geçti mi: True
      ]
    ]
  )
]

#ornek_baslik[Örnek 3: Market fişi]
#block(breakable: false)[
  #grid(
    columns: (30em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        urun = input("Ürün adı: ")
        fiyat = float(input("Birim fiyat: "))
        adet = int(input("Adet: "))

        toplam = fiyat * adet

        print("-" * 24)
        print(f"{urun:<12}{adet:>3} x {fiyat:>6.2f}")
        print(f"{'TOPLAM':<12}{toplam:>11.2f} TL")
        print("-" * 24)
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        ```text
        Ürün adı: Defter
        Birim fiyat: 24.5
        Adet: 4
        ------------------------
        Defter        4 x  24.50
        TOPLAM            98.00 TL
        ------------------------
        ```
      ]
    ]
  )
]

#ornek_baslik[Örnek 4: Saniyeyi saat-dakika-saniyeye çevirme]
#block(breakable: false)[
  #grid(
    columns: (30em, auto),
    gutter: 10pt,
    align: (horizon),
    [
      #kod-blok[
        ```python
        toplam = int(input("Saniye giriniz: "))

        saat = toplam // 3600
        kalan = toplam % 3600
        dakika = kalan // 60
        saniye = kalan % 60

        print(f"{saat:02d}:{dakika:02d}:{saniye:02d}")
        ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
        Saniye giriniz: 3725 \
        01:02:05
      ]
    ]
  )
]

#not_block(title: "Özet: ")[
  - Fonksiyon, bir işi yapan isimli kod parçasıdır; `isim(argümanlar)` biçiminde çağrılır ve gerekirse bir dönüş değeri verir.
  - `input()` klavyeden veri alır ve *her zaman metin* döndürür. Sayı gerekiyorsa `int()` veya `float()` ile dönüştürülür.
  - `print()` değerleri ekrana yazar. Virgül araya boşluk koyar; `+` yalnızca metinleri birleştirir; *f-string* ise değişkenleri metnin içine `{ }` ile yerleştirir.
  - f-string içinde işlem yapılabilir ve `:.2f`, `:,`, `:>10` gibi kalıplarla biçimlendirme yapılabilir.
  - `sep` ayırıcıyı, `end` satır sonunu değiştirir. `\n` ve `\t` gibi kaçış karakterleri özel karakterler üretir.
]
