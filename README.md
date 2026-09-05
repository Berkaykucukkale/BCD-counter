# Basys-3 0-9999 BCD Counter (7-Segment Display)

Bu proje, Xilinx Basys-3 FPGA kartı üzerinde donanım tanımlama dili (Verilog HDL) kullanılarak geliştirilmiş, 0000'dan 9999'a kadar sayabilen 4 haneli bir BCD (Binary-Coded Decimal) sayıcı tasarımıdır. Sistem, multiplexing (çoğullama) yöntemiyle 4 haneli 7-segment ekranı dinamik olarak sürmektedir.

Proje Linki: https://www.realdigital.org/doc/0bfaffd4efce9695a5aeec5595ae1949

## 🛠 Donanım ve Araçlar
* **Geliştirme Kartı:** Xilinx Basys-3 FPGA (Artix-7)
* **Yazılım:** Xilinx Vivado
* **Dil:** Verilog HDL

## ⚙️ Sistem Mimarisi ve Modüller

Proje, saat bölme, sayma, çoklama ve ekran sürme işlemlerini gerçekleştiren 5 temel modülden oluşmaktadır:

1. **`final.v` (Top Module):**
   Tüm alt modüllerin birbirine bağlandığı ana donanım çatısıdır. Saat bölücü, sayıcı, çoklayıcı ve ekran sürücü modüllerini kablolarla (wire) bir araya getirerek senkronize bir donanım mimarisi oluşturur.

2. **`counter.v` (Clock Divider):**
   Basys-3'ün 100 MHz'lik ana saatini böler. Sayıcının 22. ve 23. bitlerini (`divided_clock`) ekran taraması (multiplexing) için, 23. bitini (`numnum`) ise sayıcının artış hızını tetiklemek için kullanır.

3. **`BCD.v` (Binary-Coded Decimal Counter):**
   Sistemin sayma mantığıdır. Gelen saat sinyaline göre 16-bitlik sayıyı 4'er bitlik paketler (nibble) halinde artırır. Her hane 9'a ulaştığında sıfırlanır ve bir sonraki haneyi tetikleyerek (cascade) 0000-9999 arası düzgün bir onluk taban (decimal) sayımı yapar.

4. **`mux.v` (Multiplexer):**
   Sayıcıdan gelen 16-bitlik sayının (`namnam`), o an ekranda hangi hane aktifse o haneye ait 4 bitlik kısmını (`[3:0]`, `[7:4]`, `[11:8]` veya `[15:12]`) seçerek çıkışa (`exit`) aktarır.

5. **`indicator.v` (7-Segment & Anode Controller):**
   Mux'tan gelen 4-bitlik BCD veriyi alıp ekranda rakamların yanmasını sağlayan 7-bitlik `segments` sinyaline çevirir (Decoder). Aynı zamanda 2-bitlik seçici sinyale göre 4 haneden hangisinin o an aktif olacağını (`katots`) belirler.

## 🚀 Kurulum ve Çalıştırma

1. Projeyi Xilinx Vivado'da açın.
2. Klasördeki tüm `.v` uzantılı dosyaları projeye dahil edip `final.v` dosyasını **Top Module** olarak ayarlayın.
3. Constraint (`.xdc`) dosyanızda şu pin eşleştirmelerini yapın:
   * `clock100` -> Basys-3'ün 100 MHz saat pini (W5).
   * `resetpin` / `resetpincounter` -> Sistemin sıfırlanması için atanacak butonlar.
   * `numbers[6:0]` -> 7-segment ekranın katot pinleri (A-G).
   * `segmentation[3:0]` -> 7-segment ekranın anot (hane seçici) pinleri.
4. Sentezleme aşamasında hata almamak için `final.v` içindeki `selection_mux_and_segmnet` yazım hatasını `selection_mux_and_segment` olarak düzelttiğinizden emin olun.
5. **Generate Bitstream** işlemini tamamlayıp `.bit` dosyasını donanıma yükleyin.
