# title: "Cyclistic Bike Share: Data Process - Data Analyze"
# purpose: this script is used to performing data Analyze
# author: "Carla Cotas"
# date: "02.Dec.2024"
# version: 1.0
# -----------------------------------------------------------

##install and load packages
install.packages("tidyverse")
#install.packages("dplyr") #column rename, datasets merge   
#install.packages("lubridate")
install.packages("hms")
install.packages("ggplot2")
install.packages("DescTools") #mode
library(tidyverse)
#library(dplyr)
#library(lubridate)
library(hms)
library(ggplot2)
library("DescTools")


###ANALYZE###
## large data file ready for ANALYZE renaming for simplicity and improve readability
CyclisticTripData <- read.csv("20241126_CyclisticTripData.csv")

## summary of data
glimpse (CyclisticTripData)
str (CyclisticTripData)
summary(CyclisticTripData)

## proper data format
#ride_length = as.numeric(hms(ride_length)) > convert ride length into seconds
CyclisticTripData <- mutate(CyclisticTripData, start_station_id = as.character(start_station_id)
                                    ,end_station_id = as.character(end_station_id)
                                    ,ride_length = as.numeric(hms(ride_length))) 


## mean, median and maximum for the ride length
CyclisticTripData_RideLengthMetrics <- CyclisticTripData %>% 
  group_by(member_casual) %>%
  summarise(mean_ride_length = round(mean(ride_length), 0)
            , median_ride_length = median(ride_length)
            , max_ride_length = max(ride_length))
CyclisticTripData_RideLengthMetrics <- mutate(CyclisticTripData_RideLengthMetrics
                                           , mean_ride_length = hms(mean_ride_length)
                                           , median_ride_length = hms(median_ride_length)
                                           , max_ride_length = hms(max_ride_length))

## mode of day of week
CyclisticTripData_ModeDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual) %>%
  summarise(mode_day_of_week = Mode(day_of_week))

## mean for member type by day of week
CyclisticTripData_Mean_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(mean_ride_length = round(mean(ride_length), 0), .groups = 'drop') %>%
  mutate(mean_ride_length = hms(mean_ride_length))

## number of rides for member type by day_of_week
CyclisticTripData_Rides_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(number_rides = n(), .groups = 'drop') %>%
  mutate(percentage_number_rides = round(number_rides/sum(number_rides) * 100,2))

## number of rides for member type
CyclisticTripData_TotalRides <- CyclisticTripData %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = n()) %>%
  mutate(percentage_rides = round(ride_count/sum(ride_count) * 100,2))


