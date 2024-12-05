# title: "Cyclistic Bike Share: Data Share"
# purpose: this script is used to performing data visualization
# author: "Carla Cotas"
# date: "05.Dec.2024"
# version: 1.0
# -----------------------------------------------------------

##install and load packages
install.packages("tidyverse")
#install.packages("dplyr") #column rename, datasets merge   
#install.packages("lubridate")
install.packages("hms")
install.packages("ggplot2")
library(tidyverse)
#library(dplyr)
#library(lubridate)
library(hms)
library(ggplot2)



###SHARE###
## large data file ready for Visualization renaming for simplicity and improve readability
CyclisticTripData <- read.csv("20241126_CyclisticTripData.csv")
## proper data format
#ride_length = as.numeric(hms(ride_length)) > convert ride length into seconds
CyclisticTripData <- mutate(CyclisticTripData, start_station_id = as.character(start_station_id)
                            ,end_station_id = as.character(end_station_id)
                            ,ride_length = as.numeric(hms(ride_length)))


## Pie Chart: %number of rides for member type
CyclisticTripData_TotalRides <- CyclisticTripData %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = n()) %>%
  mutate(percentage_rides = round(ride_count/sum(ride_count) * 100,2))

slices <- CyclisticTripData_TotalRides$percentage_rides 
lbls <- c("Casual", "Member")
pct <- CyclisticTripData_TotalRides$percentage_rides
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Percentage of Total Rides")


## Bar Plot: number of rides for member type by day_of_week
CyclisticTripData_Rides_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(number_rides = n(), .groups = 'drop') %>%
  mutate(percentage_number_rides = round(number_rides/sum(number_rides) * 100,2))

ggplot(CyclisticTripData_Rides_UserDayOfWeek,aes(x = factor(day_of_week,
                                                            levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
                                                 , y = number_rides, fill = member_casual)) +
  labs(title = "Total number of rides by day of week",
       x = "Day of week",
       y = "Total number") +
  theme(plot.title = element_text(face="bold")) +
  theme(axis.title.x = element_text(face="bold")) +
  theme(axis.title.y = element_text(face="bold")) +
  labs(fill = "Member type") +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values=c("#00ffff", 
                             "red"))

## Bar Plot: mean ride length for member type by day_of_week
CyclisticTripData_Mean_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(mean_ride_length = round(mean(ride_length), 0), .groups = 'drop')

ggplot(CyclisticTripData_Mean_UserDayOfWeek,aes(x = factor(day_of_week,
                                                            levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
                                                 , y = mean_ride_length, fill = member_casual)) +
  labs(title = "Mean ride length by day of week",
       x = "Day of week",
       y = "Mean ride length [seconds]") +
  theme(plot.title = element_text(face="bold")) +
  theme(axis.title.x = element_text(face="bold")) +
  theme(axis.title.y = element_text(face="bold")) +
  labs(fill = "Member type") +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values=c("#00ffff", 
                             "red"))


