#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Koşul İfadelerinde Okunabilirlik ve Kısa Devre (Short-Circuit) Mantığı

Python, `and` ve `or` operatörlerini içeren mantıksal ifadeleri soldan sağa doğru değerlendirir ve sonucun kesinleştiği anda geri kalan koşulları hiç çalıştırmadan durur. Bu mekanizmaya *kısa devre değerlendirmesi (short-circuit evaluation)* denir.

- *`and` Operatöründe Kısa Devre:* Sol taraftaki ifade `False` ise, sağ taraftaki ifadenin ne olduğuna bakılmaksızın tüm ifade `False` olur; sağ taraf değerlendirilmez.
- *`or` Operatöründe Kısa Devre:* Sol taraftaki ifade `True` ise, sağ taraftaki ifadenin ne olduğuna bakılmaksızın tüm ifade `True` olur; sağ taraf değerlendirilmez.

Kısa devre mantığı hem gereksiz işlemleri önleyerek performans sağlar hem de olası çalışma zamanı hatalarını (örneğin sıfıra bölme hatasını) engellemek için güvenlik kalkanı olarak kullanılır.

#kod-cikti(baslik: "Sıfıra Bölme Hatasını Kısa Devre ile Önleme", columns: (31em, auto))[
  ```python
  bolen = int(input("Bölen sayıyı giriniz: "))
  bolunen = 100

  # bolen != 0 False ise sağdaki (bolunen / bolen) hiç çalışmaz!
  if bolen != 0 and bolunen / bolen > 10:
      print("Bölüm 10'dan büyüktür.")
  else:
      print("Koşul sağlanmadı veya bölen sıfır.")
  ```
][
  ```text
  Bölen sayıyı giriniz: 0
  Koşul sağlanmadı veya bölen sıfır.
  ```
]

Koşul ifadelerinde *okunabilirliği* artırmak için şu kurallara dikkat edilmelidir:
+ *Anlamlı değişken isimleri kullanın:* Karmaşık bir koşulu doğrudan `if` içine yazmak yerine önce açıklayıcı bir `bool` değişkene atamak kodu anlaşılır kılar (örneğin `gecerli_not = 0 <= puan <= 100`).
+ *Zincirleme karşılaştırmalardan yararlanın:* Python'da `puan >= 0 and puan <= 100` yerine matematikteki gibi `0 <= puan <= 100` yazabilirsiniz.
+ *Gereksiz `== True` yazmayın:* `if aktif == True:` yerine doğrudan `if aktif:` yazmak daha sade ve Python'a uygun (Pythonic) bir kullanımdır.
