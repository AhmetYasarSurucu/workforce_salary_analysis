# Gerekli kütüphaneleri yükleyin
if(!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if(!require(dplyr)) install.packages("dplyr", dependencies = TRUE)
if(!require(readr)) install.packages("readr", dependencies = TRUE)
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)

# 1. Veriyi Yükleme
dosya_yolu <- "ek_degiskenli.xlsx" # Verinizin yolunu belirtin
data <- read.xlsx(dosya_yolu, sheet = 1)

# Salary değerlerini filtreleme (Aykırı değerleri çıkarma)
data <- data %>% filter(salary < 1000000) # 1.000.000'dan büyük maaşlar filtreleniyor

# 2. Grafikler
# Salary (Sayısal Değişken) - Histogram ve Ortalama Çizgisi

ggplot(data, aes(x = salary)) +
  geom_histogram(binwidth = 10000, fill = "steelblue", color = "black") +
  geom_vline(aes(xintercept = mean(salary, na.rm = TRUE)), color = "red", linetype = "dashed", size = 1) +
  scale_x_continuous(labels = scales::comma, breaks = seq(0, max(data$salary), by = 50000)) +
  labs(title = "Salary Distribution", x = "Salary", y = "Frequency") +
  annotate("text", x = max(data$salary)*0.8, y = max(table(data$salary))*3, 
           label = "--- mean salary", color = "red") +
  theme_minimal()

# Salary Per Experience Level - Histogram ve Ortalama Çizgisi
ggplot(data, aes(x = salary_per_experience_level)) +
  geom_histogram(binwidth = 10000, fill = "darkorange", color = "black") +
  geom_vline(aes(xintercept = mean(salary_per_experience_level, na.rm = TRUE)), color = "red", linetype = "dashed", size = 1) +
  scale_x_continuous(labels = scales::comma, breaks = seq(0, max(data$salary_per_experience_level), by = 30000)) +
  labs(title = "Salary Per Experience Level Distribution", x = "Salary Per Experience Level", y = "Frequency") +
  annotate("text", x = max(data$salary_per_experience_level)*0.8, y = max(table(data$salary_per_experience_level))*3, 
           label = "--- mean", color = "red") +
  theme_minimal()



# Job Title (Kategorik Değişken - Çok Kategorili)
top_jobs <- data %>%
  count(job_title) %>%
  top_n(10, wt = n) %>%
  arrange(desc(n))

ggplot(top_jobs, aes(x = reorder(job_title, n), y = n)) +
  geom_bar(stat = "identity", fill = "coral") +
  labs(title = "Top 10 Job Titles", x = "Job Title", y = "Frequency") +
  coord_flip() +
  theme_minimal()



ggplot(data, aes(y = salary)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Salary Boxplot", y = "Salary") +
  theme_minimal()

# Remote Ratio (Sayısal Değişken)
ggplot(data, aes(x = factor(remote_ratio))) +
  geom_bar(fill = "purple") +
  labs(title = "Remote Ratio Distribution", x = "Remote Ratio", y = "Count") +
  theme_minimal()

# Salary Per Experience Level (Sayısal Değişken)

ggplot(data, aes(y = salary_per_experience_level)) +
  geom_boxplot(fill = "lightgreen", color = "darkgreen") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Salary Per Experience Level Boxplot", y = "Salary Per Experience Level") +
  theme_minimal()

# Salary Currency (Kategorik Değişken)
ggplot(data, aes(x = salary_currency)) +
  geom_bar(fill = "gold") +
  labs(title = "Salary Currency Distribution", x = "Currency", y = "Count") +
  theme_minimal()

# Employee Residence (Kategorik Değişken)
top_residence <- data %>%
  count(employee_residence) %>%
  top_n(10, wt = n) %>%
  arrange(desc(n))

ggplot(top_residence, aes(x = reorder(employee_residence, n), y = n)) +
  geom_bar(stat = "identity", fill = "pink") +
  labs(title = "Top 10 Employee Residences", x = "Residence", y = "Frequency") +
  coord_flip() +
  theme_minimal()

# Company Location (Kategorik Değişken)
top_locations <- data %>%
  count(company_location) %>%
  top_n(10, wt = n) %>%
  arrange(desc(n))

ggplot(top_locations, aes(x = reorder(company_location, n), y = n)) +
  geom_bar(stat = "identity", fill = "lightpink") +
  labs(title = "Top 10 Company Locations", x = "Location", y = "Frequency") +
  coord_flip() +
  theme_minimal()

# Company Size (Kategorik Değişken)
company_size_count <- table(data$company_size)
pie(company_size_count, 
    main = "Company Size Distribution", 
    col = c("cyan", "lightgreen", "pink"))

# Grafiklerin başarıyla oluşturulduğunu bildiren mesaj
cat("Grafikler başarıyla oluşturuldu ve analiz için hazır!")

