#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== İç İçe Koşul Yapıları

Yazılım dünyasında bazı problemlerde bir koşulun kontrol edilebilmesi, kendisinden önceki başka bir koşulun başarıyla gerçekleşmiş olmasına bağlıdır. Bir kontrol yapısının içine (girinti seviyesini bir kademe daha artırarak) yeni bir kontrol yapısı yerleştirilmesine *iç içe (nested) koşul yapısı* adı verilir.

Günlük hayatta ehliyet alma süreci, bu mimariye verilebilecek somut örneklerden biridir. Bir adayın sürücü belgesi alabilmesi için öncelikle 18 yaşını doldurmuş olması şartı aranır. Bu ilk (dış) koşul sağlanmazsa diğer aşamalara geçilmesine izin verilmez ve süreç doğrudan sonlandırılır. Yaş şartı sağlandığında ise adayın karşısına yazılı sınavı geçme ve ardından direksiyon sınavında başarılı olma gibi iç koşullar çıkar.

#kod-cikti(baslik: "Ehliyet Başvuru Kontrolü", columns: (31em, auto))[
  ```python
  yas = int(input("Yaşınız: "))

  if yas >= 18:
      yazili = input("Yazılı sınavı geçtiniz mi? (evet/hayır): ")
      if yazili.lower() == "evet":
          print("Tebrikler, direksiyon sınavına girebilirsiniz!")
      else:
          print("Önce yazılı sınavı geçmelisiniz.")
  else:
      print("18 yaşından küçükler başvuru yapamaz.")
  ```
][
  ```text
  Yaşınız: 19
  Yazılı sınavı geçtiniz mi? (evet/hayır): evet
  Tebrikler, direksiyon sınavına girebilirsiniz!
  ```
]

#not_block(title: "Dikkat:")[
  İç içe yapılarda her yeni `if` veya `else` bloku, kendi üstündeki bloktan *4 boşluk daha içeride* yazılmalıdır. Girintiler arttıkça kodun okunması zorlaşabileceği için genellikle 2–3 kademeden daha derin iç içe yapılardan kaçınılır.
]
