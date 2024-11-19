# -----------------------------------------------------------
# title: "Cyclistic Bike Share: Data Preparation"
# purpose: this script is used to perform data preparation
#          Prepare, Process - data cleaning 
# author: "Carla Cotas"
# date: "12.Nov.2024"
# version: 1.0
# -----------------------------------------------------------

#install and load packages
install.packages("tidyverse")
install.packages("dplyr") #column rename, datasets merge   
install.packages ("lubridate")
install.packages("ggplot2")
library(tidyverse)
library("dplyr")  
library (lubridate)
library(ggplot2)

###PREPARE###    
# original data files renaming for simplicity and improve readability
CyclisticTripData_2019_Q4 <- read.csv("Divvy_Trips_2019_Q4.csv")
CyclisticTripData_2020_Q1 <- read.csv("Divvy_Trips_2020_Q1.csv")

# summary data to ensure that the data sets have the same number of columns
# and same column names before moving to the next steps

colnames(CyclisticTripData_2019_Q4)
colnames(CyclisticTripData_2020_Q1)

CyclisticTripData_dfs = list(CyclisticTripData_2019_Q4, CyclisticTripData_2020_Q1)

for (CyclisticTripData_df in CyclisticTripData_dfs) {
  glimpse(CyclisticTripData_df)
}

for (CyclisticTripData_df in CyclisticTripData_dfs) {
  str(CyclisticTripData_df)
}

###PROCESS###
#columns rename to ensure uniformity
(CyclisticTripData_2019_Q4 <- rename(CyclisticTripData_2019_Q4
                   ,ride_id = trip_id
                   ,started_at = start_time  
                   ,ended_at = end_time
                   ,rideable_type = bikeid
                   ,start_station_id = from_station_id
                   ,start_station_name = from_station_name
                   ,end_station_id = to_station_id
                   ,end_station_name = to_station_name
                   ,member_casual = usertype))

#columns datatype 'ride_id' and 'rideable_type' change to character
CyclisticTripData_2019_Q4 <- mutate(CyclisticTripData_2019_Q4, ride_id = as.character(ride_id)
                                    ,rideable_type = as.character(rideable_type))


#quarter dataframes combined into a large dataframe
CyclisticTripData <- bind_rows(CyclisticTripData_2019_Q4, CyclisticTripData_2020_Q1)

#exploratory verification - large dataframe
colnames(CyclisticTripData)
glimpse(CyclisticTripData)
head(CyclisticTripData) #first rows
tail(CyclisticTripData) #last rows

#removing the columns 'birthyear', 'gender', 'start_lat', 'start_lng', 'end_lat', 'end_lng'
CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("birthyear"
                                                                         ,"gender"
                                                                         ,"start_lat"
                                                                         ,"start_lng"
                                                                         ,"end_lat"
                                                                         ,"end_lng")]

#exporting the 'CyclisticTripData' to  'CyclisticTripData.csv'
write.csv(CyclisticTripData,"CyclisticTripData.csv", row.names = FALSE) 

