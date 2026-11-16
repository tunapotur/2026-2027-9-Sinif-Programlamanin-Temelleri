#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *

== Temel Programlama Yapıları Bölüm Değerlendirme Soruları: Cevap Anahtarı
Aşağıda 2. Bölüm Değerlendirme Soruları'nın (çoktan seçmeli, boşluk doldurma ve kısa cevaplı) ayrıntılı cevap anahtarı ve gerekçeleri yer almaktadır.

=== A. Çoktan Seçmeli Soruların Cevapları

#icerik-tablo(
  tablo_baslik: "Çoktan Seçmeli Sorular Cevap ve Gerekçe Tablosu",
  sutunlar: (1.2cm, 1.4cm, 4.5cm, 1fr),
  sutun_basliklari: ("Soru", "Doğru", "Konu", "Açıklama / Çözüm Gerekçesi"),
  boyut: 8.5pt,
  baslik-boyut: 8.5pt,
  dikey-bosluk: 6pt,
  bolunebilir: true,
  [1], [*B*], [Transistör ve İkili Sistem], [Elektrik akımını geçirerek 1, keserek 0 durumunu oluşturan en temel donanım birimi transistördür.],
  [2], [*B*], [Hexadecimal Sayı Sistemi], [$2^4 = 16$ olduğundan her hexadecimal basamak tam olarak 4 bitlik ikilik (binary) sayıya karşılık gelir.],
  [3], [*B*], [ASCII Karakter Tablosu], [0-31 arasındaki karakterler ve 127 (`DEL`), yazıcı/cihaz iletişimini ve imleci yöneten *Kontrol Karakterleri* olarak adlandırılır.],
  [4], [*C*], [Veri Büyüklükleri], [Üreticiler onluk sistemde $1 "KB" = 1000 "Byte"$, işletim sistemleri ise ikilik sistemde $1 "KB" = 1024 "Byte"$ hesaplar.],
  [5], [*B*], [Assembly Dili], [Sayısal makine kodları yerine `MOV`, `ADD`, `SUB` gibi sembolik kısaltmaları (*mnemonics*) Assembly dili kullanır.],
  [6], [*B*], [Derleyici (Compiler)], [Kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılım derleyicidir.],
  [7], [*C*], [Değişkenler ve Bellek], [Değişkenler verileri RAM'de *geçici* tutar; bilgisayar kapandığında veya elektrik kesildiğinde RAM içeriği silinir.],
  [8], [*C*], [Boolean Veri Türü], [`bool` türü yalnızca `True` (1) ya da `False` (0) saklar ve RAM'de 1 bayt yer kaplar.],
  [9], [*C*], [Python Söz Dizimi], [Python'da blok yapıları süslü parantez yerine *girintiler (indentation)* ile belirlenir.],
  [10], [*C*], [input() Fonksiyonu], [`input()` fonksiyonu klavyeden girilen verileri her zaman metin (`str`) türünde döndürür.],
  [11], [*C*], [Bilinçli Tür Dönüşümü], [`int()` fonksiyonu ondalıklı sayının virgülden sonraki kısmını doğrudan atar; `85.85` değerini `85` yapar (yuvarlama yapmaz).],
  [12], [*C*], [Değişken Kuralları], [Python'da değişken adları rakamla başlayamaz; `1yazili` kurala aykırıdır (`yazili1` olmalıdır).],
  [13], [*B*], [Bileşik Atama Operatörleri], [`sayi = 20` iken `sayi += 10` ile 30 olur; `sayi //= 4` tam bölme işlemiyle `30 // 4 = 7` sonucunu verir.],
  [14], [*B*], [İşlem Önceliği (Üs Alma)], [Python'da üs alma (`**`) sağdan sola çalışır: `2 ** (3 ** 2)` $-->$ `2 ** 9 = 512` ($2^(3^2) = 2^9 = 512$).],
  [15], [*B*], [print() sep Parametresi], [`sep="-"` parametresi virgülle ayrılan değerlerin arasına tire yerleştirir: `2026-11-16`.],
  [16], [*A*], [Tür Kontrolü (isinstance)], [7.5 değeri `float` türündedir ve `(int, float)` demetindeki tiplerden birine uyduğu için sonuç `True` olur.],
)

#pagebreak()
=== B. Boşluk Doldurma Sorularının Cevapları

#let b_cevap(no, terim, aciklama) = [
  #box(width: 1.8em)[*#no.*] *#text(fill: rgb("#166534"))[#terim]* #text(fill: luma(80))[— #aciklama]
]

#stack(
  dir: ttb,
  spacing: 8pt,
  b_cevap("1", "Bit (Binary Digit)", "0 veya 1 değerini alan en küçük bilgi birimi."),
  b_cevap("2", "A, B, C, D, E, F (veya A-F)", "10'dan 15'e kadar olan sayıların onaltılık karşılıkları."),
  b_cevap("3", "Byte (Bayt)", "8 bitin yan yana gelmesiyle oluşan 1 karakterlik veri kümesi."),
  b_cevap("4", "1024 (2¹⁰)", "İkilik bellek adreslemesinden kaynaklanan basamak kat sayısı."),
  b_cevap("5", "Mnemonic (Sembolik Komut)", "Assembly dilinde komutları temsil eden `MOV`, `ADD` gibi kısaltmalar."),
  b_cevap("6", "Yorumlayıcı (Interpreter)", "Kodu satır satır okuyarak anında çalıştıran çevirici araç."),
  b_cevap("7", "RAM (Geçici Bellek / Bellek)", "Program çalıştığı sürece değişkenlerin tutulduğu donanım alanı."),
  b_cevap("8", "char (Karakter)", "Tek bir harf veya sembolü tutan ve bellekte 1 bayt kaplayan veri türü."),
  b_cevap("9", "6", "Her karakter 1 bayt yer kapladığından 6 harfli 'ANKARA' metni 6 bayttır."),
  b_cevap("10", "DRY (Don't Repeat Yourself)", "Kendini tekrar etmeme, kod tekrarından kaçınma ilkesi."),
  b_cevap("11", "Otomatik (Örtük / Implicit)", "Veri kaybını önlemek için küçük türün geniş türe otomatik çevrilmesi."),
  b_cevap("12", "snake_case (Yılan Gösterimi)", "Kelimelerin küçük harfle yazılıp alt çizgiyle bağlandığı Python standardı."),
  b_cevap("13", "Sabit (Constant)", "Program boyunca değeri değişmeyen, büyük harfle tanımlanan değişkenler."),
  b_cevap("14", "Mod / Yüzde (%)", "Bölme işleminden kalan tam sayıyı veren operatör."),
  b_cevap("15", "sep", "print fonksiyonunda değerlerin arasına eklenecek ayracı belirleyen parametre."),
  b_cevap("16", "type() ve isinstance()", "Tür öğrenme (`type`) ve tür doğrulama (`isinstance`) fonksiyonları."),
)

#pagebreak()
=== C. Kısa Cevaplı ve Açık Uçlu Değerlendirme Soruları: Model Cevaplar

#let c_cevap(no, baslik, soru, cevap, not_bilgi) = block(
  breakable: false,
  stroke: 1pt + rgb("#e2e8f0"),
  radius: 4pt,
  inset: 9pt,
  fill: rgb("#f8fafc"),
  width: 100%,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#1e293b"))[#no. #baslik]\
  #text(size: 8.5pt, fill: luma(80))[*Soru:* #soru]\
  #v(3pt)
  #text(weight: "semibold", size: 9pt, fill: rgb("#166534"))[Model Cevap:]\
  #text(size: 9pt)[#cevap]
  #if not_bilgi != "" [
    #v(2pt)
    #text(size: 8pt, fill: rgb("#475569"))[*Değerlendirme Ölçütü:* #not_bilgi]
  ]
]

#stack(
  dir: ttb,
  spacing: 9pt,
  c_cevap(
    "1",
    "Depolama Birimleri Hesabı",
    "Piyasadan satın alınan 1 TB kapasiteli bir harici diski bilgisayarınıza taktığınızda depolama alanı neden yaklaşık 931 GB görünür?",
    [Disk üreticileri onluk sayı sistemini ($10^3$) kullanarak $1 "TB" = 1.000.000.000.000 "Bayt"$ şeklinde hesap yapar. Ancak işletim sistemleri ikilik sayı sistemi ($2^(10)$) ile bellek adreslemesi yaptığı için her basamağı 1024'e böler:
    $ frac(1.000.000.000.000, 1024 times 1024 times 1024) approx 931.32 " GB" $
    Bu durum donanım veya üretim hatası değildir; ölçüm birimi standartlarının (1000 vs 1024) farklı olmasından kaynaklanır.],
    [Öğrencinin üreticilerin $1000$, işletim sisteminin ise $1024$ tabanını kullandığını belirtmesi tam puan için yeterlidir.]
  ),
  c_cevap(
    "2",
    "Derleyici ve Yorumlayıcı Farkı",
    "Derleyici (Compiler) ile Yorumlayıcı (Interpreter) arasındaki temel çalışma farkı nedir? Python hangi yöntemi kullanır?",
    [*Derleyici (Compiler):* Kaynak kodun tamamını önce baştan sona okur, söz dizimi hatalarını denetler ve tüm programı bir bütün olarak doğrudan makine koduna çevirir (C, C++ gibi).\
    *Yorumlayıcı (Interpreter):* Kaynak kodu bir bütün olarak değil, satır satır okur ve her satırı anında çalıştırır. Hata ile karşılaştığı satırda programı durdurur.\
    *Python*, satır satır çeviri ve çalıştırma yapan *yorumlayıcı (interpreter)* yaklaşımını kullanır.],
    [Derleyicinin 'bütün halinde', yorumlayıcının 'satır satır' çevirdiğini ve Python'un yorumlayıcı kullandığını belirten cevaplar tam puan alır.]
  ),
  c_cevap(
    "3",
    "Veri Türleri ve Donanım Mantığı",
    "char rakam = '5'; ile int sayi = 5; ifadeleri arasındaki farkı bellek kullanımı ve matematiksel işlem açısından açıklayınız.",
    [- *`char rakam = '5';`:* Bellekte (RAM) 1 bayt yer kaplar. '5' bir sembol olarak ASCII tablosundaki 53 sayısal koduyla saklanır. Matematiksel işlemlere doğrudan katılamaz; metinsel bir karakterdir.\
    - *`int sayi = 5;`:* 16-bit sistemlerde bellekte 2 bayt yer kaplar. Doğrudan sayısal 5 değerini temsil eder ve toplama, çıkarma, çarpma gibi matematiksel hesaplamalarda kullanılır.],
    [char'ın 1 bayt ve metinsel sembol olduğunu, int'in sayısal değer olup matematiksel işlemlerde kullanıldığını vurgulamalıdır.]
  ),
  c_cevap(
    "4",
    "Karakter Dizileri ve Bellek Hesabı",
    "'KONYA' kelimesi ile 'KONYA MERKEZ' kelime grubu bellekte (RAM) kaçar bayt yer kaplar? Boşluk karakterinin durumunu da açıklayınız.",
    [Bilgisayar mimarisinde ASCII tablosundaki her bir karakter (harf, rakam, sembol ve boşluk) bellekte tam *1 Bayt* yer kaplar (Toplam Alan = Karakter Sayısı $times$ 1 Bayt).\
    - *`"KONYA"`:* 5 harften oluşur $-->$ $5 times 1 = 5 "Bayt"$ yer kaplar.\
    - *`"KONYA MERKEZ"`:* 11 harf ve aradaki 1 adet boşluk (ASCII: 32) olmak üzere toplam 12 karakterdir $-->$ $12 times 1 = 12 "Bayt"$ yer kaplar. Boşluk tuşu da bellekte bir karakter gibi 1 bayt alan tutar.],
    [Boşluğun 1 bayt olarak hesaba katıldığını ve toplam bayt sayılarının (5 ve 12) doğru yazıldığını kontrol ediniz.]
  ),
  c_cevap(
    "5",
    "int(input()) Satırının İşleyişi",
    "Python'da yas = int(input('Yaşınız: ')) satırı çalıştırıldığında sürecin içten dışa nasıl gerçekleştiğini iki adımda açıklayınız.",
    [Bu satır *içten dışa* doğru iki aşamada çalışır:\
    - *1. Adım:* En içteki `input("Yaşınız: ")` fonksiyonu çalışır. Kullanıcının klavyeden girdiği değeri alır ve bunu her zaman bir metin (`str`, örneğin `"16"`) olarak üretir.\
    - *2. Adım:* Dıştaki `int()` fonksiyonu bu `"16"` metnini alır ve sayısal tam sayı (`16`) türüne dönüştürür. Son olarak `=` atama operatörü bu değeri `yas` değişkenine yazar.],
    [input'un önce çalışıp metin ürettiğini, int'in sonra çalışıp bunu sayıya çevirdiğini ifade eden açıklamalar doğrudur.]
  ),
  c_cevap(
    "6",
    "Tür Dönüşümü vs. Yuvarlama",
    "int(85.85) ifadesi ile round(85.85) fonksiyonu arasındaki temel fark nedir? Çıktılarıyla açıklayınız.",
    [- *`int(85.85)`:* Açık (bilinçli) bir tür dönüşümüdür. Yuvarlama işlemi yapmaz; sayının virgülden sonraki kısmını doğrudan silip atarak tam sayı kısmı olan *`85`* değerini üretir.\
    - *`round(85.85)`:* Matematiksel bir yuvarlama fonksiyonudur. Virgülden sonraki ilk basamağa (0.85) bakar; 0.5 ve üzeri olduğu için sayıyı en yakın tam sayı olan *`86`* değerine yuvarlar.],
    [int'in virgülden sonrasını attığını (85), round'un en yakına yuvarladığını (86) belirten yanıtlar tam puan alır.]
  ),
  c_cevap(
    "7",
    "Değişken Tanımlama Kuralları",
    "Python'da bir değişken adı tanımlarken uyulması gereken 4 temel kuralı maddeler halinde yazınız.",
    [1. *Başlangıç Kuralı:* Değişken adları kesinlikle bir rakam ile başlayamaz; bir harf ya da alt çizgi (`_`) ile başlamalıdır.\
    2. *Karakter Kuralı:* Yalnızca harfler (A-Z, a-z), rakamlar (0-9) ve alt çizgi (`_`) kullanılabilir. Boşluk, tire (`-`), nokta gibi özel karakterler kullanılamaz.\
    3. *Büyük-Küçük Harf Duyarlılığı:* Python harf büyüklüğüne duyarlıdır (`case-sensitive`). `puan`, `Puan` ve `PUAN` üç farklı değişkendir.\
    4. *Ayrılmış Sözcükler:* Python'un kendi anahtar kelimeleri (`if`, `else`, `while`, `for`, `class`, `True`, `False` vb.) değişken adı yapılamaz.],
    [4 temel kuraldan herhangi dördünün eksiksiz belirtilmesi tam puan için yeterlidir.]
  ),
  c_cevap(
    "8",
    "type() ve isinstance() Farkı",
    "type() fonksiyonu ile isinstance() fonksiyonu arasındaki kullanım amacı farkını kısaca açıklayınız.",
    [- *`type()`:* Bir değişkenin veya nesnenin doğrudan hangi türe (sınıfa) ait olduğunu öğrenmek için kullanılır. Çıktı olarak `<class 'int'>` gibi türün kendisini döndürür.\
    - *`isinstance()`:* Bir değerin belirli bir türe (veya demet içindeki türlerden birine) ait olup olmadığını doğrulamak (şartlı kontrol yapmak) için kullanılır. Çıktı olarak `True` veya `False` şeklinde mantıksal bir sonuç üretir.],
    [type'ın tür bilgisini döndürdüğünü, isinstance'in ise kontrol yapıp True/False verdiğini açıklayan yanıtlar doğrudur.]
  ),
)
