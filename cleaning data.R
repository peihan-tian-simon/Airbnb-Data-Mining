remove(list = ls())
library(dplyr)

calender=read.csv('D:/Brandeis Homework/data competition/calendar.csv')
head(calender)
calender[calender=='']
listings_details=read.csv('D:/Brandeis Homework/data competition/listings_details.csv', comment.char="#")
head(listings_detail)
tail(listings_detail)
dim(listings_detail)
review_details=read.csv('D:/Brandeis Homework/data competition/reviews_details.csv')
head(review_detail)
review_summary=read.csv('D:/Brandeis Homework/data competition/reviews_summary.csv')
head(review_summary)
listings_summary=read.csv('D:/Brandeis Homework/data competition/listings_summary.csv', comment.char="#")

head(listings_summary)
colnames(listings_detail)
colnames(listings_summary)
colnames(listings_detail)[colnames(listings_detail)%!in%colnames(listings_summary)]
colnames(listings_detail)
a = colnames(listings_details)
b = colnames(listings_summary)
c = setdiff(a,b)
c
edit_listings_details = listings_details[,c]
edit_listings_details
colnames(edit_listings_details)



reserved_variable =c("summary","space","description","transit","host_since","host_response_time","host_response_rate","host_is_superhost",
                     "host_neighbourhood","host_verifications","host_identity_verified","neighbourhood_cleansed","property_type","accommodates",
                     "bathrooms","bedrooms","beds","amenities","square_feet","weekly_price","monthly_price","security_deposit","cleaning_fee",
                     "guests_included","extra_people","number_of_reviews_ltm","review_scores_rating","cancellation_policy"
                   
                     )
edited2_listing_details = listings_details[,reserved_variable]
colnames(edited2_listing_details)
head(edited2_listing_details)
edited2_listing_details
dim(listings_summary)
dim(edited2_listing_details)


list.df2 <- dput(as.character(colnames(listings_summary)))
combined_summary<-listings_details %>% select(one_of(list.df2))
ListingSummary<-cbind(combined_summary,edited2_listing_details)
x=dput(mtcars)
list.df2

