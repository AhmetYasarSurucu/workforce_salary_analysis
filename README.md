İçindekiler
1. GİRİŞ	3
1.1 Veri Hangi Amaçlarla Kullanılabilir?	3
1.2 Siz Olsanız Bu Veri Kümesini Hangi Amaç İçin Kullanırdınız?	3
1.3 Bu Amaç İçin Gerekli Olan Araştırma Sorularınız Nelerdir?	3
1.4 Araştırma Sorularınıza Cevap Verebilecek Olan İstatistiksel Analizler ve Açıklamaları	3
2. VERİ HAZIRLAMA	4
2.1 Değişken ve Gözlem Sayısı	4
2.2 Değişkenlerin Yapısı Hakkında	4
2.3 Değişkenlerden Elde Başka Yeni Değişkenler	5
3. ANALİZ	5
3.1 Kullanılan Paketler ve Fonksiyonlarla İlgili Özet Bilgi	5
3.1.1. readr Paketi	5
3.1.2. openxlsx Paketi	6
3.1.3. dplyr Paketi	6
3.1.4. gridExtra Paketi	6
3.1.5. ggplot2 Paketi	6
3.1.6. corrplot Paketi	7
3.1.7. scales Paketi	7
3.2 Tanımlayıcı İstatistikler	7
3.2.1 Sayısal İstatistikler	7
3.2.1 Kategorik İstatistikler	8
3.3 Değişken Grafikleri	8
3.4 Gruplar Arasındaki Farklılıklar	15
3.5 Değişkenlerin Birbirleriyle İlişkisi	17
4. ÖZET	18
4.1. Analizlerin Sonuç Yorumlamaları	18
4.2. Analizdeki İlginç Yorumlamalar	19
4.3. Analizdeki Eksik Yönler ve Geliştirilebilecek Alanlar	19
5.Kaynakça	20




1. GİRİŞ
1.1 VERİ HANGİ AMAÇLARLA KULLANILABİLİR?
Veriler, iş dünyasında çalışanların maaşları, iş pozisyonları, deneyim seviyeleri ve çalışma koşulları bilgilerini içermektedir. 
	İş gücü analizi yapmak ve çalışan profillerini incelemek.
	İş piyasasındaki dinamikleri anlamak.
	Maaşları analiz ederek sektörler arası kıyaslamalar yapmak.
	Uzaktan çalışma oranlarının yaygınlığını araştırmak.
	Koşulların maaşlara etkisini incelemek.
o	Deneyim seviyesine göre maaş dağılımını analiz etmek.
o	Şirket büyüklüğünün maaş politikaları üzerindeki etkilerini incelemek.
o	Çalışanların lokasyonlarına göre maaş farklılıklarını belirlemek.

1.2 SİZ OLSANIZ BU VERİ KÜMESİNİ HANGİ AMAÇ İÇİN KULLANIRDINIZ?
Ben bu veri kümesini kullanaraktan sektördeki koşulların maaşlara etkisini analiz ederek insanların iş arayışlarında daha uygun, yerinde kararlar alabilmelerini ve maaş beklentilerini araştırarak kariyer planlama süreçlerine katkıda bulunmayı sağlamak isterim. Böylece piyasada daha adil bir maaş dengesi elde edilebilir.  

1.3 BU AMAÇ İÇİN GEREKLİ OLAN ARAŞTIRMA SORULARINIZ NELERDİR?
	Deneyim seviyeleri maaş seviyelerini nasıl etkiliyor?
	Çalışma tipi (uzaktan, hibrit veya ofis) maaşlarda ne tür farklılıklar yaratıyor?
	Aynı iş pozisyonları farklı şirketlerde maaş açısından nasıl farklılık gösteriyor?
	Uzaktan çalışmanın tercih edilmesi, maaş oranları ile nasıl bir ilişki gösteriyor?

1.4 ARAŞTIRMA SORULARINIZA CEVAP VEREBİLECEK OLAN İSTATİSTİKSEL ANALİZLER VE AÇIKLAMALARI
Soru 1: Deneyim seviyeleri maaş seviyelerini nasıl etkiliyor?
	Regresyon Analizi kullanılabilir. Deneyim seviyesi gibi bağımsız bir değişkenin maaş üzerindeki etkisini ölçmek için çoklu regresyon modeli oluşturulabilir. 

Soru 2: Çalışma tipi (uzaktan, hibrit veya ofis) maaşlarda ne tür farklılıklar yaratıyor?
	Varyans Analizi (ANOVA) uygulanabilir. Farklı çalışma tiplerinin maaşlar üzerindeki etkisi test edilerek gruplar arasında anlamlı bir fark olup olmadığı incelenebilir.

Soru 3: Aynı iş pozisyonları farklı şirketlerde maaş açısından nasıl farklılık gösteriyor?
	ANOVA veya t-Testi kullanılabilir. Şirketlere göre maaşların farklılıklarını analiz etmek için bu yöntemler kullanılabilir. 
	Ki-Kare Testi ile kategorik değişkenler arasındaki ilişkiler incelenebilir.

Soru 4: Uzaktan çalışmanın tercih edilmesi, maaş oranları ile nasıl bir ilişki gösteriyor?
	Korelasyon Analizi kullanılabilir. Uzaktan çalışma oranları ile maaş arasında bir ilişki olup olmadığını ve bu ilişkinin yönünü belirleyebiliriz.

2. VERİ HAZIRLAMA
2.1 DEĞİŞKEN VE GÖZLEM SAYISI
   
![image](https://github.com/user-attachments/assets/8cfd4fee-3428-4b97-a175-9bd3cb92b659)


Veri kümesinde toplam 11 değişken ve 5000 gözlem vardır.


2.2 DEĞİŞKENLERİN YAPISI HAKKINDA
![image](https://github.com/user-attachments/assets/b2a34911-a219-4b78-bd25-9d233c26d4c2)

Veri kümesinin oldukça temiz ve eksik veri içermemektedir. Analiz sürecine doğrudan başlanabilmesi için oldukça iyi bir durumdur. 
"Job_title", "salary", ve "salary_in_usd" gibi değişkenlerin yüksek benzersiz değer sayıları, maaş dinamikleri ve iş pozisyonları arasındaki ilişkiyi detaylı inceleme fırsatı vermekte. 
"experience_level" ve "employment_type" gibi kategorik değişkenlerin sınırlı ancak anlamlı dağılım göstermesi açıklayıcı analizler elde etmemizi kolaylaştıracaktır.

2.3 DEĞİŞKENLERDEN ELDE BAŞKA YENİ DEĞİŞKENLER
Veri kümesinde mevcut değişkenler kullanılarak daha fazla bilgi sağlayacak yeni bir değişken oluşturulmuştur. 
Oluşturulan Yeni Değişken:
salary_per_experience_level (Deneyim Seviyesine Göre Maaş Oranı)
Amaç:
Her bir deneyim seviyesinin maaş üzerindeki etkisini karşılaştırılabilir bir hale getirmek amaçlanmıştır. 
Nasıl Oluşturuldu?
1.	experience_level Değişkeni Kodlandı:
	experience_level kategorik değişkeni sıralı bir şekilde sayısal değerlere dönüştürüldü:
•	EN (Entry-Level): 1
•	MI (Mid-Level): 2
•	SE (Senior-Level): 3
•	EX (Executive-Level): 4 
2.	Maaş Oranı Hesaplandı:
	Her bir çalışan için maaş (salary_in_usd) deneyim seviyesine bölündü:
[salary_per_experience_level = salary_in_usd / experience_level_numeric]

Hesaplanan değerler, veri setine salary_per_experience_level adlı yeni bir sütun olarak eklendi.

3. ANALİZ
3.1 KULLANILAN PAKETLER VE FONKSİYONLARLA İLGİLİ ÖZET BİLGİ
Veri analizi ve görselleştirme işlemleri için çeşitli R paketleri ve fonksiyonlar kullanılmıştır. Aşağıda kullanılan paketler ve bu paketlere ait önemli fonksiyonlar özetlenmiştir.
3.1.1. readr Paketi
•	Amaç: CSV ve düz metin dosyalarını hızlı ve kolay bir şekilde okumak ve yazmak.
•	Kullanılan Fonksiyonlar:
•	read_csv(): CSV dosyalarını veri çerçevesine dönüştürmek için kullanılır.
•	write_csv(): Veri çerçevelerini CSV formatında kaydetmek için kullanılır.
3.1.2. openxlsx Paketi
•	Amaç: Excel dosyalarını okuma ve yazma işlemlerini gerçekleştirmek.
•	Kullanılan Fonksiyonlar:
•	read.xlsx(): Excel dosyalarını içe aktarmak için kullanılır.
•	write.xlsx(): Veri çerçevelerini Excel formatında kaydetmek için kullanılır.

3.1.3. dplyr Paketi
•	Amaç: Veri manipülasyonu ve dönüştürme işlemlerinde kullanılır.
•	Kullanılan Fonksiyonlar:
•	filter(): Belirli koşullara göre satırları filtrelemek.
•	mutate(): Yeni değişkenler eklemek veya mevcut olanları değiştirmek.
•	select(): Veri çerçevesindeki belirli sütunları seçmek.
•	arrange(): Veriyi sıralamak.

3.1.4. gridExtra Paketi
•	Amaç: Birden fazla grafiği bir arada düzenlemek ve göstermek.
•	Kullanılan Fonksiyonlar:
•	grid.arrange(): Birden fazla grafiği yan yana veya alt alta düzenlemek için kullanılır.

3.1.5. ggplot2 Paketi
•	Amaç: Veri görselleştirme ve grafik oluşturma.
•	Kullanılan Fonksiyonlar:
•	ggplot(): Veri görselleştirme için temel yapı taşıdır.
•	geom_boxplot(): Kategorik ve sayısal değişkenler arasındaki ilişkiyi görselleştirmek için kullanılmıştır.
•	geom_histogram(): Sayısal değişkenlerin dağılımını incelemek için kullanılmıştır.
•	geom_point(): İki sayısal değişken arasındaki ilişkiyi göstermek için scatter plot oluşturur.
•	geom_smooth(): Verilere doğrusal regresyon çizgisi eklemek için kullanılmıştır.
•	labs(), scale_x_continuous(), theme_minimal(): Grafiklerin eksen etiketlerini ve tasarımını özelleştirmek için kullanılmıştır.

3.1.6. corrplot Paketi
•	Amaç: Korelasyon matrislerini görselleştirme.
•	Kullanılan Fonksiyonlar:
•	corrplot(): Korelasyon matrislerini grafiksel olarak temsil etmek için kullanılmıştır. Kullanılan parametrelerle grafik özelleştirilmiştir (örneğin, renkler, katsayılar, hiyerarşik düzenleme).
3.1.7. scales Paketi
•	Amaç: Grafiklerde sayısal verilerin etiketlendirilmesi.
•	Kullanılan Fonksiyonlar:
•	comma(): Grafiklerde eksen etiketlerinin okunabilirliğini artırmak için kullanılmıştır.


3.2 TANIMLAYICI İSTATİSTİKLER
3.2.1 Sayısal İstatistikler
![image](https://github.com/user-attachments/assets/a0d8fb90-bb5f-434f-add3-73e3b8732d17)

Salary değişkeninde maaşların ortalama değeri 165,545 USD iken, medyan değerin 141,300 USD olması, maaş dağılımında çarpıklık olduğunu göstermektedir. 
Remote_ratio için ortalama değer 32.29 olup, bu oran uzaktan çalışmanın genelde düşük seviyelerde olduğunu göstermektedir. 
Experience_level_numeric değişkeninde deneyim seviyelerinin ortalaması 2.65 olması çalışanların büyük bir kısmının orta düzey deneyim seviyesinde olduğunu göstermektedir. 
Salary_per_experience_level değişkeninde yüksek standart sapma (29,505) maaşların deneyim seviyelerine göre çokça değişkenlik göstermektedir.

3.2.1 Kategorik İstatistikler
![image](https://github.com/user-attachments/assets/5ab1480c-ae4e-4cee-9a43-cba6a083289b)

Experience_level değişkeninde dört farklı deneyim seviyesi bulunmaktadır. En yaygın seviyenin "Senior-Level (SE)" olduğu görülmektedir (3289 gözlem). 
Employment_type değişkeninde "Full-Time (FT)" türü baskındır (4977/5000). Bu durum çalışanların büyük çoğunluğunun tam zamanlı istihdam edildiğini göstermektedir. 
Job_title için 123 farklı pozisyon arasında en sık görülenin "Data Engineer" (1075 gözlem).
Salary_currency değişkeninde "USD" en çok kullanılan para birimi olmuştur.
Employee_residence ve company_location değişkenlerinde en yaygın lokasyon "US" dir. 
Company_size değişkeninde orta ölçekli şirketlerin(M) olduğu görülmektedir.
3.3 DEĞİŞKEN GRAFİKLERİ
Salary Distribution:
![image](https://github.com/user-attachments/assets/234ec711-f375-49b1-b275-dd628401c442)
 
	Maaşların büyük bir kısmı 50,000 ile 200,000 USD arasında yoğunlaşmış olup, ortalama maaşın yaklaşık 150,000 USD olduğu görülmektedir. Dağılım simetrik olmayıp sağa doğru çarpık bir yapı sergilemektedir.
Salary Boxplot:
![image](https://github.com/user-attachments/assets/e0f30283-0f00-4a1d-a6e0-365de6a45021)
 

	Kutunun sınırları, birinci çeyrek (Q1) ve üçüncü çeyrek (Q3) değerlerini göstermektedir. Maaşların %50'sinin 100,000 ile 200,000 USD arasında yoğunlaşmaktadır.
	Aykırı değerler özellikle 300,000 USD'nin üzerinde yoğunlaşmaktadır. Maaş dağılımının sağa çarpık olduğunu göstermektedir.
Remote Ratio Dstribution:
![image](https://github.com/user-attachments/assets/6ee2d28e-b6e2-48af-a652-26869af07365)
 
Grafik, üç kategori olan 0% (tamamen ofis çalışması), 50% (hibrit çalışma), ve 100% (tamamen uzaktan çalışma) oranları vardır. 
	Grafikten görüldüğü üzere, en büyük grup 0% oranında uzaktan çalışma yapan çalışanlardan oluşmaktadır. Çalışanların büyük bir çoğunluğunun tamamen ofiste çalıştığını göstermektedir. 
	İkinci büyük grup ise tamamen uzaktan çalışanlardır (100%). 
	Hibrit çalışma oranı (50%) oldukça düşüktür.


Top 10 Job Titles:
![image](https://github.com/user-attachments/assets/1a9f5f46-e198-48b8-8cd8-9d67fc2e0661)

İlk üç iş unvanı, veri odaklı mesleklerin sektörde ne kadar önemli ve yaygın olduğunu ortaya koymaktadır.
	Grafikte en yüksek frekansa sahip iş unvanı Data Engineer olmuştur. Onu Data Scientist ve Data Analyst pozisyonları takip etmektedir. 
	Machine Learning Engineer pozisyonu da diğerlerine oranla geride olsa da dikkat çekici sıklıkta olduğu görülmektedir. 





Salary Currency Distribution:
![image](https://github.com/user-attachments/assets/55cadef8-b9fb-4895-bcb0-52fcc30dc880)

	En baskın para biriminin USD (ABD Doları) olduğu açıkça görülmektedir. Veri kümesindeki maaşların çoğunun dolar cinsinden hesaplandığını göstermektedir. 
	Diğer para birimleri arasında EUR (Euro) ve GBP (İngiliz Sterlini) nispeten daha sık kullanılmıştır, ancak frekansları USD ile kıyaslandığında oldukça düşüktür.
Top 10 Employe Residences:
![image](https://github.com/user-attachments/assets/86c432dd-c17d-4412-a262-c94e4f1caa33)

	Grafikte açıkça görüldüğü üzere, çalışanların büyük bir çoğunluğu ABD'de (US) ikamet etmektedir. 
	ABD'yi, sırasıyla Birleşik Krallık (GB) ve Kanada (CA) takip etmektedir. 
	Avrupa'daki İspanya (ES), Almanya (DE) ve Fransa (FR) gibi ülkeler ise daha az bulunmaktadır.


Company Size Distribution:
![image](https://github.com/user-attachments/assets/628c2ee3-f238-4f12-a5fe-bae7fc3034c9)
 
Grafik şirket büyüklüğünün (S: Küçük, M: Orta, L: Büyük) dağılımını göstermektedir. 
	Çalışanların büyük bir çoğunluğunun orta büyüklükteki (M) şirketlerde çalıştığı görülmektedir. 
	Büyük(L) şirketlerde çalışanlarını orta büyüklükteki(M) çalışanlara oranla daha azdır.
	Küçük şirketlerde (S) çalışanların oranı oldukça düşük bir seviyededir. 
Veri kümesindeki iş gücünün daha çok orta ölçekli şirketlere yoğunlaştığını göstermektedir.








Top 10 Cornpany Locations:
![image](https://github.com/user-attachments/assets/93544b95-9e00-4f1a-9a1b-2285a848146b)

	Açık bir şekilde ABD (US), en fazla sayıda şirkete ev sahipliği yapmaktadır. 
	ABD'yi sırasıyla Birleşik Krallık (GB) ve Kanada (CA) takip etmektedir. 
	Avrupa ülkeleri (ES, DE, FR) ve Avustralya (AU) gibi diğer lokasyonlar ise daha düşük temsil oranına sahiptir.

Salary Per Experience Level Distribution:
![image](https://github.com/user-attachments/assets/057f7bc6-8ad5-47d3-9cc0-f7514c1c5a20)

Verinin büyük bir kısmı 30,000 ile 90,000 USD aralığında yoğunlaşmıştır. Deneyim seviyesine göre maaşların genellikle belirli bir düzeyde kaldığını gözükmektedir.
	Ortalama değer, dağılımın merkezine oldukça yakındır.
	Yüksek maaşlar (örneğin 180,000 USD ve üzeri) nadir görülmekte ve Sağa çarpıklık oluşturmaktadır. 
	Dağılımın bu yapısı, deneyim seviyesi arttıkça maaşlarda artış olduğunu işaret etmektedir.
	Çok yüksek maaşların sınırlı sayıda kişi tarafından kazanıldığını göstermektedir.

Salary Per Experience Level Boxplot:
 
	Kutunun sınırları, birinci çeyrek (Q1) ve üçüncü çeyrek (Q3) değerlerini göstermektedir. Maaşların %50'sinin 30,000 ile 70,000 USD arasında yoğunlaşmaktadır.

	Aykırı değerler özellikle 120,000 USD'nin üzerinde yoğunlaşmaktadır. Maaş dağılımının sağa çarpık olduğunu göstermektedir.





3.4 GRUPLAR ARASINDAKİ FARKLILIKLAR
![image](https://github.com/user-attachments/assets/a5d1ba91-dee8-419d-8000-eeff8ace6ddd)

Experience Level (Deneyim Seviyesi): 
Deneyim seviyesi arttıkça maaşlarda belirgin bir artış görülmektedir. 
	Özellikle EX (Expert) ve SE (Senior) seviyelerinde maaşlar oldukça yüksek bir aralıkta yoğunlaşmıştır. 
	EN (Entry) seviyesindeki maaşlar, diğer seviyelere kıyasla oldukça düşüktür ve sınırlı bir aralıkta yoğunlaşmıştır.

Remote Ratio (Uzaktan Çalışma Oranı): 
Uzaktan çalışma oranlarına göre maaşlarda belirgin bir farklılık gözlemlenmektedir. 
	Tamamen uzaktan çalışan ve Ofis çalışan bireylerin maaşları, hibrit çalışan bireylerin maaşlarına kıyasla daha yüksek görünmektedir. 

Employment Type (İstihdam Türü): 
	Tam zamanlı (FT) çalışanlar, diğer istihdam türlerine (CT: Contract, FL: Freelance, PT: Part-Time) kıyasla daha yüksek maaş aralığına sahiptir. 
	CT ve PT türlerinde maaşlar düşük ve sınırlı bir aralıktadır.

![image](https://github.com/user-attachments/assets/11423e8a-7bbe-4f1e-a361-c69b05dac3a2)


 
Şirket büyüklüğünün maaş seviyeleri üzerindeki etkisini açıkça gözükmektedir. 
	Büyük ve orta ölçekli şirketler genellikle daha yüksek maaşlar sunarken, küçük şirketler daha düşük maaşlar ve sınırlı maaş aralığında kalmaktadır.
![image](https://github.com/user-attachments/assets/92ff8a79-cfa5-4ae7-94c0-ede54df8197a)
![image](https://github.com/user-attachments/assets/1257ad2a-5087-46a5-8f30-fc493f975224)

	Genel olarak, maaş aralıkları benzer seviyelerde yoğunlaşmıştır, ancak Data Analyst pozisyonu diğer pozisyonlara göre daha düşük maaş aralığında yer almaktadır.





3.5 DEĞİŞKENLERİN BİRBİRLERİYLE İLİŞKİSİ
![image](https://github.com/user-attachments/assets/caf0a5ff-c124-4462-a815-f1f1536d3ba4)

Koyu mavi ve büyük daireler: Güçlü pozitif korelasyonları göstermektedir. 
	Salary ile salary_in_usd arasında 0.99'luk yüksek bir korelasyon bulunmakta bu da bu iki değişkenin aynı veri yapısını temsil ettiğini işaret eder.
Soluk mavi ve daha küçük daireler: Orta düzeyde pozitif korelasyonları göstermektedir. 
	Salary ile experience_level_numeric arasında 0.48'lik bir pozitif ilişki vardır. Deneyim seviyesi arttıkça maaşların genelde arttığını gösterir.
Turuncu daireler: Negatif korelasyonları göstermektedir. 
	Remote_ratio ile experience_level_numeric arasındaki -0.15'lik negatif korelasyon, uzaktan çalışmanın deneyim seviyesiyle zayıf ama ters bir ilişki içinde olduğunu ifade eder.
Küçük veya olmayan daireler: Zayıf ya da önemsiz korelasyonları temsil eder. 
	Work_year ile diğer değişkenler arasındaki korelasyonlar genellikle düşüktür ve anlamlı bir ilişki bulunmamaktadır.

4. ÖZET
4.1. ANALİZLERİN SONUÇ YORUMLAMALARI
1.	Deneyim Seviyesi ve Maaş:
	Deneyim seviyeleri arttıkça maaşların da belirgin bir şekilde yükseldiği görülmektedir. Özellikle "Senior" ve "Expert" seviyelerindeki çalışanlar daha geniş maaş aralıklarına sahiptir.
	"Entry" seviyesindeki çalışanlar genellikle sınırlı maaş aralıklarında yoğunlaşmıştır ve düşük maaş almaktadır.
2.	Uzaktan Çalışma ve Maaş:
	Tamamen uzaktan çalışan ve Ofis çalışan bireylerin maaşlarının, hibrit çalışan bireylerden daha yüksek olduğu gözlemlenmiştir..
3.	İstihdam Türü ve Maaş:
	Tam zamanlı (FT) çalışanların maaşlarının, diğer istihdam türlerine göre daha yüksek olduğu açıkça görülmektedir. Sözleşmeli (CT) ve yarı zamanlı (PT) çalışanlar daha düşük maaş aralıklarına sahiptir.
4.	Şirket Büyüklüğü ve Maaş:
	Büyük ve orta ölçekli şirketler, genellikle daha yüksek maaşlar sunarken, küçük ölçekli şirketlerde maaşlar daha düşüktür.
5.	İş Unvanı ve Maaş:
	"Data Engineer", "Data Scientist" ve "Machine Learning Engineer" gibi pozisyonlar yüksek maaş aralıklarına sahiptir.
	"Data Analyst" pozisyonunun maaş aralığı ise diğer iş unvanlarına göre daha düşüktür.

4.2. ANALİZDEKİ İLGİNÇ YORUMLAMALAR
•	Uzaktan Çalışma ve Maaş: Hibrit çalışma modelinin en düşük maaş aralıklarına sahip olması dikkat çekicidir. Tam uzaktan ve tam ofis modelleri ise daha avantajlıdır.
•	Data Analyst Pozisyonu: Maaş aralığının diğer iş pozisyonlarına kıyasla düşük olması, veri analistlerinin sektör dinamiklerinde daha az maaş avantajına sahip olduğunu göstermektedir.
•	Şirket Büyüklüğü: Orta ölçekli şirketlerde çalışanların maaşlarının büyük şirketler kadar yüksek olması.

4.3. ANALİZDEKİ EKSİK YÖNLER VE GELİŞTİRİLEBİLECEK ALANLAR
1.	Eksik Değişkenler:
	Analizde çalışanların eğitim durumu ve yaş gibi diğer etkili faktörler eksiktir. Bu değişkenlerin eklenmesi, daha kapsamlı sonuçlar elde edilmesine yardımcı olabilir.
2.	Hibrit Model Üzerine Detay:
	Hibrit çalışanların neden düşük maaş aldığını anlamak için çalışma saatleri, iş yükü gibi detaylar incelenebilir.







