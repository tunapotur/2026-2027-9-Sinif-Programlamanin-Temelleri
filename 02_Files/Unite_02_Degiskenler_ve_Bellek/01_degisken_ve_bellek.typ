#import "../../pageGeneralConfig.typ": *
#import "../../lib/qr_code.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *

// #show: conf
// #show: conf.with(sayfa-ayari: false)

== Değişkenler ve Bellek(RAM)
=== Değişken Kullanılarak Çözülen Matematik Problemi
*Problem:* $946877 times 946875 - 946876 times 946875 = ?$ Bu soru matematik sorularında değişken kullanımının hesaplamaları nasıl daha kolay hâle getirdiğine bir örnektir.\
*Çözüm:* Altı haneli sayılarla işlem yapmak hata olasılığını artırır ve çözümü zorlaştırır. $x = 946875$ dersek:
// #v(-0.5em)
#align(center)[
  $ (x + 2) x - (x + 1) x
    = x [(x + 2) - (x + 1)] 
    = x (x + 2 - x - 1) 
    = x.1 
    = x$
    => sonuç $x = 946875$
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

=== Değişken Tanımlama Kuralları
Yazılan kaynak kodların Python yorumlayıcısı tarafından doğru şekilde işlenebilmesi için değişken adları belirlenirken Python’un söz dizimi (*syntax*) kurallarına uyulması zorunludur.

- *Karakter Kısıtlaması:* Değişken isimleri sadece alfabetik karakterler (*A-Z, a-z*), rakamlar (*0-9*) ve alt çizgi (*\_*) karakterini barındırabilir. Bunların dışındaki hiçbir özel sembol (nokta, virgül, soru işareti, tire, boşluk vb.) değişken isminde yer alamaz.
- *Başlangıç Kriteri:* Bir değişken ismi kesinlikle bir rakam ile başlayamaz. İsimler ya alfabetik bir karakterle ya da alt çizgi (*\_*) işaretiyle başlamak zorundadır. Örneğin #text(weight: "semibold", red)[3etap_skor] hatalı bir söz dizimi iken, *etap_skor_3* veya *\_etap3* kurallara uygundur.
- *Büyük-Küçük Harf Duyarlılığı (Case-Sensitivity):* Python dili, büyük ve küçük harfleri farklı karakterler olarak değerlendirir. Bu nedenle aynı harflerden oluşsa bile yazımında büyük-küçük harf farkı bulunan kelimeler, bellekte tutulan verilere erişmek için kullanılan farklı değişken adları olarak kabul edilir.\ Örneğin *asistan_adi*, *Asistan_Adi* ve *ASISTAN_ADI* ifadeleri Python yorumlayıcısı tarafından birbirinden bağımsız üç farklı değişken adı olarak değerlendirilir.
- *Resmî Dil Anahtarları (Reserved Words):* Python dilinin kendi iç mekanizmasını yönetmek ve komutları işletmek adına kendine ayırdığı bazı özel kelimeler (keywords) değişken adı olarak kullanılamaz.\ Örneğin *if*, *else*, *True*, *False*, *while*, *for* gibi kelimeler Python için özel bir anlam ifade ettiğinden doğrudan değişken ismi yapılamaz.
- *Türkçe Karakter Kullanımı: * Kodlama dillerinin ve yazılım araçlarının küresel standardı gereği, değişken isimlendirirken * Türkçe'ye özgü harfleri kullanmaktan kesinlikle kaçınınız!*.

#align(center)[
  #block(breakable: false, width: 100%)[
    #grid(
      columns: (1fr, 1.2fr),
      gutter: 14pt,
      align: (top, top),
icerik-tablo(
  sutunlar:(auto, auto, auto),
  tablo_baslik:[Türkçe Karakterlerin İngilizce Karşılıkları],
  sutun-baslik-bosluk: (x:6pt, y:7pt),
  hucre-bosluk: (x:8pt, y:8.4pt),
  sutun_basliklari: ([Türkçe], [Dönüşüm], [İngilizce]),
  [ç / Ç], [#text(weight: "bold",size: 12pt)[$-->$]], [*c / C*],
  [ğ / Ğ], [#text(weight: "bold",size: 12pt)[$-->$]], [*g / G*],
  [ı / İ], [#text(weight: "bold",size: 12pt)[$-->$]], [*i / I*],
  [ö / Ö], [#text(weight: "bold",size: 12pt)[$-->$]], [*o / O*],
  [ş / Ş], [#text(weight: "bold",size: 12pt)[$-->$]], [*s / S*],
  [ü / Ü], [#text(weight: "bold",size: 12pt)[$-->$]], [*u / U*],
),
icerik-tablo(
  sutunlar:(auto, auto, auto),
  tablo_baslik:[Değişken Kullanım Örnekleri],
  sutun-baslik-bosluk: (x:6pt, y:7pt),
  hucre-bosluk: (x:8pt, y:6pt),
  sutun_basliklari: ([Hatalı Kullanım],[Dönüşüm],[Doğru Kullanım]),
  [`doğumTarihi`],  [$-->$], [*`dogumTarihi`*],
  [`ürünFiyatı`],    [$-->$], [*`urunFiyati`*],
  [`şubeKodu`],      [$-->$], [*`subeKodu`*],
  [`kayıtDurumu`],   [$-->$], [*`kayitDurumu`*],
  [`şifresi`],       [$-->$], [*`sifresi`*],
  [`öğrenci_yaşı`],  [$-->$], [*`ogrenci_yasi`*],
  [`ücret_miktarı`], [$-->$], [*`ucret_miktari`*],
  [`ilk_değer`],     [$-->$], [*`ilk_deger`*],
))]]

=== Değişken Adlandırma Standartları (Notasyonlar)
==== Yılan Gösterimi (snake_case)
Tüm harflerin küçük yazıldığı ve kelimelerin birbirine alt çizgi (\_) karakteriyle bağlandığı yöntemdir. Python literatüründe değişken ve fonksiyon isimleri için bu standardın kullanılması (örneğin *kullanici_giris_tarihi, asistan_bellek_kapasitesi* vb.) kurumsal olarak tavsiye edilir.

==== Camel Case (Deve Notasyonu) Kuralı
Değişken adları tanımlanırken kelimeler arasında *boşluk bırakılamaz*. Birden fazla kelimeden oluşan değişkenleri okunaklı kılmak için dünya çapında standart olan *camelCase* yöntemi kullanılır.\
İlk kelimenin tüm harfleri küçük başlar. Sonraki her kelimenin ilk harfi büyük yazılır (kelimelerin ortasındaki hörgüç görünümü gibi).

#icerik-tablo(
  tablo_baslik: "Değişken Adlandırma Kuralları (Naming Conventions)",
  sutunlar: (auto, auto, auto),
  sutun_basliklari: ([Yanlış / Zor Okunan Biçim],[snake_case (Python)],[camelCase]),
  dikey-bosluk: 8.5pt,
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

=== Sabitler
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
