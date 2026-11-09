#import "/lib/template.typ": *
#import "fonksiyon-aciklama.typ": fonksiyon-aciklama

#show: conf

== `int(input())` Nasıl Çalışır?

#kod-blok[
```python
puan = int(input("Puan Giriniz: "))
```
]

Python bu satırı *içten dışa* doğru çalıştırır: önce en içteki `input()`, sonra onu saran `int()`, en son da atama (`=`).

=== Adım 1: `input()` çalışır ve `int()` fonksiyonuna gider

Kullanıcı klavyeden `50` yazıp Enter'a basar. `input()` fonksiyonu bu değeri her zaman *metin* olarak döndürür; yani elimize geçen şey sayı değil, tırnak içinde `"50"` olur. Bu değer, dıştaki `int()` fonksiyonuna gider.

#align(center)[
  #fonksiyon-aciklama(
    on: "puan = ",
    degisken: "int",
    ara: "(",
    ifade: "input(\"Puan Giriniz: \")",
    son: ")",
    deger: "\"50\"",
    boyut: 18pt,
  )
]

=== Adım 2: `int()` çalışır ve sonuç `puan` değişkenine gider

`input()` çağrısı yerini döndürdüğü değere bıraktı; satır artık şu hale geldi: `puan = int("50")`. `int()` fonksiyonu `"50"` metnini tam sayıya çevirir ve sonuç olan `50` değeri `puan` değişkenine atanır.

#align(center)[
  #fonksiyon-aciklama(
    degisken: "puan",
    ifade: "int(\"50\")",
    deger: "50",
    boyut: 18pt,
  )
]

=== Sonuç

#kod-blok[
```python
puan = int(input("Puan Giriniz: "))
print(puan)
print(type(puan))
```
]

#output-box[
```
Puan Giriniz: 50
50
<class 'int'>
```
]

#not_block(title: "Dikkat:")[
  `int()` olmasaydı `puan` değişkeninde `"50"` yani *metin* olurdu ve `puan + 10` gibi bir işlem hata verirdi. Sayıyla işlem yapacaksak `int()` (ya da ondalıklı değerler için `float()`) ile dönüştürmemiz gerekir.
]
