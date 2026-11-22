#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap(no, cevap, aciklama) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt, weight: "semibold")[#underline(stroke: 1.25pt, offset: 1.25pt)[(#cevap)]]
  #text(size:10pt)[#aciklama]
]

#let cevap-acikUclu(no, cevap) = block(
  breakable: false,
  width: 100%,
  below: 0.6em
)[
  #text(weight: "bold", size: 9pt)[Soru #no.]
  #text(size: 10pt)[#cevap]
]

#let ara-baslik(baslik) = block(
  breakable: false,
  width: 100%,
  above: 1em,
  below: 0.7em
)[
  #text(weight: "bold", size: 10pt)[#baslik]
]

=== Bölüm Soruları: Cevap Anahtarı

#cevap(1, [A], [Transistör])

#cevap(2, [B], [8 bit = 1 Byte ($2^8 = 256$ farklı kombinasyon)])

#cevap(3, [E], [4 bit ($16 = 2^4$, 1 nibble)])

#cevap(4, [A], [Uzun ikili (binary) bit dizilerini daha kısa ve okunabilir göstermesi])

#cevap(5, [C], [Harf ve sembollere standart sayısal kodlar karşılık getirmek])

#cevap(6, [D], [Assembly Dili])

#cevap(7, [B], [Makine komutlarını sembolik kısaltmalarla (mnemonics) yazma imkânı vermesi])

#cevap(8, [A], [Derleyici (Compiler)])

#cevap(9, [Bit], [İkilik sayı sisteminde $0$ veya $1$ değerini alabilen en temel mantıksal veri birimi.])

#cevap(10, [Byte (Bayt)], [8 bitin birleşmesiyle oluşan ve 1 karakter saklamaya yeten veri birimi.])

#cevap(11, [Hexadecimal (Onaltılık)], [0–9 rakamları ile A–F harflerini kullanan 16 tabanlı sayı sistemi.])

#cevap(12, [ASCII], [Karakter ve sembolleri standart sayısal kodlarla eşleştiren kodlama tablosu.])

#cevap(13, [Assembly], [İşlemci komutlarını kısaltmalarla ifade eden alt seviyeli programlama dili.])

#cevap(14, [Y], [Bilgisayardaki en küçük veri birimi Byte değil, *bittir* (1 Byte = 8 bit).])

#cevap(15, [D], [8 bit bir araya gelerek 1 Byte'lık veri büyüklüğünü meydana getirir.])

#cevap(16, [D], [Hexadecimal sistemde 0–9 rakamları ile A–F arasındaki 6 harf (toplam 16 sembol) kullanılır.])

#text(weight: "semibold")[Soru 17.] Eşleştirme: *1-B, 2-C, 3-E, 4-D, 5-A*

==== Tarihteki İlk Bilgisayar Programcısı

#cevap(18, [B], [Analitik Makine'yi 1837'de Charles Babbage tasarlamıştır.])
#cevap(19, [B], [Dönemin teknolojisi makinenin yapımı için yeterli değildi.])
#cevap(20, [B], [Ada Lovelace, Babbage'ın en büyük destekçilerinden biriydi.])
#cevap(21, [B], [Bernoulli sayıları için algoritma tasarladığı için ilk bilgisayar programcısı kabul edilir.])
#cevap(22, [B], [Ada programlama dili, adını Ada Lovelace'ten alır.])

==== Bilgisayar Nedir? Değerlendirme

#cevap(23, [B], [Verileri depolamak, işlemek ve sonuçları çıktı olarak sunmak.])
#cevap(24, [B], [İşlenmemiş ham verilere girdi denir.])
#cevap(25, [B], [İşlenmiş anlamlı değere çıktı denir.])
#cevap(26, [E], [Programlama, bilgisayarın temel işlemlerinden biri değildir.])
#cevap(27, [C], [Dış dünyadan gelen verileri elektrik sinyaline giriş birimi çevirir.])
#cevap(28, [B], [Bellek birimi verileri, komutları ve ara sonuçları geçici saklar.])
#cevap(29, [C], [Aritmetiksel ve mantıksal işlemleri işlemci (CPU) yapar.])
#cevap(30, [D], [İşlenmiş sonuçları çıkış birimi kullanıcıya sunar.])
#cevap(31, [B], [Veri yolu, birimler arasında veri ve komut taşır.])
#cevap(32, [B], [Girişten gelen veriler işlemciye ulaşmadan önce RAM'e yazılır.])
#cevap(33, [B], [RAM geçicidir; bilgisayar kapanınca içeriği silinir.])
#cevap(34, [C], [Kalıcı veriler sabit diskte saklanır.])

==== Soru 35: Çemberin çevresi ve alanı

#kod-blok(width: 100%)[
  ```python
  PI = 3.14159

  yaricap = float(input("Yarıçap (cm): "))

  cevre = 2 * PI * yaricap
  alan = PI * yaricap ** 2

  print(f"Çevre: {cevre:.2f} cm")
  print(f"Alan: {alan:.2f} cm²")
  ```
]

==== Soru 36: Vücut kitle endeksi (BMI)

#kod-blok(width: 100%)[
  ```python
  boy = float(input("Boyunuzu Metre Cinsinden Giriniz(1.85 gibi):"))
  kilo = int(input("Kilonuzu Tam Sayı Olarak Giriniz(85 gibi):"))

  bmi = kilo / boy ** 2

  print("Vücut Kitle Endeksiniz (BMI):", bmi)
  ```
]

==== Soru 37: Araç yakıt tüketimi

#kod-blok(width: 100%)[
  ```python
  print("Araç Kullanım Bilgileri Giriş Ekranı")

  yol = float(input("Gidilen Yol(km):"))
  yakit = float(input("Aldığınız Yakıt Miktarı(lt):"))
  tutar = float(input("Alınan Yakıt Tutarı:"))

  yuz_km_litre = yakit / yol * 100
  yuz_km_tutar = tutar / yol * 100

  print("100km 'de Harcanan Yakıtın Litresi:", yuz_km_litre)
  print("100km 'de Harcanan Yakıtın Tutarı:", yuz_km_tutar)
  ```
]

==== Soru 38: Sayıyı iki katının beş fazlasına güncelleme

#kod-blok(width: 100%)[
  ```python
  sayi = int(input("Klavyeden 1-20 Arası Pozitif Tam Sayı Girin: "))

  sayi = sayi * 2 + 5

  print("Girilen sayının değeri 2 katının 5 fazlası kadar arttırıldı")
  print("Sayının Yeni Değeri :", sayi)
  ```
]

==== Soru 39: Dik üçgende hipotenüs

#kod-blok(width: 100%)[
  ```python
  a = float(input("a Kenarının Uzunluğu: "))
  b = float(input("b Kenarının Uzunluğu: "))

  c = (a ** 2 + b ** 2) ** 0.5

  print("c Kenarının Uzunluğu(Hipotenüs): ", c)
  ```
]

