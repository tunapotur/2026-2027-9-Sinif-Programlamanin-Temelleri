#import "/lib/template.typ": *
#import "/lib/qr_code.typ": *

#show: conf

== Değişkenler ve Bellek(RAM)
Değişken; programın çalışması sırasında verilerin bellekte (RAM) geçici olarak tutulduğu alanlara verilen isimdir. Kullanıcıdan veya harici bir kaynaktan alınan bilgiler bu değişkenlerde saklanır; kod çalıştıkça hesaplamalarda kullanılır ve süreç içinde yeni değerler alabilir. \
Değişkenler yardımıyla bellekte (RAM) saklanan verilere kolayca erişilir; kod çalıştırıldığında bu değişken isimleri çağrılarak temsil ettikleri veriler üzerinde işlemler gerçekleştirilir.

#v(1em)

#kod-cikti(baslik: [Örnek Python Kodu])[
```Python
puan = int(input("Puan Giriniz: "))
print("Puanı:", puan)
puan = puan + 25
print("Güncellenmiş Puan:", puan)
```
][
```
Puan Giriniz: 50
Puanı: 50
Güncellenmiş Puan: 75
```
]

#v(1em)

#grid(
  columns: (auto,auto),
  gutter: 10pt,
  align: (bottom),
  image("/02_Files/images/01-Deger-Atama.png"),
  image("/02_Files/images/02-Hafizadan-Cagirma.png"),
)

#v(1em)

#grid(
  columns: (auto,auto),
  gutter: 10pt,
  align: (bottom),
  image("/02_Files/images/03-Deger-Guncelleme.png"),
  image("/02_Files/images/04-Guncel-Hali-Cagirma.png"),
)

#v(1em)

#not_block(title:"Kısacası:")[Değişkenler, değerleri geçici olarak RAM'de tutan etiketlerdir. Program çalıştığı sürece bu değerler kullanılabilir ve güncellenebilir.]
