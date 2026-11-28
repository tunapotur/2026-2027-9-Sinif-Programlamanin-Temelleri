#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

== Grafiksel Görselleştirme

Metin tabanlı çıktılar programlama mantığını öğrenmek için harika bir başlangıçtır; ancak döngülerin, koşulların ve listelerin nasıl çalıştığını görsel olarak ekranda görmek öğrenmeyi çok daha kalıcı hâle getirir. Python, ek bir kurulum gerektirmeden görsel çizimler yapmamızı sağlayan yerleşik grafik araçlarına sahiptir.

=== Koordinat Tabanlı Çizim Aracı: Turtle

Python'ın standart kütüphanesinde bulunan *`turtle`* (kaplumbağa) modülü, kodlarla iki boyutlu düzlemde çizim yapmayı sağlayan eğitsel bir grafik aracıdır. Bu modülde ekranda görünmez bir kartezyen koordinat düzlemi (X ve Y eksenleri) ve bu düzlem üzerinde hareket eden, elinde bir boyama kalemi tutan sanal bir imleç (kaplumbağa) bulunur.

İmleç, verdiğimiz hareket komutlarıyla düzlem üzerinde ilerlerken arkasında çizgiler bırakır. Böylece basit komutları `for` döngüleri, `if` koşulları ve renk listeleriyle birleştirerek geometrik şekillerden karmaşık desenlere kadar pek çok görsel üretebiliriz.

#icerik-tablo(
  tablo_baslik: "Temel Turtle Komutları Referans Rehberi",
  sutunlar: (auto, auto, 1fr),
  sutun_basliklari: ("Komut", "Kısa Yazım", "İşlevi ve Davranışı"),
  icerik_hizalama: (left + horizon, center + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon),
  dikey-bosluk: 5.5pt,
  [`forward(mesafe)`], [`fd(mesafe)`], [İmleci baktığı yöne doğru belirtilen piksel kadar ileri taşır.],
  [`backward(mesafe)`], [`bk(mesafe)`], [İmleci baktığı yönün tersine doğru belirtilen piksel kadar geri taşır.],
  [`right(aci)`], [`rt(aci)`], [İmlecin yönünü saat yönünde belirtilen derece kadar döndürür.],
  [`left(aci)`], [`lt(aci)`], [İmlecin yönünü saat yönünün tersine belirtilen derece kadar döndürür.],
  [`pencolor(renk)`], [—], [Çizgi rengini belirler (örneğin `"blue"`, `"red"`).],
  [`pensize(kalinlik)`], [`width(kalinlik)`], [Kalem ucunun piksel cinsinden çizgi kalınlığını ayarlar.],
)
