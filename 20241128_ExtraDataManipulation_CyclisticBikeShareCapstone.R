# title: "Cyclistic Bike Share: Data Process - Data Manipulation"
# purpose: this script is used to continue performing data preparation
#          Process - extra data manipulation
# author: "Carla Cotas"
# date: "28.Nov.2024"
# version: 1.0
# -----------------------------------------------------------

#install and load packages
#install.packages("tidyverse")
install.packages("dplyr") #column rename, datasets merge   
#install.packages ("lubridate")
#install.packages("ggplot2")
#library(tidyverse)
library(dplyr)
#library (lubridate)
#library(hms) #column format from seconds to HH:MM:SS
#library(ggplot2)


###PROCESS###

## renaming files for simplicity and improve readability
CyclisticTripData <- read.csv("20241126_CyclisticTripData.csv")
CyclisticTripData_2020_Q1 <- read.csv("Divvy_Trips_2020_Q1.csv")

## get the start and end - latitude and longitude - for each station 
CyclisticTripData_2020_Q1 <- CyclisticTripData_2020_Q1[,!names(CyclisticTripData_2020_Q1) 
                                                       %in% c("rideable_type"
                                                              ,"member_casual"
                                                              ,"started_at"
                                                              ,"ended_at")]

CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) 
                                                       %in% c("started_at"
                                                              ,"ended_at"
                                                              ,"member_casual"
                                                              ,"ride_length"
                                                              ,"day_of_week")]


unique(CyclisticTripData_2020_Q1$start_station_name)
unique(CyclisticTripData_2020_Q1$end_station_name)
CyclisticTripData_2020_Q1_start <- CyclisticTripData_2020_Q1 %>% distinct(start_station_name, .keep_all=TRUE)
CyclisticTripData_2020_Q1_end <- CyclisticTripData_2020_Q1 %>% distinct(end_station_name, .keep_all=TRUE)

unique(CyclisticTripData$start_station_name)
unique(CyclisticTripData$end_station_name)

#There are no consistency on the start and end station names between the two dataframes!
#without further information about the latitude and longitude for all the stations
#this data manipulation is ready to analyse

