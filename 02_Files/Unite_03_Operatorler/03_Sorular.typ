#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap-cizgisi(..args) = {
  let n = if args.pos().len() > 0 {
    args.pos().first()
  } else if "n" in args.named() {
    args.named().at("n")
  } else {
    1
  }
  for _ in range(n) [
    #v(0.25em)
    #line(length: 100%, stroke: 0.45pt + gray)
    #v(0.45em)
  ]
}

#let soru(no, metin) = block(breakable: false, below: 0.65em)[
  *#no.* #metin
]

#let siklar2(a, b, c, d, ..rest) = {
  let e = if rest.pos().len() > 0 { rest.pos().first() } else { none }
  if e != none {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
      grid.cell(colspan: 2)[E) #e],
    )
  } else {
    grid(
      columns: (1fr, 1fr),
      gutter: 6pt,
      [A) #a], [B) #b],
      [C) #c], [D) #d],
    )
  }
}

#let siklar4(a, b, c, d) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d],
)

#let siklar5(a, b, c, d, e) = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [A) #a], [B) #b], [C) #c], [D) #d], [E) #e],
)

=== Bölüm Soruları

#soru(1, [Başlangıçta `sayi = 20` iken sırasıyla `sayi += 10` ve `sayi -= 4` satırları çalıştırılırsa `sayi` değişkeninin son değeri ne olur?])
#siklar5([22], [26], [32], [30], [24])

#soru(2, [Python'da iki değerin birbirine eşit olup olmadığını denetlemek (karşılaştırmak) için hangi operatör kullanılır?])
#siklar5([`=`], [`:=`], [`=>`], [`==`], [`!=`])

#soru(3, [Python'da `2 ** 6` üs alma işleminin sonucu kaçtır?])
#siklar5([36], [512], [64], [18], [12])

#soru(4, [Aşağıdakilerden hangisi bir aritmetik operatör *değildir*?])
#siklar5([`+`], [`>=`], [`*`], [`/`], [`-`])

#soru(5, [Python'da `=` atama operatörü, `==` ise eşitlik karşılaştırma operatörüdür. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(6, [Python'da atama operatörü (`=`) ile eşitlik karşılaştırma operatörü (`==`) arasındaki fark nedir?])
#cevap-cizgisi(2)

#v(1em)

==== Kod izleme
#soru_bilgi[Konu: işlem önceliği, bileşik atama, mantıksal operatörler · Zorluk: Orta]

Aşağıdaki programı *çalıştırmadan*, her `print` satırının ekrana yazacağı değeri yanına yazın.\ Sonra bilgisayarda çalıştırıp kontrol edin.

#grid(
  columns: (19em, 13em, auto), 
  gutter: 10pt,
  align: top
)[
#kod-blok(width: 100%)[
```python
a = 10
b = 4

print(a + b * 2)
print((a + b) * 2)
print(a / b)
print(a // b)
print(a % b)
print(a > 5 and b < 3)
print(not a == 10 or b == 4)
```]
][
#kod-blok(width: 100%,ilk-satir: 11)[
```python
bakiye = 100
bakiye += 50
bakiye -= 30
bakiye *= 2
print(bakiye)

mesaj = "Ha"
mesaj *= 3
mesaj += "!"
print(mesaj)
```]
][
#kod-blok(width: 100%, ilk-satir: 21)[
```python
x = 7
x = x + 3 * 2

print(x)
print(x % 5 == 3)
print(17 // 5, 17 % 5)

print(2 ** 3 ** 2)
print(-3 ** 2)
print(10 - 4 - 3)
```]
]

#iki_hucreli_satir[
==== Dakikayı gün, saat ve dakikaya çevirme
#soru_bilgi[Konu: tam bölme `//`, mod `%` · Zorluk: Orta]

  Kullanıcıdan toplam dakikayı alın; bu süreyi gün, saat ve dakika olarak yazdırın (1 gün = 1440 dakika). Yalnızca `//` ve `%` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Toplam dakika: 4000
2 gün 18 saat 40 dakika
```
]
]

#iki_hucreli_satir[
==== Basamaklarına ayırma
#soru_bilgi[Konu: tam bölme `//`, mod `%` · Zorluk: Orta]

  Kullanıcıdan 3 basamaklı bir sayı alın. Yüzler, onlar ve birler basamağını; basamakların toplamını; sayının tersini (487 için 784) ekrana yazdırın. Sayıyı metne çevirip dilimleme yapmayın, yalnızca `//` ve `%` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
3 basamaklı bir sayı girin: 487
Yüzler: 4, Onlar: 8, Birler: 7
Basamaklar toplamı: 19
Ters sayı: 784
```
]
]

#iki_hucreli_satir[
==== ATM para dağıtımı
#soru_bilgi[Konu: `//` ve `%` ile adım adım hesap, değişken güncelleme · Zorluk: Zor]

  Bir ATM'de 100, 50, 20, 10, 5 ve 1 TL'lik paralar var. Kullanıcının çekmek istediği tutarı (tam sayı) alın ve her paradan en az sayıda kullanılarak kaç adet verileceğini yazdırın. İpucu: büyük paradan başlayın; her adımda `//` ile adedi, `%` ile kalanı bulun.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Çekilecek tutar (TL): 287
100 TL: 2 adet
50 TL : 1 adet
20 TL : 1 adet
10 TL : 1 adet
5 TL  : 1 adet
1 TL  : 2 adet
```
]
]

#iki_hucreli_satir[
==== Sinema bileti
#soru_bilgi[Konu: karşılaştırma ve mantıksal operatörler · Zorluk: Orta]

  Bir sinema; 12 yaşından küçük, 65 yaş ve üzeri ya da öğrenci olanlara indirim yapıyor. Kullanıcıdan yaşını ve öğrenci olup olmadığını (`E` / `H`) alın; değişkenlerin adını `yas` ve `ogrenci` yapın. İndirim hakkını ve tam fiyat ödeyip ödemeyeceğini `True` / `False` olarak yazdırın. `if` kullanmayın; öğrenci bilgisini bir karşılaştırma ile `bool` değişkene dönüştürün. Bu iki değişkenin adını ve değerini f-string'in `{değişken=}` biçimiyle yazdırın. ][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Yaşınız: 16
Öğrenci misiniz? (E/H): E
yas=16
ogrenci=True
İndirimli bilet: True
Tam fiyat: False
```
]
]
