# Gerekli kütüphaneleri yükleyin
if(!require(readr)) install.packages("readr", dependencies = TRUE)
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)
if(!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# 1. Excel dosyasını yükleme
dosya_yolu <- "ek_degiskenli.xlsx" # Yüklediğiniz dosyanın yolu
data <- read.xlsx(dosya_yolu, sheet = 1) # Veriyi yükleme

# 2. Sütunların türlerine göre ayrılması
numeric_columns <- sapply(data, is.numeric)
categorical_columns <- sapply(data, function(x) is.character(x) || is.factor(x))

# 3. Sayısal değişkenler için tanımlayıcı istatistikler
numeric_stats <- data.frame(
  Variable = names(data)[numeric_columns],
  Min = sapply(data[, numeric_columns], min, na.rm = TRUE),
  Max = sapply(data[, numeric_columns], max, na.rm = TRUE),
  Mean = sapply(data[, numeric_columns], mean, na.rm = TRUE),
  Median = sapply(data[, numeric_columns], median, na.rm = TRUE),
  SD = sapply(data[, numeric_columns], sd, na.rm = TRUE),
  NA_Count = sapply(data[, numeric_columns], function(x) sum(is.na(x)))
)

# 4. Kategorik değişkenler için tanımlayıcı istatistikler
categorical_stats <- data.frame(
  Variable = names(data)[categorical_columns],
  Unique_Values = sapply(data[, categorical_columns], function(x) length(unique(x))),
  Most_Frequent = sapply(data[, categorical_columns], function(x) names(sort(table(x), decreasing = TRUE)[1])),
  Frequency = sapply(data[, categorical_columns], function(x) max(table(x))),
  NA_Count = sapply(data[, categorical_columns], function(x) sum(is.na(x)))
)

# 5. Tüm istatistiklerin Excel'e aktarılması
yeni_excel_dosya_yolu <- "tanimlayici_istatistikler_duzenli.xlsx" # Kaydedilecek dosya
write.xlsx(list(
  "Numeric_Statistics" = numeric_stats,
  "Categorical_Statistics" = categorical_stats
), file = yeni_excel_dosya_yolu)

# 6. İşlemin başarılı olduğunu bildiren mesaj gösterme
cat("Tüm tanımlayıcı istatistikler", yeni_excel_dosya_yolu, "dosyasına kaydedildi.")
