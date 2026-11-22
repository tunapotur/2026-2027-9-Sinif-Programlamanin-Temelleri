#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ": *

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
