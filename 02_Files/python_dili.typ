#import "/lib/template.typ": *
#import "/lib/qr_code.typ": *

#show: conf


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
      // #v(2em)
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
