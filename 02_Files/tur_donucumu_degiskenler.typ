#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "../lib/fonksiyon-aciklama.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/yardimcilar.typ": *

#show: conf



== Tür Dönüşümü (Type Conversion / Type Casting)
Bilgisayarlar bellekteki verileri türlerine göre farklı formatlarda saklandığını gördük. Bir verinin türünü başka bir türe çevirme işlemine *tür dönüşümü* denir.

=== Kullanıcı Girişlerinin Sayıya Dönüştürülmesi (Metin $->$ Sayı)
Klavyeden girilen veya bir metin dosyasından okunan tüm veriler, sisteme ilk olarak karakter dizisi (metin / string) biçiminde ulaşır.

- Kullanıcı ekrana 25 yazdığında bilgisayar bunu sayısal 25 olarak değil; yan yana duran *'2'*(ASCII: 50) ve *'5'*(ASCII: 53) karakterleri olarak algılar.
- Karakter tabanlı bir veriyle matematiksel işlem yapılamaz. Örneğin iki metinsel veri toplanmak istendiğinde matematiksel toplama ($25 + 10 = 35$) yerine metin birleştirme ("25" + "10" = "2510") gerçekleşir veya derleyici hata verir.
- Bu değerlerin matematiksel işlemlere girebilmesi için metin biçiminden uygun sayı türüne (int veya float) dönüştürülmesi (parse/cast edilmesi) şarttır.
#v(1em)
#block(breakable: false)[
  #v(1em)
  *Örnek Python Kodu: * Kullanıcının girdiği tam sayı değere 25 ekleyerek sonucu ekrana yazdıran kod.
  #grid(
    columns: (auto, auto),
    gutter: 10pt,
     align: (horizon),
    [
      #text(size:9pt)[
      ]
      #kod-blok[
          ```Python
          puan = int(input("Puan Giriniz: "))
          print("Puanı:", puan)
          puan = puan + 25
          print("Güncellenmiş Puan:", puan)
          ```
      ]
    ],
    [
      #output-box(title: "Python Ekran Çıktısı")[
```
Puan Giriniz: 50
Puanı: 50
Güncellenmiş Puan: 75
```
]

    ]
  
  )
]

#align(center)[
#kod-satiri(no:1, size:12pt,weight: "semibold")[
           ```Python
          puan = int(input("Puan Giriniz: "))
          ```
]
]
#v(1em)
Program, kullanıcıdan "Puan Giriniz:" iletisiyle bir tam sayı değeri beklemektedir. Python'da input() fonksiyonu klavyeden veri almak için kullanılır. Ancak daha önce belirttiğimiz gibi, input() fonksiyonu girilen veriyi ne olursa olsun her zaman bir metin (string) olarak okur. Bu metinsel değerin matematiksel hesaplamalarda veya karşılaştırmalarda kullanılabilmesi için int() fonksiyonu ile tam sayıya dönüştürülmesi şarttır.
#v(1em)
      #kod-blok[
    ```Python
veri = input("Puan Giriniz: ")  # 1. Aşama: Metin olarak alındı ("50")
puan = int(veri)                # 2. Aşama: Tam sayıya dönüştürüldü (50)
    ```
]
#v(1em)

Dileyenler bu işlemi tek satırda iç içe yapmak yerine, önce veriyi bir değişkene metin olarak alıp ardından ikinci bir satırda *int()* fonksiyonuyla sayıya dönüştürerek iki aşamada da gerçekleştirebilir. Fakat bu tek satır kod yazmaya göre daha uzundur.

#v(1em)

#kod-cikti(columns: (30em,auto), baslik: [Kullanıcı girişlerinin #underline(stroke: 1.5pt, offset: 2pt)[metin] türünden #underline(stroke: 1.5pt, offset: 2pt)[float] tipine dönüşümü yapılır #v(0em)], baslik-yeri: "sag")[
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

==== `int(input())` Nasıl Çalışır?

#kod-satiri(no: 0, size: 14pt, weight: "semibold")[
```python
puan = int(input("Puan Giriniz: "))
```
]

Bu satır *içten dışa* doğru çalışır: önce en içteki `input()`, sonra onu saran `int()`, en son da atama (#oprt-goster(size: 12pt)[`=`]).

#text(size: 12pt, weight: "semibold")[Adım 1: `input()` çalışır ve `int()` fonksiyonuna gider]

Kullanıcı klavyeden `50` yazıp Enter'a basar. `input()` fonksiyonu bu değeri her zaman *metin* olarak döndürür; yani elimize geçen şey sayı değil, tırnak içinde `"50"` olur. Bu değer, dıştaki `int()` fonksiyonuna gider.

#v(1em)

#align(center)[
   #block(   
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
    )[
  #fonksiyon-aciklama(
    on: "puan = ",
    degisken: "int",
    ara: "(",
    ifade: "input(\"Puan Giriniz: \")",
    son: ")",
    deger: "\"50\"",
    boyut: 22pt,
  )
]]

#v(1em)

#text(size: 12pt, weight: "semibold")[Adım 2: `int()` çalışır ve sonuç `puan` değişkenine gider]

`input()` çağrısı yerini döndürdüğü değere bıraktı; satır artık şu hale geldi: `puan = int("50")`.\ `int()` fonksiyonu `"50"` metnini tam sayıya çevirir ve sonuç olan `50` değeri `puan` değişkenine atanır.

#v(1em)

#align(center)[
   #block(   
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
    )[
  #fonksiyon-aciklama(
    degisken: "puan",
    ifade: "int(\"50\")",
    deger: "50",
    boyut: 28pt,
  )
]]

#v(1em)
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


#not_block(title: "Dikkat:")[
  `int()` olmasaydı `puan` değişkeninde `"50"` yani *metin* olurdu ve `puan + 10` gibi bir işlem hata verirdi. Sayıyla işlem yapacaksak `int()` (ya da ondalıklı değerler için `float()`) ile dönüştürmemiz gerekir.
]


=== Otomatik (Örtük / Implicit) Dönüşüm:
Farklı türler aynı matematiksel işleme girdiğinde, veri kaybını önlemek için küçük tür otomatik olarak daha geniş ve kapsayıcı olan türe yükseltilir:

#v(1em)

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
adet = 5           # int türünde
birim_fiyat = 2.5   # float türünde

# Python arka planda 'adet' değerini 5.0 yapar
toplam_tutar = adet * birim_fiyat # 5.0 * 2.5 = 12.5(float)

print(toplam_tutar) # Çıktı: 12.5
  ```]
)

#pagebreak()
=== Bilinçli (Açık / Explicit) Dönüşüm:
Programcının veri kaybını göze alarak veya işlemi yönlendirmek için türü zorla değiştirmesidir.

#v(1em)

#grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: top,
  [
*Hassasiyeti Korumak İçin Tam Sayıyı Kesirli Sayıya Çevirmek (int $-->$ float):*
Daha hassas değerler gerektiğinde tam sayı değerleri kasten kesirli değerlere dönüştürülebilir.
#v(1em)
#kod-blok()[
  ```Python
puan = 100

ondalikli_puan = float(puan)  # 100 -> 100.0

print(ondalikli_puan)  # Çıktı: 100.0
  ```
]
  ],
  [
*Ondalık Kısmı Atmak İçin (float $-->$ int):*
Ondalıklı bir sayının virgülden sonraki kısmını silip yalnızca tam kısmını elde etmek gerektiğinde bu dönüşümden yararlanılır.
#v(1em)
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

#v(1em)

== Değişken Tanımlama Kuralları
Yazılan kaynak kodların Python yorumlayıcısı tarafından doğru şekilde işlenebilmesi için değişken adları belirlenirken Python’un söz dizimi (*syntax*) kurallarına uyulması zorunludur.

- *Karakter Kısıtlaması:* Değişken isimleri sadece alfabetik karakterler (*A-Z, a-z*), rakamlar (*0-9*) ve alt çizgi (*\_*) karakterini barındırabilir. Bunların dışındaki hiçbir özel sembol (nokta, virgül, soru işareti, tire, boşluk vb.) değişken isminde yer alamaz.
- *Başlangıç Kriteri:* Bir değişken ismi kesinlikle bir rakam ile başlayamaz. İsimler ya alfabetik bir karakterle ya da alt çizgi (*\_*) işaretiyle başlamak zorundadır. Örneğin #text(weight: "semibold", red)[3etap_skor] hatalı bir söz dizimi iken, *etap_skor_3* veya *\_etap3* kurallara uygundur.
- *Büyük-Küçük Harf Duyarlılığı (Case-Sensitivity):* Python dili, büyük ve küçük harfleri farklı karakterler olarak değerlendirir. Bu nedenle aynı harflerden oluşsa bile yazımında büyük-küçük harf farkı bulunan kelimeler, bellekte tutulan verilere erişmek için kullanılan farklı değişken adları olarak kabul edilir.\ Örneğin *asistan_adi*, *Asistan_Adi* ve *ASISTAN_ADI* ifadeleri Python yorumlayıcısı tarafından birbirinden bağımsız üç farklı değişken adı olarak değerlendirilir.
- *Resmî Dil Anahtarları (Reserved Words):* Python dilinin kendi iç mekanizmasını yönetmek ve komutları işletmek adına kendine ayırdığı bazı özel kelimeler (keywords) değişken adı olarak kullanılamaz. Örneğin *if*, *else*, *True*, *False*, *while*, *for* gibi kelimeler Python için özel bir anlam ifade ettiğinden doğrudan değişken ismi yapılamaz.
- *Türkçe Karakter Kullanımı: * Kodlama dillerinin ve yazılım araçlarının küresel standardı gereği, değişken isimlendirirken * Türkçe'ye özgü harfleri kullanmaktan kesinlikle kaçınınız!*.

#v(1em)
#align(center)[
  #block(breakable: false, width: 100%)[
    #grid(
      columns: (1fr, 1.2fr),
      gutter: 14pt,
      align: (top, top),
      [
        *Türkçe Karakterlerin İngilizce Karşılıkları*
        #table(
          columns: (auto, auto, auto),
          fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: (center + horizon, center + horizon, center + horizon),
          rows: (2.5em, 2.6em),
          table.header([*Türkçe*], [*Dönüşüm*], [*İngilizce*]),
          [ç / Ç], [#text(weight: "bold",size: 12pt)[$-->$]], [*c / C*],
          [ğ / Ğ], [#text(weight: "bold",size: 12pt)[$-->$]], [*g / G*],
          [ı / İ], [#text(weight: "bold",size: 12pt)[$-->$]], [*i / I*],
          [ö / Ö], [#text(weight: "bold",size: 12pt)[$-->$]], [*o / O*],
          [ş / Ş], [#text(weight: "bold",size: 12pt)[$-->$]], [*s / S*],
          [ü / Ü], [#text(weight: "bold",size: 12pt)[$-->$]], [*u / U*],
        )
      ],
      [
        *Değişken Kullanım Örnekleri*
        #table(
          columns: (auto, auto, auto),
          fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
          stroke: 0.5pt + rgb("#cbd5e1"),
          align: (left + horizon, center + horizon, left + horizon),
          rows: (2.5em, 2em),
          table.header([*Hatalı Kullanım*], [*Dönüşüm*], [*Doğru Kullanım*]),
          [`doğumTarihi`],  [$-->$], [*`dogumTarihi`*],
          [`ürünFiyatı`],    [$-->$], [*`urunFiyati`*],
          [`şubeKodu`],      [$-->$], [*`subeKodu`*],
          [`kayıtDurumu`],   [$-->$], [*`kayitDurumu`*],
          [`şifresi`],       [$-->$], [*`sifresi`*],
          [`öğrenci_yaşı`],  [$-->$], [*`ogrenci_yasi`*],
          [`ücret_miktarı`], [$-->$], [*`ucret_miktari`*],
          [`ilk_değer`],     [$-->$], [*`ilk_deger`*],
        )
      ]
    )
  ]
]

== Değişken Adlandırma Standartları (Notasyonlar)
=== Yılan Gösterimi (snake_case)
Tüm harflerin küçük yazıldığı ve kelimelerin birbirine alt çizgi (\_) karakteriyle bağlandığı yöntemdir. Python literatüründe değişken ve fonksiyon isimleri için bu standardın kullanılması (örneğin *kullanici_giris_tarihi, asistan_bellek_kapasitesi* vb.) kurumsal olarak tavsiye edilir.

=== Camel Case (Deve Notasyonu) Kuralı
Değişken adları tanımlanırken kelimeler arasında **boşluk bırakılamaz**. Birden fazla kelimeden oluşan değişkenleri okunaklı kılmak için dünya çapında standart olan *camelCase* yöntemi kullanılır.\
İlk kelimenin tüm harfleri küçük başlar. Sonraki her kelimenin ilk harfi büyük yazılır (kelimelerin ortasındaki hörgüç görünümü gibi).

#align(center)[
  #v(1em)
  *Değişken Adlandırma Kuralları (Naming Conventions)*
  
  #table(
    columns: (auto, auto, auto),
    fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e1"),
    align: (center + horizon, center + horizon, center + horizon),
    rows: (2.5em, 2.5em),
    table.header([*Yanlış / Zor Okunan Biçim*], [*snake_case (Python)*], [*camelCase*]),
    
    text(fill: rgb("#dc2626"))[`personelsayisi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`personel_sayisi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`personelSayisi`],

    text(fill: rgb("#dc2626"))[`dogumyil`],
    text(fill: rgb("#2563eb"), weight: "bold")[`dogum_yil`],
    text(fill: rgb("#16a34a"), weight: "bold")[`dogumYil`],

    text(fill: rgb("#dc2626"))[`ogrencinotortalamasi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`ogrenci_not_ortalamasi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`ogrenciNotOrtalamasi`],

    text(fill: rgb("#dc2626"))[`toplamfiyat`],
    text(fill: rgb("#2563eb"), weight: "bold")[`toplam_fiyat`],
    text(fill: rgb("#16a34a"), weight: "bold")[`toplamFiyat`],

    text(fill: rgb("#dc2626"))[`kullaniciadi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`kullanici_adi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`kullaniciAdi`],

    text(fill: rgb("#dc2626"))[`maksimumhizsiniri`],
    text(fill: rgb("#2563eb"), weight: "bold")[`maksimum_hiz_siniri`],
    text(fill: rgb("#16a34a"), weight: "bold")[`maksimumHizSiniri`],

    text(fill: rgb("#dc2626"))[`sonodemetarihi`],
    text(fill: rgb("#2563eb"), weight: "bold")[`son_odeme_tarihi`],
    text(fill: rgb("#16a34a"), weight: "bold")[`sonOdemeTarihi`],
  )
  ]

== Sabitler
Bir yazılım mimarisinde programın çalışma süresince değiştirilmemesi amaçlanan ve aynı değeri koruması beklenen verilere sabit (*constant*) adı verilir. Sabit olarak kullanılması amaçlanan isimler, tüm harfleri büyük olacak ve kelimeler alt çizgiyle (\_) ayrılacak biçimde yazılır.

#kod-blok(width: 100%)[
```Python
# Doğru Sabit Kullanım Standardı (BÜYÜK HARF)
PI_SAYISI = 3.14159
MAKSIMUM_DENEME_SAYISI = 3
SISTEM_PORT_NUMARASI = 443
VARSAYILAN_DIL = "TR"
KARSILAMA_MESAJI = " Sisteme Hoş Geldiniz!"
GELISTIRICI_MODU_ACIK = True
```
]

== Açıklama Satırı (Comment line)
Yazılım projelerinde, derleyicinin görmezden geldiği ancak yazılımcıların kendileri için veya diğer yazılımcılar için bıraktığı notlara açıklama satarı (comment line) denir. Python'da iki tür açıklama satırı uygulaması vardır.
- *\#* ile başlayan tek satırlık açıklama satırı
- *\"\"\"...\"\"\"* Çok satırlı açıklama satırları üç adet tırnak ile açılan ve yine üç adet tırnak ile kapanan alan içine yazılan açıklama ifadeleri ile yapılır.

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align: top,
    [
      *Açıklamasız*
      #kod-blok(width: 100%)[
        ```Python
a = 50
b = 20
c = a * b / 100
print(c)
```
      ]
    ],
    [
      *Açıklamalı*
      #kod-blok(width: 100%)[
        ```Python
# Ürünün fiyatı
a = 50
# İndirim oranı (%)
b = 20
# İndirim miktarı
c = a * b / 100
print(c)
```
      ]
    ]
  )
]

        *Açıklama Satırının Kullanım Amaçları*
      

#kod-blok(width: 100%)[
  ```Python
# 1) Kodu açıklamak için
yas = 17  # öğrencinin yaşı

# 2) Kodu geçici olarak devre dışı bırakmak için
print("Merhaba")
# print("Bu satır çalışmaz")


# 3) Yapılacakları not etmek için
# TODO: Kullanıcıdan yaş bilgisi alınacak
```
      ]

#v(1em)      
*Çok Satırlı Açıklama ile Program Başlığı*

#kod-blok(width: 100%)[
  ```Python
"""
Program : Daire Alanı Hesaplama
Yazar   : Ahmet Tuna POTUR
Tarih   : 01.11.2026
Açıklama: Yarıçapı verilen dairenin alanını hesaplar.
"""
pi = 3.14        # pi sayısı (yaklaşık değer)
r = 5            # yarıçap
alan = pi * r * r
print(alan)      # Ekrana 78.5 yazar
```]

#not_block(title: "Dikkat: ")[
  Açıklama satırları programın çalışmasını etkilemez, ancak kodun okunabilirliğini artırır. Gereksiz ve her satır için tekrarlanan açıklamalardan kaçınılmalı; kodun *ne yaptığından çok neden yaptığı* anlatılmalıdır.  
]


#kod-blok(width: 100%)[
        ```Python
# Bu tam satırlık açıklama
x = 10  # satır içi (inline) açıklama
```]

#kod-blok(width: 100%)[
  ```Python
# Bu fonksiyon iki sayıyı toplar,
# ve geriye döndürür.
def topla(a, b):
    return a + b
# fonksiyon sonlandırıldı
```
]

      #kod-blok(width: 100%)[
        ```Python
"""
Bu teknik olarak bir string değişmezidir, ancak bir 
değişkene atanmadığı için yorum bloğu gibi davranır.
"""
print("Kod çalışıyor")
```  
      ]