// PROGRAMLAMA TEMELLERİ 9 (BİLİŞİM TEKNOLOJİLERİ)
// basliklar-Icerik.txt başlık yapısı ile kitap_metni.typ içerikleri birleştirildi.
// İçerik bulunmayan başlıklar boş bırakıldı.

#set page(
  paper: "a4",
  margin: 2cm,
  numbering: "1",
)
#set text(
  font: "Libertinus Serif",
  size: 11pt,
  lang: "tr",
  hyphenate: false,
)
#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.1em,
)
#set heading(numbering: none)
#show heading: set block(above: 1.2em, below: 0.6em)
#show heading.where(level: 1): set text(size: 17pt)
#show heading.where(level: 2): set text(size: 14pt)
#show heading.where(level: 3): set text(size: 12pt)
#show heading.where(level: 4): set text(size: 11pt)
#set raw(tab-size: 4)
#show raw.where(block: true): set text(size: 9pt)

= Karar Yapıları ve Döngüler

== Koşul Yapıları

Programlama dillerinde, belirlenen bir mantıksal koşulun sonucuna [Doğru (True) veya Yanlış (False)] göre program akışının farklı dallara ayrılmasını sağlayan kontrol mekanizmalarına karar yapıları denir. Python dilinde bu süreç `if`, `else` ve `elif` anahtar kelimeleri ile yönetilir.

=== Programın Akışı: Sıralı Çalışma ve Karar Verme

=== Kod Blokları ve Girinti (Indentation) Kuralı

C++, Go, C\# gibi dillerde bir kod blokunun hangi koşula veya döngüye ait olduğunu belirtmek için süslü parantezler (`{ }`) kullanılırken Python dil mimarisinde bu işlem, kod satırlarında oluşturulan girinti (indentation) mimarisi ile gerçekleştirilir.

Python yorumlayıcısı, bir kontrol yapısının (`if`, `else`, `elif`, `for` ve `while`) başladığını belirten iki nokta (`:`) sembolünü gördüğü andan itibaren bir sonraki satırın içe doğru kaydırılmasını (4 boşluk veya 1 Tab tuşu) bekler. Aynı girinti seviyesinde bulunan tüm kod satırları, tek bir mantıksal blok olarak kabul edilir. Girinti kuralının ihlal edilmesi durumunda sistem doğrudan `IndentationError` (Girinti Hatası) vererek akışı durdurur.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== if (Eğer) Tek Yönlü Karar Mekanizmaları

Eğer belirtilen koşulun mantıksal sonucu True (Doğru) ise `if` bloku altında girintilenmiş olan kod satırları çalıştırılır. Koşul False ise bu blok tamamen atlanır.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== if-else (Eğer-Değilse) Çift Yönlü Karar Mekanizmaları

Kod içerisinde koşulun doğru olması durumunda `if` ile bir kod blokuna yönlendirilir, yanlış olması durumunda ise `else` ile başka bir kod blokuna yönlendirilir.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== Örnek Uygulamalar

==== Mod Operatörü ile Karar Verme: Tek-Çift ve Bölünebilme

==== Büyük / Küçük Harf Duyarlılığı ==> .lower() ve .upper() metodunu kullan.

Bilgisayarlar, kullanıcıların girdilerini işlerken karakterlerin biçimsel özelliklerine karşı son derece katıdır. Python programlama dili büyük / küçük harf duyarlılığına sahip bir mimariyle çalışır. Bu durum, bellek düzeyinde "A" karakteri ile "a" karakterinin tamamen farklı iki veri olarak kabul edilmesi anlamına gelir.

Kullanıcılardan metinsel veri alırken harf duyarlılığından kaynaklanan mantıksal hataları engellemek ve programın kararlılığını korumak için string metotlarından yararlanılır. Kullanıcının klavyeden metni nasıl yazdığından (hepsi büyük, hepsi küçük veya karışık) bağımsız olarak veriyi standart bir forma dönüştürmek amacıyla en sık kullanılan iki metot şudur:

- `.lower()` Metodu: Uygulandığı metinsel ifadedeki tüm büyük harfleri küçük harfe dönüştürür.
- `.upper()` Metodu: Uygulandığı metinsel ifadedeki tüm küçük harfleri büyük harfe dönüştürür.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

Kullanıcı, bir menü seçeneğinde veya onay ekranında Evet cevabını vermek için farklı biçimler kullanmaktadır.

*Örnek Kod Bloku*

```python
# Standart dışı girdi senaryosu
girdi = "EvEt"

# Yöntem A: Metot kullanılmayan durum (Mantıksal Hata Riski)
if girdi == "evet":
    print("İşlem onaylandı.")  # Bu blok çalışmaz, çünkü "EvEt" == "evet" sonucu False'tur.

# Yöntem B: Kararlı Dönüşüm Yapılmış Durum (Önerilen Standart)
temiz_girdi = girdi.lower()  # "EvEt" verisi tamamen küçük harfe dönüştürülerek "evet" olur.

if temiz_girdi == "evet":
    print("İşlem başarıyla onaylandı.")  # Bu blok kararlı bir şekilde çalışır.
```

=== if-elif-else Çok Kriterli Karar Mekanizmaları

birden fazla koşulun sırayla kontrol edilmesi ve sadece doğru olan yolun seçilmesi `if`, `elif`, `else` anahtar kelimeleri kullanılır.

`if-elif-else` yapısı yukarıdan aşağıya doğru doğrusal bir hiyerarşiyle çalışır. Python yorumlayıcısı ilk karşılaştığı `if` koşulunu test eder eğer ilk koşul yanlış ise sırasıyla aşağıdaki `elif` basamaklarını kontrol etmeye başlar. Koşulların hiçbirinin sağlanmadığı senaryoda en altta yer alan `else` bloku devreye girer.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

`if-elif-else` merdiveni kurgulanırken koşulların yazım sırası programın mantıksal kararlılığı açısından kritik bir öneme sahiptir. Yorumlayıcı ilk doğru gördüğü blokta aramayı sonlandırdığı için kapsayıcılığı yüksek olan koşulların alt basamaklara, daha özel veya dar kapsamlı koşulların ise üst basamaklara yazılması gerekir. Aksi takdirde bazı kod blokları hiçbir zaman çalışmayarak ölü kod (dead code) hâline gelebilir.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== İç İçe Koşul Yapıları

Yazılım dünyasında bazı problemlerde bir koşulun kontrol edilebilmesi, kendisinden önceki başka bir koşulun başarıyla gerçekleşmiş olmasına bağlı olabilir. Bir kontrol yapısının içine (girinti seviyesini bir kademe daha artırarak) yeni bir kontrol yapısı yerleştirilmesine iç içe (nested) koşul yapısı adı verilir.

Günlük hayatta ehliyet alma süreci, bu mimariye verilebilecek somut örneklerden biridir. Bir adayın sürücü belgesi alabilmesi için öncelikle 18 yaşını doldurmuş olması şartı aranır. Bu ilk ve dış koşul sağlanmazsa diğer aşamalara geçilmesine izin verilmez ve süreç doğrudan sonlandırılır. Yaş şartı başarıyla sağlandığında ise adayın karşısına yazılı sınavı geçme şeklinde yeni bir iç koşul çıkar. Yazılı sınavı geçenler için de direksiyon sınavında başarılı olma gibi daha içeride yer alan başka bir koşul devreye girer.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== Karşılaştırma ve Mantıksal Operatörlerin Birlikte Kullanımı

Coklu koşulları tasarlamak için ilişkisel operatörler (`<`, `>`, `==`, `!=`, `<=`, `>=`) ile mantıksal operatörler (`and`, `or`, `not`) birbirine bağlanır ve tek bir sonuç oluşur.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== İç İçe Koşul mu, Mantıksal Operatör mü?

=== Koşul İfadelerinde Okunabilirlik ve Kısa Devre (Short-Circuit) Mantığı

// Yapılacak: Short-Circuit konusu anlat

== Döngü Yapıları ve Liste İşlemleri

=== Döngüye Neden İhtiyaç Duyarız?

=== range() Fonksiyonu

`for` döngülerinde ardışık sayısal aralıklar oluşturmak ve döngünün tam olarak istenen miktarda dönmesini sağlamak amacıyla yerleşik `range()` (aralık) fonksiyonundan yararlanılır. `range()` fonksiyonu, başlangıç, bitiş ve adım bilgilerine göre bir sayı aralığını temsil eden yinelenebilir bir range nesnesi oluşturur. Üç farklı parametre kombinasyonuyla yapılandırılır.

=== Belirli Sayıda Tekrar: for Döngüsü

Bir kod blokunun tam olarak kaç kez çalıştırılacağının başlangıçta net olarak öngörüldüğü senaryolarda `for` döngüsü tercih edilir. `for` döngüsü; metinsel ifadeler, listeler (list), belirli sayı aralıkları gibi sıralı bir veri yapısının (iterable) her bir elemanını sırayla döngü değişkenine atarak döngü blokunu otomatik olarak tetikler.

=== Başlangıç, Bitiş ve Adım Değerleri

*Tek Parametreli Kullanım: `range(bitis)`*

Sayaç varsayılan olarak 0'dan başlar ve girilen bitiş değerine kadar birer birer artarak ilerler. En kritik kural, bitiş değerinin aralığa dâhil edilmemesidir.

`range(3)` 0, 1 ve 2 değerlerini üretir (Döngü 3 kez döner.).

*Çift Parametreli Kullanım: `range(baslangic, bitis)`*

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

Sayacın sıfırdan değil belirlenen özel bir sayıdan başlaması istendiğinde kullanılır. Başlangıç değerinden başlar ve bitiş değerine (bitiş hariç) kadar birer birer artar.

`range(5, 8)` 5, 6 ve 7 değerlerini üretir (Döngü 3 kez döner.).

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

*Üç Parametreli Kullanım: `range(baslangic, bitis, artis_miktari)`*

Sayacın kaçar kaçar artacağını veya azalacağını belirleyen üçüncü bir parametre (adım) eklenir. Eğer artış miktarı negatif seçilirse döngü geriye doğru sayma işlemi gerçekleştirir.

`range(2, 9, 2)` 2, 4, 6 ve 8 değerlerini üretir (Döngü 4 kez döner.).

`range(8, 2, -2)` 8, 6 ve 4 değerlerini üretir (Döngü 3 kez döner.).

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

=== Koşula Bağlı Tekrar: while Döngüsü

Döngünün kaç kez çalışacağı başlangıçta bilinmiyorsa tekrar süreci tamamen bir mantıksal koşulun doğruluğuna (True) bağlıysa `while` döngüsü kullanılır. `while` kelimesi Türkçe literatürde "-ken, ... olduğu sürece" anlamına gelir. Koşul ifadesi True değerini ürettiği sürece döngü bloku aralıksız olarak çalışmaya devam eder. Koşul False değerine döndüğü anda döngü sona erer ve program döngüden sonraki satırdan devam eder.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

Programlama süreçlerinde özellikle döngü mekanizmalarında bir değişkenin mevcut değerinin üzerine yeni bir sayı eklemek, çıkarmak veya bu değeri katlamak çok sık yapılan bir eylemdir. Değişkenin kendi değerini güncellediği bu durumlarda `sayac = sayac + 1` şeklinde uzun bir söz dizimi yazmak yerine Python mimarisinde kod okunabilirliğini artıran bileşik atama operatörleri (`+=`, `-=`, `*=`, `/=`) kullanılır (örneğin `sayac += 1`, `hak -= 1` vb.).

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

*Uygulama Süresi:*

Kod-Asistan yazılımının sistem loglarını veya belirli bir raporu ekrana ardışık olarak (örneğin 3 kez) basması istenmektedir. Bu işlem, döngünün kaç kez çalışacağının önceden `range()` gibi bir aralık olarak verilmesiyle değil anlık şekilde güncellenen bir sayacın mantıksal koşula (`sayac <= 3`) bağlanmasıyla dinamik olarak kontrol edilecektir.

*Örnek Kod Bloku*

```python
# Belirli bir sınıra kadar sayım yapılması
sayac = 1

while sayac <= 3:
    print(f"Mevcut Sayaç Değeri: {sayac}")
    sayac += 1  # Sayaç değeri 1 artırılır (güncelleme adımı).
```

*Terminal Çıktısı*

```text
Mevcut Sayaç Değeri: 1
Mevcut Sayaç Değeri: 2
Mevcut Sayaç Değeri: 3
```

=== Sonsuz Döngü

=== Örnek Uygulamalar

==== Kullanıcıdan Çıkış Değeri Gelene Kadar Tekrar

==== Geçerli Veri Girilene Kadar Tekrar

=== `for` mu, `while` mı?

=== Döngü Kontrol İfadeleri: break ve continue

Döngülerin normal çalışma akışını anlık olarak yönlendirmek, belirli istisnai durumlarda döngüyü erken sonlandırmak veya bir turu atlamak için iki özel anahtar kelime kullanılır.

- `break` (döngüyü kır): Döngü bloku içerisinde `break` ifadesiyle karşılaşıldığı an, döngü koşulunun ne olduğuna bakılmaksızın döngü tamamen sonlandırılır ve döngüden sonraki ilk satıra geçilir.
- `continue` (turu atla): `for` döngü bloku içerisinde `continue` ifadesiyle karşılaşıldığı zaman o turun geri kalan kod satırları çalıştırılmaz, döngü doğrudan bir sonraki turun başına (koşul kontrol adımına) atlar. `while` döngüsünde ise koşul yeniden değerlendirilir.

Kod-Asistan yazılımının veri işleme modülünde belirli bir aralıktaki sayıların sırayla işlenip ekrana yazdırılması planlanmıştır. Sistemin belirli bir değere (3 sayısı) denk geldiğinde o adımı atlayıp yoluna devam etmesi, başka kritik bir değere (5 sayısı) ulaştığında ise mevcut döngüyü sonlandırması test edilecektir.

*Örnek Kod Bloku*

```python
# break ve continue Mantığının Gösterimi
for sayi in range(1, 10):
    if sayi == 3:
        continue  # 3 sayısı görüldüğünde ekrana yazdırma turu atlanır.
    if sayi == 5:
        break     # 5 sayısı görüldüğünde döngü tamamen sonlandırılır.
    print(f"İşlenen Sayı: {sayi}")
```

*Terminal Çıktısı*

```text
İşlenen Sayı: 1
İşlenen Sayı: 2
İşlenen Sayı: 4
```

==== break ve continue Mümkünse Kullanılmamalı?

==== `break` ve `continue` Kullanmadan Çözüm Yolları

=== İç İçe Döngüler

==== Dış ve İç Döngünün Çalışma Sırası

==== Örnek: Çarpım Tablosu ve Yıldızlarla Desenler

== Liste İşlemleri (Veri Kümeleri ve Döngü Entegrasyonu)

=== Liste Kavramı ve Liste Oluşturma

Python programlama dilinde, birden fazla veriyi tek bir değişken ismi altında, belirli bir sıra dâhilinde saklayan dinamik veri yapılarına liste (list) adı verilir. Listeler, birden fazla verinin düzenli biçimde saklanmasını ve döngülerle işlenmesini kolaylaştırır ve yazılım kalitesini doğrudan artırır.

Python'da bir liste oluşturulurken veriler köşeli parantez `[ ]` içerisine alınır ve her bir eleman birbirinden virgül (`,`) sembolü ile ayrılır. Listelerin en büyük esnekliği, içerilerinde aynı anda farklı veri türlerini (metin, tam sayı, ondalıklı sayı, boolean vb.) barındırabilmeleridir.

```python
# Standart Liste Tanımlama Örnekleri
bos_liste = []  # İçinde eleman olmayan boş bir liste
asistan_modulleri = ["Menü", "Hesaplama", "Raporlama"]  # str türünde elemanlar
sepet_verileri = [150.50, 45, True, "Fatih"]  # Farklı türde elemanlar
```

=== İndis ile Elemanlara Erişme ve Eleman Değiştirme

Bir listenin içerisindeki belirli bir elemana doğrudan ulaşmak, onu güncellemek veya silmek için elemanın listedeki konum numarası kullanılır. Yazılım literatüründe bu konum numarasına indeks (index) adı verilir. Python dil mimarisinde indeksleme (indexing) kuralları şu sistematik temellere dayanır:

Olmayan bir indeks numarasına erişmeye çalışmak sistem hatalarına yol açar. Dört elemanlı bir listede 4 veya daha büyük bir pozitif indekse erişilmeye çalışılırsa `IndexError` oluşur. Python `IndexError` istisnası üretir; hata yakalanmazsa programın yürütülmesi durur. Python yorumlayıcısı bu durumu ekrana `IndexError: list index out of range` (liste indeksi aralık dışında) hatasıyla yansıtır. Kararlı bir yazılımcı, sınır değerleri daima bu kuralı gözeterek yönetir.

=== Liste Dilimleme

=== `len()` Fonksiyonu ve `in` Operatörü

Bir veri kümesi üzerinde işlem yapmadan önce o kümenin içinde anlık olarak kaç adet eleman bulunduğunun belirlenmesi gerekir. Python'da bir listenin toplam eleman sayısını (boyutunu) döndüren yerleşik fonksiyon, `len()` (length kısaltması) fonksiyonudur.

```python
moduller = ["Menü", "Hesaplama"]
eleman_sayisi = len(moduller)
print(eleman_sayisi)  # Ekrana 2 çıktısını basar.
```

`len()` fonksiyonu listenin içindeki eleman sayısını verir.

=== Döngü ile Listede Gezinme

Listelerin gerçek verimliliği, `for` döngüsüyle sarmal bir şekilde bağlandıklarında ortaya çıkar. `for` döngüsü, listenin ilk elemanından başlayarak son elemanına kadar tüm değerleri sırayla döngü değişkeninin içine aktarır. Böylece tek tek indeks numarası yazmaya gerek kalmadan listenin boyutu ne olursa olsun tüm elemanlar sırayla, her turda bir eleman olacak şekilde işlenir.

#block(
  fill: luma(240),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Bilgi Kutusu: Sıfır Tabanlı İndeksleme Tasarımı*

  Günlük hayatta saymaya 1'den başlarken bilgisayar mimarisinde listelerin 0'dan başladığını unutmak, mantıksal sapmaların en temel kaynağıdır. 10 elemanlı bir veri kümesinin son elemanı 10. indekste değil 9. indekstedir. Programlama yaparken bellek şemalarını zihinde canlandırmak, indeks sınırlarını sistematik olarak kontrol etmek ve veri kaymalarının önüne geçmek kararlı kod üretiminin vazgeçilmez bir parçasıdır.
]

=== Listede Toplam, Ortalama, En Büyük ve En Küçük Değer

=== Liste Metotları

==== Eleman Ekleme: `append()`, `insert()`, `extend()`

Listenin mevcut yapısını bozmadan, var olan elemanların en sonuna (kuyruğuna) yeni bir veri dâhil etmek amacıyla `.append()` (ekleme) metodu kullanılır.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

`.append()` elemanı listenin sonuna ekler. Bu işlem genellikle verimli çalışır ancak listenin kapasitesi yetersiz olduğunda iç yapının yeniden düzenlenmesi gerekebilir.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

Bir verinin listenin sonuna değil de yazılımcının belirleyeceği özel bir indeks konumuna (araya) yerleştirilmesi istendiğinde `.insert()` (yerleştirme) metodu devreye girer. Bu metot, `.insert(hedef_indeks, eklenecek_veri)` şeklinde iki parametreyle çalışır.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

==== Eleman Silme: `remove()`, `pop()`, `clear()`

Bir listenin içerisinden indeks numarasına bakmadan sadece taşımış olduğu değere göre eşleşen ilk değeri listeden kaldırmak amacıyla `.remove()` (silme) metodu kullanılır.

// Yapılacak: Üstte ki tanım için örnek bir kod yapılacak.

`.remove()` metodu çağrıldığında Python yorumlayıcısı listeyi sıfırıncı indeksten başlayarak sağa doğru tarar (linear search). Belirtilen değere sahip ilk elemanı bulduğu an bellek hücresini boşaltır. Boşalan hücrenin yaratacağı mantıksal kopukluğu engellemek adına silinen elemanın sağ tarafında kalan tüm veriler, birer indeks sola kaydırılarak bellek bloku yeniden sıkıştırılır. Değer listede bulunmazsa `ValueError` oluşur.

==== Arama ve Sayma: `index()`, `count()`

==== Sıralama ve Ters Çevirme: `sort()`, `reverse()`

==== Listede Filtreleme

== Grafiksel Görselleştirme

=== Koordinat Tabanlı Çizim Aracı: Turtle

Python yerleşik kütüphanesinde bulunan turtle (kaplumbağa), kodlarla iki boyutlu düzlemde çizim yapmayı sağlayan eğitsel bir grafik aracıdır. Bu modülde ekranda görünmez bir kartezyen koordinat düzlemi (X ve Y eksenleri) ve bu düzlem üzerinde hareket eden, elinde bir boyama kalemi tutan sanal bir imleç bulunur.

Temel Turtle Komutları ve İşlevleri Referans Rehberi
#table(
  columns: (1.2fr, 1fr, 2.2fr),
  stroke: 0.5pt,
  inset: 5pt,
  align: (left + top, left + top, left + top),
  [*Komut*], [*Kısa Yazım*], [*İşlevi ve Davranışı*],
  [`forward(mesafe)`], [`fd(mesafe)`], [İmleci baktığı yöne doğru belirtilen piksel kadar ileri taşır.],
  [`right(açı)`], [`rt(açı)`], [İmlecin yönünü saat yönünde belirtilen derece kadar döndürür.],
  [`left(açı)`], [`lt(açı)`], [İmlecin yönünü saat yönünün tersine belirtilen derece kadar döndürür.],
  [`pencolor(renk)`], [-], [Çizgi rengini belirler (örneğin "blue", "red").],
)

=== Turtle Kütüphanesini Projeye Dahil Etme

=== Çizim Ekranı ve Koordinat Sistemi

=== Hareket ve Yön Komutları

=== Kalem, Renk ve Dolgu Ayarları

=== Döngülerle Düzgün Çokgen Çizimi

=== İç İçe Döngülerle Karmaşık Geometrik Desenlerin Üretimi

=== Bir Şekli Döndürerek Tekrarlama

=== Izgara (Satır-Sütun) Desenleri

=== Koşul ve Listelerle Renkli Desenler
