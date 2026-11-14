#import "/pageGeneralConfig.typ": *
#import "/lib/qr_code.typ": *
#import "/lib/kod-bloklari.typ": *

// #show: conf

== Python Dili
*Python*; yüksek seviyeli, yorumlanan, nesne yönelimli ve geniş bir kütüphane ekosistemine sahip bir programlama dilidir. 1991 yılında Guido van Rossum tarafından geliştirilen bu dil, adını van Rossum'un beğeniyle takip ettiği İngiliz komedi grubu Monty Python’ın Monty Python’s Flying Circus adlı televizyon programından almıştır.

Günümüzde bilgisayar donanımları, programlama dillerinin ilk ortaya çıktığı dönemlere kıyasla inanılmaz bir kapasiteye ulaşmıştır. Bu sayede Python gibi dillerin getirdiği çalışma zamanı maliyeti modern donanımlarla büyük ölçüde tolere edilmekte; çoğu uygulama için fazlasıyla yeterli ve pratik bir performans sunmaktadır.

"Notlarımızın bundan sonraki bölümlerinde vereceğimiz örnekler *Python programlama dili* için olacaktır."

#align(center)[
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
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
      #v(5em)
      *İki Sayının Toplamını Alan Kod Örneği*
      #v(2em)
*Python Dili*
#kod-blok[
    ```python
    sayi1 = int(input("Birinci sayı: "))
    sayi2 = int(input("İkinci sayı: "))

    toplam = sayi1 + sayi2
    print(f"Toplam: {toplam}")
    ```
]

    ]
  
  )
]
]

#grid(
  columns: (15em,auto),
  gutter: 5pt,
  align: horizon,
  [
    #align(center)[
      #image("/02_Files/images/python-logo.jpg", width: 80%)
    ]
  ],
  [
    *Sarı ve Mavi Yılanlar:* \
    Python ismi her ne kadar Monty Python grubundan gelse de resmi logo, Antik Yunan mitolojisindeki *"Ouroboros"* (kendini besleyen/tamamlayan döngü) esintileri taşıyan iki stilize yılandan oluşur. Sarı ve mavi renkler; dilin **esnekliğini**, farklı sistemlerle **kolay entegre olabilmesini** ve geliştirici dostu yapısını temsil eder.
  ]
)

#grid(
  columns: (1.4fr, 1fr),
  gutter: 12pt,
  [
    #block(
      fill: rgb("#f1f5f9"),
      inset: 8pt,
      radius: 4pt,
      stroke: 0.5pt + rgb("#cbd5e1"),
      width: 100%,
      height: auto
    )[
      *Neden Günümüzün En Popüler Dili?*
      
      - *Sözdizimi Sadeliği:* C ve Java gibi dillerdeki süslü parantez (`{}`) ve noktalı virgül (`;`) kalabalığı yerine girintilere (*indentation*) dayanır. Kod, neredeyse günlük İngilizce gibi okunur.
      - *Geniş Ekosistem:* Yapay zekâdan veri bilimine, web geliştirmeden siber güvenliğe kadar her alanda devasa kütüphane desteği sunar.
      - *Endüstri Standardı:* TIOBE ve GitHub Octoverse gibi küresel programlama dili endekslerinde son yıllarda sürekli **1. sırada** yer almaktadır.
    ]
  ],
  [
    #block(
      fill: rgb("#f1f5f9"),
      inset: 8pt,
      radius: 4pt,
      stroke: 0.5pt + rgb("#cbd5e1"),
      width: 100%,
      height: 15.8em,
    )[
      *Yaygın Kullanım Alanları:*
      
      - *Yapay Zekâ & Makine Öğrenmesi:* \ (TensorFlow, PyTorch, Scikit-learn)
      - *Veri Analizi & Görselleştirme:* \ (Pandas, NumPy, Matplotlib)
      - *Web Geliştirme (Backend):* \ (Django, FastAPI, Flask)
      - *Otomasyon & Scripting:* \ (Ağ yönetimi, veri kazıma, sistem görevleri)
      
    ]
  ]
)