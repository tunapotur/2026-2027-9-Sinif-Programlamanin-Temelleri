#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Örnek Uygulamalar

==== Mod Operatörü ile Karar Verme: Tek-Çift ve Bölünebilme

Bir sayının başka bir sayıya tam bölünüp bölünmediğini anlamak için mod alma operatörü (`%`) kullanılır. İki sayının bölümünden kalan `0` ise sayı tam bölünüyor demektir. Özellikle bir sayının 2'ye bölümünden kalan `0` ise sayı *çift*, aksi halde *tektir*.

#kod-cikti(baslik: "Tek / Çift Sayı Kontrolü", columns: (30em, auto))[
  ```python
  sayi = int(input("Bir tam sayı giriniz: "))

  if sayi % 2 == 0:
      print(f"{sayi} bir ÇİFT sayıdır.")
  else:
      print(f"{sayi} bir TEK sayıdır.")
  ```
][
  ```text
  Bir tam sayı giriniz: 17
  17 bir TEK sayıdır.
  ```
]

#kod-cikti(baslik: "5'e Tam Bölünebilme", columns: (30em, auto))[
  ```python
  sayi = int(input("Sayı giriniz: "))

  if sayi % 5 == 0:
      print(f"{sayi}, 5'e tam bölünür.")
  else:
      kalan = sayi % 5
      print(f"Tam bölünmez, kalan: {kalan}")
  ```
][
  ```text
  Sayı giriniz: 23
  Tam bölünmez, kalan: 3
  ```
]

==== Büyük / Küçük Harf Duyarlılığı: `.lower()` ve `.upper()`

Bilgisayarlar, kullanıcıların girdilerini işlerken karakterlerin biçimsel özelliklerine karşı son derece katıdır. Python programlama dili büyük/küçük harf duyarlılığına (case-sensitive) sahip bir mimariyle çalışır. Bu durum, bellek düzeyinde `"A"` karakteri ile `"a"` karakterinin tamamen farklı iki veri olarak kabul edilmesi anlamına gelir.

Kullanıcılardan metinsel veri alırken harf duyarlılığından kaynaklanan mantıksal hataları engellemek ve programın kararlılığını korumak için string metotlarından yararlanılır. Kullanıcının klavyeden metni nasıl yazdığından (hepsi büyük, hepsi küçük veya karışık) bağımsız olarak veriyi standart bir forma dönüştürmek amacıyla en sık kullanılan iki metot şunlardır:

- *`.lower()` Metodu:* Uygulandığı metinsel ifadedeki tüm büyük harfleri küçük harfe dönüştürür.
- *`.upper()` Metodu:* Uygulandığı metinsel ifadedeki tüm küçük harfleri büyük harfe dönüştürür.

#kod-cikti(baslik: "Harf Duyarlılığını Önleme", columns: (31em, auto))[
  ```python
  cevap = input("İşleme devam edilsin mi? (Evet/Hayır): ")

  # Kullanıcının girdiği metni küçük harfe çevirip karşılaştırıyoruz
  if cevap.lower() == "evet":
      print("İşlem başarıyla onaylandı.")
  else:
      print("İşlem iptal edildi.")
  ```
][
  ```text
  İşleme devam edilsin mi? (Evet/Hayır): EvEt
  İşlem başarıyla onaylandı.
  ```
]

Yukarıdaki örnekte kullanıcı `"EvEt"`, `"EVET"` veya `"evet"` yazsa bile `.lower()` metodu tüm karakterleri `"evet"` biçimine dönüştürdüğü için karşılaştırma tutarlı şekilde `True` sonucunu verir. Benzer şekilde plaka kodu veya sınıf şubesi gibi büyük harf beklenen durumlarda `.upper()` metodu kullanılabilir.
