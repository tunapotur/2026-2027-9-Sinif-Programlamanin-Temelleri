#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

#let cevap-karti(no, soru-metni, model-cevap, anahtar-kavramlar) = block(
  breakable: false,
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e1"),
  radius: 4pt,
  fill: rgb("#f8fafc"),
  inset: (x: 9pt, y: 8pt),
  below: 0.85em,
)[
  #text(weight: "bold", fill: rgb("#1e293b"))[*Soru #no:* #soru-metni]
  #v(0.35em)
  #line(length: 100%, stroke: 0.35pt + rgb("#cbd5e1"))
  #v(0.35em)
  #text(weight: "bold", fill: rgb("#0f766e"))[Örnek Model Cevap:] \
  #text(size: 8.9pt, fill: rgb("#1e293b"))[#model-cevap]
  #v(0.3em)
  #box(
    fill: rgb("#f1f5f9"),
    radius: 3pt,
    inset: (x: 6pt, y: 3.5pt),
    stroke: 0.35pt + rgb("#e2e8f0"),
  )[
    #text(size: 8pt, fill: rgb("#475569"))[*Değerlendirmede Aranacak Anahtar Kavramlar:* #anahtar-kavramlar]
  ]
]

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları: Cevap Anahtarı
Aşağıda bölüm değerlendirme sorularının (1–56) doğru yanıtları, gerekçeleri, model cevapları ve kavramsal çözüm açıklamaları yer almaktadır.

#v(0.3em)

=== A. Çoktan Seçmeli Sorular Cevap Anahtarı
#text(size: 8.8pt, fill: luma(100))[Her sorunun doğru seçeneği ve çözüm gerekçesi tabloda belirtilmiştir.]

#table(
  columns: (32pt, 40pt, 1fr),
  stroke: 0.4pt + gray,
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else if calc.even(y) { rgb("#f8fafc") } else { white },
  inset: (x: 5pt, y: 4.5pt),
  align: (center + horizon, center + horizon, left + horizon),
  [*No*], [*Doğru*], [*Çözüm Gerekçesi ve Açıklama*],
  [1], [*B*], [Elektrik akımını anahtarlayarak (geçirerek veya keserek) ikili mantıktaki $1$ ve $0$ durumlarını oluşturan temel yarı iletken yapı taşı *Transistördür*.],
  [2], [*C*], [Standart bilgisayar mimarisinde tam 8 bit bir araya gelerek 1 *Byte* ($2^8 = 256$ farklı kombinasyon) oluşturur.],
  [3], [*B*], [Hexadecimal tabanda $16 = 2^4$ olduğundan, her bir onaltılık basamak (0–F) ikilik tabanda tam *4 bit* (nibble) ile ifade edilir.],
  [4], [*C*], [Hexadecimal gösterim, uzun ikili bit dizilerini (ör. `11111111`) daha kısa, derli toplu ve okunabilir (*FF*) hale getirir.],
  [5], [*B*], [Bilgisayarlar harfleri doğrudan tanıyamaz. ASCII tablosu, her harf ve karaktere evrensel bir sayısal kod atar (ör. 'A' = 65).],
  [6], [*B*], [Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi hatırlanabilir sembolik kısaltmalar (*mnemonics*) kullanan dil *Assembly Dilidir*.],
  [7], [*B*], [Assembly dili, karmaşık ikili makine komutlarını akılda kalıcı sembolik isimlerle yazma imkânı sağlayarak programlamayı kolaylaştırır.],
  [8], [*B*], [Kaynak kodun tamamını bir kerede analiz edip hedef makine diline çeviren yazılımlara *Derleyici (Compiler)* adı verilir.],
  [9], [*B*], [Değişkenlerin temel varlık amacı; program çalışırken girdi, ara değer veya sonuç verilerini RAM'de adlandırılmış bir alanda saklamaktır.],
  [10], [*C*], [Değişkenler geçici ana bellek olan RAM'de tutulur. RAM uçucu (*volatile*) olduğundan elektrik kesildiğinde tüm değişken verileri silinir (kalıcı tutamaz).],
  [11], [*C*], [Yalnızca `True` (Doğru) veya `False` (Yanlış) mantıksal değerlerini tutan ve 1 bayt yer kaplayan tür *bool* (Boolean) türüdür.],
  [12], [*C*], [İşlemci (CPU), verileri sistem veri yolu (bus) üzerinden RAM'den çeker, işler ve nihai sonucu tekrar belleğe yazar.],
  [13], [*C*], [Python'da `input()` fonksiyonu kullanıcı klavyeden ne yazarsa yazsın (rakam girse dahi) daima metin katarı (*str*) türünde döndürür.],
  [14], [*C*], [`int(85.85)` tür dönüşümü ondalık kısmı kırpar (*truncation*) ve tam sayı olan *85* değerini üretir; yuvarlama yapmaz.],
  [15], [*C*], [Python değişken adlandırma kurallarına göre değişken isimleri rakamla başlayamaz (`1yazili` geçersizdir).],
  [16], [*D*], [`ogrenci_no` değişkeni harfle başlar, boşluk içermez, alt tire haricinde özel karakter barındırmaz ve anahtar kelime değildir.],
  [17], [*C*], [`sayi = 20` iken `sayi += 10` ile 30 olur; ardından `sayi -= 4` satırıyla son değer *26* olur.],
  [18], [*B*], [Tek eşittir (`=`) atama operatörüdür; iki değerin birbirine eşit olup olmadığını denetlemek için çift eşittir (*`==`*) operatörü kullanılır.],
  [19], [*A*], [`2 ** 6` ifadesi $2^6$ üs alma işlemidir ve sonucu $2 times 2 times 2 times 2 times 2 times 2 = 64$'tür.],
  [20], [*B*], [`sep="-"` parametresi argümanlar arasına tire eklediğinden ekran çıktısı *16-11-2026* olur.],
  [21], [*B*], [Python'da bir değişkenin veya değerin veri türünü öğrenmek için *`type()`* fonksiyonu kullanılır.],
  [22], [*A*], [7.5 değeri bir float'tır. `isinstance` fonksiyonu parametre olarak verilen tür demetinde `float` bulunduğu için *True* sonucunu verir.],
  [23], [*C*], [Python, veri kaybını engellemek için `int` ile `float` işleme girdiğinde tam sayıyı otomatik olarak ondalıklı sayıya dönüştürür; sonuç *float* olur.],
  [24], [*C*], [Python'da tek satırlık açıklama (yorum) satırları diyez (*`#`*) karakteriyle başlatılır.],
  [25], [*E*], [`+`, `-`, `*`, `/` aritmetik işlem operatörüdür; *`>=`* (büyük veya eşit) ise mantıksal bir karşılaştırma (ilişkisel) operatörüdür.],
  [26], [*B*], [f-string (`f"..."`), süslü parantezler `{}` yardımıyla metin içine doğrudan değişken değerlerini ve ifadeleri yerleştirmeyi sağlar.],
)

#v(0.5em)

=== B. Boşluk Doldurma Soruları Cevap Anahtarı
#text(size: 8.8pt, fill: luma(100))[Sorulardaki boşluklara gelmesi gereken kesin terimler aşağıda listelenmiştir.]

#table(
  columns: (32pt, 120pt, 1fr),
  stroke: 0.4pt + gray,
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else if calc.even(y) { rgb("#f8fafc") } else { white },
  inset: (x: 5pt, y: 4.5pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*No*], [*Doğru Terim*], [*Açıklama*],
  [27], [*Bit*], [İkilik sayı sisteminde $0$ veya $1$ değerini alabilen en temel mantıksal veri birimi.],
  [28], [*Byte (Bayt)*], [8 bitin birleşmesiyle oluşan ve 1 karakter saklamaya yeten veri birimi.],
  [29], [*Hexadecimal (Onaltılık)*], [0–9 rakamları ile A–F harflerini kullanan 16 tabanlı sayı sistemi.],
  [30], [*ASCII*], [Karakter ve sembolleri standart sayısal kodlarla eşleştiren kodlama tablosu.],
  [31], [*Assembly*], [Makine komutlarını sembolik kısaltmalarla ifade eden alt seviyeli programlama dili.],
  [32], [*RAM (Ana Bellek)*], [Çalışmakta olan program ve verilerin geçici olarak tutulduğu birincil bellek.],
  [33], [*float*], [Python'da virgüllü / kesirli ondalık sayıları temsil eden veri türü.],
  [34], [*bool (Boolean)*], [Yalnızca `True` veya `False` değerlerini alabilen mantıksal veri türü.],
  [35], [*`input()`*], [Kullanıcının klavyeden metin girişi yapmasını sağlayan standart fonksiyon.],
  [36], [*`int()`*], [Metin veya ondalıklı sayıları tam sayı veri türüne dönüştüren fonksiyon.],
  [37], [*`print()`*], [Ekrana veya konsola çıktı yazdırmak için kullanılan temel Python fonksiyonu.],
)

#v(0.5em)

=== C. Eşleştirme Sorusu Cevap Anahtarı

#table(
  columns: (80pt, 45pt, 1fr),
  stroke: 0.4pt + gray,
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { white },
  inset: (x: 6pt, y: 5pt),
  align: (left + horizon, center + horizon, left + horizon),
  [*Kavram*], [*Eşleşme*], [*Doğru Açıklama / Görev*],
  [1. RAM], [*B*], [Program ve verilerin çalışma sırasında geçici tutulduğu birincil bellek],
  [2. CPU], [*C*], [Komutları yorumlayıp çalıştıran merkezi işlem birimi],
  [3. Veri Yolu (Bus)], [*E*], [Donanım bileşenleri arasında veri taşınmasını sağlayan iletim hattı],
  [4. ASCII], [*D*], [Karakter ve sembollere standart sayısal kodlar atayan tablo],
  [5. Assembly], [*A*], [Makine komutlarını sembolik kısaltmalarla ifade eden programlama dili],
)
#v(0.2em)
*Eşleştirme Sonucu:* *1* – *B* #h(1.5em) *2* – *C* #h(1.5em) *3* – *E* #h(1.5em) *4* – *D* #h(1.5em) *5* – *A*

#v(0.5em)

=== D. Doğru – Yanlış Soruları Cevap Anahtarı

#table(
  columns: (32pt, 40pt, 1fr),
  stroke: 0.4pt + gray,
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else if calc.even(y) { rgb("#f8fafc") } else { white },
  inset: (x: 5pt, y: 4.5pt),
  align: (center + horizon, center + horizon, left + horizon),
  [*No*], [*Cevap*], [*Açıklama ve Düzeltme*],
  [39], [*Y (Yanlış)*], [Bilgisayardaki en küçük veri birimi Byte değil, *bittir* (1 Byte = 8 bit).],
  [40], [*D (Doğru)*], [8 bit bir araya gelerek 1 Byte'lık veri büyüklüğünü meydana getirir.],
  [41], [*D (Doğru)*], [Hexadecimal sistemde 0–9 rakamları ile A–F arasındaki 6 harf (toplam 16 sembol) kullanılır.],
  [42], [*Y (Yanlış)*], [RAM uçucu (*volatile*) bellektir; bilgisayar kapandığında içerisindeki veriler tamamen silinir.],
  [43], [*D (Doğru)*], [İşlemci, RAM üzerindeki bellek adreslerine veri ve adres yolları üzerinden doğrudan erişir.],
  [44], [*Y (Yanlış)*], [`input()` fonksiyonu kullanıcı ne girerse girsin daima metin (*str*) türünde döndürür.],
  [45], [*D (Doğru)*], [`=` operatörü değişken ataması yaparken, `==` operatörü eşitlik karşılaştırması yapar.],
  [46], [*D (Doğru)*], [`bool` türü yalnızca `True` ve `False` olmak üzere iki mantıksal değer alır.],
  [47], [*Y (Yanlış)*], [`float` türü kesirli/ondalıklı sayıları saklar; tam sayılar için `int` kullanılır.],
  [48], [*D (Doğru)*], [Python dinamik türlemeli (*dynamically typed*) bir dildir; bir değişkene farklı satırlarda farklı türde değerler atanabilir.],
  [49], [*D (Doğru)*], [`type()` fonksiyonu parametre olarak verilen nesnenin veya değişkenin veri türünü döndürür.],
)

#v(0.5em)

=== E. Açık Uçlu ve Klasik Sorular Model Cevapları
#text(size: 8.8pt, fill: luma(100))[Aşağıda her soru için tam puan almayı sağlayacak model cevaplar ve değerlendirme ölçütleri verilmiştir.]

#cevap-karti(
  50,
  [Programlamada değişken nedir? Bir değişkene yeni bir değer atandığında bellekteki (RAM) değer ve adres açısından ne değişir?],
  [
    *Değişken Nedir:* Değişken, program çalışırken üretilen veya kullanıcıdan alınan verileri RAM'de (geçici bellekte) saklamak amacıyla ayrılan, programcının kolayca erişebilmesi için adlandırılmış bir bellek bölgesidir. \
    *Bellekteki Değişim (Değer ve Adres):* \
    - Değişken adı, bellekteki fiziksel adrese (ör. `0x7ffee...`) verilen sembolik bir etikettir. \
    - Statik dillerde aynı bellek adresindeki eski veri silinip üzerine yeni değer yazılır (adres sabit kalır, değer güncellenir). \
    - Python gibi dinamik dillerde ise sayılar değiştirilemez (*immutable*) nesneler olduğundan yeni değer için bellekte yeni bir nesne oluşturulur ve değişkenin referansı bu yeni bellek adresine yönlendirilir. Eski sahipsiz nesne ise Çöp Toplayıcı (*Garbage Collector*) tarafından temizlenir.
  ],
  [RAM'de adlandırılmış geçici alan, fiziksel adres etiketi, eski değerin üzerine yazılması / yeni referansa bağlanması, Garbage Collector.],
)

#cevap-karti(
  51,
  [`int` ve `float` veri türlerini karşılaştırınız. Tüm sayısal verileri `float` olarak saklamak bellek ve işlemci açısından neden uygun değildir?],
  [
    *Karşılaştırma:* `int` veri türü kesir içermeyen tam sayıları (ör. 5, -12, 0), `float` veri türü ise kesirli/ondalıklı sayıları (ör. 3.14, -0.5) temsil eder. \
    *Neden Tüm Sayılar Float Olamaz:* \
    1. *Bellek Maliyeti:* `float` sayılar IEEE 754 standardına göre mantis ve üs bileşenleriyle saklandığından genellikle tam sayılara göre daha fazla bellek alanı gerektirir. \
    2. *İşlemci Yükü:* İşlemcide tam sayı aritmetiği (ALU) tek saat çevriminde doğrudan donanım seviyesinde yapılırken; ondalıklı işlemler özel FPU (*Floating Point Unit*) birimi gerektirir ve daha yavaş çalışır. \
    3. *Hassasiyet Kaybı:* İkilik tabanda bazı ondalıklı kesirler tam temsil edilemez (ör. `0.1 + 0.2` sonucunun `0.30000000000000004` çıkması). Döngü sayaçlarında ve indekslerde `float` kullanmak yuvarlama hatalarına ve sonsuz döngülere yol açabilir.
  ],
  [Tam sayı vs ondalıklı sayı farkı, IEEE 754 mantis/üs gösterimi, ALU vs FPU işlemci yükü, kayan nokta yuvarlama / hassasiyet hatası.],
)

#cevap-karti(
  52,
  [Python'da `input()` fonksiyonuyla alınan bir verinin doğrudan matematiksel işlemde kullanılamama nedenini açıklayınız. `int()` ve `float()` fonksiyonlarının bu süreçteki rolü nedir?],
  [
    *Kullanılamama Nedeni:* `input()` fonksiyonu kullanıcı klavyeden ne yazarsa yazsın (örneğin `25` veya `3.14`) bunu daima metin katarı (*str*) türünde döndürür. Metinler üzerinde toplama (`+`) operatörü matematiksel toplama yapmak yerine metin birleştirme (*concatenation*) yapar (`"10" + "20" = "1020"`). Çıkarma (`-`), çarpma (`*`) veya bölme (`/`) yapılmak istendiğinde ise Python `TypeError` hatası verir. \
    *`int()` ve `float()` Rolü:* Bu fonksiyonlar açık tür dönüşümü (*explicit type casting*) yapar. Metin halindeki karakter dizilimini ikilik sayı sistemine çevirerek CPU'nun aritmetik yapabileceği `int` (tam sayı) veya `float` (ondalıklı sayı) türüne dönüştürür. Böylece matematiksel hesaplamalar doğru biçimde icra edilir.
  ],
  [`input()` fonksiyonunun daima `str` dönmesi, `+` ile metin birleştirme riski, `TypeError` hatası, açık tür dönüşümü (type casting).],
)

#cevap-karti(
  53,
  [Python'da `=` ile `==` operatörlerinin görevlerini karşılaştırınız. Her iki operatörün kullanım amacını birer örnekle açıklayınız.],
  [
    *`=` (Atama Operatörü):* Sağındaki ifadenin değerini hesaplar ve solundaki değişkene aktarır (değişkenin bellekteki değerini günceller). Bir komut / eylemdir. \
    - *Örnek:* `puan = 85` (puan değişkenine 85 sayısı atanır). \
    *`==` (Eşitlik Karşılaştırma Operatörü):* Sağındaki ve solundaki iki değerin birbirine eşit olup olmadığını denetler. Değişkenlerin değerini asla değiştirmez; denetim sonucuna göre mantıksal `True` veya `False` üretir. \
    - *Örnek:* `puan == 100` (Eğer puan 100 ise `True`, değilse `False` üretir; `if puan == 100:` gibi karar yapılarında kullanılır).
  ],
  [`=` atama (değer yazma/bağlama), `==` karşılaştırma (True/False üretme), örnek kullanım ve değişken değerinin değişip değişmemesi.],
)

#cevap-karti(
  54,
  [Fonksiyon kullanmanın kod tekrarını azaltmaya ve program bakımına katkısını açıklayınız. Yazılımda *DRY (Don't Repeat Yourself)* ilkesi ne anlama gelir?],
  [
    *Fonksiyonların Katkısı:* Belirli bir amaca hizmet eden kod blokları fonksiyon çatısı altında toplandığında, aynı işlem gerektiğinde kodları defalarca baştan yazmak yerine sadece fonksiyon adı (`hesapla()`) çağrılır. Kod kısalır ve modülerleşir. Kodda bir değişiklik veya hata düzeltmesi gerektiğinde, projenin onlarca farklı satırını arayıp düzeltmek yerine yalnızca fonksiyonun gövdesini değiştirmek yeterli olur (kolay bakım). \
    *DRY (Don't Repeat Yourself) İlkesi:* "Kendini Tekrar Etme" anlamına gelen temel yazılım prensibidir. Sistemdeki her mantıksal kuralın ve bilginin kod tabanında tek, belirgin ve yetkili bir temsile sahip olması gerektiğini savunur. Kopyala-yapıştır yöntemini önleyerek hata payını azaltır ve yazılım kalitesini artırır.
  ],
  [Kod tekrarını önleme, tek noktadan bakım ve güncelleme kolaylığı, modülerlik, DRY ilkesinin tanımı ve tek yetkili temsil ilkesi.],
)

#cevap-karti(
  55,
  [`char rakam = '5';` ifadesi ile `int sayi = 5;` ifadesi arasındaki farkı; bellek kullanımı ve matematiksel işlemlere girebilme açısından karşılaştırınız.],
  [
    *Bellek Temsili:* \
    - `'5'` karakteri (`char`), bellekte karakterin ASCII/Unicode tablosundaki sayısal karşılığı olan *53* (ikilik: `00110101`) olarak saklanır ve bellekte genellikle 1 bayt yer kaplar. \
    - `5` tam sayısı (`int`), doğrudan 5 niceliğini ifade eder; bellekte ikilik olarak `00000101` biçiminde ve genellikle 4 bayt (Python'da dinamik) yer tutar. \
    *Matematiksel İşlemler:* \
    - `sayi + 2` işlemi doğrudan sayısal toplama yapar ve *7* sonucunu üretir. \
    - `rakam + 2` ifadesi ise bir semboldür; C gibi dillerde ASCII değeri üzerinden (`53 + 2 = 55`, yani `'7'` karakteri) işlem görürken, Python gibi dillerde tür uyuşmazlığı hatası (*TypeError*) verir. Rakam bir simge/yazıdır, sayı ise bir büyüklük/niceliktir.
  ],
  [Bellek boyutu (1 bayt vs 4 bayt), ASCII sayısal karşılığı (53) vs ikili nicelik (5), sembol/metin vs büyüklük ayrımı, aritmetik işlem davranışı.],
)

#cevap-karti(
  56,
  [Python'da yazılan `yas = int(input("Yaşınız: "))` satırı çalıştırıldığında işletim sürecinin *içten dışa* nasıl gerçekleştiğini iki adımda açıklayınız.],
  [
    *1. Adım (İç Katman - Girdi Alma):* İlk olarak parantezin en içindeki `input("Yaşınız: ")` fonksiyonu işletilir. Ekrana `"Yaşınız: "` metni basılır ve program kullanıcının klavyeden giriş yapmasını bekler. Kullanıcı örneğin `15` yazıp Enter'a bastığında, fonksiyon girilen değeri metin katarı (*str*) olarak (`"15"`) döndürür. \
    *2. Adım (Dış Katman - Tür Dönüşümü ve Değişkene Atama):* `input`tan dönen `"15"` metni, dıştaki `int(...)` fonksiyonuna parametre olarak geçer. `int("15")` ifadesi metni tam sayı formatındaki `15` değerine dönüştürür. Son olarak atama operatörü (`=`), elde edilen bu sayısal değeri RAM'de `yas` değişkenine bağlar.
  ],
  [1. adımda `input()` fonksiyonunun çalışıp `str` üretmesi, 2. adımda `int()` ile tip dönüşümü yapılıp `=` ile değişkene atanması (içten dışa hiyerarşi).],
)
