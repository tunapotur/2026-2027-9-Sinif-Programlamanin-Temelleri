#import "/lib/template.typ": *
#import "../lib/fonksiyon-aciklama.typ":*

== Fonksiyonların Kullanımı
"Kod tekrarı; aynı kodun farklı yerlerde yeniden yazılmasıdır. Hata vermez fakat kodun bakımını ve okunmasını zorlaştırır. Bu durumdan kaçınma ilkesine DRY (Don't Repeat Yourself - Kendini Tekrar Etme) denir."

Fonksiyonlar kod tekrarını önleyen en temel araçlardandır. Belirli bir görevi yerine getiren kod blokları bir fonksiyon çatısı altında toplanır ve ihtiyaç duyuldukça yalnızca fonksiyonun adı çağrılır. Fonksiyonlar, kendilerine gönderilen argümanları (girdi değerlerini) işleyerek ekrana bir çıktı verebilir veya hesaplanan sonucu geriye bir değer olarak döndürebilir.

Aşağıda, kesirli bir sayının virgülden sonraki iki basamağını elde etmek için kullanılan manuel bir mantık gösterilmiştir. Bu işlem için her defasında 5 satır kod yazdığımızı varsayalım. Programın farklı yerlerinde bu işlemi yalnızca üç kez tekrar etmemiz bile 15 satırlık gereksiz bir kod kalabalığı yaratacaktır. Oysa bunun yerine Python'ın hazır `round()` fonksiyonunu kullandığımızda aynı işlem tek bir satıra iner.


// --------------------------------------------

#let ok-asagi = box(text(top-edge: "bounds", bottom-edge: "bounds", sym.arrow.b))

// Üstte kod, ortada ok, altta kod; aralarındaki boşluğu bosluk belirler
#let adim(ust, alt, bosluk: 3pt) = stack(
  dir: ttb,
  spacing: bosluk,
  kod-blok(width: 100%, ust),
  align(center, ok-asagi),
  kod-blok(width: 100%, alt),
)

*Fonksiyonları Kullanmanın Yarattığı Fark*
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    align: center,
    adim(
      ```python
sayi = 3.14159
sayi2 = sayi*100
sayi3 = sayi2//1
sayi4 = sayi3/100
print(sayi4)  #3.14
      ```,
      ```python
round(3.14159, 2) #3.14
      ```,
    ),
    adim(
      ```python
sayi = 5.03123
sayi2 = sayi*100
sayi3 = sayi2//1
sayi4 = sayi3/100
print(sayi4)  #5.03
      ```,
      ```python
round(5.03123, 2) #5.03
      ```,
    ),
    adim(
      ```python
sayi = 7.21013
sayi2 = sayi*100
sayi3 = sayi2//1
sayi4 = sayi3/100
print(sayi4)  #7.21
      ```,
      ```python
round(7.21013, 2) #7.21
      ```,
    ),
  )
]

#align(center)[
// *`round()` Fonksiyonunun Kullanımı*
  #block(   
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
    )[
#fonksiyon-aciklama(degisken: "sonuc", ifade: "round(3.14159, 2)", deger: "3.14", boyut: 18pt)
  ]
]

Yukarıdaki örnekte *`round()`* fonksiyonunun kullanımı gösterilmektedir. Bir fonksiyonu çalıştırmak (*çağırmak*) için fonksiyonun adından hemen sonra parantez açılıp kapatılır: *`round()`*.

*`round()`* fonksiyonu dışarıdan girdi kabul eden bir fonksiyondur. Fonksiyon çağrılırken parantez içerisine yazılan bu değerlere *argüman* denir. Burada girilen: *Birinci değer (`3.14159`):* İşlem yapılacak olan ondalıklı sayıyı, *İkinci değer (`2`):* Bu sayının virgülden sonra kaç basamağa yuvarlanacağını belirtir.

Fonksiyonun kendi içinde hesapladığı sonucu çağrıldığı yere iletmesine *değer döndürme (return)* denir. Yukarıdaki örnekte *`round()`* fonksiyonunun döndürdüğü sonuç, #show-op()[`=`] atama operatörü kullanılarak *`sonuc`* isimli değişkene aktarılmıştır.


#ders-tablosu(boyut:8.5pt,
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

#not_block(title: "Dikkat: ", boyut: 9pt)[
  Parantez olmadan yazılan `print` gibi bir fonksiyon ifadesi fonksiyonu çalıştırmaz. Fonksiyonun *çalışması* için `print()` biçiminde parantezle çağrılması gerekir.
]

=== Yerleşik (Built-in) Fonksiyonlar
Python'la birlikte hazır gelen fonksiyonlara *yerleşik fonksiyon* denir. Bu konuda göreceğimiz `print()` ve `input()` ile tür dönüşümünde kullandığımız `int()`, `float()` ve `str()` yerleşik fonksiyonlardır.

#ders-tablosu(
  "Sık Kullanılan Yerleşik Fonksiyonlar",
  bolunebilir: true,
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

#kod-cikti(baslik: [Birkaç yerleşik fonksiyonun sonuçları.])[
```python
        print(len("Python"))
        print(max(3, 9, 5))
        print(min(3, 9, 5))
        print(abs(-7))
        print(round(3.14159, 2))
        print(type(5))
        print(type("5"))
        ```
][
        ```        
        6
        9
        3
        7
        3.14
        `<class 'int'>`
        `<class 'str'>`

        ```
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

#image("images/python_functions.jpg")

== input() ve print() Fonksiyonları
Çoğu program şu üç adımı izler: *veriyi al* (girdi), *işle*, *sonucu göster* (çıktı). `input()` girdi adımını, `print()` çıktı adımını yapar.


=== print(): Ekrana Yazdırma
`print()` fonksiyonu, parantez içine verilen değerleri ekrana yazar ve ardından bir alt satıra geçer. Metinler tırnak içinde yazılır; sayılar ve değişkenler tırnaksız yazılır.

#kod-cikti(baslik: [Metin, sayı ve değişken yazdırma], baslik-yeri: "sag")[
   ```python
        print("Merhaba Dünya")
        print(2026)
        print(7 + 3)

        isim = "Ayşe"
        print(isim)
        print("isim")
        ```
][
        ```
        Merhaba Dünya
        2026
        10
        Ayşe
        isim
        ```
]

#not_block(title: "Dikkat: ")[
  `print(isim)` değişkenin içindeki değeri (`Ayşe`) yazdırır. `print("isim")` ise tırnak içindeki metni (`isim`) olduğu gibi yazdırır.
]

#grid(
  columns: (auto,auto),
      gutter: 5pt,
    align: (horizon),
  [Boş `print()` çağrısı ekrana hiçbir şey yazmaz, yalnızca bir satır boşluk bırakır:],
kod-blok(width: 100%)[
  ```python
  print("Birinci satır") # Birinci satır
  print()                #
  print("Üçüncü satır")  # Üçüncü satır
  ```
]
)

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

#kod-cikti(baslik: [Kullanıcının adını alıp selamlama])[
  ```python
        ad = input("Adınız nedir? ")
        print("Merhaba", ad)
        print("Tanıştığımıza memnun oldum!")
        ```
][
        ```
        Adınız nedir? Ayşe 
        Merhaba Ayşe
        Tanıştığımıza memnun oldum!
        ```
]

==== input() Her Zaman Metin Verir
Kullanıcı `15` yazsa bile `input()` bunu sayı olarak değil, `"15"` *metni* olarak verir. Bu, tür dönüşümü konusunda gördüğümüz önemli bir kuraldır:

#kod-cikti(baslik: [input Her Zaman Metin Verir])[
  ```python
        yas = input("Yaşınız: ")
        print(type(yas))
        print(yas + yas)
        ```
][
        ```
        Yaşınız: 15
        `<class 'str'>`
        1515
        ```
]

Metinlerde `+` toplama değil *birleştirme* yaptığı için `"15" + "15"` sonucu `1515` olur. Sayısal işlem yapacaksak `int()` veya `float()` ile dönüştürmemiz gerekir:

#kod-cikti(baslik: "Doğum yılından yaş hesaplama")[
        ```python
        dogum_yili = int(input("Doğum yılınız: "))
        yas = 2026 - dogum_yili
        print("Yaşınız:", yas)
        ```
][
        ```
        Doğum yılınız: 2010
        Yaşınız: 16
        ```
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

==== Virgül (,) ile Yazdırma
`print()` içindeki argümanlar virgülle ayrılır. Python aralarına *otomatik bir boşluk* koyar ve her değeri kendi türüne dokunmadan yazar. Bu yüzden sayı ile metni karıştırmak sorun çıkarmaz.

#kod-blok(width: 100%)[
  ```python
  ad = "Ayşe"
  yas = 16
  print("Merhaba", ad, "yaşın", yas)   # Merhaba Ayşe yaşın 16
  ```
]

==== f-string (Formatlı Metin)
Modern ve en okunaklı yöntemdir. Metnin tırnağının hemen önüne *`f`* harfi yazılır; metnin içinde değişkenler *süslü parantez `{ }`* arasına konur. Python çalışırken süslü parantezin içindeki değişkeni değeriyle değiştirir.

#kod-cikti(baslik: [Aynı çıktının f-string ile yazılışı])[
```python
        ad = "Ayşe"
        yas = 16
        print(f"Merhaba {ad}, {yas} yaşındasın.")
        ```
][
        ```
        Merhaba Ayşe, 16 yaşındasın.
        ```
]

f-string'in avantajları:
- Boşlukları ve tırnakları tek tek düşünmeyiz; cümle nasıl görünecekse öyle yazarız.
- Kod, okunduğunda yazdığımız cümleye çok benzer.

#kod-blok(width: 100%)[
  ```python
  # Aynı iş, üç farklı yazım
  ad = "Ayşe"
  yas = 16

  print("Merhaba", ad + ",", yas, "yaşındasın.")        # virgül ve + karışık
  print(f"Merhaba {ad}, {yas} yaşındasın.")             # f-string
  ```
]

#pagebreak()
==== f-string İçinde İşlem Yapmak
Süslü parantezin içine yalnızca değişken değil, *her türlü ifade* yazabiliriz.

#kod-cikti(baslik: [Süslü parantez içinde ifade kullanımı:],baslik-yeri: "sag")[
      ```python
        a = 8
        b = 5
        ad = "ayşe"

        print(f"{a} + {b} = {a + b}")
        print(f"{a} * {b} = {a * b}")
        print(f"Ad: {ad.upper()}")
        print(f"Ad {len(ad)} harflidir.")
        ```
][
        ```
        8 + 5 = 13
        8 \* 5 = 40
        8 sayısı çift mi? True
        Ad: AYŞE
        Ad 4 harflidir.
        ```
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

#kod-cikti(baslik: [Fiyat hesabında biçimlendirme], baslik-yeri: "sag")[
  ```python
        fiyat = 249.9
        adet = 3
        toplam = fiyat * adet

        print(f"Toplam: {toplam}")
        print(f"Toplam: {toplam:.2f} TL")
        print(f"Toplam: {toplam:,.2f} TL")
        ```
][
    ```
    Toplam: 749.7
    Toplam: 749.70 TL
    Toplam: 749.70 TL
    ```
]

#not_block(title: "İpucu: ")[
  Para, ortalama, ölçüm gibi değerlerde `{deger:.2f}` kalıbı çok kullanılır. `0.1 + 0.2` gibi işlemlerde çıkan `0.30000000000000004` türü uzun sayıları da `:.2f` ile düzgün gösterebiliriz.
]

==== f-string ile Hizalama
Tablo gibi düzenli çıktılar için metni belirli bir genişlikte sola (`<`), sağa (`>`) veya ortaya (`^`) hizalar.

#ders-tablosu(
  "f-string Hizalama Kalıpları",
  (auto, auto, auto, 1fr),
  ("Kalıp", "Örnek", "Sonuç (| işaretleri sınırı gösterir)", "Açıklama"),
  hizalama: (center + horizon, left + horizon, left + horizon, left + horizon),
  [`:<10`], [`f"{'Elma':<10}"`], [`|Elma      |`], [10 karakterlik alanda sola yasla.],
  [`:>10`], [`f"{'Elma':>10}"`], [`|      Elma|`], [10 karakterlik alanda sağa yasla.],
  [`:^10`], [`f"{'Elma':^10}"`], [`|   Elma   |`], [10 karakterlik alanda ortala.],
)

#kod-cikti(baslik: [Hizalı fiyat listesi])[
```python
        print(f"{'Ürün':<10}{'Fiyat':>8}")
        print(f"{'Elma':<10}{12.5:>8.2f}")
        print(f"{'Armut':<10}{9.75:>8.2f}")
        print(f"{'Muz':<10}{30:>8.2f}")
        ```
][
```text
        Ürün         Fiyat
        Elma         12.50
        Armut         9.75
        Muz          30.00
        ```
]



==== f-string'de Süslü Parantez ve Tırnak Kullanımı
- Metnin içinde süslü parantezin kendisini göstermek istersek *iki kez* yazarız: `{{` ve `}}`.
- `{ }` içine doğrudan bir yazı yazacaksak, f-string'in dışındaki tırnaktan *farklı* tür tırnak kullanırız. Dışta çift tırnak varsa içeride tek tırnak kullanırız.

#kod-blok(width: 100%)[
  ```python
  print(f"Küme: {{1, 2, 3}}")        # Küme: {1, 2, 3}

  print(f"Ders: {'Python'}")         # Ders: Python
  ```
]

==== f"{degisken=}" Kullanımı
Süslü parantez içine değişkenin sonuna `=` koyarsak Python hem değişkenin *adını* hem *değerini* yazar. Kodu test ederken çok işe yarar.

#kod-cikti()[
  ```python
        puan = 75
        ort = 82.5
        print(f"{puan=}")
        print(f"{ort=}")
        ```
][
        ```
        puan=75
        ort=82.5
        ```
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
#kod-cikti(baslik: [Farklı ayırıcılarla yazdırma], baslik-yeri: "sol", columns: (2fr, 1fr))[
```python
        print("Pazartesi", "Salı", "Çarşamba")
        print("Pazartesi", "Salı", "Çarşamba", sep="-")
        print("Pazartesi", "Salı", "Çarşamba", sep=", ")
        print("Pazartesi", "Salı", "Çarşamba", sep="")
        print(14, 30, 45, sep=":")
        ```
][
```
Pazartesi Salı Çarşamba
Pazartesi\-Salı\-Çarşamba
Pazartesi, Salı, Çarşamba
PazartesiSalıÇarşamba
14:30:45
```
]

==== end: Satır Nasıl Bitsin?
Normalde her `print()` işini bitirince alt satıra geçer. `end` ile bu davranışı değiştirebiliriz.

#kod-cikti(baslik: [Aynı satırda yazdırmaya devam etme], baslik-yeri: "sag")[
```python
        print("Yükleniyor", end="...")
        print("Tamam")

        print("A", end=" ")
        print("B", end=" ")
        print("C")
        ```
][
```
Yükleniyor...Tamam
A B C
```
]

*`sep` ve `end` birlikte de kullanılabilir:*
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

#kod-cikti(baslik: [Kaçış Karakteri Örneği])[
   ```python
        print("Birinci\nİkinci")
        print("Ad:\tAyşe")
        print("Yol: C:\\Okul")
        print("O \"evet\" dedi")
        ```
][
```
Birinci
İkinci
Ad:#h(1.5em)Ayşe
Yol: C:\\Okul
O \"evet\" dedi
```
]

=== Örnek Uygulamalar
#kod-cikti(
  baslik: "Daire alanı hesaplama",
  columns: (32em, auto),
  align: horizon,
  [
    ```python
    pi = 3.14159
    r = float(input("Yarıçap (cm): "))
    alan = pi * r * r
    print(f"r={r}cm olan dairenin alanı {alan:.2f}cm²'dir.")
    ```
  ],
  [
    Yarıçap (cm): 5 \
    r=5.0 cm olan dairenin alanı 78.54 cm²\'dir.
  ],
)

#kod-cikti(
  baslik: "Not ortalaması",baslik-yeri: "sag",
  columns: (32em, auto),
  align: horizon,
  [
    ```python
    ad = input("Öğrenci adı: ")
    vize = float(input("Vize notu: "))
    final = float(input("Final notu: "))

    ortalama = vize * 0.4 + final * 0.6

    print(f"Öğrenci : {ad}")
    print(f"Ortalama: {ortalama:.1f}")
    print(f"Geçti mi: {ortalama >= 50}")
    ```
  ],
  [
    ```
    Öğrenci adı: Ayşe
    Vize notu: 70
    Final notu: 90
    Öğrenci : Ayşe
    Ortalama: 82.0
    Geçti mi: True
    ```
  ],
)

#kod-cikti(
  baslik: "Market fişi",
  baslik-yeri: "sag",
  columns: (32em, auto),
  align: horizon,
  [
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
  ],
  [
    ```text
    Ürün adı: Defter
    Birim fiyat: 24.5
    Adet: 4
    ------------------------
    Defter        4 x  24.50
    TOPLAM            98.00 TL
    ------------------------
    ```
  ],
)

#kod-cikti(
  baslik: "Saniyeyi saat-dakika-saniyeye çevirme",baslik-yeri: "sag",
  columns: (32em, auto),
  align: horizon,
  [
    ```python
    toplam = int(input("Saniye giriniz: "))

    saat = toplam // 3600
    kalan = toplam % 3600
    dakika = kalan // 60
    saniye = kalan % 60

    print(f"{saat:02d}:{dakika:02d}:{saniye:02d}")
    ```
  ],
  [
    ```
    Saniye giriniz: 3725
    01:02:05
    ```
  ],
)

#not_block(title: "Özet: ", boyut: 8.35pt)[
  - Fonksiyon, bir işi yapan isimli kod parçasıdır; `fonksiyon(argümanlar)` biçiminde çağrılır ve gerekirse bir dönüş değeri verir.
  - `input()` klavyeden veri alır ve *her zaman metin* döndürür. Sayı gerekiyorsa `int()` veya `float()` ile dönüştürülür.
  - `print()` değerleri ekrana yazar. Virgül araya boşluk koyar; *f-string* ise değişkenleri metnin içine `{ }` ile yerleştirir.
]

#align(center)[
  #image("images/python_functions2.jpg", width: 87%)
]