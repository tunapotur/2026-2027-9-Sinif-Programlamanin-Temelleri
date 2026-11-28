#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

== Koşul Yapıları

Programlama dillerinde, belirlenen bir mantıksal koşulun sonucuna — *Doğru (`True`)* veya *Yanlış (`False`)* — göre program akışının farklı dallara ayrılmasını sağlayan kontrol mekanizmalarına *karar yapıları* (koşul yapıları) denir. Python dilinde bu süreç `if`, `elif` ve `else` anahtar kelimeleri ile yönetilir.

=== Programın Akışı: Sıralı Çalışma ve Karar Verme

Şimdiye kadar yazdığımız programlarda komutlar yukarıdan aşağıya doğru, yazıldıkları sırayla ve istisnasız bir şekilde çalıştırılıyordu. Bu çalışma biçimine *sıralı çalışma (sequential execution)* denir. Ancak gerçek hayattaki problemlerin neredeyse tamamı duruma göre farklı kararlar vermeyi gerektirir.

Örneğin bir okul sisteminde öğrencinin notu 50 veya üzerindeyse "Geçti", 50'nin altındaysa "Kaldı" yazdırılması gerekir. Sıralı çalışan bir programda iki mesajın da aynı anda yazdırılması mantıksız olurdu; programın *koşulu değerlendirip* yalnızca uygun yolu seçmesi gerekir.

#kod-cikti(baslik: "Sıralı Akış (Karar Yok)", columns: (30em, auto))[
  ```python
  notu = 45
  print("Not kontrol ediliyor...")
  print("Sınav sonucu: Geçti")
  print("Sınav sonucu: Kaldı")
  ```
][
  ```text
  Not kontrol ediliyor...
  Sınav sonucu: Geçti
  Sınav sonucu: Kaldı
  ```
]

#kod-cikti(baslik: "Koşullu Akış (Karar Var)", columns: (30em, auto))[
  ```python
  notu = 45
  print("Not kontrol ediliyor...")
  if notu >= 50:
      print("Sınav sonucu: Geçti")
  else:
      print("Sınav sonucu: Kaldı")
  ```
][
  ```text
  Not kontrol ediliyor...
  Sınav sonucu: Kaldı
  ```
]

#not_block(title: "Not:")[
  Karar yapıları bir *koşul ifadesi* (örneğin `notu >= 50`) değerlendirir. Bu ifadenin sonucu her zaman mantıksal bir değerdir (`True` veya `False`). Program, bu sonuca bakarak hangi kod blokunun çalıştırılacağına karar verir.
]
