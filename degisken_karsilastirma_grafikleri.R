# Gerekli kütüphaneleri yükleyin
if(!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if(!require(dplyr)) install.packages("dplyr", dependencies = TRUE)
if(!require(tidyr)) install.packages("tidyr", dependencies = TRUE)
if(!require(gridExtra)) install.packages("gridExtra", dependencies = TRUE)
if(!require(corrplot)) install.packages("corrplot", dependencies = TRUE)

# Veriyi yükleme
library(readxl)
data <- read_excel("ek_degiskenli.xlsx")

# Maaş değerlerini makul bir aralık ile sınırlama
data <- data %>% filter(salary < 500000, salary_per_experience_level < 100000)

# 3.4 GRUPLAR ARASINDAKİ FARKLILIKLAR
# Salary'a göre Experience Level farklılıkları
salary_experience_plot <- ggplot(data, aes(x = experience_level, y = salary, fill = experience_level)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Experience Level", x = "Experience Level", y = "Salary") +
  theme_minimal()

# Remote Ratio'a göre Salary farklılıkları
salary_remote_plot <- ggplot(data, aes(x = factor(remote_ratio), y = salary, fill = factor(remote_ratio))) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Remote Ratio", x = "Remote Ratio", y = "Salary") +
  theme_minimal()

# Employment Type'a göre Salary farklılıkları
salary_employment_plot <- ggplot(data, aes(x = employment_type, y = salary, fill = employment_type)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Employment Type", x = "Employment Type", y = "Salary") +
  theme_minimal()

# Tüm grafikleri yan yana göster
library(gridExtra)
grid.arrange(salary_experience_plot, salary_remote_plot, salary_employment_plot, ncol = 3)

# 3.5 DEĞİŞKENLERİN BİRBİRLERİYLE İLİŞKİSİ
# Korelasyon matrisi için sadece sayısal değişkenleri seçme
numeric_data <- data %>% select_if(is.numeric)
corr_matrix <- cor(numeric_data, use = "complete.obs")

# Sayısal değişkenleri seçerek korelasyon matrisi oluşturma
numeric_data <- data %>% select_if(is.numeric)
corr_matrix <- cor(numeric_data, use = "complete.obs")

# Korelasyon grafiğini detaylandırma
library(corrplot)
corrplot(
  corr_matrix, 
  method = "circle", 
  type = "upper", 
  tl.col = "black", 
  tl.cex = 0.8, 
  title = "Enhanced Correlation Matrix", 
  mar = c(0, 0, 1, 0),
  addCoef.col = "darkblue",          # Korelasyon katsayılarını ekler
  number.cex = 0.7,                   # Katsayıların boyutu
  diag = FALSE,                       # Diagonal ekseni gizler
  order = "original"                 # Değişken sırasını korur
)

# Korelasyon grafiği altına bilgi notu ekleme
cat("Not: Grafikteki renkler ve boyutlar, korelasyonun yönünü ve gücünü göstermektedir. Koyu mavi, pozitif korelasyonu; kırmızı, negatif korelasyonu temsil eder. Katsayılar yuvarlanmış değerlerdir.")


#######################################3
# Maaş değerlerini filtreleme
data <- data %>% filter(salary < 500000, salary_per_experience_level < 100000)

# Salary'a göre Company Size farklılıkları
ggplot(data, aes(x = company_size, y = salary, fill = company_size)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Company Size", x = "Company Size", y = "Salary") +
  theme_minimal()

# Salary'a göre Employee Residence farklılıkları (ilk 10 lokasyon)
top_residences <- data %>% 
  count(employee_residence, sort = TRUE) %>% 
  slice(1:10) %>% 
  pull(employee_residence)

data_filtered <- data %>% filter(employee_residence %in% top_residences)

ggplot(data_filtered, aes(x = employee_residence, y = salary, fill = employee_residence)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Employee Residence (Top 10)", x = "Employee Residence", y = "Salary") +
  theme_minimal()

# Salary'a göre Job Title farklılıkları (ilk 10 pozisyon)
top_jobs <- data %>% 
  count(job_title, sort = TRUE) %>% 
  slice(1:10) %>% 
  pull(job_title)

data_filtered_jobs <- data %>% filter(job_title %in% top_jobs)

ggplot(data_filtered_jobs, aes(x = job_title, y = salary, fill = job_title)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 500000)) +
  labs(title = "Salary Differences by Job Title (Top 10)", x = "Job Title", y = "Salary") +
  coord_flip() +
  theme_minimal()

