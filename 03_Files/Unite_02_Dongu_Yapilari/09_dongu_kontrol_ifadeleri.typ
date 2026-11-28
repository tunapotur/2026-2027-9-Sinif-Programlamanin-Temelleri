#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Döngü Kontrol İfadeleri: `break` ve `continue`

Döngülerin normal çalışma akışını anlık olarak yönlendirmek, belirli istisnai durumlarda döngüyü erken sonlandırmak veya bir turu atlamak için iki özel anahtar kelime kullanılır:

- *`break` (döngüyü kır):* Döngü bloku içerisinde `break` ifadesiyle karşılaşıldığı an, döngü koşulunun ne olduğuna bakılmaksızın döngü tamamen sonlandırılır ve döngüden sonraki ilk satıra geçilir.
- *`continue` (turu atla):* Döngü bloku içerisinde `continue` ifadesiyle karşılaşıldığı zaman o turun geri kalan kod satırları çalıştırılmaz; döngü doğrudan bir sonraki turun başına atlar.

#kod-cikti(baslik: "break ve continue Mantığının Gösterimi", columns: (30em, auto))[
  ```python
  for sayi in range(1, 10):
      if sayi == 3:
          continue  # 3 görüldüğünde bu tur atlanır.
      if sayi == 6:
          break     # 6 görüldüğünde döngü tamamen sonlanır.
      print(f"İşlenen Sayı: {sayi}")
  ```
][
  ```text
  İşlenen Sayı: 1
  İşlenen Sayı: 2
  İşlenen Sayı: 4
  İşlenen Sayı: 5
  ```
]

==== `break` ve `continue` Mümkünse Kullanılmamalı?

`break` ve `continue` ifadeleri pratik görünse de özellikle büyük ve karmaşık döngülerde kodun akışını takip etmeyi zorlaştırır. Bir döngünün normal çıkış şartı `while` veya `for` başlığında açıkça yazarken, döngünün ortasında gizlenmiş bir `break` veya `continue` satırı kodun okunabilirliğini azaltır. Ayrıca `while` döngülerinde `continue` öncesinde sayaç güncellenmezse sonsuz döngü hatasına yol açabilir. Bu nedenle yapısal programlama yaklaşımında mümkün olduğunca koşullar doğrudan döngü başlığına veya `if` bloklarına yazılmalıdır.

==== `break` ve `continue` Kullanmadan Çözüm Yolları

`break` yerine döngü koşulunu kontrol eden bir *bayrak (flag) değişkeni* (`devam = True`), `continue` yerine ise atlanacak durumun tersini kontrol eden bir *`if` koşulu* kullanmak daha temiz ve öngörülebilir kod üretir.

#kod-cikti(baslik: "continue Yerine if Kullanımı", columns: (30em, auto))[
  ```python
  for sayi in range(1, 6):
      if sayi != 3:
          print(f"İşlenen Sayı: {sayi}")
  ```
][
  ```text
  İşlenen Sayı: 1
  İşlenen Sayı: 2
  İşlenen Sayı: 4
  İşlenen Sayı: 5
  ```
]

#kod-cikti(baslik: "break Yerine Bayrak Değişkeni", columns: (30em, auto))[
  ```python
  bulundu = False
  sayac = 1
  while sayac <= 10 and not bulundu:
      if sayac == 4:
          bulundu = True
      else:
          print(sayac)
      sayac += 1
  ```
][
  ```text
  1
  2
  3
  ```
]
