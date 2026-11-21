#import "../../pageGeneralConfig.typ": *
#import "../../lib/qr_code.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *

// #show: conf
// #show: conf.with(sayfa-ayari: false)

== Değişkenler ve Bellek(RAM)
=== Değişken Kullanılarak Çözülen Matematik Problemi
Matematik sorularında değişken kullanımının hesaplamaları nasıl daha kolay hâle getirdiğine bir örnek.

*Problem:* $946877 times 946875 - 946876 times 946875 = ?$

*Çözüm:* Sürekli altı haneli sayılarla işlem yapmak hem hata olasılığını artırır hem de çözümü zorlaştırır. Bunun yerine 946875 sayısını bir değişkenle gösterelim. $x = 946875$ dersek $946877 = x + 2$ ve $946876 = x + 1$ olur.\ Buna göre ifadeyi yeniden yazalım:
#v(-0.5em)
#align(center)[
  $ (x + 2) x - (x + 1) x
    = x [(x + 2) - (x + 1)] 
    = x (x + 2 - x - 1) 
    = x.1 
    = x $
]

#not_block(title: "Sonuç: ")[
  $x = 946875$ olduğuna göre işlemin sonucu *946875*'tir.
]
=== Programlama Dillerinde Değişken
Değişken; programın çalışması sırasında verilerin bilgisayarın geçici belleğinde (RAM) saklandığı alanlara verilen isimdir (etikettir). Bilgisayarlar karmaşık bellek adresleriyle çalışırken programcılar bu adresleri ezberlemek yerine verilerine anlamlı değişken isimleriyle kolayca ulaşır.

Kullanıcıdan alınan bilgiler veya dış kaynaklardan gelen veriler, değişkenler aracılığıyla belleğe kaydedilir. Program çalıştığı sürece bu verilere değişken isimleri çağrılarak erişilir; veriler üzerinde matematiksel veya mantıksal işlemler yapılır ve süreç içerisinde değişkenlerin taşıdığı değerler yeni verilerle güncellenebilir.

Aşağıda *`puan`* değişkeninin oluşturulmasına, çağrılmasına ve güncellenmesine bir örnek verilmiştir.

#kod-cikti(baslik: [Örnek Python Kodu])[
  ```Python
puan = int(input("Puan Giriniz: "))
print("Puanı:", puan)
puan = puan + 25
print("Güncellenmiş Puan:", puan)
```
][
```
Puan Giriniz: 50
Puanı: 50
Güncellenmiş Puan: 75
```
]


#let image_width = 94%

#let atama1 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[
  #image("images/01-Deger-Atama-RAM.jpg",width: image_width)
  ]
  #grid(
    columns: (8em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Puan Giriniz: 50]],
    [#text(size:8pt)[Giriş yapılan *50* değeri, RAM'de *puan* ismiyle bir adrese kaydedilir.]]
  )
]

#let atama2 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("images/02-Hafizadan-Cagirma-RAM.jpg",width: image_width)]
  #grid(
    columns: (5em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Puanı: 50]],
    [#text(size:8pt)[*puan* değişkeni RAM'deki adresinden çağırılarak *50* değeri ekrana yazdırılır.]]
  )
]

#let atama3 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("images/03-Deger-Guncelleme-RAM.jpg",width: image_width)]
  #grid(
    columns: (4em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[İşlem]],
    text(size:8pt)[Mevcut *50* değeri hafızadan alınır, *25* eklenir ve elde edilen *75* değeri tekrar *puan* değişkenine atanır.]
  )
]

#let atama4 = block(
  breakable: false,
   inset: 10pt,
    radius: 4pt,
    stroke: 1pt + rgb("#d0d7de"),
    width: 100%
)[
  #align(center)[#image("images/04-Guncel-Hali-Cagirma-RAM.jpg",width: image_width)]
  #grid(
    columns: (10.1em, auto),
    gutter: 5pt,
    align: (left + horizon),
    [#not_block(title: "",boyut: 8pt)[Güncellenmiş Puan: 75]],
    text(size:8pt)[Güncellenen *puan* değişkeni hafızadan çağırılarak ekrana yazdırılır.]
  )
]

#grid(
  columns: (auto,auto),
  gutter: 5pt,
  align: (left + horizon),
  atama1, atama2
)

#grid(
  columns: (auto,auto),
  gutter: 5pt,
  align: (left + horizon),
  atama3, atama4
)

#not_block(title:"Özet",boyut: 10pt, width: 100%)[Değişkenler, değerleri geçici olarak RAM'de tutan etiketlerdir. Program çalıştığı sürece bu değerler kullanılabilir ve güncellenebilir.]

