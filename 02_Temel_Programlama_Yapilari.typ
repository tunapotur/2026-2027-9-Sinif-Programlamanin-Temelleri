#import "pageGeneralConfig.typ": *
#import "lib/qr_code.typ": *

#show: conf

#set document(title: "2026-2027 9. Sınıf Programlamanın Temelleri")

#title()

#outline(title: "İçindekiler", indent: 12pt)
#pagebreak(to: "odd")
#counter(page).update(1)
#set page(numbering: "1")

// #title()

// Unite 01 Bilgisayar Nedir
#include "02_Files/Unite_01_Bilgisayar_Nedir/bilgisayr_nedir.typ"

// Unite 02 Degisken ve Bellek
#include "02_Files/degisken_ve_bellek.typ"

#include "02_Files/veri_turleri_ve_ram_kullanimi.typ"

#include "02_Files/python_dili.typ"

#include "02_Files/tur_donucumu_degiskenler.typ"

// Unite 03 Operatorler
#include "02_Files/operatorler.typ"

// Unite 04 Fonksiyon Kullanımı
#include "02_Files/fonksiyon_kullanimi.typ"
#include "02_Files/type-fonksiyonu.typ"

// TODO sorulari bölüm sonlarına yerlestir
#pagebreak()
#include "02_Files/bolum_sorulari.typ"
#pagebreak()
#include "02_Files/bolum_sorulari_cevaplari.typ"

#pagebreak()
#include "02_Files/bolum_uygulama_sorular.typ"
#pagebreak()
#include "02_Files/bolum_uygulama_sorulari_cevaplari.typ"

#pagebreak()
#include "02_Files/infographic/infografikler.typ"
// infografik dosyaları
#include "02_Files/infographic/bilgisayarin_dili.typ"
#include "02_Files/infographic/degisken_ve_bellek.typ"
#include "02_Files/infographic/veri_turleri.typ"
#include "02_Files/infographic/ram_islemci_iliskisi.typ"
#include "02_Files/infographic/bellek_yonetimi.typ"
#include "02_Files/infographic/tur_donusumu.typ"
#include "02_Files/infographic/operatorler.typ"
#include "02_Files/infographic/fonksiyon_kullanimi.typ"
#include "02_Files/infographic/input_print.typ"

#pagebreak()
#include "02_Files/bilgisayar_nedir.typ"
