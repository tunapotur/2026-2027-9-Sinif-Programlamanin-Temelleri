#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Karşılaştırma ve Mantıksal Operatörlerin Birlikte Kullanımı

Çoklu koşulları tek bir karar satırında birleştirmek için karşılaştırma (ilişkisel) operatörleri (`<`, `>`, `==`, `!=`, `<=`, `>=`) ile mantıksal operatörler (`and`, `or`, `not`) birlikte kullanılır. Böylece karmaşık şartlar tek bir mantıksal sonuca (`True` veya `False`) indirgenir.

#icerik-tablo(
  tablo_baslik: "Mantıksal Operatörlerin Karar Yapılarındaki Rolü",
  sutunlar: (auto, 1fr, auto),
  sutun_basliklari: ("Operatör", "Karar Koşulundaki Anlamı", "Örnek Koşul"),
  icerik_hizalama: (center + horizon, left + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon),
  dikey-bosluk: 6pt,
  [`and`], [Her iki koşul da `True` ise blok çalışır (VE).], [`yas >= 18 and puan >= 70`],
  [`or`], [Koşullardan en az biri `True` ise blok çalışır (VEYA).], [`gun == "Cumartesi" or gun == "Pazar"`],
  [`not`], [Koşulun sonucunu tersine çevirir (DEĞİL).], [`not sistem_kilitli`],
)

#kod-cikti(baslik: "Giriş Doğrulama ve İndirim Kontrolü", columns: (31em, auto))[
  ```python
  kullanici = input("Kullanıcı adı: ")
  sifre = input("Şifre: ")

  if kullanici == "admin" and sifre == "1234":
      print("Sisteme giriş başarılı.")
  else:
      print("Kullanıcı adı veya şifre hatalı!")
  ```
][
  ```text
  Kullanıcı adı: admin
  Şifre: 1234
  Sisteme giriş başarılı.
  ```
]

Aynı ifadede hem `and` hem de `or` kullanıldığında işlem önceliği sırası `not` > `and` > `or` şeklindedir. Karışıklığı önlemek ve niyeti açıkça göstermek için parantez `( )` kullanmak en iyi pratiktir:

#kod-blok(width: 100%)[
  ```python
  yas = 68
  ogrenci = False

  if yas < 18 or (yas >= 65 and not ogrenci):
      print("İndirimli bilet tanımlandı.")
  ```
]
