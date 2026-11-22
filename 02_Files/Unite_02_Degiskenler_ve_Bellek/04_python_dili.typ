#import "../../pageGeneralConfig.typ": *
#import "../../lib/qr_code.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/not-block.typ": *

// #show: conf

=== Python Dili
*Python*; yüksek seviyeli, yorumlanan, nesne yönelimli ve geniş bir kütüphane ekosistemine sahip bir programlama dilidir. 1991 yılında Guido van Rossum tarafından geliştirilen bu dil, adını van Rossum'un beğeniyle takip ettiği İngiliz komedi grubu Monty Python’ın Monty Python’s Flying Circus adlı televizyon programından almıştır.

Günümüzde bilgisayar donanımları, programlama dillerinin ilk ortaya çıktığı dönemlere kıyasla inanılmaz bir kapasiteye ulaşmıştır. Bu sayede Python gibi dillerin getirdiği çalışma zamanı maliyeti modern donanımlarla büyük ölçüde tolere edilmekte; çoğu uygulama için fazlasıyla yeterli ve pratik bir performans sunmaktadır.

"Notlarımızın bundan sonraki bölümlerinde vereceğimiz örnekler *Python programlama dili* için olacaktır."

#align(center)[
#block(breakable: false)[
  *İki Sayının Toplamını Alan Kod Örneği*
  #grid(
    columns: (1fr, 1fr),
    gutter: 5pt,
     align: (top),
    [
      *C Dili*
      #kod-blok[
          ```c
          #include <stdio.h>

          int main() {
              int sayi1, sayi2, toplam;

              printf("Birinci sayi: ");
              scanf("%d", &sayi1);

              printf("Ikinci sayi: ");
              scanf("%d", &sayi2);

              toplam = sayi1 + sayi2;
              printf("Toplam: %d\n", toplam);

              return 0;
          }
          ```
      ]
    ],
    [
*Python Dili*
#kod-blok[
    ```python
    sayi1 = int(input("Birinci sayı: "))
    sayi2 = int(input("İkinci sayı: "))

    toplam = sayi1 + sayi2
    print(f"Toplam: {toplam}")
    ```
]
#align(center)[
  #v(1em)
      #image("/02_Files/Unite_02_Degiskenler_ve_Bellek/images/python-logo.jpg", width: 40%) 
  ]

    ]
  
  )
]
]


==== Sarı ve Mavi Yılanlar
Python resmi logosu, Antik Yunan mitolojisindeki kendini besleyen yılandan oluşur. Sarı ve mavi renkler; dilin *esnekliğini*, farklı sistemlerle *kolay entegre olabilmesini* ve geliştirici dostu yapısını temsil eder.

==== Neden Günümüzün En Popüler Dili?
- *Sözdizimi Sadeliği:* C ve Java gibi dillerdeki süslü parantez (`{}`) ve noktalı virgül (`;`) kalabalığı yerine girintilere (*indentation*) dayanır. Kod, neredeyse günlük İngilizce gibi okunur.
- *Geniş Ekosistem:* Yapay zekâdan veri bilimine, web geliştirmeden siber güvenliğe kadar her alanda devasa kütüphane desteği sunar.
- *Endüstri Standardı:* TIOBE ve GitHub Octoverse gibi küresel programlama dili endekslerinde son yıllarda sürekli *1. sırada* yer almaktadır.


==== Yaygın Kullanım Alanları
#grid(
  columns: (auto, auto),
  gutter: 25pt,
  align: top + left,
  [
    - *Yapay Zekâ & Makine Öğrenmesi:* (TensorFlow, PyTorch, Scikit-learn)
    - *Veri Analizi & Görselleştirme:* (Pandas, NumPy, Matplotlib)
  ],
  [
    - *Web Geliştirme (Backend):* (Django, FastAPI, Flask)
    - *Otomasyon & Scripting:* (Ağ yönetimi, veri kazıma, sistem görevleri)
  ]
)


==== Python Açıklama Satırı (Comment line)
Yazılım projelerinde, derleyicinin görmezden geldiği ancak yazılımcıların kendileri için veya diğer yazılımcılar için bıraktığı notlara açıklama satarı (comment line) denir. Python'da iki tür açıklama satırı uygulaması vardır.
- *\#* ile başlayan tek satırlık açıklama satırı
- *\"\"\"...\"\"\"* Çok satırlı açıklama satırları üç adet tırnak ile açılan ve yine üç adet tırnak ile kapanan alan içine yazılan açıklama ifadeleri ile yapılır.

#let sutun1Genislik = 26em

#block(breakable: false)[
  #grid(
  columns: (sutun1Genislik,auto),
  gutter: 10pt,
    align: top,
    [
      #align(center)[*Açıklamasız*]
      #v(1.5em)
      #kod-blok(width: 100%)[
        ```Python
a = 50
b = 20
c = a * b / 100
print(c)
```
      ]
    ],
    [
      #align(center)[*Açıklamalı*]
      #kod-blok(width: 100%)[
        ```Python
# Ürünün fiyatı
a = 50
# İndirim oranı (%)
b = 20
# İndirim miktarı
c = a * b / 100
print(c)
```
      ]
    ]
  )
]

*Açıklama Satırının Kullanım Amaçları*
#grid(
  columns: (sutun1Genislik,auto),
  gutter: 10pt,
  align: top,
  [
#kod-blok(width: 100%)[
  ```Python
# 1) Kodu açıklamak için
yas = 17  # öğrencinin yaşı

# 2) Kodu geçici olarak devre dışı bırakmak için
print("Merhaba")
# print("Bu satır çalışmaz")

# 3) Yapılacakları not etmek için
# TODO: Kullanıcıdan yaş bilgisi alınacak
```
      ]
  ],
  [
#kod-blok(width: 100%)[
        ```Python
# Bu tam satırlık açıklama
x = 10  # satır içi (inline) açıklama
```]

#kod-blok(width: 100%)[
  ```Python
# Bu fonksiyon iki sayıyı toplar,
# ve geriye döndürür.
def topla(a, b):
    return a + b
# fonksiyon sonlandırıldı
```
]
  ]
  )

*Çok Satırlı Açıklama ile Program Başlığı*
#grid(
  columns: (sutun1Genislik+6em,auto),
  gutter: 15pt,
  align: horizon,
  [
#kod-blok(width: 100%)[
  ```Python
"""
Program : Daire Alanı Hesaplama
Ders    : Programlamanın Temelleri (9. Sınıf)
Yazar   : Ahmet Tuna POTUR
Sürüm   : 1.0
Açıklama: Sabit olarak tanımlanan pi sayısı ve yarıçap (r) 
değerini kullanarak dairenin alanını (π * r²) hesaplar
ve ekrana yazdırır. Girdiler: pi (float), r (int).
Çıktı   : alan (float) - Hesaplanan daire alanı
"""
pi = 3.14        # pi sayısı (yaklaşık değer)
r = 5            # yarıçap
alan = pi * r * r
print(alan)      # Ekrana 78.5 yazar
```]
  ],
  [
    #not_block(title: "Dikkat: ")[
  Açıklama satırları programın çalışmasını etkilemez, ancak kodun okunabilirliğini artırır.\ Gereksiz ve her satır için tekrarlanan açıklamalardan kaçınılmalı; kodun *ne yaptığından çok neden yaptığı* anlatılmalıdır.  
]
  ]
)

