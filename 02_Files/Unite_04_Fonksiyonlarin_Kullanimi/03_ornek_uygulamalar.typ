#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== Örnek Uygulamalar

#kod-cikti(
  baslik: "Daire alanı hesaplama",
  columns: (32em, auto),
  align: bottom,
  [
    ```python
    pi = 3.14159
    r = float(input("Yarıçap (cm): "))
    alan = pi * r * r
    print(f"r={r}cm olan dairenin alanı {alan:.2f}cm²'dir.")
    ```
  ],
  [
    ```text
    Yarıçap (cm): 5 \
    r=5.0 cm olan dairenin alanı 78.54 cm²\'dir.
    ```
  ],
)

#kod-cikti(
  baslik: "Not ortalaması",baslik-yeri: "sag",
  columns: (32em, auto),
  align: bottom,
  [
    ```python
    ad = input("Öğrenci adı: ")
    vize = float(input("Vize notu: "))
    final = float(input("Final notu: "))

    ortalama = vize * 0.4 + final * 0.6

    print(f"Öğrenci : {ad}")
    print(f"Ortalama: {ortalama:.1f}")
    print(f"Geçti mi: {ortalama >= 50}")
    ```
  ],
  [
    ```
    Öğrenci adı: Ayşe
    Vize notu: 70
    Final notu: 90
    Öğrenci : Ayşe
    Ortalama: 82.0
    Geçti mi: True
    ```
  ],
)

#kod-cikti(
  baslik: "Saniyeyi saat-dakika-saniyeye çevirme",baslik-yeri: "sag",
  columns: (32em, auto),
  align: bottom,
  [
    ```python
    toplam = int(input("Saniye giriniz: "))
    saat = toplam // 3600
    kalan = toplam % 3600
    dakika = kalan // 60
    saniye = kalan % 60
    print(f"{saat:02d}:{dakika:02d}:{saniye:02d}")
    ```
  ],
  [
    ```
    Saniye giriniz: 3725
    01:02:05
    ```
  ],
)

#kod-cikti(
  baslik: "Market fişi",
  baslik-yeri: "sag",
  columns: (32em, auto),
  align: bottom,
  [
    ```python
    urun = input("Ürün adı: ")
    fiyat = float(input("Birim fiyat: "))
    adet = int(input("Adet: "))

    toplam = fiyat * adet

    print("-" * 24)
    print(f"{urun:<12}{adet:>3} x {fiyat:>6.2f}")
    print(f"{'TOPLAM':<12}{toplam:>11.2f} TL")
    print("-" * 24)
    ```
  ],
  [
    ```text
    Ürün adı: Defter
    Birim fiyat: 24.5
    Adet: 4
    ------------------------
    Defter        4 x  24.50
    TOPLAM            98.00 TL
    ------------------------
    ```
  ],
)

#not_block(title: "Özet: ")[
  - Fonksiyon, bir işi yapan isimli kod parçasıdır; `fonksiyon(argümanlar)` biçiminde çağrılır ve gerekirse bir dönüş değeri verir.
  - `input()` klavyeden veri alır ve *her zaman metin* döndürür. Sayı gerekiyorsa `int()` veya `float()` ile dönüştürülür.
  - `print()` değerleri ekrana yazar. Virgül araya boşluk koyar; *f-string* ise değişkenleri metnin içine `{ }` ile yerleştirir.
]
