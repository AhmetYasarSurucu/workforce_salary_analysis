# Gerekli kütüphaneleri yükleyin
if(!require(readr)) install.packages("readr", dependencies = TRUE)
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)

# 1. TXT dosyasını yükleme
dosya_yolu <- "df_grup_27.txt" # Dosyanızın tam yolunu belirtin
data <- read_csv(dosya_yolu) # Veriyi yükleme

# 2. Veriyi Excel formatında kaydetme
excel_dosya_yolu <- "df_grup_27.xlsx" # Kaydedilecek Excel dosyasının adı ve yolu
write.xlsx(data, file = excel_dosya_yolu)

# 3. İşlemin başarılı olduğunu bildiren mesaj gösterme
cat("Veri başarıyla", excel_dosya_yolu, "dosyasına kaydedildi.")
