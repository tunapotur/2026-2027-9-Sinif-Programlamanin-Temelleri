#import "pageGeneralConfig.typ": *
#import "lib/qr_code.typ": *

#show: conf

#set document(title: "2026-2027 9. Sınıf Programlamanın Temelleri")
#align(center)[
  #title()
]

#outline(title: "İçindekiler", indent: 12pt)
#pagebreak(to: "odd")
#counter(page).update(1)
#set page(numbering: "1")

= Temel Programlama Yapıları

// Unite 01 Bilgisayar Nedir
#include "02_Files/Unite_01_Bilgisayar_Nedir/01_bilgisayr_nedir.typ"
#include "02_Files/Unite_01_Bilgisayar_Nedir/02_makinenin_dilinden_insan_diline.typ"
#include "02_Files/Unite_01_Bilgisayar_Nedir/03_Sorular.typ"
#include "02_Files/Unite_01_Bilgisayar_Nedir/04_Soru-Cevaplari.typ"
#pagebreak()

// Unite 02 Degisken ve Bellek
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/01_degisken_ve_bellek.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/02_veri_turleri_ve_ram_kullanimi.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/03_bellek-yonetimi.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/04_python_dili.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/05_tur_donusumu.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/06_Sorular.typ"
#include "02_Files/Unite_02_Degiskenler_ve_Bellek/07_Soru-Cevaplari.typ"
#pagebreak()

// Unite 03 Operatorler
#include "02_Files/Unite_03_Operatorler/01_operatorler.typ"
#include "02_Files/Unite_03_Operatorler/02_Sorular.typ"
#include "02_Files/Unite_03_Operatorler/03_Soru-Cevaplari.typ"
#pagebreak()

// Unite 04 Fonksiyon Kullanımı
#include "02_Files/Unite_04_Fonksiyonlarin_Kullanimi/01_fonksiyon_kullanimi.typ"
#include "02_Files/Unite_04_Fonksiyonlarin_Kullanimi/02_type-fonksiyonu.typ"
#include "02_Files/Unite_04_Fonksiyonlarin_Kullanimi/03_ornek_uygulamalar.typ"
#include "02_Files/Unite_04_Fonksiyonlarin_Kullanimi/04_Sorular.typ"
#include "02_Files/Unite_04_Fonksiyonlarin_Kullanimi/05_Soru-Cevaplari.typ"
#pagebreak()

/*
/// TODO sorulari bölüm sonlarına yerlestir

02_Files aldında konuları Unite_01, Unite_02 gibi klasörlere topladık.
bu konulara göre aşağıda ki sorular dosyalarından ilgili ünitelere göre soruları ve cevapları altta dosya isimlerinden al her her ünite klasörünün altına en sona yeni dosya olarak oluştur ve soruları buraya taşı aşağıda ki soru dosyalarından taşı.
Örneğin Unite_01_Bilgisayar_Nedir\03_Sorular, Unite_01_Bilgisayar_Nedir\03_Soru-Cevaplari şekilinde oluştur ve alttan buraya taşı.
=== Bölüm Soruları
Soru 1 gibi dosyanını içine oluştur
! Konulara göre ayrımı yapman çok önemli

02_Files\bilgisayar_nedir-sorular.typ
02_Files\bolum_sorulari.typ
02_Files\bolum_sorulari_cevaplari.typ


#pagebreak()
#include "02_Files/bolum_uygulama_sorular.typ"
#pagebreak()
#include "02_Files/bolum_uygulama_sorulari_cevaplari.typ"



/// infografik dosyaları
#pagebreak()
#include "02_Files/infographic/kapak-infografikler.typ"
#include "02_Files/infographic/bilgisayarin_dili.typ"
#include "02_Files/infographic/degisken_ve_bellek.typ"
#include "02_Files/infographic/veri_turleri.typ"
#include "02_Files/infographic/ram_islemci_iliskisi.typ"
#include "02_Files/infographic/bellek_yonetimi.typ"
#include "02_Files/infographic/tur_donusumu.typ"
#include "02_Files/infographic/operatorler.typ"
#include "02_Files/infographic/fonksiyon_kullanimi.typ"
#include "02_Files/infographic/input_print.typ"

*/