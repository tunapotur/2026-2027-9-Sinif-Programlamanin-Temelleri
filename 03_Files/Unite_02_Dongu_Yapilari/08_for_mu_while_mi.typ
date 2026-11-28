#import "/pageGeneralConfig.typ": *
#import "../../lib/islem-aciklama.typ": *
#import "../../lib/not-block.typ": *
#import "../../lib/kod-bloklari.typ": *
#import "../../lib/icerik-tablo.typ": *
#import "../../lib/yardimcilar.typ": *

=== `for` mu, `while` mı?

Python'da `for` ile yapılan pek çok işlem `while` ile de yazılabilir; ancak doğru döngü türünü seçmek kodun okunabilirliğini ve hata olasılığını doğrudan etkiler.

#icerik-tablo(
  tablo_baslik: "for ve while Döngülerinin Karşılaştırılması",
  sutunlar: (auto, 1fr, 1fr),
  sutun_basliklari: ("Kriter", "for Döngüsü", "while Döngüsü"),
  icerik_hizalama: (left + horizon, left + horizon, left + horizon),
  sutun_baslik_hizalama: (center + horizon, center + horizon, center + horizon),
  dikey-bosluk: 6pt,
  [*Tekrar Sayısı*], [Başlangıçta bellidir veya bir koleksiyonun boyutu kadardır.], [Başlangıçta belli değildir; çalışma anındaki koşula bağlıdır.],
  [*Kullanım Alanı*], [`range()`, liste, metin gibi sıralı veriler üzerinde gezinme.], [Kullanıcı çıkana kadar bekleme, şifre/girdi doğrulama, oyun döngüsü.],
  [*Sayaç Yönetimi*], [Sayaç veya eleman geçişi Python tarafından otomatik yönetilir.], [Sayaç veya koşul değişkeni yazılımcı tarafından güncellenir.],
  [*Sonsuz Döngü Riski*], [Yoktur (sonlu bir veri yapısı üzerinde döner).], [Koşul güncellenmezse sonsuz döngüye girme riski vardır.],
)

#not_block(title: "Kural:")[
  Tekrar sayısı önceden biliniyorsa veya elinizde elemanlarını tek tek gezeceğiniz bir liste/metin varsa her zaman *`for`* döngüsünü seçin. Döngünün ne zaman biteceği bir olaya veya kullanıcı girdisine bağlıysa *`while`* döngüsünü kullanın.
]
