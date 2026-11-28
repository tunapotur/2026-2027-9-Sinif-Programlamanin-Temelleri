#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

== Döngü Yapıları ve Liste İşlemleri

Bilgisayarları insanlardan ayıran en güçlü özelliklerden biri, aynı işlemi yorulmadan, sıkılmadan ve hatasız şekilde binlerce kez tekrarlayabilmeleridir. Programlamada belirli bir kod blokunun arka arkaya birden fazla kez çalıştırılmasını sağlayan kontrol yapılarına *döngü (loop)* adı verilir.

=== Döngüye Neden İhtiyaç Duyarız?

Ekrana 5 kez `"Merhaba Dünya"` yazdırmak istediğimizde `print()` komutunu 5 kez alt alta yazmak kolay görünebilir. Peki aynı işlemi 1.000 öğrenci için not hesaplamada, bir dosyadaki 50.000 satırı okumada veya bir oyunda karakterin hareketini her saniye güncellemede kullanmamız gerekirse ne olur? Aynı kodu kopyalayıp yapıştırmak hem zaman kaybıdır hem de *DRY (Kendini Tekrar Etme)* ilkesine aykırıdır; üstelik yapılacak küçük bir değişiklikte binlerce satırı tek tek güncellemek imkânsız hâle gelir.

#kod-cikti(baslik: "Döngüsüz (Tekrarlı Kod)", columns: (30em, auto))[
  ```python
  print("1. Öğrenci yoklaması alındı.")
  print("2. Öğrenci yoklaması alındı.")
  print("3. Öğrenci yoklaması alındı.")
  print("4. Öğrenci yoklaması alındı.")
  print("5. Öğrenci yoklaması alındı.")
  ```
][
  ```text
  1. Öğrenci yoklaması alındı.
  2. Öğrenci yoklaması alındı.
  3. Öğrenci yoklaması alındı.
  4. Öğrenci yoklaması alındı.
  5. Öğrenci yoklaması alındı.
  ```
]

#kod-cikti(baslik: "Döngülü (Kısa ve Esnek)", columns: (30em, auto))[
  ```python
  for sira in range(1, 6):
      print(f"{sira}. Öğrenci yoklaması alındı.")
  ```
][
  ```text
  1. Öğrenci yoklaması alındı.
  2. Öğrenci yoklaması alındı.
  3. Öğrenci yoklaması alındı.
  4. Öğrenci yoklaması alındı.
  5. Öğrenci yoklaması alındı.
  ```
]

#not_block(title: "Özet:")[
  Döngüler sayesinde:
  - Kod tekrarı ortadan kalkar, programlar kısalır ve okunabilirliği artar.
  - Tekrar sayısı değiştiğinde (örneğin `6` yerine `100` yapıldığında) yalnızca tek bir sayıyı güncellemek yeterli olur.
  - Kullanıcının girdiği verilere göre çalışma sayısı dinamik olarak belirlenebilir.
]
