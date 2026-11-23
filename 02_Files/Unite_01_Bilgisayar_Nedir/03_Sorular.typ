#import "/pageGeneralConfig.typ": *
#import "/lib/not-block.typ": *
#import "/lib/kod-bloklari.typ": *
#import "/lib/icerik-tablo.typ": *
#import "/lib/yardimcilar.typ": *
#import "/lib/sorular.typ":*

=== Bölüm Soruları

#soru(1, [Bilgisayarlarda elektrik akımını geçirerek veya keserek $1$ ve $0$ değerlerinin oluşmasını sağlayan temel donanım birimi aşağıdakilerden hangisidir?])
#siklar5([Transistör], [Transformatör], [Direnç], [Kondansatör], [Diyot])

#soru(2, [Bir Byte tam olarak kaç bitten oluşur?])
#siklar5([2 bit], [8 bit], [4 bit], [16 bit], [32 bit])

#soru(3, [Onaltılık (Hexadecimal) sayı sisteminde tek bir basamak, ikilik (binary) sistemde kaç bite karşılık gelir?])
#siklar5([2 bit], [8 bit], [16 bit], [32 bit], [4 bit])

#soru(4, [Onaltılık (Hexadecimal) sayı sisteminin makine kodlarının gösteriminde kullanılmasının temel yararı aşağıdakilerden hangisidir?])
#siklar2(
  [Uzun ikili sayı dizilerini daha kısa ve okunabilir göstermesi],
  [RAM kapasitesini iki katına yükseltmesi],
  [İşlemcinin çalışma hızını doğrudan artırması],
  [Programlama dillerini otomatik olarak makine diline çevirmesi],
  [Sabit diskteki verileri otomatik olarak sıkıştırması],
)

#soru(5, [ASCII tablosunun temel amacı aşağıdakilerden hangisidir?])
#siklar2(
  [Görüntü dosyalarını bellekte sıkıştırmak],
  [İşlemci komutlarının çalışmasını hızlandırmak],
  [Harf ve sembollere sayısal kodlar karşılık getirmek],
  [RAM alanındaki adresleri yönetmek],
  [Python programlama kodlarını makine diline derlemek],
)

#soru(6, [Makine dilindeki `1` ve `0` dizilimleri yerine `MOV`, `ADD`, `SUB` gibi sembolik kısaltmalar (*mnemonics*) kullanan programlama dili hangisidir?])
#siklar5([Makine Dili], [C++], [Python], [Assembly Dili], [Java])

#soru(7, [Assembly dilinin makine koduna göre programcıya sağladığı temel kolaylık aşağıdakilerden hangisidir?])
#siklar2(
  [Komutları yalnızca görsel simgelerle ifade etmesi],
  [Makine komutlarını daha anlaşılır sembolik isimlerle yazma imkânı vermesi],
  [Programın hiçbir çeviriciye ihtiyaç duymadan çalışması],
  [RAM kullanımını tamamen ortadan kaldırması],
  [Yazılan programın tüm işletim sistemlerinde doğrudan çalışması],
)

#soru(8, [Yazdığımız kaynak kodun tamamını baştan sona okuyup bir bütün halinde makine diline çeviren yazılımlara ne ad verilir?])
#siklar5([Derleyici], [Yorumlayıcı], [Assembler], [Editör], [İşletim Sistemi])


#soru(9, [1837'de "Analitik Makine" adını verdiği cihazı tasarlayan kişi kimdir?])
#siklar5(
  sutunlar: (1fr, 1fr, 1fr, 1fr, 1.1fr),
  [Ada Lovelace],
  [Alan Turing],
  [Charles Babbage],
  [Bill Gates],
  [John von Neumann],
)

#soru(10, [Charles Babbage'ın Analitik Makine'yi hayata geçirememesinin temel nedeni nedir?])
#siklar2(
  [Dönemin teknolojisinin yeterli olmaması],
  [Yeterli matematik bilgisi olmaması],
  [Cihazın çok küçük olması],
  [Elektrik enerjisinin bulunmaması],
  [Babbage'ın çalışmaktan vazgeçmesi],
)

#soru(11, [Ada Lovelace'in Babbage'ın çalışmalarındaki rolü aşağıdakilerden hangisidir?])
#siklar2(
  [Analitik Makine'yi tek başına icat etmesi],
  [İlk işlemciyi tasarlaması],
  [İlk bilgisayarı üretmesi],
  [İnterneti geliştirmesi],
  [Babbage'ın en büyük destekçilerinden biri olması],
)

#soru(12, [Ada Lovelace neden tarihteki ilk bilgisayar programcısı olarak kabul edilir?])
#siklar2(
  [İlk bilgisayarı ürettiği için],
  [İlk algoritmayı tasarladığı için],
  [İlk işlemciyi icat ettiği için],
  [Ada programlama dilini kendisi geliştirdiği için],
  [İlk bilgisayar oyununu yaptığı için],
)

#soru(13, [Ada programlama dilinin adı nereden gelmektedir?])
#siklar5(
  [Charles Babbage],
  [Analitik Makine],
  [Ada ülkesi],
  [Ada Lovelace],
  [İlk bilgisayar],
)

#soru(14, [Bilgisayarın temel görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Verileri depolamak, işlemek ve sonuçları çıktı olarak sunmak],
  [Yalnızca metin yazmak],
  [İnternete bağlanmak],
  [Yalnızca oyun oynamak],
  [Elektrik üretmek],
)

#soru(15, [Kullanıcı tarafından girilen işlenmemiş ham verilere ne ad verilir?])
#siklar5(
  [Çıktı],
  [Bellek],
  [Girdi],
  [Algoritma],
  [Dosya],
)

#soru(16, [İşlem sonucunda elde edilen ve kullanıcıya sunulan anlamlı değere ne denir?])
#siklar5(
  [Girdi],
  [Komut],
  [Veri yolu],
  [Program],
  [Çıktı],
)

#soru(17, [Aşağıdakilerden hangisi bilgisayarda gerçekleştirilen temel işlemlerden biri değildir?])
#siklar2(
  [Giriş],
  [Programlama],
  [Veri işleme],
  [Veri saklama],
  [Çıkış],
)

#soru(18, [Dış dünyadan gelen verileri elektrik sinyaline çeviren birim hangisidir?])
#siklar5(
  [İşlemci],
  [Bellek],
  [Çıkış birimi],
  [Giriş birimi],
  [Veri yolu],
)

#soru(19, [Bellek biriminin görevi aşağıdakilerden hangisidir?])
#siklar2(
  [Verileri, komutları ve ara sonuçları geçici olarak saklamak],
  [Verileri işlemek],
  [Sonuçları ekrana yazmak],
  [Dış dünyadan veri almak],
  [Programları derlemek],
)

#soru(20, [Aritmetiksel ve mantıksal işlemleri yapan birim hangisidir?])
#siklar5(
  [RAM],
  [Giriş birimi],
  [İşlemci (CPU)],
  [Çıkış birimi],
  [Sabit disk],
)

#soru(21, [İşlenmiş sonuçları ekran, yazıcı veya hoparlörle kullanıcıya sunan birim hangisidir?])
#siklar5(
  [Giriş birimi],
  [Bellek],
  [İşlemci],
  [Veri yolu],
  [Çıkış birimi],
)

#soru(22, [Veri yolu (BUS) ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Yalnızca elektrik üretir],
  [Birimler arasında veri ve komut taşır],
  [Yalnızca ses iletir],
  [Kalıcı dosyaları saklar],
  [İşlemcinin yerini alır],
)

#soru(23, [`5 + 3` işlemi sırasında giriş biriminden gelen veriler, işlemciye ulaşmadan önce nereye yazılır?])
#siklar5(
  [Sabit diske],
  [Ekrana],
  [Yazıcıya],
  [RAM'e],
  [Klavyeye],
)

#soru(24, [RAM ile ilgili aşağıdakilerden hangisi doğrudur?])
#siklar2(
  [Geçicidir, bilgisayar kapanınca içeriği silinir],
  [Kalıcıdır, bilgisayar kapanınca silinmez],
  [Yalnızca program dosyalarını saklar],
  [İşlemciye veri taşır],
  [Ekran çıktısını üretir],
)

#soru(25, [Bilgisayar kapatıldığında kaybolmaması gereken veriler nerede saklanmalıdır?])
#siklar5(
  [RAM'de],
  [İşlemcide],
  [Sabit diskte],
  [Önbellekte],
  [Veri yolunda],
)

#v(0.5em)
#soru(26, [Bilgisayarda bilginin en küçük temel veri birimine ............... denir.])

#soru(27, [8 bitin yan yana gelmesiyle oluşan veri birimine ............... adı verilir.])

#soru(28, [0–9 rakamları ile A–F harflerini kullanan sayı sistemine ............... sayı sistemi denir.])

#soru(29, [Harf ve sembolleri sayısal kodlarla temsil etmek için kullanılan standart tablonun adı ...............'dir.])

#soru(30, [İşlemci komutlarını sembolik ve hatırlanabilir kısaltmalarla ifade eden alt seviyeli dile ............... denir.])

#v(0.5em)
#soru(31, [Bir Byte, bilgisayardaki en küçük veri birimidir. #sik_D_Y])

#soru(32, [8 bit bir araya gelerek 1 Byte oluşturur. #sik_D_Y])

#soru(33, [Hexadecimal sayı sisteminde 0–9 rakamları ile A–F harfleri kullanılır. #sik_D_Y])

// #v(0.5em)
#pagebreak()
#soru(34, [Aşağıdaki numaralandırılmış kavramlar ile harflendirilmiş görev tanımlarını eşleştiriniz:])
#table(
  columns: (1fr, 3fr),
  stroke: 0.5pt + gray,
  inset: 5pt,
  [*Kavram*], [*Açıklama / Görev*],
  [1. RAM], [A. Makine komutlarını sembolik kısaltmalarla ifade eden programlama dili],
  [2. CPU], [B. Program ve verilerin çalışma sırasında geçici tutulduğu birincil bellek],
  [3. Veri Yolu (Bus)], [C. Komutları yorumlayıp çalıştıran merkezi işlem birimi],
  [4. ASCII], [D. Karakter ve sembollere standart sayısal kodlar atayan tablo],
  [5. Assembly], [E. Donanım bileşenleri arasında veri taşınmasını sağlayan iletim hattı],
)
*Cevaplarınız:*  *1* – ..... #h(1.5em) *2* – ..... #h(1.5em) *3* – ..... #h(1.5em) *4* – ..... #h(1.5em) *5* – .....
