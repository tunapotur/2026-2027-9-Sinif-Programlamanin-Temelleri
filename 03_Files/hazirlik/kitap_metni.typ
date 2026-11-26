// PROGRAMLAMA TEMELLERİ 9 (BİLİŞİM TEKNOLOJİLERİ)
// "Extracted - Metin" PDF dosyasından başlık numaraları korunarak çıkarılan metin.
// Sade düzen: yalnızca başlıklar, paragraflar, kod blokları ve tablolar.

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

= 3. ÖĞRENME BİRİMİ: KARAR YAPILARI VE DÖNGÜLER

== 3.1. KOŞUL YAPILARI VE MANTIKSAL OPERATÖRLER

Programlama dillerinde, belirlenen bir mantıksal koşulun sonucuna [Doğru (True) veya Yanlış (False)] göre program akışının farklı dallara ayrılmasını sağlayan kontrol mekanizmalarına karar yapıları denir. Python dilinde bu süreç `if`, `elif` ve `else` anahtar kelimeleri ile yönetilir.

=== 3.1.1. Tek Yönlü Karar Mekanizmaları: if (Eğer) Yapısı

Bir koşulun doğruluğunu denetleyen ilk temel basamaktır. Eğer belirtilen koşulun mantıksal sonucu True (Doğru) ise `if` bloku altında girintilenmiş olan kod satırları çalıştırılır. Koşul False ise bu blok tamamen atlanır.

```python
if kosul_ifadesi:
    gorev_satiri_1
    gorev_satiri_2
ana_akis_satiri
```

Kod blokunda, `kosul_ifadesi` değeri True ise `gorev_satiri_1`, `gorev_satiri_2` ve `ana_akis_satiri` çalışır. Eğer `kosul_ifadesi` değeri False ise yalnızca `ana_akis_satiri` kodu çalışır.

=== 3.1.2. Dallanma Mantığı ve Girinti Dünyası

Python'da kod bloklarının sınırlarını belirleyen temel özelliklerden biri girinti (indentation) mimarisidir. C++, Go, C\# gibi dillerde bir kod blokunun hangi koşula veya döngüye ait olduğunu belirtmek için süslü parantezler (`{ }`) kullanılırken Python dil mimarisinde bu işlem, doğrudan kodun satır başından itibaren bırakılan boşluklar vasıtasıyla gerçekleştirilir.

Python yorumlayıcısı, bir kontrol yapısının (`if`, `elif`, `else`, `for` ve `while`) başladığını belirten iki nokta (`:`) sembolünü gördüğü andan itibaren bir sonraki satırın içe doğru kaydırılmasını (4 boşluk veya 1 Tab tuşu) bekler. Aynı girinti seviyesinde bulunan tüm kod satırları, tek bir mantıksal blok olarak kabul edilir. Python kod bloklarında her girinti düzeyi için dört boşluk kullanılması önerilir. Aynı dosyada Tab ve boşluk karakterleri karıştırılmamalıdır. Girinti kuralının ihlal edilmesi durumunda sistem doğrudan `IndentationError` (Girinti Hatası) vererek akışı durdurur.

```python
# Standart Girinti Yapısı
if kosul_ifadesi:
    # Bu satır koşula bağlıdır (4 boşluk içeride).
    görev_satiri_1
    görev_satiri_2
# Bu satır girintiden çıktığı için koşuldan bağımsızdır, her şekilde çalışır.
ana_akis_satiri
```

=== 3.1.3. Çift Yönlü Alternatifler: if-else (Eğer-Değilse) Yapısı

Gerçek dünya senaryolarında koşulun doğru olması durumunda bir kod blokunun, yanlış olması durumunda ise mutlaka başka bir kod blokunun çalıştırılması istenir. Bu tür çift yönlü yol ayrımlarında `if` ifadesi `else` (aksi takdirde) anahtar kelimesiyle birlikte yapılandırılır. `else` ifadesi tek başına bir koşul barındırmaz, `if` şartının başarısız olduğu tüm senaryoları otomatik olarak kapsayan güvenli bir limandır.

```python
# Kullanıcı Rolü Yetki Kontrolü
kullanici_rolu = "Misafir"
if kullanici_rolu == "Yönetici":
    print("Erişim İzni Verildi. Sistem paneli yükleniyor...")
else:
    print("Erişim Engellendi! Bu alanı görmeye yetkiniz yok.")
```

=== 3.1.4. Karşılaştırma ve Mantıksal Operatörlerin Birleşik Kullanımı

Programlama dillerinde kararlar, çoğunlukla tek bir dinamik verinin kontrol edilmesinden çok daha karmaşıktır. Bir sistemin tanımlanan koşullara göre doğru kod bloklarını çalıştırabilmesi ve doğru çıktılar üretebilmesi, birden fazla nesnel şartın aynı anda ve birleşik bir süzgeçten geçirilmesini gerektirir. Günlük hayatta tasarruf bilinciyle yapılan bir alışverişte sadece bütçenin yeterli olması tek başına bir satın alma sebebi değildir; ürünün gerçek bir ihtiyaç olması da (bütçe yeterli ve temel ihtiyaç) gözetilir. Benzer şekilde bir indirim kampanyasından faydalanabilmek için öğrenci belgesi veya kurumsal üyelik kartı ibraz edilmesi gibi alternatif şartlar aranır. Yazılım literatüründe de bu tarz çoklu koşulları tasarlamak için ilişkisel operatörler (`<`, `>`, `==`, `!=`, `<=`, `>=`) vasıtasıyla üretilen tekil mantıksal çıktılar, yerleşik mantıksal operatörler (`and`, `or`, `not`) kullanılarak birbirine bağlanır ve tek bir nihai True ya da False değerine indirgenir.

Birleşik ifadelerin doğru sonuçlar üretebilmesi için Python dil mimarisindeki Genel İşlem Önceliği Hiyerarşisi kuralları dikkate alınmalıdır. Bilgisayarın karmaşık bir kod satırını çözerken izlediği bu yol, finansal okuryazarlık gerektiren bir alışverişte insan zihninin izlediği sıraya çok benzer. Bir ürünün alınıp alınmayacağına karar verilirken önce cüzdandaki harçlık ile kumbaradaki tasarruf miktarı toplanır. Ardından elde edilen bu toplam bütçe, hedeflenen ürünün raf etiketiyle kıyaslanır. En son aşamada ise paranın yetip yetmediği bilgisi, o ürünün anlık bir istek mi yoksa gerçek bir ihtiyaç mı olduğu sorusuyla birleştirilerek nihai harcama kararı verilir. Karmaşık bir kod satırı değerlendirilirken Python yorumlayıcısı da bu örnekteki gibi sırasıyla şu adımları izler:

+ Aritmetik Operatörler: Önce matematiksel hesaplamalar (`*`, `/`, `+`, `-`) tamamlanır.
+ İlişkisel (Karşılaştırma) Operatörler: Çıkan sayısal sonuçlar birbirleriyle kıyaslanır (`==`, `>`, `<=` vb.) ve ham True / False değerleri üretilir.
+ Mantıksal Operatörler: Üretilen mantıksal değerler kendi içinde önce `not`, sonra `and` ve en son `or` hiyerarşisiyle işlenerek tek bir karara bağlanır.

Bu hiyerarşinin kavranması ve kod yazarken karmaşık bölümlerin parantez `( )` ile gruplandırılarak güvence altına alınması, programın yanlış hesaplamalar yapmasının (mantıksal hataların) önüne geçmek için uygulanan en temel yazılım standartlarından biridir.

=== 3.1.5. Çok Kriterli Karar Mekanizmaları: if-elif-else Merdiveni

Günlük hayatta ve karmaşık yazılım mimarilerinde kararlar her zaman Evet / Hayır gibi iki seçenekten ibaret değildir. Çoğu zaman birbirine bağlı birden fazla koşulun sırayla kontrol edilmesi ve sadece doğru olan yolun seçilmesi gerekir. Python programlama dilinde bu tür çok kriterli karar süreçlerini yönetmek için `if` ve `else` ifadelerinin arasına aksi takdirde eğer anlamına gelen `elif` (else-if kısaltması) anahtar kelimesi yerleştirilir.

`if-elif-else` yapısı yukarıdan aşağıya doğru doğrusal bir hiyerarşiyle çalışır. Python yorumlayıcısı ilk karşılaştığı `if` koşulunu test eder, eğer bu koşul doğru ise ilgili kod blokunu çalıştırır ve merdivenin geri kalan tüm basamaklarını (`elif` ve `else` bloklarını) işletmeden doğrudan kontrol yapısından çıkar. Eğer ilk koşul yanlış ise sırasıyla aşağıdaki `elif` basamaklarını kontrol etmeye başlar. Koşulların hiçbirinin sağlanmadığı senaryoda ise en altta yer alan ve adeta güvenli bir liman olan `else` bloku devreye girer.

```python
# if-elif-else Merdiven Yapısı Şablonu
if birinci_kosul:
    # Sadece birinci koşul True ise çalışır.
    blok_1
elif ikinci_kosul:
    # Birinci koşul False VE ikinci koşul True ise çalışır.
    blok_2
elif ucuncu_kosul:
    # Önceki koşullar False VE üçüncü koşul True ise çalışır.
    blok_3
else:
    # Yukarıdaki tüm koşullar False ise mutlaka çalışır.
    varsayilan_blok
```

`if-elif-else` merdiveni kurgulanırken koşulların yazım sırası programın mantıksal kararlılığı açısından kritik bir öneme sahiptir. Yorumlayıcı ilk doğru gördüğü blokta aramayı sonlandırdığı için kapsayıcılığı yüksek olan koşulların alt basamaklara, daha özel veya dar kapsamlı koşulların ise üst basamaklara yazılması gerekir. Aksi takdirde bazı kod blokları hiçbir zaman çalışmayarak ölü kod (dead code) hâline gelebilir.

=== 3.1.6. İç İçe Koşul Yapıları

Yazılım dünyasında bazı problemlerde bir koşulun kontrol edilebilmesi, kendisinden önceki başka bir koşulun başarıyla gerçekleşmiş olmasına bağlı olabilir. Bir kontrol yapısının içine (girinti seviyesini bir kademe daha artırarak) yeni bir kontrol yapısı yerleştirilmesine iç içe (nested) koşul yapısı adı verilir.

Günlük hayatta ehliyet alma süreci, bu mimariye verilebilecek somut örneklerden biridir. Bir adayın sürücü belgesi alabilmesi için öncelikle 18 yaşını doldurmuş olması şartı aranır. Bu ilk ve dış koşul sağlanmazsa diğer aşamalara geçilmesine izin verilmez ve süreç doğrudan sonlandırılır. Yaş şartı başarıyla sağlandığında ise adayın karşısına yazılı sınavı geçme şeklinde yeni bir iç koşul çıkar. Yazılı sınavı geçenler için de direksiyon sınavında başarılı olma gibi daha içeride yer alan başka bir koşul devreye girer. Bu ardışık ve tamamen birbirine bağımlı doğrulama aşamalarında olduğu gibi programlama dillerinde de bir kod blokunun çalıştırılması, dıştaki ana koşulun Doğru (True) değerini üretmesine ve ardından içeriye doğru girintilenmiş diğer alt koşulların sırayla sağlanmasına bağlıdır. Bu hiyerarşik yapı, yazılımların gerçek yaşamdaki gibi güvenli ve aşamalı kararlar almasını mümkün kılar.

=== 3.1.7. Kararlı Veri Kontrolü: Büyük / Küçük Harf Duyarlılığı

Bilgisayarlar, kullanıcıların girdilerini işlerken karakterlerin biçimsel özelliklerine karşı son derece katıdır. Python programlama dili büyük / küçük harf duyarlılığına sahip bir mimariyle çalışır. Bu durum, bellek düzeyinde "A" karakteri ile "a" karakterinin tamamen farklı iki veri olarak kabul edilmesi anlamına gelir.

Kullanıcılardan metinsel veri alırken harf duyarlılığından kaynaklanan mantıksal hataları engellemek ve programın kararlılığını korumak için string metotlarından yararlanılır. Kullanıcının klavyeden metni nasıl yazdığından (hepsi büyük, hepsi küçük veya karışık) bağımsız olarak veriyi standart bir forma dönüştürmek amacıyla en sık kullanılan iki metot şudur:

- `.lower()` Metodu: Uygulandığı metinsel ifadedeki tüm büyük harfleri küçük harfe dönüştürür.
- `.upper()` Metodu: Uygulandığı metinsel ifadedeki tüm küçük harfleri büyük harfe dönüştürür.

==== 3. ÖRNEK: HARF DUYARLILIĞI ÇÖZÜMÜ

Kullanıcı, bir menü seçeneğinde veya onay ekranında Evet cevabını vermek için farklı biçimler kullanmaktadır.

*Uygulama Süresi:* 20 Dakika

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

*Kod Analizi*

- Aynı harflerden oluşsa dahi "EvEt" ile "evet" karakter dizileri bilgisayar belleğinde tamamen farklı verileri temsil eder.
- Profesyonel yazılım projelerinde son kullanıcıdan gelen girdiler (büyük / küçük harf karışık, boşluklu vb.) her zaman öngörülemez kabul edilir. Yazılımın dayanıklılığını korumak ve `if-else` karar yapılarının doğru yönlenmesini sağlamak için alınan metinsel verilerin `.lower()` gibi dönüştürücü metotlarla arka planda standart bir formata getirilmesi yaygın bir veri normalleştirme uygulamasıdır. Bu adım, programı kullanıcı hatalarına karşı kararlı hâle getirir.

#block(
  fill: luma(240),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Bilgi Kutusu: Veri Standardizasyonu ve Kod Okunabilirliği*

  Yazılım geliştirme süreçlerinde her bir `elif` basamağında kullanıcının girebileceği harf kombinasyonlarını tek tek tahmin edip `or` operatörü ile bağlamaya çalışmak (örneğin `if cevap == "E" or cevap == "e":`) kod tabanını karmaşıklaştırır ve okunabilirliği düşürür. Sistematik bir programcı, veriyi kontrol yapısına sunmadan hemen önce giriş aşamasında `.lower()` veya `.upper()` metotlarıyla standardize eder. Veriyi tek bir kurumsal formata indirgemek hem kodun satır sayısını azaltır hem de mantıksal açıkların oluşmasını erkenden engeller.
]

== 3.2. DÖNGÜ YAPILARI VE LİSTE İŞLEMLERİ

Bilgisayarlar, tanımlanan işlemleri yüksek hızla ve tekrar tekrar gerçekleştirebilir. Ancak sonuçların doğruluğu algoritmanın, kodun ve verilerin doğruluğuna bağlıdır. Gerçek dünya senaryolarında belirli bir işlem kümesinin, bir kurala bağlı olarak ardı ardına yeniden çalıştırılması gerekir. Kod bloklarının belirli şartlar çerçevesinde dinamik olarak tekrarlanmasını sağlayan bu kontrol yapılarına döngü mekanizmaları (iterative structures) adı verilir. Python dil mimarisinde tekrarlı süreçleri optimize etmek amacıyla iki temel döngü yapısı kullanılır.

Günlük hayatta bir kargo dağıtım merkezinde paketlerin araca yüklenme süreci, bu iki farklı döngü mimarisine verilebilecek somut örneklerden biridir. Bir görevliye önceden belirlenmiş 50 adet koli listesi verilirse görevli, tam 50 kez taşıma işlemi yapar ve süreci tamamlar. Bilgisayar bilimlerinde de tıpkı bu örnekteki gibi tekrar sayısının veya işlenecek veri miktarının başlangıçta açıkça bilindiği durumlarda `for` döngüsü tercih edilir. Diğer taraftan görevliye belirli bir liste verilmediğinde taşıma işlemi, kargo aracının kasası tamamen dolana kadar devam eder. Bu senaryoda yükleme işleminin tam olarak kaç tur süreceği baştan bilinmese de sürecin devamlılığı kasada boş yer bulunması şartına bağlanmıştır. Tekrar sayısının belirsiz olduğu ve sürecin tamamen anlık bir mantıksal koşula bağlı olarak sürdürüldüğü bu durumlarda ise `while` döngüsü kullanılır. Bu ayrımın kavranması, algoritmaların problem çözme sürecinde doğru aracın seçilmesi ve sistemin sonsuz döngüye girmeden kararlı bir şekilde kurgulanması açısından önemlidir.

=== 3.2.1. Belirli Sayıda Tekrar: for Döngüsü ve Sıralı Veri Dünyası

Bir kod blokunun tam olarak kaç kez çalıştırılacağının başlangıçta net olarak öngörüldüğü senaryolarda `for` döngüsü tercih edilir. `for` döngüsü; metinsel ifadeler, listeler (list), belirli sayı aralıkları gibi sıralı bir veri yapısının (iterable) her bir elemanını sırayla döngü değişkenine atarak döngü blokunu otomatik olarak tetikler.

```python
# for Döngüsü Söz Dizimi Şablonu
for dongu_degiskeni in sirali_veri_yigini:
    # Her bir eleman için çalıştırılacak blok (4 boşluk girinti)
    gorev_satiri_1
```

=== 3.2.2. range() Fonksiyonu

`for` döngülerinde ardışık sayısal aralıklar oluşturmak ve döngünün tam olarak istenen miktarda dönmesini sağlamak amacıyla yerleşik `range()` (aralık) fonksiyonundan yararlanılır. `range()` fonksiyonu, başlangıç, bitiş ve adım bilgilerine göre bir sayı aralığını temsil eden yinelenebilir bir range nesnesi oluşturur. Üç farklı parametre kombinasyonuyla yapılandırılır.

*Tek Parametreli Kullanım: `range(bitis)`*

Sayaç varsayılan olarak 0'dan başlar ve girilen bitiş değerine kadar birer birer artarak ilerler. En kritik kural, bitiş değerinin aralığa dâhil edilmemesidir.

`range(3)` 0, 1 ve 2 değerlerini üretir (Döngü 3 kez döner.).

*Çift Parametreli Kullanım: `range(baslangic, bitis)`*

Sayacın sıfırdan değil belirlenen özel bir sayıdan başlaması istendiğinde kullanılır. Başlangıç değerinden başlar ve bitiş değerine (bitiş hariç) kadar birer birer artar.

`range(5, 8)` 5, 6 ve 7 değerlerini üretir (Döngü 3 kez döner.).

*Üç Parametreli Kullanım: `range(baslangic, bitis, artis_miktari)`*

Sayacın kaçar kaçar artacağını veya azalacağını belirleyen üçüncü bir parametre (adım) eklenir. Eğer artış miktarı negatif seçilirse döngü geriye doğru sayma işlemi gerçekleştirir.

`range(2, 9, 2)` 2, 4, 6 ve 8 değerlerini üretir (Döngü 4 kez döner.).

`range(8, 2, -2)` 8, 6 ve 4 değerlerini üretir (Döngü 3 kez döner.).

=== 3.2.3. Koşula Bağlı Tekrar: while Döngüsü ve Mantıksal Süreklilik

Döngünün kaç kez çalışacağı başlangıçta bilinmiyorsa tekrar süreci tamamen bir mantıksal koşulun doğruluğuna (True) bağlıysa `while` döngüsü kullanılır. `while` kelimesi Türkçe literatürde "-ken, ... olduğu sürece" anlamına gelir. Koşul ifadesi True değerini ürettiği sürece döngü bloku aralıksız olarak çalışmaya devam eder. Koşul False değerine döndüğü anda döngü sona erer ve program döngüden sonraki satırdan devam eder.

```python
# Kurumsal while Döngüsü Söz Dizimi Şablonu
while mantiksal_kosul:
    # Koşul True olduğu sürece çalışacak blok (4 boşluk girinti)
    gorev_satiri
    # Koşulu etkileyen güncelleme adımı
```

=== 3.2.4. Bileşik Atama Operatörleri

Programlama süreçlerinde özellikle döngü mekanizmalarında bir değişkenin mevcut değerinin üzerine yeni bir sayı eklemek, çıkarmak veya bu değeri katlamak çok sık yapılan bir eylemdir. Değişkenin kendi değerini güncellediği bu durumlarda `sayac = sayac + 1` şeklinde uzun bir söz dizimi yazmak yerine Python mimarisinde kod okunabilirliğini artıran bileşik atama operatörleri (`+=`, `-=`, `*=`, `/=`) kullanılır (örneğin `sayac += 1`, `hak -= 1` vb.).

==== 5. ÖRNEK: SAYAÇ YÖNETİMLİ while UYGULAMASI

*Uygulama Süresi:* 20 Dakika

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

*Kod Analizi*

- Python yorumlayıcısı ilk olarak `sayac = 1` değerini alır ve `1 <= 3` (True) olduğu için döngüye girerek ilk çıktıyı basar.
- Ardından `sayac`, `sayac += 1` komutuyla 2'ye ve sonraki turda 3'e yükseltilir.
- `sayac` 4 değerine ulaştığı anda `4 <= 3` koşulu False ürettiği için döngü kararlı bir şekilde sonlandırılmış ve program ana akışa dönmüştür.

`while` döngülerinin kurgulanmasında en sık karşılaşılan mantıksal hata, döngü koşulunun hiçbir zaman False konumuna gelememesidir. 5. örnekte `sayac += 1` güncelleme satırı unutulsaydı `sayac` değeri her zaman 1 kalacak, `1 <= 3` koşulu sonsuza kadar True üretecek ve kullanıcı tarafından manuel olarak sonlandırılana kadar program sürekli çalışacaktı. Bu duruma sonsuz döngü (infinite loop) adı verilir.

=== 3.2.5. Döngü Kontrol İfadeleri: break ve continue

Döngülerin normal çalışma akışını anlık olarak yönlendirmek, belirli istisnai durumlarda döngüyü erken sonlandırmak veya bir turu atlamak için iki özel anahtar kelime kullanılır.

- `break` (döngüyü kır): Döngü bloku içerisinde `break` ifadesiyle karşılaşıldığı an, döngü koşulunun ne olduğuna bakılmaksızın döngü tamamen sonlandırılır ve döngüden sonraki ilk satıra geçilir.
- `continue` (turu atla): `for` döngü bloku içerisinde `continue` ifadesiyle karşılaşıldığı zaman o turun geri kalan kod satırları çalıştırılmaz, döngü doğrudan bir sonraki turun başına (koşul kontrol adımına) atlar. `while` döngüsünde ise koşul yeniden değerlendirilir.

==== 6. ÖRNEK: DÖNGÜ KONTROL İFADELERİNİN MANTIĞI

*Uygulama Süresi:* 20 Dakika

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

*Kod Analizi*

- 1 ve 2 sayıları koşullarda False ürettiği için terminale yazılır.
- Python yorumlayıcısı 3 sayısına geldiğinde `if sayi == 3:` koşulu True olur ve `continue` komutu tetiklenir. Yorumlayıcı, o turun geri kalan kod satırlarını (`print` işlemini) görmezden gelerek o turu atlar ve doğrudan bir sonraki turun başına (4 sayısına) döner.
- 4 sayısı koşullarda False ürettiği için terminale yazılır.
- Python yorumlayıcısı 5 sayısına ulaştığında `if sayi == 5:` koşulu True olur ve `break` komutu çalışır. Bu komut, döngü koşulunun ne olduğuna bakılmaksızın (aralık bitmemiş olsa bile) döngüyü acil durdurma butonu gibi tamamen sonlandırır ve programı döngüden çıkarır.

=== 3.2.6. Döngülerin Yazılım Verimliliğindeki Rolü

Yazılım mühendisliğinde algoritmik verimlilik, bir çözümün özellikle yürütme süresi ve bellek kullanımı bakımından kaynak maliyetinin değerlendirilmesidir. Kodun okunabilirliği ve bakım kolaylığı ise ayrıca dikkate alınır. Döngü yapıları, yazılım dünyasında tekrarlı işlemleri yeniden kullanılabilir ve yönetilebilir biçimde ifade etmemizi sağlayan temel kontrol mekanizmalarıdır. Eğer döngüler olmasa binlerce veriyi işlemek veya tekrarlı görevleri yürütmek için aynı kod satırlarını binlerce kez kopyalamak gerekir. Bu durum şu kritik verimsizliklere yol açar:

- *Kod Şişmesi (Code Bloat):* Kaynak kod dosyasının boyutunun gereksiz yere büyümesi ve okunabilirliğinin yok olmasıdır.
- *Bakım Zorluğu:* Kodun tek bir yerinde yapılacak bir değişikliğin, kopyalanan tüm satırlarda tek tek yapılmak zorunda kalınmasıdır (mantıksal hata riskini artırır).
- *Kod Tekrarı ve Yürütme Maliyeti:* Python yorumlayıcısının doğrusal satırları okurken harcadığı zamanın ve enerjinin artmasıdır.

Döngüler, bin satırlık bir işi sadece üç dört satıra indirgeyerek hem yazılımcının zamanını korur hem de bilgisayar donanımının algoritmaya ve uygulamaya bağlı olarak daha verimli çalışmasına katkı sağlar.

Günlük hayatta bir okulun mezuniyet töreni için bin öğrenciye davetiye hazırlanması süreci, verimlilik ilkesine verilebilecek somut örneklerden biridir. Davetiyelerin her birinin tek tek elle yazılması; gereksiz bir zaman ve kâğıt kaybına (kod şişmesi) yol açar, yazan kişinin enerjisini tüketir (zaman ve iş gücü kaybı) ve tören saatinde bir değişiklik yapıldığında tüm davetiyelerin tek tek silinip baştan yazılmasını (bakım zorluğu) zorunlu kılar. Bunun yerine tek bir şablon tasarlanıp fotokopi makinesine "Bu şablonu bin kez çoğalt." talimatının verilmesi, süreci hatasız bir verimliliğe kavuşturur. Yazılım projelerinde de döngüler bu çoğaltma makinesi gibi çalışarak binlerce satırlık tekrarlı bir işi sadece üç dört satıra indirger. Bu sayede hem yazılımcının zamanı korunur hem de bilgisayar donanımının algoritmaya bağlı olarak daha verimli çalışmasına katkı sağlanır.

=== 3.2.7. for ve while Döngüleri Arasındaki Karşılaştırmalı Farklar

Python dilinde her iki döngü yapısı, tekrarlı işlemleri yürütse de çalışma biçimleri açısından birbirlerinden tamamen ayrılırlar. Tablo 3.1'de `for` ve `while` döngülerinin karşılaştırılması verilmiştir.

#table(
  columns: (1.1fr, 1.45fr, 1.45fr),
  stroke: 0.5pt,
  inset: 5pt,
  align: (left + top, left + top, left + top),
  [*Özellik / Kriter*], [*for Döngüsü*], [*while Döngüsü*],
  [Tekrar Sayısı], [Bir yinelenebilir yapının elemanları üzerinde dolaşır, eleman sayısının önceden bilinmesi zorunlu değildir.], [Bir koşul True olduğu sürece çalışır, tekrar sayısı belirli de belirsiz de olabilir.],
  [Çalışma Koşulu], [Sıralı bir nesnenin (`range`, `str` vb.) elemanları bitene kadar döngüyü sürdürür.], [Mantıksal koşul ifadesi True olduğu sürece döngüyü sürdürür.],
  [Sayaç Yönetimi], [Her turda yinelenebilir yapıdan aldığı sıradaki değeri döngü değişkenine atar.], [Döngünün sonlanmasını sağlayacak koşul değişimi veya ulaşılabilir bir `break` bulunmalıdır.],
  [En Sık Kullanım Alanı], [Liste taramalarında, veri setlerinde ve sabit sayıda dönmesi gereken sayaçlarda kullanılır.], [Aktif menü motorlarında, kullanıcı onay ekranlarında, sonsuz veri akışlarında kullanılır.],
)
#align(center)[_Tablo 3.1: for ve while Döngülerinin Karşılaştırılması_]

==== 4. UYGULAMA

*2. Aşama: Etkileşimli Deney*

Yazdığınız oyun kodunu terminalde yürüterek aşağıdaki adımları sırayla simüle ediniz ve program akışının mantıksal kararlarını muhakeme ediniz.

a) *Deney (continue İşlevi):* Oyun başlar başlamaz sırasıyla 99, -10 ve 55 değerlerini giriniz. Programın size uyarı verip Kalan Hakkınız (5) satırını korumasını sağlayan algoritmik mantığı gerekçelendiriniz. `continue` satırı olmasaydı kalan hakkınız bu hatalı girişlerde ne olurdu?

b) *Deney (Erken Sonlandırma Testi):* İlk tahmininizde ipucunu kullanarak ikinci tahmininizde doğru sayıyı bulmaya çalışınız (Gerekirse kodu test etmek için gizli sayıyı ekrana yazdırabilirsiniz.). Sayıyı doğru tahmin ettiğiniz anda kalan 3 hakkınız olsa bile `break` ifadesi mevcut döngüyü sonlandırır ve programın döngüden sonraki kod satırlarıyla devam etmesini sağlar. Bu komutun etkisini yorumlayınız.

*3. Aşama: Projenin Dijital Depoya Yüklenmesi*

a) Döngü kontrolünü sağlayan `break` ve `continue` ifadelerini kararlı bir oyun senaryosu üzerinde kodlayarak oluşturduğunuz `kod_asistan_oyun.py` dosyanızı kaydediniz.

b) Dijital depo hesabınızdaki `kod-asistan-v0.2` deponuza giderek Add file > Upload files adımlarıyla dosyanızı deponuza yükleyiniz.

c) Sürüm notu alanına kurumsal şeffaflık standartlarına uygun olarak şu notu ekleyiniz: "Asistan projesine random modülü entegre edildi, break ve continue komutlarının işlevlerini somutlaştıran Sayı Tahmin Oyunu katmanı başarıyla eklendi (v0.2)."

*Değerlendirme:* Çalışmanızı, karekodda yer alan Öz Değerlendirme Formu'ndaki ölçütlere göre değerlendiriniz. Çalışmanızı planlarken ölçekteki ölçütleri dikkate alınız.

Kendi çalışmanızı değerlendirmek için karekodda yer alan Öz Değerlendirme Formu'nu doldurunuz. Dijital yayınlarda karekodun üstüne tıklayarak içeriğe ulaşabilirsiniz.

=== 3.2.8. Liste İşlemleri (Veri Kümeleri ve Döngü Entegrasyonu)

Python'daki temel veri tiplerinde (`str`, `int`, `float`, `bool`) bir değer, tek bir değişken adıyla temsil edilir. Birbiriyle ilişkili birden fazla değeri topluca yönetmek için liste gibi veri yapılarından yararlanılır. Örneğin sınıftaki 5 öğrencinin adı veya bir sepet uygulamasındaki farklı ürün fiyatları kaydedilmek istendiğinde her biri için ayrı ayrı değişkenler (`ogrenci_1`, `ogrenci_2` vb.) tanımlamak zorunda kalınır. Gerçek dünya problemlerinde ise yan yana duran, birbiriyle ilişkili yüzlerce hatta milyonlarca veriyi tek bir çatı altında düzenli bir şekilde tutma ihtiyacı doğar.

Python programlama dilinde, birden fazla veriyi tek bir değişken ismi altında, belirli bir sıra dâhilinde saklayan dinamik veri yapılarına liste (list) adı verilir. Listeler, birden fazla verinin düzenli biçimde saklanmasını ve döngülerle işlenmesini kolaylaştırır ve yazılım kalitesini doğrudan artırır.

Python'da bir liste oluşturulurken veriler köşeli parantez `[ ]` içerisine alınır ve her bir eleman birbirinden virgül (`,`) sembolü ile ayrılır. Listelerin en büyük esnekliği, içerilerinde aynı anda farklı veri türlerini (metin, tam sayı, ondalıklı sayı, boolean vb.) barındırabilmeleridir.

```python
# Standart Liste Tanımlama Örnekleri
bos_liste = []  # İçinde eleman olmayan boş bir liste
asistan_modulleri = ["Menü", "Hesaplama", "Raporlama"]  # str türünde elemanlar
sepet_verileri = [150.50, 45, True, "Fatih"]  # Farklı türde elemanlar
```

Bir listenin içerisindeki belirli bir elemana doğrudan ulaşmak, onu güncellemek veya silmek için elemanın listedeki konum numarası kullanılır. Yazılım literatüründe bu konum numarasına indeks (index) adı verilir. Python dil mimarisinde indeksleme (indexing) kuralları şu sistematik temellere dayanır:

- *Pozitif İndeksleme:* Listenin ilk elemanının indeks numarası her zaman 0 (sıfır) ile başlar ve sağa doğru birer birer artarak ilerler.
- *Negatif İndeksleme:* Listenin son elemanına hızlıca erişmek için sağdan sola doğru -1, -2 şeklinde ilerleyen negatif indeks mimarisi kullanılır.

```python
# İndeks Erişim Modülü
ogrenciler = ["Ahmet", "Zeynep", "Can", "Elif"]
# Pozitif İndeks ile Erişim
ilk_ogrenci = ogrenciler[0]      # "Ahmet" verisini döndürür.
ucuncu_ogrenci = ogrenciler[2]   # "Can" verisini döndürür.
# Negatif İndeks ile Erişim
son_ogrenci = ogrenciler[-1]     # "Elif" verisini döndürür.
```

Olmayan bir indeks numarasına erişmeye çalışmak sistem hatalarına yol açar. Dört elemanlı bir listede 4 veya daha büyük bir pozitif indekse erişilmeye çalışılırsa `IndexError` oluşur. Python `IndexError` istisnası üretir; hata yakalanmazsa programın yürütülmesi durur. Python yorumlayıcısı bu durumu ekrana `IndexError: list index out of range` (liste indeksi aralık dışında) hatasıyla yansıtır. Kararlı bir yazılımcı, sınır değerleri daima bu kuralı gözeterek yönetir.

=== 3.2.9. Dinamik Döngü-Liste İlişkisi (Iterating Through a List)

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

==== 5. UYGULAMA

*2. Aşama: Etkileşimli Deney*

Yazdığınız kodu terminalde yürüterek şu adımları test ediniz ve bellek şemalarını muhakeme ediniz.

a) *Deney (Hata Atlama Testi):* Sırasıyla 150, -40, 200 ve 0 değerlerini giriniz. Programın negatif ve sıfır değerlerinde uyarı verip listenin yapısını korumasını sağlayan mantıksal mekanizmayı açıklayınız.

b) *Deney (Komut Kararlılığı):* Girişi sonlandırmak için karışık harflerle HeSaPla yazınız. Metinsel metodun bu esnekliği nasıl sağladığını kod satırı üzerinden analiz ediniz.

c) *Deney (Açık Uçlu Sorgu):* Fatura detay raporundaki `urun_sayaci` değişkeni neden listedeki indeksler gibi 0 yerine 1 değerinden başlatılmıştır? Kullanıcı deneyimi açısından gerekçelendiriniz.

*3. Aşama: Projenin Dijital Depoya Yüklenmesi*

a) Listeleri, iki farklı döngü türünü ve kontrol ifadelerini tek bir çatı altında birleştirerek kararlı hâle getirdiğiniz `kod_asistan_sepet_guncel.py` dosyanızı kaydediniz.

b) Dijital depo hesabınızdaki `kod-asistan-v0.2` deponuza giderek Add file > Upload files adımlarıyla dosyanızı deponuza yükleyiniz.

c) Sürüm notu alanına, kurumsal şeffaflık standartlarına uygun olarak şu notu ekleyiniz: "Sepet mimarisi dinamik liste yapısına kavuşturuldu; while-for döngüleri, break ve continue ifadeleriyle kararlı veri doğrulama katmanı Kod-Asistan projesine eklendi (v0.3)."

*Değerlendirme:* Çalışmanızı, karekodda yer alan Öz Değerlendirme Formu'ndaki ölçütlere göre değerlendiriniz. Çalışmanızı planlarken ölçekteki ölçütleri dikkate alınız.

Kendi çalışmanızı değerlendirmek için karekodda yer alan Öz Değerlendirme Formu'nu doldurunuz. Dijital yayınlarda karekodun üstüne tıklayarak içeriğe ulaşabilirsiniz.

=== 3.2.10. Liste Metotları ve Bellek Davranışları

Python programlama dilinde listeler, dinamik genişleme ve daralma yeteneğine sahip esnek veri yapılarıdır. Python listeleri, eleman eklenip çıkarılabilen değiştirilebilir veri yapılarıdır. Programın akışı esnasında bu veri kümesine liste elemanlarını eklemek, silmek veya listenin uzunluğunu belirlemek için yerleşik fonksiyon ve liste metotlarından yararlanılır. Bu metotların doğru kullanımı, yazılımın kararlılığını ve donanım kaynaklarının verimli tüketilmesini doğrudan etkiler.

Bir veri kümesi üzerinde işlem yapmadan önce o kümenin içinde anlık olarak kaç adet eleman bulunduğunun belirlenmesi gerekir. Python'da bir listenin toplam eleman sayısını (boyutunu) döndüren yerleşik fonksiyon, `len()` (length kısaltması) fonksiyonudur.

```python
moduller = ["Menü", "Hesaplama"]
eleman_sayisi = len(moduller)
print(eleman_sayisi)  # Ekrana 2 çıktısını basar.
```

Bu kod çalıştırıldığında Python'un bellek davranışı oldukça verimlidir. `len()` fonksiyonu listenin içindeki elemanları tek tek sayarak sisteme ekstra işlem yükü bindirmez. Python bellek mimarisinde listenin boyutu arka planda bir sayaç olarak sürekli güncel tutulur. `len()` çağrıldığında doğrudan bu hazır sayaç verisi okunur. Bu durum, algoritmanın çalışma hızını (zaman karmaşıklığını) optimize eden verimli bir reflekstir.

Listenin mevcut yapısını bozmadan, var olan elemanların en sonuna (kuyruğuna) yeni bir veri dâhil etmek amacıyla `.append()` (ekleme) metodu kullanılır.

```python
sepet = [150.0, 45.5]
sepet.append(90.0)
print(sepet)  # [150.0, 45.5, 90.0] çıktısını üretir.
```

`.append()` elemanı listenin sonuna ekler. Bu işlem genellikle verimli çalışır ancak listenin kapasitesi yetersiz olduğunda iç yapının yeniden düzenlenmesi gerekebilir.

Bir verinin listenin sonuna değil de yazılımcının belirleyeceği özel bir indeks konumuna (araya) yerleştirilmesi istendiğinde `.insert()` (yerleştirme) metodu devreye girer. Bu metot, `.insert(hedef_indeks, eklenecek_veri)` şeklinde iki parametreyle çalışır.

```python
isler = ["Raporlama", "Çıkış"]
# 1. indekse "Hesaplama" verisini araya ekle
isler.insert(1, "Hesaplama")
print(isler)  # ['Raporlama', 'Hesaplama', 'Çıkış'] çıktısını verir.
```

Bu kod çalıştırıldığında gerçekleşen bellek davranışı, `.insert()` metodunun `.append()` metoduna göre çok daha yüksek bir donanım maliyetine sahip olduğunu gösterir. Araya bir eleman eklendiğinde hedef konumdan sonraki elemanların indeksleri bir sağa kayar. Python yorumlayıcısı, araya yer açabilmek için sağdaki tüm verileri birer indeks sağa kaydırmak (shifting) zorunda kalır. Büyük veri kümelerinde bu metodun sıkça kullanılması yazılımın çalışma performansını düşürebilir.

Bir listenin içerisinden indeks numarasına bakmadan sadece taşımış olduğu değere göre eşleşen ilk değeri listeden kaldırmak amacıyla `.remove()` (silme) metodu kullanılır.

```python
programlar = ["Python", "C++", "Go"]
programlar.remove("C++")
print(programlar)  # ["Python", "Go"] çıktısını üretir.
```

`.remove()` metodu çağrıldığında Python yorumlayıcısı listeyi sıfırıncı indeksten başlayarak sağa doğru tarar (linear search). Belirtilen değere sahip ilk elemanı bulduğu an bellek hücresini boşaltır. Boşalan hücrenin yaratacağı mantıksal kopukluğu engellemek adına silinen elemanın sağ tarafında kalan tüm veriler, birer indeks sola kaydırılarak bellek bloku yeniden sıkıştırılır. Değer listede bulunmazsa `ValueError` oluşur.

#block(
  fill: luma(240),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Bilgi Kutusu: Dinamik Bellek Yönetimi ve Performans Bilinci*

  Programlama yaparken sadece kodun çalışması yeterli değildir. Kodun bilgisayar donanımına bindirdiği yükün de sistematik olarak hesaplanması gerekir. Listenin sonuna eleman ekleme işlemi genellikle verimlidir, listenin başına `.insert(0, ...)` ile ekleme yapmak ise mevcut elemanların indekslerinin kaydırılmasını gerektirir. Geliştirdiğiniz algoritmalarda doğru metodu doğru ihtiyaç için seçmek, sistem kaynaklarını koruyan vizyoner ve sistematik bir yazılımcı eğilimidir.
]

=== 3.2.11. Döngü ve Liste İşlemlerinde Yapay Zekâ Denetimi

Büyük dil modellerine (LLM) dayalı yapay zekâ asistanları; karmaşık döngüleri, koşul bloklarını ve liste metotlarını saniyeler içinde yazarak yazılımcılara büyük bir hız kazandırabilir. Bu asistanların çalışma mantığı, kodun doğruluğunu analitik olarak anlamaya değil geçmiş verilerden öğrendikleri dil kalıplarına göre en olası bir sonraki kelimeyi / karakteri tahmin etmeye dayanır. Yapay zekâ modellerinin koşul, döngü ve liste kurgularında en sık yaptığı üç kronik hata türü şunlardır:

Birinci kronik hata, gizli yapısal kusur olan kararsız girinti hatalarıdır. Python dil mimarisinde kod bloklarının sınırları, süslü parantezlerle değil sadece boşluk düzeyleriyle (girintilerle) belirlenir. Yapay zekâ modelleri, özellikle iç içe koşul yapısı veya döngü içeren uzun kod blokları üretirken girinti hizalamasını kaybedebilir. Bu noktada yapay zekânın en sık düştüğü hata; gözle bakıldığında aynı hizada duran bazı satırlarda 4 adet boşluk karakteri, bazı satırlarda ise 1 adet Tab karakteri kullanmasıdır. Bu durum program çalıştırıldığı an `IndentationError` veya `TabError` fırlatılmasına yol açar. Bu gizli kusura karşı uygulanacak en güvenli insan denetimi çözümü; yapay zekâdan alınan kodları doğrudan kopyalamak yerine editörün Render Whitespace (Görünmez Boşlukları Göster) özelliğini açarak, noktaları ve okları sistematik olarak kontrol etmektir.

İkinci kronik hata, sonsuz döngü tuzağıdır. Yapay zekâ modelleri, koşula bağlı olarak dönen `while` döngülerini kurarken döngüyü sonlandıracak mantıksal anahtarı (`break` ifadesini veya sayaç güncellemesini) döngü blokunun içine yerleştirmeyi unutabilir veya yanlış koşul basamağına yazabilir. Bu hata gözden kaçtığında ve kod çalıştırıldığında `sayac` değeri döngü içinde hep 1 kalacağı için uygulamanın yanıt vermemesine veya gereksiz işlemci kullanmasına yol açabilir. Analitik bir programcının bu tuzağa karşı uygulayacağı insan denetimi çözümü; döngü koşulunu etkileyen değişkenin, döngünün içinde ve doğru girinti seviyesinde güncellendiğini manuel olarak doğrulamaktır.

Üçüncü kronik hata ise indeks sınır taşması ve metot sapmalarıdır. Yapay zekâ araçları, listeler üzerinde `for` döngüsü kurarken veya listeden `.remove()` metoduyla eleman silerken sınır değerlerini sıklıkla karıştırır. Yapay zekânın buradaki en yaygın hatası, Python listelerinin 0 (sıfır) tabanlı indeksleme mimarisine sahip olduğunu unutarak listelerin boyutuyla indeks numaralarını eşitlemesidir. Örneğin 5 elemanlı bir listenin son elemanına ulaşmak için `liste[5]` kodunu üretebilir. Bu durum doğrudan `IndexError: list index out of range` hatasına yol açar. Bilişim uzmanlarının bu sapmalara karşı alacağı insan denetimi çözümü ise listenin sınırlarını ve metot çağırma işlemlerini yürütmeden önce `len()` fonksiyonu ile listenin anlık boyutunu denetlemek ve program akışına sınır değer kontrolü (`if eleman in liste:`) yerleştirmektir.

Bilişim dünyasında yapay zekâ modelleri; çok hızlı yazabilen, her şeye anında onay veren ama son derece aceleci, dikkatsiz bir stajyer gibi konumlandırılabilir. Hazır bir kod satırının bilgisayarda çalıştırılmadan önce girdilerinin, döngü kırılma noktalarının ve indeks sınırlarının zihinsel süzgeçten geçirilmesi mesleki bir sorumluluktur. Yapay zekânın ürettiği bir koddaki mantık hatasının çalıştırılmadan önce tahmin edilebilmesi, yazılımcılara Yapay Zekâ Denetçisi unvanını kazandırır.

==== 6. UYGULAMA: HATA AVCILIĞI VE YAPAY ZEKÂ KOD DENETİMİ

*Uygulamanın Süresi:* 30 dakika

*Uygulamanın Amacı:* Yapay zekâ tarafından üretilmiş hatalı kodları çalıştırmadan önce analiz etmek; girinti, döngü ve indeks hatalarını belirleyip düzelterek kod kararlılığını sağlamak.

*Problem Senaryosu:* Bir yapay zekâ asistanına "Kullanıcının sepetindeki fiyatları listeye ekleyen, ÇIKIŞ yazana kadar dönen ve sonunda sepeti listeleyen bir menü yaz." komutu verilmiştir. Yapay zekânın ürettiği kodlar çalıştırılmadan önce insan denetiminden geçirilmesi istenmektedir.

Verilen problem senaryosundan hareketle aşağıdaki işlem basamaklarını sırasıyla takip ederek uygulamanızı bireysel şekilde gerçekleştiriniz.

*Uygulamanın Aşamaları*

*Kod Dosyasının Hazırlanması ve İncelenmesi*

a) Yapay zekâ, bu kodu üretirken (olasılıksal doğası gereği) kodun içine 3 adet kronik hata yapmıştır. Kod bloklarını bilgisayarda çalıştırmadan önce satır satır inceleyiniz. Tespit ettiğiniz hataların yerini, türünü ve programın kararlılığını nasıl etkileyeceğini Hata Tespit Masası tablosuna kaydediniz.

b) Kod blokunu kod editörüne aktararak programın hatasız, kararlı ve PEP 8 stil önerilerine uygun temiz sürümünü yeniden yapılandırınız.

*Hata Tespit Çalışması Tablosu*

#table(
  columns: (1.1fr, 1fr, 1.6fr),
  stroke: 0.5pt,
  inset: 5pt,
  align: (left + top, left + top, left + top),
  [*Hata Türü*], [*Hatayı Barındıran Satır Aralığı*], [*Kök Neden ve Mantıksal Kusur*],
  [Yapısal Hata (IndentationError)], [], [],
  [Mantıksal Sınır Hatası (IndexError)], [], [],
)

== 3.3. GRAFİKSEL GÖRSELLEŞTİRME

Programlama dillerinde verileri işlemeyi, koşulları yönetmeyi ve döngüler kurmayı öğrenmek, algoritmik düşünme becerisinin temelini oluşturur. Yazılan kodların sadece terminal ekranında metinsel çıktılar (sayılar, yazılar vb.) üretmesi, programın arka planda yürüttüğü geometrik ve mantıksal dönüşümlerin görsel olarak algılanmasını zorlaştırabilir. Bir mimarın hesaplamalarla dolu kâğıt üzerindeki projesinin, üç boyutlu bir makete veya gerçek bir binaya dönüşmeden zihinde tam olarak canlandırılamaması gibi bilgisayarın belleğindeki sayısal veriler de görselleştirilmeden tam olarak kavranamayabilir. Yazılım dünyasında soyut algoritmaları çizgilere, renklere ve piksellere dönüştürerek somutlaştırma işlemine grafiksel görselleştirme (graphical visualization) adı verilir. Python dil mimarisi, kodların ekranda görsel birer sanat eserine veya grafik arayüzüne dönüşmesini sağlayan güçlü kütüphaneler barındırır.

=== 3.3.1. Koordinat Tabanlı Çizim Aracı: Turtle

Python yerleşik kütüphanesinde bulunan turtle (kaplumbağa), kodlarla iki boyutlu düzlemde çizim yapmayı sağlayan eğitsel bir grafik aracıdır. Bu modülde ekranda görünmez bir kartezyen koordinat düzlemi (X ve Y eksenleri) ve bu düzlem üzerinde hareket eden, elinde bir boyama kalemi tutan sanal bir imleç bulunur.

Günlük hayatta gözleri kapalı birine elinde bir fırçayla geniş ve boş bir tuval üzerinde yürüyerek, resim çizdirilmek istendiğinde ona on adım ileri git, doksan derece sağa dön, fırçanın rengini kırmızı yap gibi çok net ve sıralı yönlendirmeler verilmesi gerekir. Turtle modülü de bu yönlendirme mantığıyla çalışır. Sanal imlecin baktığı yön, dönüş açısı, kalem rengi gibi parametreler döngülerle birleştirildiğinde bilgisayar ekranında karmaşık geometrik desenler saniyeler içinde oluşturulabilir. Bu süreç, öğrencilerin algoritmik talimatları piksellere dönüştürerek sonuçlarını somut bir şekilde değerlendirmesini ve soyut matematiksel açıları görsel birer çıktıya dönüştürmesini sağlar. Vektörel çizim süreçlerinde algoritmik desenler oluşturmak ve imleci (turtle) çalışma ekranında yönlendirmek amacıyla sıklıkla kullanılan temel grafik komutları ile bu komutların işlevleri Tablo 3.2'de referans olarak özetlenmiştir.

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
#align(center)[_Tablo 3.2: Temel Turtle Komutları ve İşlevleri Referans Rehberi_]

=== 3.3.2. İç İçe Döngülerle Karmaşık Geometrik Desenlerin Üretimi

İç içe döngülerin çalışma mekanizması dış döngü ve iç döngü hiyerarşisine dayanır. Dışarıdaki döngü sadece 1 tur döndüğünde içerideki döngü başlangıçtan bitişe kadar olan tüm turlarını tamamlamak zorundadır. İç döngü tamamen bitmeden dış döngü bir sonraki adımına geçemez.

Günlük hayatta bir analog saatin çalışma mekanizması, iç içe döngülerin bu hiyerarşik yapısına verilebilecek somut örneklerden biridir. Bir saatte yer alan akrep dış döngüyü, yelkovan ise iç döngüyü temsil eder. Akrebin yalnızca bir sayılık ilerleme kaydedebilmesi (dış döngünün bir tur atması) için yelkovanın 60 dakikalık tam bir turu eksiksiz bir şekilde bitirmesi şarttır. Yelkovan kendi turlarını tamamlamadan akrep kesinlikle bir sonraki saate ilerleyemez. Bu mekanizmada olduğu gibi programlama dillerinde de iç döngünün tüm tekrarları bütünüyle sonlanmadan dış döngünün bir sonraki adıma geçmesine izin verilmez. Bu mutlak bağımlılık, bilgisayarın karmaşık işlemleri sırayla, düzenli ve hatasız bir şekilde yapılandırmasını mümkün kılar. Bu mekanizma; turtle grafik kütüphanesinin yön, piksel ve açı parametreleriyle birleştiğinde iç döngünün temel bir geometrik şekli (örneğin bir üçgen veya kareyi) çizdiği, dış döngünün ise bu şekli her seferinde belirli bir açıyla döndürerek ekranda muazzam simetrik geometrik desenler ve geometrik spiraller oluşturduğu akıllı bir tasarım sistemine dönüşür.

Geleneksel mimaride ve çini sanatında ustaların karmaşık eserlerini üretme süreci, bu ardışık çizim mimarisinin ekrandaki yansımasına verilebilecek en estetik örneklerden biridir. Bir usta, önce merkezdeki tek bir geometrik motifi tüm detaylarıyla çizer. Bu adım, yazılımdaki iç döngüyü temsil eder. Ardından elde edilen bu temel motif, belirli bir açıyla kaydırılarak zemin etrafında defalarca kopyalanır. Bu aşama ise dış döngünün kontrolündedir. Sadece basit bir çizimin iç içe döngüler aracılığıyla aynı eksen etrafında döndürülerek çoğaltılması, matematiksel hesaplamaların görsel bir derinlik kazanmasını sağlar. Yüzlerce satır tekrarlı komut dizisi yazmak yerine sadece birkaç satırlık iç içe yapı kurgulamak, sistemin doğadaki kusursuz simetriye benzeyen fraktalları hızlı ve hatasız şekilde inşa etmesini sağlar.

==== 7. UYGULAMA

*3. Aşama: Projenin Dijital Depoya Yüklenmesi*

a) Proje dosyanızı kaydediniz.

b) Dijital depo hesabınızdaki `kod-asistan-v0.2` deponuza giderek Add file > Upload files adımlarıyla dosyanızı deponuza yükleyiniz.

c) Sürüm notu alanına kurumsal şeffaflık standartlarına uygun olarak şu notu ekleyiniz: "turtle kütüphanesiyle döngüsel grafik görselleştirme Kod-Asistan projesine eklendi (v0.3)."

*Değerlendirme:* Çalışmanızı, karekodda yer alan Öz Değerlendirme Formu'ndaki ölçütlere göre değerlendiriniz. Çalışmanızı planlarken ölçekteki ölçütleri dikkate alınız.

Kendi çalışmanızı değerlendirmek için karekodda yer alan Öz Değerlendirme Formu'nu doldurunuz. Dijital yayınlarda karekodun üstüne tıklayarak içeriğe ulaşabilirsiniz.
