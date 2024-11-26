# title: "Cyclistic Bike Share: Data Process - Data Manipulation"
# purpose: this script is used to continue performing data preparation
#          Process - data manipulation 
# author: "Carla Cotas"
# date: "20.Nov.2024"
# version: 1.0
# -----------------------------------------------------------

#install and load packages
install.packages("tidyverse")
install.packages("dplyr") #column rename, datasets merge   
install.packages ("lubridate")
#install.packages("ggplot2")
library(tidyverse)
library(dplyr)
library (lubridate)
library(hms) #column format from seconds to HH:MM:SS
#library(ggplot2)


###PROCESS###
## large data file renaming for simplicity and improve readability
CyclisticTripData <- read.csv("20241119_CyclisticTripData.csv")

## check for duplicates, null values, and inconsistency on values and clean it
# find DUPLICATES 'ride_id'
CyclisticTripData_duplicates <- CyclisticTripData[duplicated(CyclisticTripData$ride_id), ]
duplicate_counts <- table(CyclisticTripData[duplicated(CyclisticTripData$ride_id), ])

# find and count MISSING values
which(is.na(CyclisticTripData))     # find location of missing values
sum(is.na(CyclisticTripData))       # count total missing values
colSums(is.na(CyclisticTripData))   # count total missing values in each column
# remove 'tripduration' column
CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("tripduration")]
# new dataframe that only contains rows that have missing values
CyclisticTripData_missing <- CyclisticTripData[rowSums(is.na(CyclisticTripData)) > 0,]
# save the dataframe for recording
write.csv(CyclisticTripData_missing,"20241120_CyclisticTripData_MissingValues.csv", row.names = FALSE)
# remove the missing values from the large dataset
CyclisticTripData <- CyclisticTripData[rowSums(is.na(CyclisticTripData)) == 0, ]

# ensuring consistency on data 'member_casual' column
unique(CyclisticTripData$member_casual)
# add new column 'member_casual_copy' with values of 'member_casual' for recording
CyclisticTripData$member_casual_copy = CyclisticTripData$member_casual
# change original 'member_casual' column values
CyclisticTripData <- CyclisticTripData %>%
  mutate(member_casual = recode(member_casual, 'Subscriber' = 'member', 'Customer' = 'casual' ))
# remove the new column 'member_casual_copy' with original values of 'member_casual' recorded
CyclisticTripData <- subset( CyclisticTripData, select = -member_casual_copy )
# remove 'rideable_type' column
CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("rideable_type")]
# check for consistency on number of characters across columns
summarise_if(CyclisticTripData, is.character, funs(max(nchar(.), na.rm=T)))
summarise_if(CyclisticTripData, is.character, funs(min(nchar(.), na.rm=T)))


##New columns 'ride_length' and 'day_of_week' and calculations from columns 'started_at' 'ended_at'
CyclisticTripData$ride_length <- as_hms(difftime(CyclisticTripData$ended_at, CyclisticTripData$started_at))
CyclisticTripData$day_of_week <- weekdays(as.Date(CyclisticTripData$started_at))

# check the values on column 'day_of_week' ensuring consistency
unique(CyclisticTripData$day_of_week)
# check for 'ride_length' negative or zero
as_hms(min(CyclisticTripData$ride_length, na.rm = TRUE))
as_hms(max(CyclisticTripData$ride_length, na.rm = TRUE))
# new dataframe that only contains rows that have zero or negative ride length values
CyclisticTripData_ridelength_zeronegative <- CyclisticTripData[CyclisticTripData$ride_length <= 00:00:00,]
# save the dataframe for recording
write.csv(CyclisticTripData_ridelength_zeronegative,"20241126_CyclisticTripData_ridelength_InconsistencyValues.csv", row.names = FALSE)
# remove the rows that have zero or negative ride length values
CyclisticTripData <- CyclisticTripData[CyclisticTripData$ride_length > 00:00:00, ]


#exporting the 'CyclisticTripData' to  'CyclisticTripData.csv'
write.csv(CyclisticTripData,"20241126_CyclisticTripData.csv", row.names = FALSE) 
