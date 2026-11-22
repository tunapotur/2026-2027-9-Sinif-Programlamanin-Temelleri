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

#soru(1, [`print("16", "11", "2026", sep="-")` komutunun ekran çıktısı aşağıdakilerden hangisidir?])
#siklar5([16 11 2026], [16112026], [16-11-2026], [16/11/2026], ["16-11-2026"])

#soru(2, [Python'da bir değişkenin veri türünü öğrenmek için aşağıdaki fonksiyonlardan hangisi kullanılır?])
#siklar5([`len()`], [`print()`], [`round()`], [`input()`], [`type()`])

#soru(3, [`isinstance(7.5, (int, float))` ifadesinin çalışma sonucu aşağıdakilerden hangisidir?])
#siklar5([int], [False], [float], [True], [Hata verir])

#soru(4, [Python'da f-string (`f"..."`) kullanımının temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Kullanıcıdan parola gibi gizli verileri güvenle almak],
  [Yazılan kodların çalışma süresini ölçmek],
  [Kullanılmayan değişkenleri bellekten otomatik silmek],
  [Sayıları arka planda ikilik sisteme dönüştürmek],
  [Metin içinde değişken değerlerini ve ifadeleri `{}` ile doğrudan biçimlendirmek],
)

#block(above: 1em, below: 0.6em)[
#text(size: 8.8pt, fill: luma(100))[Aşağıdaki cümlelerde boş bırakılan yerleri en uygun kavram veya ifadeyle tamamlayınız.]
]

#soru(5, [Python'da klavyeden kullanıcı girdisi almak için ............... fonksiyonu kullanılır.])

#soru(6, [Python'da hesaplanan sonuçları ekrana çıktı olarak yazdırmak için ............... fonksiyonu kullanılır.])

#block(above: 1em, below: 0.6em)[#text(size: 8.8pt, fill: luma(100))[Aşağıdaki ifadeleri inceleyerek doğru olanların sonuna (D), yanlış olanların sonuna (Y) yazınız.]]

#soru(7, [`type()` fonksiyonu bir değişkenin veya değerin veri türünü öğrenmek için kullanılır. #box(stroke: 0.5pt + gray, radius: 2pt, inset: (x: 6pt, y: 1.5pt))[ D / Y ]])

#soru(8, [Programlamada fonksiyon kullanmanın sağladığı en önemli fayda nedir?])
#cevap-cizgisi(2)

#soru(9, [Yazılımda *DRY (Don't Repeat Yourself)* ilkesi ne anlama gelir?])
#cevap-cizgisi(2)

#v(1em)

#iki_hucreli_satir[
==== Çıktı biçimlendirme
#soru_bilgi[Konu: `sep`, `end`, kaçış karakterleri · Zorluk: Orta]

  *a)* Kullanıcıdan gün, ay ve yılı ayrı ayrı alın. Tek bir `print()` ile, değerlerin arasına `/` koyarak ve satırın sonuna ` <- tarih biçimi` yazarak ekrana yazdırın. Bunun için `sep` ve `end` kullanın.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Gün: 14
Ay: 11
Yıl: 2026
14/11/2026 <- tarih biçimi
```
]
]

#iki_hucreli_satir[
  *b)* Aşağıdaki çıktıyı `print()` ile üreten programı yazın. "Yükleniyor...Tamam" aynı satırda görünmeli, diğer satırlarda kaçış karakterleri kullanılmalıdır (ikinci satırdaki boşluk bir `Tab` boşluğudur).][
  #output-box[
```text
Yükleniyor...Tamam
Ad:	Ali
Yol: C:\Okul
O "evet" dedi
```
]
]

#iki_hucreli_satir[
==== Market fişi
#soru_bilgi[Konu: sabit, f-string ile hizalama ve biçimlendirme · Zorluk: Zor]

  `KDV_ORANI = 0.20` sabitini tanımlayın. Kullanıcıdan ürün adını, birim fiyatı ve adedi alın. Ara toplamı, KDV'yi ve genel toplamı hesaplayın; aşağıdaki gibi, sütunları hizalı ve 28 tireli çizgilerle yazdırın. Ürün adı 12 karakterlik alanda sola, adet 3 karakterlik alanda sağa, fiyat 7 karakterlik alanda sağa yaslanmalıdır.][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
Ürün adı: Defter
Birim fiyat: 24.5
Adet: 4
----------------------------
Defter        4 x   24.50
Ara toplam        98.00 TL
KDV (%20)         19.60 TL
GENEL TOPLAM     117.60 TL
----------------------------
```
]
]

#iki_hucreli_satir[
==== Sayı ve İsim İstatistiği
#soru_bilgi[Konu: yerleşik fonksiyonlar `len()`, `max()`, `min()`, `abs()`, `round()` · Zorluk: Orta]

Kullanıcıdan ismini ve 2 ondalıklı sayı alın. Yerleşik fonksiyonları kullanarak ismin kaç harfli olduğunu, en büyük ve en küçük sayıyı, iki sayının ortalamasını (2 basamağa yuvarlanmış) ve birinci ile ikinci sayının arasındaki mutlak farkı yazdırın.
  ][
  #output-box(title: "Örnek Ekran Çıktısı")[
```text
İsminizi girin: Mehmet
1. Sayı: 7.5
2. Sayı: 9.25
İsminiz 6 harflidir.
En büyük: 9.25
En küçük: 7.5
Ortalama: 8.38
Mutlak fark: 1.75
```
]
]
