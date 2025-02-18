# Gerekli kütüphaneleri yükleyin
if(!require(readr)) install.packages("readr", dependencies = TRUE)
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)
if(!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# 1. TXT dosyasını yükleme
dosya_yolu <- "df_grup_27.xlsx" # Dosyanızın tam yolunu belirtin
data <- read.xlsx(dosya_yolu, sheet = 1) # Veriyi yükleme

# 2. Veri yapısı hakkında bilgiler
variable_count <- ncol(data) # Değişken sayısı
observation_count <- nrow(data) # Gözlem sayısı
structure_info <- str(data) # Değişkenlerin yapısı

detail_info <- data.frame(
  Variable = colnames(data),
  Type = sapply(data, class),
  Unique_Values = sapply(data, function(x) length(unique(x))),
  Missing_Values = sapply(data, function(x) sum(is.na(x)))
)

# 3. Bilgileri Excel'e aktarma
excel_dosya_yolu <- "df_structure_info.xlsx" # Kaydedilecek Excel dosyası
write.xlsx(list(
  "Summary" = data.frame(
    Metric = c("Variable Count", "Observation Count"),
    Value = c(variable_count, observation_count)
  ),
  "Details" = detail_info
), file = excel_dosya_yolu)

# 4. İşlemin başarılı olduğunu bildiren mesaj gösterme
cat("Veri yapısı bilgileri", excel_dosya_yolu, "dosyasına kaydedildi.")
