remove(list = ls())
library(data.table)
dataset2=fread('D:/Brandeis Homework/data competition/listings_details_nice.csv')
head(dataset2$zip_has)

reg_price_host_response=lm(price~ zip_has,dataset2)
plot(reg_price_host_response)
library(ggplot2)
ggplot(dataset2, aes(x=host_response_rate,y=price))+ geom_point()+
         geom_smooth()

summary(dataset2$security_deposit)
sd(dataset2$security_deposit)       
colnames(dataset2)



summary(dataset2$host_response_rate)
sd(dataset2$host_response_rate)

summary(dataset2$availability_365)
sd(dataset2$availability_365)

summary(dataset2$availability_60)
sd(dataset2$availability_60)

summary(dataset2$availability_30)
sd(dataset2$availability_30)

summary(dataset2$availability_60)
sd(dataset2$availability_60)

summary(dataset2$host_response_price)
sd(dataset2$host_response_price)

summary(dataset2$host_listings_count)
sd(dataset2$host_listings_count)

summary(dataset2$zip_has)
sd(dataset2$zip_has)

summary(dataset2$review_scores_value)
sd(dataset2$review_scores_value)

summary(dataset2$cancellation_policy_price)
sd(dataset2$cancellation_policy_price)

summary(dataset2$bed_type_price)
sd(dataset2$bed_type_price)


dataset2$property_type_price
ggplot(dataset2, aes(x=neighbourhood_cleansed_price,y=price))+ geom_point()+
         geom_smooth()



qnt <- quantile(dataset2$price, probs=c(.25, .75), na.rm = T)
caps <- quantile(dataset2$price, probs=c(.05, .95), na.rm = T)
H <- 1.5 * IQR(dataset2$price, na.rm = T)
dataset2$price[dataset2$price < (qnt[1] - H)] <- caps[1]
dataset2$price[dataset2$price > (qnt[2] + H)] <- caps[2]


boxplot(price~host_is_superhost,
        data=dataset2,
        main="Relationship between Price and Superhost",
        xlab="Host_is_Superhost",
        ylab="Price",
        col="orange",
        border="brown")
dataset2$host_identity_verified

dataset2$is_location_exact
boxplot(price~require_guest_phone_verification,
        data=dataset2,
        main="Relationship between Price and guest_phone_verification",
        xlab="Guest Phone Verification",
        ylab="Price",
        col="orange",
        border="brown")

dataset2$require_guest_phone_verification

plot(dataset2$price~dataset2$host_response_rate, pch=16, cex=0.6)

dataset2$cancella
plot <- ggplot(data=dataset2, aes(x=as.factor(host_response_price), y=dataset2[["price"]])) + 
  geom_boxplot(fill="lightblue") + labs(x = "host_response_price", y = "price",
                                        title = ('Relationship between host_response_price and price')) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(plot)

summary(dataset2$property_type_price)
sd(dataset2$property_type_price)

unique(dataset2$neighbourhood_cleansed_price)

summary(dataset2$room_type_price)
sd(dataset2$room_type_price)

summary(dataset2$host_response_price)
sd(dataset2$host_response_price)

dataset2$bedrooms
library(dplyr)
temp1=dataset2%>%group_by(beds)%>%summarise(avg_price=mean(price))
head(temp1)

plot <- ggplot(data=temp1, aes(x=as.factor(beds), y=temp1[["avg_price"]])) + 
  geom_boxplot(fill="lightblue") + labs(x = "beds", y = "avg_price",
                                        title = ('Relationship between bedrooms and avg_price')) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(plot)



p<-ggplot(data=temp1, aes(x=beds, y=avg_price)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

temp <- subset(dataset, is_top_100 == 1) 
temp=temp%>%group_by(is_top_100,neighbourhood_cleansed)%>%summarise(density = n()/nrow(.))
temp1=subset(dataset,is_top_100==0)
temp1=temp1%>%group_by(is_top_100,neighbourhood_cleansed)%>%summarise(density = n()/nrow(.))
temp2 <- rbind(temp, temp1)
head(temp)
plot <- ggplot(data=temp2, aes(x=as.factor(temp2[["neighbourhood_cleansed"]]), y=density, fill=as.factor(is_top_100))) + 
  geom_bar(position = 'dodge', stat='identity') + labs(fill = "is_top_100", x = "neighbourhood_cleansed", 
                                                       title = paste("neighbourhood_cleansed", " relative density grouped by is_top_100")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

print(plot)




