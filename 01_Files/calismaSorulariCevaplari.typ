#import "template.typ": *
#import "flowchart.typ": *


#align(center)[#text(size:18pt, weight: "bold")[Çalışma Sorularının Cevapları]]

*1.2.2.3. Örnek Çalışma Soruları*

1.Doğum Yılı
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    // Düğümler
    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı gunumuzYili, dogumYili, yas], width: 190pt),
    cikti((0, 2), [Çıktı "Günümüz Yılını Girin: "], width: 160pt),
    girdi((0, 3), [Giriş gunumuzYili], width: 120pt),
    cikti((0, 4), [Çıktı "Doğum Yılını Girin: "], width: 160pt),
    girdi((0, 5), [Giriş dogumYili], width: 110pt),
    islem((0, 6), [yas = gunumuzYili - dogumYili], width: 170pt),
    cikti((0, 7), [Çıktı "Yaş :" & yas], width: 120pt),
    baslangic((0, 8), [Son]),

    // Bağlantı Okları
    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

2.Kare Alan Çevre 
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel kenar, alan, cevre], width: 150pt),
    cikti((0, 2), [Çıktı "Karenin Bir Kenar Uzunluğunu Girin: "], width: 220pt),
    girdi((0, 3), [Giriş kenar], width: 90pt),
    islem((0, 4), [alan = kenar \* kenar], width: 130pt),
    islem((0, 5), [cevre = kenar \* 4], width: 120pt),
    cikti((0, 6), [Çıktı "Karenin Alanı: " & alan], width: 160pt),
    cikti((0, 7), [Çıktı "Karenin Çevresi: " & cevre], width: 160pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

#pagebreak()
3.Urun KDV'li Fiyat
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel urunFiyat, kdvOran, kdvTutar, toplam], width: 220pt),
    islem((0, 2), [kdvOran = 0.20], width: 110pt),
    cikti((0, 3), [Çıktı "Ürün Fiyatını Giriniz: "], width: 160pt),
    girdi((0, 4), [Giriş urunFiyat], width: 100pt),
    islem((0, 5), [kdvTutar = urunFiyat \* kdvOran], width: 180pt),
    cikti((0, 6), [Çıktı "Ürün Kdv Tutar: " & kdvTutar], width: 170pt),
    islem((0, 7), [toplam = urunFiyat + kdvTutar], width: 180pt),
    cikti((0, 8), [Çıktı "Ürün Toplam Fiyat: " & toplam], width: 180pt),
    baslangic((0, 9), [Son]),

    ..range(9).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

4.Celsius, Fahrenheit Dönüşümü
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel c, f], width: 90pt),
    cikti((0, 2), [Çıktı "Celsius :"], width: 110pt),
    girdi((0, 3), [Giriş c], width: 80pt),
    islem((0, 4), [f = c \* 1.8 + 32], width: 130pt),
    cikti((0, 5), [Çıktı "Fahrenheit :" & f], width: 140pt),
    baslangic((0, 6), [Son]),

    ..range(6).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

#pagebreak()
5.Taksimerte Açlış, Taksi Tutarı
#align(center)[
  #diagram(
    spacing: (0pt, 16pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Reel taksiMetreAcilisTutar, kilometreBasiTutar, \ kilometreYol, odenecekTutar], width: 220pt),
    islem((0, 2), [taksiMetreAcilisTutar = 30], width: 140pt),
    islem((0, 3), [kilometreBasiTutar = 20], width: 130pt),
    cikti((0, 4), [Çıktı "Gidilen Kilometre :"], width: 140pt),
    girdi((0, 5), [Giriş kilometreYol], width: 110pt),
    islem((0, 6), [odenecekTutar = taksimetreAcilisTutar + \ kilometreYol \* kilometreBasiTutar], width: 220pt),
    cikti((0, 7), [Çıktı "Ödenecek Tutar :" & odenecekTutar], width: 170pt),
    baslangic((0, 8), [Son]),

    ..range(8).map(i => edge((0, i), (0, i + 1), "-|>")),
  )
]

*1.2.2.8. Örnek Çalışma Soruları Karar Yapıları*
1. Akıllı Bahçe Sulama Sistemi
#align(center)[
  #diagram(
    spacing: (1pt, 24pt),
    edge-stroke: 1pt,
    mark-scale: 85%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel nem], width: 80pt),
    cikti((1, 2), [Çıktı "Sıcaklık Değerini Giriniz: "], width: 160pt),
    girdi((1, 3), [Giriş nem], width: 80pt),
    karar((1, 4), [nem > 30], width: 90pt),
    cikti((0, 5), [Çıktı "Sulama Başlatıldı"], width: 130pt),
    cikti((2, 5), [Çıktı "Sulama Durduruldu!"], width: 140pt),
    birlesim((1, 6)),
    baslangic((1, 7), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (0, 4), (0, 5), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 4), (2, 4), (2, 5), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 5), (0, 6), (1, 6), "-|>"),
    edge((2, 5), (2, 6), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),
  )
]

2. Bakiye ve Ödeme Kontrolü
#align(center)[
  #diagram(
    spacing: (15pt, 18pt),
    edge-stroke: 1pt,
    mark-scale: 75%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel bakiye, sepet, kalanBakiye], width: 170pt),
    islem((1, 2), [kalanBakiye = 0], width: 100pt),
    cikti((1, 3), [Çıktı "Bakiye Değerini Girin: "], width: 150pt),
    girdi((1, 4), [Giriş bakiye], width: 90pt),
    cikti((1, 5), [Çıktı "Sepet Tutarını Girin: "], width: 150pt),
    girdi((1, 6), [Giriş sepet], width: 90pt),
    karar((1, 7), [bakiye >= sepet], width: 110pt),

    // Yanlış kolu (Sol)
    cikti((0, 8), [Çıktı "Yetersiz Bakiye"], width: 80pt),

    // Doğru kolu (Sağ)
    islem((2, 8), [kalanBakiye = bakiye - sepet], width: 155pt),
    cikti((2, 9), [Çıktı "Ödeme Başarılı. Kalan Bakiye :" & kalanBakiye], width: 150pt),

    birlesim((1, 10)),
    baslangic((1, 11), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),

    edge((1, 7), (0, 7), (0, 8), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((0, 8), (0, 10), (1, 10), "-|>"),

    edge((1, 7), (2, 7), (2, 8), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((2, 8), (2, 9), "-|>"),
    edge((2, 9), (2, 10), (1, 10), "-|>"),

    edge((1, 10), (1, 11), "-|>"),
  )
]

#pagebreak()
3. Vize ve final notunu
#align(center)[
  #diagram(
    spacing: (1pt, 22pt),
    edge-stroke: 1pt,
    mark-scale: 85%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel vize, final, ortalama], width: 150pt),
    cikti((1, 2), [Çıktı "Vize Notunu Girin: "], width: 140pt),
    girdi((1, 3), [Giriş vize], width: 85pt),
    cikti((1, 4), [Çıktı "Final Notunu Girin :"], width: 140pt),
    girdi((1, 5), [Giriş final], width: 85pt),
    islem((1, 6), [ortalama = vize \* 0.4 + final \* 0.6], width: 160pt),
    karar((1, 7), [ortalama >= 50], width: 110pt),
    cikti((0, 8), [Çıktı "Kaldınız! Ortalamanız: " & ortalama], width: 150pt),
    cikti((2, 8), [Çıktı "Geçtiniz Tebrikler! Ortalamanız: " & ortalama], width: 150pt),
    birlesim((1, 9)),
    baslangic((1, 10), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (1, 6), "-|>"),
    edge((1, 6), (1, 7), "-|>"),
    edge((1, 7), (0, 7), (0, 8), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((1, 7), (2, 7), (2, 8), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((0, 8), (0, 9), (1, 9), "-|>"),
    edge((2, 8), (2, 9), (1, 9), "-|>"),
    edge((1, 9), (1, 10), "-|>"),
  )
]

#pagebreak()
4. Web sitesi kargo ücreti hesaplama
#align(center)[
  #diagram(
    spacing: (40pt, 22pt),
    edge-stroke: 1pt,
    mark-scale: 85%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Reel siparisTutar, kargoTutar, toplam], width: 195pt),
    cikti((1, 2), [Çıktı "Sipariş Tutarınızı Giriniz: "], width: 165pt),
    girdi((1, 3), [Giriş siparisTutar], width: 115pt),
    islem((1, 4), [kargoTutar = 50], width: 105pt),
    karar((1, 5), [siparisTutar >= 500], width: 130pt),
    islem((2, 6), [kargoTutar = 0], width: 100pt),
    birlesim((1, 7)),
    islem((1, 8), [toplam = siparisTutar + kargoTutar], width: 185pt),
    cikti((1, 9), [Çıktı "Sipariş Bedeli: " & toplam], width: 155pt),
    baslangic((1, 10), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),
    edge((1, 4), (1, 5), "-|>"),
    edge((1, 5), (0, 5), (0, 7), (1, 7), "-|>", label: [Yanlış], label-pos: 0.25, label-side: right),
    edge((1, 5), (2, 5), (2, 6), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 6), (2, 7), (1, 7), "-|>"),
    edge((1, 7), (1, 8), "-|>"),
    edge((1, 8), (1, 9), "-|>"),
    edge((1, 9), (1, 10), "-|>"),
  )
]

#pagebreak()
5. Pozitif Negatif
#align(center)[
  #diagram(
    spacing: (1pt, 22pt),
    edge-stroke: 1pt,
    mark-scale: 85%,

    baslangic((1, 0), [Ana]),
    islem((1, 1), [Tamsayı sayi], width: 90pt),
    cikti((1, 2), [Çıktı "Bir Tamsayı Giriniz"], width: 140pt),
    girdi((1, 3), [Giriş sayi], width: 85pt),
    karar((1, 4), [sayi == 0], width: 90pt),

    // sayi == 0 Doğru
    cikti((2, 5), [Çıktı sayi & " Sayısı Girildi!"], width: 140pt),

    // sayi == 0 Yanlış -> İç Karar
    karar((0, 5), [sayi > 0], width: 85pt),
    cikti((-1, 6), [Çıktı sayi & " Sayısı Negatif Bir Sayıdır"], width: 150pt),
    cikti((1, 6), [Çıktı sayi & " Sayısı Pozitif Bir Sayıdır"], width: 150pt),
    birlesim((0, 7)),

    birlesim((1, 8)),
    baslangic((1, 9), [Son]),

    edge((1, 0), (1, 1), "-|>"),
    edge((1, 1), (1, 2), "-|>"),
    edge((1, 2), (1, 3), "-|>"),
    edge((1, 3), (1, 4), "-|>"),

    // Dış Karar
    edge((1, 4), (2, 4), (2, 5), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((2, 5), (2, 8), (1, 8), "-|>"),

    edge((1, 4), (0, 4), (0, 5), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),

    // İç Karar
    edge((0, 5), (-1, 5), (-1, 6), "-|>", label: [Yanlış], label-pos: 0.3, label-side: right),
    edge((0, 5), (1, 5), (1, 6), "-|>", label: [Doğru], label-pos: 0.3, label-side: left),
    edge((-1, 6), (-1, 7), (0, 7), "-|>"),
    edge((1, 6), (1, 7), (0, 7), "-|>"),

    edge((0, 7), (0, 8), (1, 8), "-|>"),
    edge((1, 8), (1, 9), "-|>"),
  )
]

#pagebreak()
*1.2.2.12. Örnek Çalışma Soruları Döngü Konusu*
1. Gizli Sayı Bulma
#image("FlowgorithmSorular/flowgorithm_1_2_2_12_soru_1_Sayi_Bulma - Ana.svg")

#pagebreak()
2. Geri Sayım ve Fırlatma
#align(center)[
  #diagram(
    spacing: (32pt, 22pt),
    edge-stroke: 1.1pt,
    mark-scale: 85%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı sayac], width: 95pt),
    islem((0, 2), [sayac = 10], width: 75pt),
    dongu-altigen((0, 3), [sayac >= 0], width: 85pt),

    cikti((2, 4), [Çıktı "Sayac :" & sayac], width: 125pt),
    islem((2, 5), [sayac = sayac - 1], width: 105pt),

    cikti((0, 6), [Çıktı "Fırlatma Başarılı!"], width: 130pt),
    baslangic((0, 7), [Son]),

    edge((0, 0), (0, 1), "-|>"),
    edge((0, 1), (0, 2), "-|>"),
    edge((0, 2), (0, 3), "-|>"),

    edge((0, 3), (2, 3), (2, 4), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 4), (2, 5), "-|>"),
    edge((2, 5), (2, 5.6), (0.3, 5.6), (0.3, 3), "-|>"),

    edge((0, 3), (0, 6), "-|>", label: [Yanlış], label-pos: 0.15, label-side: right),
    edge((0, 6), (0, 7), "-|>"),
  )
]

#pagebreak()
3. Çift Sayıların Çarpımı
#align(center)[
  #diagram(
    spacing: (32pt, 20pt),
    edge-stroke: 1.1pt,
    mark-scale: 85%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı N, carpim, sayac], width: 155pt),
    islem((0, 2), [sayac = 2], width: 75pt),
    islem((0, 3), [carpim = 1], width: 75pt),
    cikti((0, 4), [Çıktı "N degerini Girin: "], width: 140pt),
    girdi((0, 5), [Giriş N], width: 85pt),
    dongu-altigen((0, 6), [sayac <= N], width: 95pt),

    cikti((2, 7), [Çıktı "İslem :" & sayac & " \* " & carpim], width: 170pt),
    islem((2, 8), [carpim = carpim \* sayac], width: 140pt),
    cikti((2, 9), [Çıktı "Carpma Sonuc :" & carpim], width: 160pt),
    cikti((2, 10), [Çıktı "----"], width: 75pt),
    islem((2, 11), [sayac = sayac + 2], width: 110pt),

    cikti((0, 12), [Çıktı "Sonuc :" & carpim], width: 130pt),
    baslangic((0, 13), [Son]),

    edge((0, 0), (0, 1), "-|>"),
    edge((0, 1), (0, 2), "-|>"),
    edge((0, 2), (0, 3), "-|>"),
    edge((0, 3), (0, 4), "-|>"),
    edge((0, 4), (0, 5), "-|>"),
    edge((0, 5), (0, 6), "-|>"),

    edge((0, 6), (2, 6), (2, 7), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 7), (2, 8), "-|>"),
    edge((2, 8), (2, 9), "-|>"),
    edge((2, 9), (2, 10), "-|>"),
    edge((2, 10), (2, 11), "-|>"),
    edge((2, 11), (2, 11.6), (0.35, 11.6), (0.35, 6), "-|>"),

    edge((0, 6), (0, 12), "-|>", label: [Yanlış], label-pos: 0.12, label-side: right),
    edge((0, 12), (0, 13), "-|>"),
  )
]

#pagebreak()
4. Sınıf Not Ortalaması Hesaplama
#align(center)[
  #diagram(
    spacing: (32pt, 20pt),
    edge-stroke: 1.1pt,
    mark-scale: 85%,

    baslangic((0, 0), [Ana]),
    islem((0, 1), [Tamsayı ogrenciAdet, ogrenciNot, \ notToplami, sayac, ortalama], width: 200pt),
    cikti((0, 2), [Çıktı "Öğrenci Adedini Girin:"], width: 155pt),
    girdi((0, 3), [Giriş ogrenciAdet], width: 115pt),
    islem((0, 4), [ogrenciNot = 0], width: 100pt),
    islem((0, 5), [notToplami = 0], width: 100pt),
    islem((0, 6), [sayac = ogrenciAdet], width: 120pt),
    dongu-altigen((0, 7), [sayac >= 1], width: 85pt),

    cikti((2, 8), [Çıktı "Ogrenci Notu Giriniz"], width: 145pt),
    girdi((2, 9), [Giriş ogrenciNot], width: 110pt),
    islem((2, 10), [notToplami = ogrenciNot + notToplami], width: 190pt),
    islem((2, 11), [sayac = sayac - 1], width: 105pt),

    islem((0, 12), [ortalama = notToplami / ogrenciAdet], width: 190pt),
    cikti((0, 13), [Çıktı "Ortalama Sonuc: " & ortalama], width: 180pt),
    baslangic((0, 14), [Son]),

    edge((0, 0), (0, 1), "-|>"),
    edge((0, 1), (0, 2), "-|>"),
    edge((0, 2), (0, 3), "-|>"),
    edge((0, 3), (0, 4), "-|>"),
    edge((0, 4), (0, 5), "-|>"),
    edge((0, 5), (0, 6), "-|>"),
    edge((0, 6), (0, 7), "-|>"),

    edge((0, 7), (2, 7), (2, 8), "-|>", label: [Doğru], label-pos: 0.25, label-side: left),
    edge((2, 8), (2, 9), "-|>"),
    edge((2, 9), (2, 10), "-|>"),
    edge((2, 10), (2, 11), "-|>"),
    edge((2, 11), (2, 11.6), (0.35, 11.6), (0.35, 7), "-|>"),

    edge((0, 7), (0, 12), "-|>", label: [Yanlış], label-pos: 0.12, label-side: right),
    edge((0, 12), (0, 13), "-|>"),
    edge((0, 13), (0, 14), "-|>"),
  )
]

#pagebreak()
5. PIN Kodu
#image("FlowgorithmSorular/flowgorithm_1_2_2_12_soru_5_PIN - Ana.svg")

#pagebreak()
6. Pozitif Sayıları Sayma
#image("FlowgorithmSorular/flowgorithm_1_2_2_12_soru_5_PotitifSayiAdet - Ana.svg")