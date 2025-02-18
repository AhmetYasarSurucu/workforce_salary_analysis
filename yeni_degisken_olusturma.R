# Gerekli kütüphaneleri yükleyin
if(!require(readr)) install.packages("readr", dependencies = TRUE)
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)
if(!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# 1. TXT dosyasını yükleme
dosya_yolu <- "df_grup_27.xlsx" # Dosyanızın tam yolunu belirtin
data <- read.xlsx(dosya_yolu, sheet = 1) # Veriyi yükleme

# 2. Deneyim seviyelerini sayısal olarak kodlama
data$experience_level_numeric <- case_when(
  data$experience_level == "EN" ~ 1,
  data$experience_level == "MI" ~ 2,
  data$experience_level == "SE" ~ 3,
  data$experience_level == "EX" ~ 4,
  TRUE ~ NA_real_
)

# 3. Deneyim seviyesine göre maaş oranı hesaplama
data$salary_per_experience_level <- data$salary_in_usd / data$experience_level_numeric

# 4. Yeni Excel dosyası kaydetme
yeni_excel_dosya_yolu <- "ek_degiskenli.xlsx" # Kaydedilecek yeni Excel dosyası
write.xlsx(data, file = yeni_excel_dosya_yolu)

# 5. İşlemin başarılı olduğunu bildiren mesaj gösterme
cat("Yeni Excel dosyası", yeni_excel_dosya_yolu, "olarak kaydedildi.")
