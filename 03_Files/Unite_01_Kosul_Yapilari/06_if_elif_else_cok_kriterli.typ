#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== if-elif-else Çok Kriterli Karar Mekanizmaları

Birden fazla koşulun sırayla kontrol edilmesi ve yalnızca doğru olan yolun seçilmesi için `if`, `elif` (*else if* kısaltması) ve `else` anahtar kelimeleri kullanılır.

`if-elif-else` yapısı yukarıdan aşağıya doğru doğrusal bir hiyerarşiyle çalışır. Python yorumlayıcısı ilk karşılaştığı `if` koşulunu test eder; eğer ilk koşul yanlış (`False`) ise sırasıyla aşağıdaki `elif` basamaklarını kontrol etmeye başlar. İlk doğru (`True`) olan bloğu çalıştırdığı anda yapının geri kalanına bakmadan çıkış yapar. Koşulların hiçbirinin sağlanmadığı senaryoda ise en altta yer alan `else` bloku devreye girer.

#kod-cikti(baslik: "Not Harf Karşılığı Hesaplama", columns: (30em, auto))[
  ```python
  puan = int(input("Notunuzu giriniz (0-100): "))

  if puan >= 85:
      print("Başarı Durumu: Pekiyi (AA)")
  elif puan >= 70:
      print("Başarı Durumu: İyi (BB)")
  elif puan >= 50:
      print("Başarı Durumu: Orta (CC)")
  else:
      print("Başarı Durumu: Başarısız (FF)")
  ```
][
  ```text
  Notunuzu giriniz (0-100): 76
  Başarı Durumu: İyi (BB)
  ```
]

`if-elif-else` merdiveni kurgulanırken koşulların yazım sırası programın mantıksal kararlılığı açısından kritik bir öneme sahiptir. Yorumlayıcı ilk doğru gördüğü blokta aramayı sonlandırdığı için dar kapsamlı (daha özel) koşulların üst basamaklara, kapsayıcılığı yüksek olan koşulların ise alt basamaklara yazılması gerekir. Aksi takdirde bazı kod blokları hiçbir zaman çalışmayarak *ölü kod (dead code)* hâline gelebilir.

#kod-cikti(baslik: "Hatalı Sıralama (Ölü Kod Riski)", columns: (30em, auto))[
  ```python
  puan = 92
  if puan >= 50:
      print("Orta")   # 92 >= 50 True! Burada durur.
  elif puan >= 85:
      print("Pekiyi") # Bu satıra asla ulaşılamaz!
  ```
][
  ```text
  Orta
  ```
]

#kod-cikti(baslik: "Doğru Sıralama (Özelden Genele)", columns: (30em, auto))[
  ```python
  puan = 92
  if puan >= 85:
      print("Pekiyi") # Önce en dar aralık kontrol edilir.
  elif puan >= 50:
      print("Orta")
  ```
][
  ```text
  Pekiyi
  ```
]
