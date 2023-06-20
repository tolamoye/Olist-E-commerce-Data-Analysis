# **Olist-E-commerce-Data-Aanalysis**
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/b57e7bae-89a7-4b4f-84cc-449cbd1912e3)
--

## **INTRODUCTION**
In April, I took part in a data challenge hosted by the Twitter data community. The challenge focused on analyzing a dataset from Olist, a well-known e-commerce company in Brazil. This dataset provided crucial details about various aspects of Olist's operations, such as product listings, sellers, and customer interactions. My objective was to explore the dataset and discover valuable insights based on specific questions. The challenge organizers meticulously curated and prepared the dataset to ensure that participants, including myself, could extract meaningful information and gain insights relevant to Olist's business.


## **THE GOALS OF THIS CHALLENEGE**
### This project challenge seeks to achieve the following goals :
- Validate and clean the data to improve accuracy and usability
- Analyze the data to address the problem statement
- Offer recommendations to Olist company

## **DATASET AND DATA DICTIONARY**
The Olist [dataset](https://drive.google.com/drive/folders/1re0HnJD5TCNVkVDHoPQ08aByKMWRRRJC) comprises nine separate datasets, all of which are stored in CSV format:
1. olist_order_items_dataset
2. olist_orders_dataset
3. olist_order_payments_dataset
4. olist_order_reviews_dataset
5. olist_products_dataset
6. olist_customers_dataset
7. olist_sellers_dataset
8. olist_geolocation_dataset
9. olist_category_dataset

The olist [Data Dictionary](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/files/11643097/Olist.Data.Dictionary.2.pdf) that offers a complete overview of the dataset. This data dictionary is a valuable reference as it provides in-depth explanations of each variable and its significance within the dataset. It serves as a useful tool for understanding and interpreting the data effectively.

## **CLEANING OF ALL THE TABLES**

With the messy table on the left-hand side and the cleaned table on the right-hand side, the cleaning process involved various steps to ensure the data was accurate and consistent. In the messy table, you could see inconsistencies, missing values, duplicates, and other issues that could potentially impact the analysis. However, after applying rigorous data cleaning techniques, the cleaned table now presents a more organized and reliable dataset. The cleaning process involved handling missing values by imputing or removing them, standardizing formats, correcting inconsistencies, removing duplicates, and addressing any other data quality issues. As a result, the cleaned table provides a solid foundation for conducting meaningful analysis and extracting valuable insights from the dataset.

### **CUSTOMER TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
<img width="641" alt="dirty customer" src="https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/5a8ceada-3165-451e-9c3b-05b3212019df"> |![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/8d040a9f-21af-4152-bab9-a950b00f35d9)


### **GEOLOCATION TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
<img width="584" alt="dirty geolocation" src="https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/984618ea-db36-452a-9043-55f7ddbc180c"> | <img width="641" alt="dirty customer" src="https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/5a8ceada-3165-451e-9c3b-05b3212019df">


### **ORDER TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![dirty order dataset](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/d394de7d-8174-4ae9-a786-ccdc2e94878a) | ![cleaned order table](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/a39f6ae4-d3df-417e-abf3-01de31bd914d)


### **PRODUCT TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/50efc4da-0712-4213-acfb-8f7b84ab52fb) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/d04a55e4-739d-468e-a9d7-2faa712adbe3)



### **PRODUCT CATEGORY TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/dfa50039-0615-4445-92ec-9c44d16bb3c9) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/26fd3562-9df0-423c-a400-929bb653110c)


### **ORDER ITEM TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/d45d1eae-ff2b-4aab-885d-fe1bd0f8a1ae) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/9aceff73-a224-47d5-b187-475d8f73cd2d)

### **SELLER TABLE**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/6c96c2ea-45a0-48fe-8bab-77df9b890a2d) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/64348a09-64c7-49b9-8899-b07771b6bb48)


### **ORDER PAYMENT**
Messy                                                           | Cleaned
:--------------------------------------------------------------:|:---------------------------------------------------------------:
<img width="664" alt="DIRTY PAYMENT ORDER" src="https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/ea940b9c-0acc-4ec1-ac99-858ed94bdde0"> | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/3a25bcf6-da67-4f0e-bf1e-b08a8c6c3b67)


## **BUSINESS QUESTIONS**
1. What is the total revenue generated by Olist, and how has it changed over time?
2. How many orders were placed on Olist, and how does this vary by month or season?
3. What are the most popular product categories on Olist, and how do their sales volumes compare to each other?
4. What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?
5. How many sellers are active on Olist, and how does this number change over time?
6. What is the distribution of seller ratings on Olist, and how does this impact sales performance?
7. How many customers have made repeated purchases on Olist, and what percentage of total sales do they account for?
8. What is the average customer rating for products sold on Olist, and how does this impact sales performance?
9. What is the average order cancellation rate on Olist, and how does this impact seller performance?
10. What are the top-selling products on Olist, and how have their sales trends changed over time?
11. Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?
12. How do customer reviews and ratings affect sales and product performance on Olist?
13. Which product categories have the highest profit margins on Olist, and how can the company increase profitability across different categories?
14. Geolocation having high customer density. Calculate customer retention rate according to geolocations.

## **ANSWERS TO THE BUSINESS QUESTIONS**
### 1) What is the total revenue generated by Olist, and how has it changed over time?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/6190b0fd-827a-4ba2-ba6c-08217a5f4e55)


The total revenue generated by Olist was approximately R$15.9 million. The quarter with the highest revenue was the second quarter of 2018, while the lowest revenue was generated in the third quarter of 2016, with revenues of approximately R$3.3 million and R$136.23, respectively.

### 2) How many orders were placed on Olist, and how does this vary by month or season?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/7807621e-834e-4c9a-8419-81054b1ffea7)

The total number of orders placed on Olist was 98,207. In January 2017, Olist received the highest number of orders, with approximately 7,423 orders. The lowest number of orders occurred in September 2018 and December 2016, with only one order each.

### 3) What are the most popular product categories on Olist, and how do their sales volumes compare to each other?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/413420a0-2a8c-4907-87d3-f540ee5ed491)

The most popular product category on Olist is "bed bath table," and as we examine the popularity from the most to the least popular categories, we observe a significant decrease in their sales volume. This decrease in sales volume from the most popular to the least popular categories suggests certain implications.

### 4) What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?
by payment method                                                          | by product category
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/6e8692d2-81f5-45d6-bdb9-938d1913af2e) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/425a59a7-224e-4bb9-9d4b-4cd2fc158952)

The average order value (AOV) across all payment methods on Olist is approximately R$153.44. When categorizing by payment method, voucher payments had the lowest AOV of R$62.33, while credit card payments had the highest AOV of R$162.70. Furthermore, when categorizing by product category, computers had the highest AOV, followed by fixed telephony.

### 5) How many sellers are active on Olist, and how does this number change over time?
Active sellers                                                        | Active sellers
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/d4f17e21-05b1-4a17-ab08-4e4a9f0dc66f) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/44c17da7-267d-4a9a-91cb-42ccfaceef01)

Olist had a total of 4,312 active sellers. The highest number of active sellers was in 2018 with 2,833, followed by 1,784 in 2017 and the lowest number of active sellers was 145 in 2016. On a quarterly basis, Olist experienced an increase in active sellers throughout most quarters, except for a decline in the last quarter of 2018 (Q3) where it had 52 sellers fewer compared to the previous quarter (Q2), with 1,680 sellers in Q2 and 1,628 sellers in Q3.

### 6)  What is the distribution of seller ratings on Olist, and how does this impact sales performance?
Distribution of sellers                                                       | Correlation co-effecient
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/0b0cb18e-5caf-4705-8acf-4adc526a857f) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/b9f253c9-b152-42b5-a225-4db15bbca3f4)

It can be concluded that sellers with review scores of 4 and 5 had the highest number of orders, indicating positive sales performance. Furthermore, sellers with higher review scores also generated higher total revenue, suggesting a correlation between positive reviews and increased sales. However, it is interesting to note that sellers with a review score of 1 had the highest average revenue, indicating that other factors may influence sales performance beyond just review scores.

### 7)  How many customers have made repeated purchases on Olist, and what percentage of total sales do they account for?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/ff64ce50-f8e4-4f30-a3fd-5af0aa588cc7)

Out of the 96,096 customers in Olist, a small fraction of 2,997 customers have made repeat purchases, implying a low customer retention rate. The majority of customers (93,099) have only made a single purchase and have not returned for additional purchases. Moreover, the sales generated by repeat customers account for only 13% of the total sales.

### 8) What is the average customer rating for products sold on Olist, and how does this impact sales performance?
Average rating                                                    | Impact on Sales performance
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/26f61bac-10fd-441f-a4c5-2b88a2c4b754) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/29cb2f1e-7859-43e2-94e7-57cdbabebf55)

The average rating on Olist is 4, indicating a positive impact on sales performance. This high average rating suggests that customers are generally satisfied with their purchases, which can lead to increased customer trust, loyalty, and higher sales. The positive word-of-mouth recommendations from satisfied customers may also attract new customers, further contributing to revenue growth. Additionally, products with higher average ratings are likely to be perceived as reliable and of good quality, increasing their desirability and potentially driving higher sales volumes.

### 9) What is the average order cancellation rate on Olist, and how does this impact seller performance?
Cancellation rate                                              | Effect on Sales performance
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/d7ce1376-ca17-4b56-a8b3-36fb713d7f2a) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/1204849b-955a-4804-b1c3-a890d4b1aa14)

Olist's cancellation rate of 0.48 suggests a low percentage of order cancellations, indicating that the majority of customers complete their purchases. This positive trend can be seen as a favorable sign for Olist's sales performance, indicating that customers are content with their buying decisions and have trust in the products and services provided by Olist.

### 10) What are the top-selling products on Olist, and how have their sales trends changed over time?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/15c21ba3-fec2-4e83-924e-f5b4fd154af3)

Computer accessories reign supreme as the best-selling items on Olist, closely followed by health and beauty products, watches and gifts, bed and bath essentials, and sport and leisure items.

### 11) Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?
Number of orders with each payment methods                                          | Payment method by geographical location
:--------------------------------------------------------------:|:---------------------------------------------------------------:
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/531fbd46-7e76-404e-9814-36c992580e2a) | ![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/f7268a3c-6ed0-4a51-9e8b-fc298730d2cf)

Credit card was used for 76505 orders, making it the most common payment method. Boleto followed with approximately 19784 orders, while voucher and debit card were used for around 3866 and 1528 orders, respectively. In São Paulo, "Health Beauty" products were purchased 71 times using debit card as the payment method. Additionally, "Bed Bath Table" and "Health Beauty" were popular product categories paid for with credit cards. In Minas Gerais, credit card payments were mainly associated with "Health Beauty" products, in São Paulo, voucher payments were most commonly associated with auto products, while boleto payments were used for "Bed Bath Table" products. Credit cards were frequently used for "Computer Accessories" and "Health Beauty" products.

### 12) How do customer reviews and ratings affect sales and product performance on Olist?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/4295d5fa-3ce8-4410-ae6e-76891ab83e48)

Excellent! which has a 5-star rating, received approximately 56,902 reviews. Out of the total purchases of 23,220 products , a significant number, 5-star ratings were given. On average, each product in the generated a revenue of R$160.78. Interestingly, as we move down the rating score, the revenue decreases. This observation implies that Olist may have pricing issues that need to be addressed in order to adjust and optimize revenue.

### 13)  Which product categories have the highest profit margins on Olist, and how can the company increase profitability across different categories?
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/1ad2a83f-8669-4e30-81fe-f85b830428df)

The profit margins across different product categories vary significantly. The highest profit margin is observed in the "Fixed telephony" category with a percentage profit margin of 327.78, followed by "Signaling and security" (287.02) and "Drinks" (286.87). On the other hand, categories like "Furniture mattress and upholstery" (88.63) and "Home appliances 2" (91.01) have relatively lower profit margins.

### 14)  Geolocation having high customer density. Calculate customer retention rate according to geolocations.
![image](https://github.com/tolamoye/Olist-E-commerce-Data-Aanalysis/assets/128150171/b5487761-5445-416e-b73b-8f1c6cb5bd89)

Geolocations with higher customer densities indicate areas where the company has a larger customer base and potentially higher market demand. Geolocations with relatively higher customer densities include Acre (4.94%), Rondonia (4.35%), Mato Grosso (3.42%), Rio de Janeiro (3.34%), and Goias (3.27%).  The customer retention rate is a measure of the percentage of customers who make repeated purchases. It provides insights into customer loyalty and the effectiveness of the company's strategies to retain customers.

## **RECOMMENDATIONS**
**To improve customer retention and address low ratings on certain products, here are some recommendations:**
1. Olist should improve product quality and consistency to meet customer expectations. (Note: Consistently delivering high-quality products builds trust and loyalty among customers.)
2. Olist should enhance customer service by training representatives and implementing efficient support channels. (Note: Providing excellent customer service ensures prompt and effective resolution of concerns, fostering positive customer experiences.)
3. Olist should personalize the customer experience using data and segmentation strategies. (Note: Tailoring recommendations, offers, and communication based on customer insights creates a personalized and engaging experience.)
4. Olist should implement loyalty programs to reward repeat purchases. (Note: Loyalty programs with exclusive discounts and incentives encourage customers to stay engaged and loyal to the brand.)
5. Olist should gather and act on customer feedback to make improvements and enhance satisfaction. (Note: Actively listening to customer feedback allows for identifying areas of improvement and demonstrates a commitment to customer satisfaction.
   
**Regarding the low-rated/high revenue products:**
1. Olist should identify and resolve quality issues through process improvements and rigorous checks. (Note: Analyzing low-rated products helps address recurring quality issues, ensuring better product performance.)
2. Olist should improve customer communication to manage expectations. (Note: Clear and detailed product information helps customers understand the product's features, limitations, and usage, reducing negative experiences.)
3. Olist should proactively address customer concerns by responding to negative reviews. (Note: Promptly and professionally addressing negative reviews shows the company's dedication to resolving issues and improving customer satisfaction.)
4. Olist should continuously improve products based on feedback and market trends. (Note: Regular evaluation and innovation keep products aligned with customer needs and preferences.)
5. Olist should offer exceptional customer service to regain trust and loyalty. (Note: Going above and beyond to resolve issues and provide excellent service can turn negative experiences into positive ones, rebuilding customer trust.)
By implementing these recommendations and considering the accompanying notes, Olist can enhance customer retention, address low ratings, and foster stronger customer relationships.
