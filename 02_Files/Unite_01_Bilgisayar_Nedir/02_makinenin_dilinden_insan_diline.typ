#import "../../pageGeneralConfig.typ": *
#import "../../lib/qr_code.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/yardimcilar.typ" : *
// #import "../../lib/icerik-tablo.typ": *

=== Makinenin Dilinden İnsanın Diline: "Hello world!"
#iki_hucreli_satir(
  columns: (3fr,1fr),
  gutter: 10pt,
[Programlamada ilk adım geleneksel olarak ekrana *"Hello, World!"* yazdırmaktır. Aşağıda, bu çıktıyı üreten aynı programın beş farklı düzeydeki gösterimi yer almaktadır. Yukarıdan aşağıya doğru kod, insan için giderek daha okunabilir ve anlaşılır hâle gelir. Yazılımcılar yeni bir programlama dilini bilgisayarlarına kurduklarında ilk iş olarak ekrana mutlaka "Hello World" yazdırırlar.]
,[#output-box[Hello world!]] 
)

#link-box(
  url: "https://helloworld.directory",
  title: "Hello World Sözlüğü",
  desc: [Bu web sitesinde birçok programlama diline ait ekrana *`Hello World`* yazdıran kod örnekleri yer almaktadır.]
)

==== Makine Dili (0 ve 1'lerle)
Makine dili, işlemcinin doğrudan çalıştırabildiği tek dildir. Bir *bayt* 8 bitten oluşur; aşağıdaki her grup 8 bitlik bir bayttır. Satır sonundaki açıklamalar insan içindir, makine bu açıklamaları görmez.

#not_block()[
  Daha anlaşılır olması için burada ki örnekte kullanılan makine dili, 16 bitlik DOS ortamında çalışan bir COM programına aittir. Günümüz 64 bit işlemcilerinde komutlar ve adresler çok daha uzundur.
]

#kod-blok(width: 100%)[
  ```text
  ; 16 bit DOS COM programı (x86)
  ; Sütunlar: makine kodu baytları  |  karşılığı olan işlem

  10110100 00001001                  ; AH = 09h: metin yazdırma servisi
  10111010 00001100 00000001         ; DX = 010Ch: metnin bellek adresi
  11001101 00100001                  ; INT 21h: DOS servisini çağır
  10111000 00000000 01001100         ; AX = 4C00h: programdan çık
  11001101 00100001                  ; INT 21h: DOS servisini çağır

  ; "Hello world!$" metni (ASCII kodları)
  01001000 01100101 01101100 01101100 01101111 00100000
  01110111 01101111 01110010 01101100 01100100 00100001 00100100
  ```
]

==== Makine Dili (Hexadecimal Sayılarla)

Aynı makine kodu, ikilik sistemdeki her 8 bitlik baytın iki hexadecimal (onaltılık) basamakla gösterilmesiyle de yazılabilir. Hexadecimal gösterim, 0 ve 1'lerden oluşan uzun dizileri kısaltır ve okumayı kolaylaştırır.

Metnin sonundaki `$` karakteri (ASCII 24h), DOS'a metnin bittiğini bildiren özel bir işarettir.

#kod-blok(width: 100%)[
  ```text
  ; 16 bit DOS COM programı (x86) - aynı programın hexadecimal hâli
  B4 09                 ; AH = 09h: metin yazdırma servisi
  BA 0C 01              ; DX = 010Ch: metnin bellek adresi
  CD 21                 ; INT 21h: DOS servisini çağır
  B8 00 4C              ; AX = 4C00h: programdan çık
  CD 21                 ; INT 21h

  ; "Hello world!$" metni (ASCII kodları)
  48 65 6C 6C 6F 20 77 6F 72 6C 64 21 24
  ```
]


==== Assembly Dili

Assembly dili, makine kodundaki her komuta bir *anımsatıcı* (mnemonic) ad verir. Böylece `B4 09` gibi anlaşılmaz baytlar yerine `mov ah, 09h` gibi okunabilir komutlar yazılır.

#kod-blok(width: 100%)[
  ```text
  ; NASM sözdizimi - 16 bit DOS COM programı
  org 100h

  mov ah, 09h          ; metin yazdırma servisi
  mov dx, mesaj        ; metnin bellek adresi
  int 21h              ; DOS servisini çağır

  mov ax, 4C00h        ; programdan çık
  int 21h


  mesaj db "Hello world!$"
  ```
]

==== C Dili
*C* dili, Assembly diline göre kodlama yapan kişilere çok büyük kullanım kolaylığı getirmiştir. *C* dilinde yazılan kod bir derleyici tarafından makine koduna çevrilir ve bilgisayar bu makine kodunu doğrudan çalıştırır.

#kod-blok(width: 100%)[
  ```c
  #include <stdio.h>
  int main(void) {
      printf("Hello world!\n");
      return 0;
  }
  ```
]


==== Python Dili

Python gibi yüksek seviyeli dillerde aynı iş, tek bir komutla yapılır. Python yorumlayıcısı bu satırı önce kendi anladığı ara biçime, ardından makine diline çevirir.

#kod-blok(width: 100%)[
  ```python
  print("Hello world!")
  ```
]

