# Google Data Analytics Course - Capstone Project (November 2024)
# Case study: How does a bike-share navigate speedy success?  🚴🚲👩‍💻📈📊

This project contains a solution for the Capstone of [Google Data Analytics Professional Certificate Program](https://www.coursera.org/professional-certificates/google-data-analytics) from [Google](https://www.coursera.org/google-career-certificates) 

## Google Data Analytics Course 📈📊 

- Professional training designed by Google 🟢🔵🔴🟡
- Prepare for a career in Data Analytics
- 8 Course series, including Google Data Analytics Capstone: Complete a Case Study

> This project is my proposed solution on the Cyclistic bike-share analysis case study! 

<br/>

## Introduction 

In this case study, I will perform real-world tasks as a junior data analyst for a fictional company, Cyclistic, working in the marketing analytics team. In order to answer the business questions, I will follow the steps of the data analysis process: [Ask](#ask), [Prepare](#prepare), [Process](#process), [Analyze](#analyze), [Share](#share), and [Act](#act).

<br/>


## Background and Business Question

### Cyclistic

Cyclistic is a bike-share company in Chicago. In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

This bike-share program features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, the director of marketing believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, she believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

<br/>

### Characters and teams

- **Cyclistic marketing analytics team:** A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.

- **Cyclistic executive team:** The notoriously detail-oriented executive team.

- **Lily Moreno:** The director of marketing and the manager of my team. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels. He believes the company’s future success depends on maximizing the number of annual memberships.

- **Carla Cotas:** A junior data analyst working in the marketing analytics team. My team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve the recommendations, so they must be backed up with compelling data insights and professional data visualizations. 

<br/>

### Scenario 

**Moreno has set a clear goal:** Design marketing strategies aimed at converting casual riders into annual members.

*In order to do that, however, my team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Therefore, Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.*

<br/>


## Ask 

### Analysis Questions

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

The first question to answer was assigned to me: **_How do annual members and casual
riders use Cyclistic bikes differently?_**

<br/>


## Prepare

### Folder Structure

The local directory, folders, sub-folders and file-naming conventions follow the structure below:

```
|--20241113_CyclisticBikeShare
  |-- 1.OriginalData
  |-- 2.PreparedData
  |-- 3.UploadedData
    |-- 20141202
  |-- 4.Analysis
    |-- DataErrors
      |-- AumaticallyExcludedResults
      |-- ManuallyExcludedResults
    |-- RStudio Code
    |-- Figures
  |-- 5.Insights
    |-- MyInsights
    |-- SharedInsights
  |-- 6.Final
    |-- Report
    |-- Presentation
```



### Data Source

Cyclistic’s historical trip data to analyze and identify trends is available [here](https://divvy-tripdata.s3.amazonaws.com/index.html).

This study analyzes and identifies trends from the previous 12 months: November 2023 to October 2024 (‘202211-divvy-tripdata.csv’ → ‘202410-divvy-tripdata.csv’).

*The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). This is public data that can use to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that you won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.*

### Data Preparation

> ⚠️ **Note:** I tried to complete this project using the data from previous 12 months but I've been limited to manage renaming the original data files in Posit’s RStudio and I could only renaiming 6 files - when renaiming 7 files, Posit’s RStudio crashes. So I decided to complete this project focusing the first previous 6 months: November 2023 to April 2024 (‘202311-divvy-tripdata.csv’ → ‘202404-divvy-tripdata.csv’) because Posit’s RStudio does not crashes due to Memory Usage. However, when merging data in the [Process](#process), Posit’s RStudio crashes! So, following the tip from the Case Study Roadmap for the Data Process, I use the ‘Divvy_Trips_2019_Q4.csv’ and ‘Divvy_Trips_2020_Q1.csv’ datasets (October 2019 to March 2020).

The Cyclistic’s historical trip data is available to download in zip files (‘Divvy_Trips_2019_Q2.csv’ and ‘Divvy_Trips_2020_Q1.csv’). After downloaded and stored in a folder (1.OriginalData), the zip files were unzipped locally giving the original .CSV data files (‘Divvy_Trips_2019_Q2.csv’ and ‘Divvy_Trips_2020_Q1.csv’). This study uses [Posit’s RStudio - free version](https://posit.co/download/rstudio-desktop/) for the analysis because it is a powerful tool for performing statistical analyses and data visualizations.

The original data files, naming convention of Divvy_Trips_YYYY_(Q1/Q4), were loaded into Posit’s RStudio and renamed for simplicity and improve readability.



```
CyclisticTripData_2019_Q4 <- read.csv("Divvy_Trips_2019_Q4.csv")
CyclisticTripData_2020_Q1 <- read.csv("Divvy_Trips_2020_Q1.csv")

```
The variables Divvy_Trips_YYYY_(Q1/Q4) were assigned and were added automatically to the environment:

![image](https://github.com/user-attachments/assets/a2f121b6-256b-4fb5-b629-607d219f8f01)


Key findings:
- the data is organized in CSV (comma-separated values) format
- there is an inconsistency in the column numbers: 2020, Q1 has 13 columns - 2019, Q4 only has 12 columns
- the number of observations/rows is different every Quarter

A check summary data was performed for exploring the inconsistency in the column numbers that the original data files have and to ensure the same number of columns and the same column names before moving to the next step and merge them in only one data set.
```
colnames(CyclisticTripData_2019_Q4)
colnames(CyclisticTripData_2020_Q1)

CyclisticTripData_dfs = list(CyclisticTripData_2019_Q4, CyclisticTripData_2020_Q1)

for (CyclisticTripData_df in CyclisticTripData_dfs) {
  glimpse(CyclisticTripData_df)
}

for (CyclisticTripData_df in CyclisticTripData_dfs) {
  str(CyclisticTripData_df)
}
```

![image](https://github.com/user-attachments/assets/c59aaa00-f67e-4fc7-81f7-111fddb8e5cc)

- **CyclisticTripData_2019_Q4**
The summary data includes trip id, started and ended time, bike id, trip duration, start and end station - name and id, user type, gender and birthyear.
  
![image](https://github.com/user-attachments/assets/d7f2d564-f512-4ee9-aa6e-8404bf661411)

- **CyclisticTripData_2020_Q1**
The summary data includes ride id, rideable type, started and ended time, start and end station - name, id, latitude and longitude, and member type.

![image](https://github.com/user-attachments/assets/eccabba5-f857-4528-ac29-57a518aa388d)


And, in a very exploratory analysis, there are some datatype inconsistencies.

- **CyclisticTripData_2019_Q4**

![image](https://github.com/user-attachments/assets/c44d0fd9-175b-40a6-a8e1-72d5f26b3651)

- **CyclisticTripData_2020_Q1**

![image](https://github.com/user-attachments/assets/10c2671c-606f-406e-b93e-4d83f433edd4)

The data can be trusted, it is published in a trustworthiness source and it is aligned with the question that was assigned to me. However, all ride ids are unique and due to data privacy prohibiting
using rider's personally identifiable information, it will not be possible to determine if riders have purchased multiple single passes. Moreover, the problems with data identified lead to the need to process the data and clean it for analysis.

<br/>

## Process

In this step, the two datasets are combined into one dataset, clean it and manipulate it.

### Data cleaning

Before combining the tow datasets (‘CyclisticTripData_2019_Q4’ and ‘CyclisticTripData_2020_Q1’) into one dataset (‘CyclisticTripData’), the inconsistency in column names in each dataframe needs to be addressed by renaming the columns to ensure uniformity.
The column names are renaming considering the most recent naming convention - CyclisticTripData_2020_Q1.

```
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
```
Now that the column names are the same, the datatype for the columns _ride_id_ and _rideable_type_ needs to be uniform for combining the two dataframes.

```
CyclisticTripData_2019_Q4 <- mutate(CyclisticTripData_2019_Q4, ride_id = as.character(ride_id)
                                    ,rideable_type = as.character(rideable_type))
```

The data attributes now are uniform! The two dataframes can be combined into only one dataframe for analyzing 6 months of data.

```
CyclisticTripData <- bind_rows(CyclisticTripData_2019_Q4, CyclisticTripData_2020_Q1)
```

![image](https://github.com/user-attachments/assets/9fc2cd5a-65bf-4782-bab3-b25a979eae11)

Then the large dataframe can be verified to check very quickly uniformities and to get a better data sensitivity.

```
colnames(CyclisticTripData)
glimpse(CyclisticTripData)
head(CyclisticTripData)
tail(CyclisticTripData)
```

From looking at the output information, the columns _start_lat_, _start_lng_, _end_lat_ and _end_lng_ can be removed because the data were collected only at ‘CyclisticTripData_2020_Q1’.
Also, the columns _birthyear_ and _gender_ can be removed because the data were collected only at ‘CyclisticTripData_2019_Q4’.

```
CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("birthyear"
                                                                         ,"gender"
                                                                         ,"start_lat"
                                                                         ,"start_lng"
                                                                         ,"end_lat"
                                                                         ,"end_lng")]
```

Typing ```View(CyclisticTripData)``` on the console returns how the _CyclisticTripData_ dataframe looks like.

![image](https://github.com/user-attachments/assets/8380cf75-5405-4d6f-b04d-27968baf03ad)


Now, the large dataframe is ready to check that data is clean, free of errors and check if modifying data is needed.

> Note: The large dataframe is exported to continue working in another R script due to Posit’s RStudio Memory Usage limit on the free version!

```
write.csv(CyclisticTripData,"20241119_CyclisticTripData.csv", row.names = FALSE)
```


### Data manipulation

> Note: The large dataframe was loaded into Posit’s RStudio (new project and R script) to avoid that RStudio crashes due to Memory Usage.

Next, a closer look at data is taken to check for duplicates, null values, and inconsistency on values that needs to be cleaned.

```
# find 'ride_id' DUPLICATES 
CyclisticTripData_duplicates <- CyclisticTripData[duplicated(CyclisticTripData$ride_id), ]
duplicate_counts <- table(CyclisticTripData[duplicated(CyclisticTripData$ride_id), ])

# find and count MISSING values
which(is.na(CyclisticTripData))     
sum(is.na(CyclisticTripData))       
colSums(is.na(CyclisticTripData))   
CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("tripduration")]
CyclisticTripData_missing <- CyclisticTripData[rowSums(is.na(CyclisticTripData)) > 0,]
write.csv(CyclisticTripData_missing,"20241120_CyclisticTripData_MissingValues.csv", row.names = FALSE)
CyclisticTripData <- CyclisticTripData[rowSums(is.na(CyclisticTripData)) == 0, ]

# ensuring consistency on data 'member_casual' column
unique(CyclisticTripData$member_casual)
CyclisticTripData$member_casual_copy = CyclisticTripData$member_casual
CyclisticTripData <- CyclisticTripData %>%
  mutate(member_casual = recode(member_casual, 'Subscriber' = 'member', 'Customer' = 'casual' ))
CyclisticTripData <- subset( CyclisticTripData, select = -member_casual_copy )

# check for consistency on number of characters across columns
summarise_if(CyclisticTripData, is.character, funs(max(nchar(.), na.rm=T)))
summarise_if(CyclisticTripData, is.character, funs(min(nchar(.), na.rm=T)))
```

Key findings:
- There are no _ride_id_ duplicates
- There are 426888 missing values (426887 in 'tripduration', 1 in 'end_station_id')
- The 426887 missing values in 'tripduration' are due to this column data collected only at ‘CyclisticTripData_2020_Q1’
- The column 'tripduration' can be removed. Now the data has 1 missing value
  ![image](https://github.com/user-attachments/assets/b3b2ab61-180b-47c4-a0dd-ae9c0aa3568a)
- There are "Subscriber","Customer","member" and "casual" at _member_casual_ column. This fact is due to the different member type values between ‘CyclisticTripData_2019_Q4’ and ‘CyclisticTripData_2020_Q1’. The information that we have is that: Customers are identified as casual riders ("causal") and Cyclistic members ("members"). So, to ensure consistency on data: "Subscriber" is considered a Cyclistic member and "Customer" is the same as casual rider.
- There are no consistency on values of column _rideable_type_ due to the same fact presented in the previous point, values change between ‘CyclisticTripData_2019_Q4’ and ‘CyclisticTripData_2020_Q1’. However, with the information available and without further information we can't address this data inconsistency. So, for the purposes of this study, it was decided to remove this column.
  ```
  CyclisticTripData <- CyclisticTripData[,!names(CyclisticTripData) %in% c("rideable_type")]
  ```
- There are consistency on characters length on columns _started_at_, _ended_at_ and _member_casual_
  ![image](https://github.com/user-attachments/assets/5be829ee-05ad-4e74-b1b8-bcb61049fd97)
  ![image](https://github.com/user-attachments/assets/5630c605-5718-40ae-bcc3-acafc9258e1b)

  
Now, the data is ready to the transform and calculation steps to know the ride length and day of week.

New columns _ride_length_ and _day_of_week_ are created to calculate (1) the length of each ride by subtracting the column _started_at_ from the column _ended_at_ and (2) the day of the week that each ride started, respectivelly. Both columns _started_at_ and _ended_at_ have the start and end time in the format YYYY-MM-DD hh:mm:ss.

```
CyclisticTripData$ride_length <- as_hms(difftime(CyclisticTripData$ended_at, CyclisticTripData$started_at))
CyclisticTripData$day_of_week <- weekdays(as.Date(CyclisticTripData$started_at))
```

Now, a closer look at data in the new columns is taken to check for consistency and meaning on values.

```
# check the values on column 'day_of_week' ensuring consistency
unique(CyclisticTripData$day_of_week)

# check for 'ride_length' negative or zero and remove them
as_hms(min(CyclisticTripData$ride_length, na.rm = TRUE))
as_hms(max(CyclisticTripData$ride_length, na.rm = TRUE))
CyclisticTripData_ridelength_zeronegative <- CyclisticTripData[CyclisticTripData$ride_length <= 00:00:00,]
write.csv(CyclisticTripData_ridelength_zeronegative,"20241126_CyclisticTripData_ridelength_InconsistencyValues.csv", row.names = FALSE)
CyclisticTripData <- CyclisticTripData[CyclisticTripData$ride_length > 00:00:00, ]

```

Key findings:
- There are consistency on the the day of the week that each ride started, with unique values corresponding to the names of the days of the week
![image](https://github.com/user-attachments/assets/f5503515-ce32-4c2e-a39f-a46099a82a3e)  
- There are at least one negative value on ride length. And, at least one value that is higher than one day (circa 109 days) and less than the total number of days corresponding to this analsysis
![image](https://github.com/user-attachments/assets/475a6d3a-c9c6-4bc1-9c91-4dec352d2eeb)
- There are 222 observations with negative ride length or equal to 00:00:00
- At the end, the data ready for analysis has 1130718 observations

> Note: For the purposes of this study and to learn objectives, the data is already ready for the Analyze step; however, the original data ‘CyclisticTripData_2020_Q1’ includes columns with latitude and longitude for the start and end stations. An additional step on data manipulation is to calculate the ride length if possible with the start and end stations information (latitude and longitude) from the first quarter of 2020 to complete the 'CyclisticTripData' dataframe. 

The large dataframe and the original data from the first quarter of 2020 were loaded into Posit’s RStudio (new project and R script). And, a closer look at data is taken to check for consistency on the stations start and end names between the two dataframes.

```
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
```

Key findings:
- There are no consistency on the start and end station names on both dataframes:
fisrt quarter of 2020 - unique start station names: 607, unique end station names: 603
large dataframe - unique start station names: 613, unique end station names: 611
- Without further information about all the stations latitude and longitude we cannot guarantee consistency on ride length calculations for all observations
- At the end, the data ready for analysis has 1130718 observations and 10 features 

<br/>

## Analyze

After the data is prepared, processed, and stored appropriately, it's ready for analyze it. 
The main objective in this step is to find trends or relationships in the data. Also, we can discover some surprises in the data. And, find how will these insights help answer the question assigned to me.
This step includes conducting descriptive analysis and identifying trends and relationships.

Following the Case Study Roadmap for the Data Analyze, I started this step by looking the following questions:
- How should you organize your data to perform analysis on it?
- Has your data been properly formatted?
- What surprises did you discover in the data?

```
glimpse (CyclisticTripData)
str (CyclisticTripData)
summary(CyclisticTripData)
```

The data includes ride id, started and ended time, start and end station - name and id, member type, ride length and day of week.

![image](https://github.com/user-attachments/assets/76c138fe-0e6e-4dbf-af77-0aa459d19b01)

![image](https://github.com/user-attachments/assets/5d15d38d-1bef-4d43-a17b-beb76e550f52)

![image](https://github.com/user-attachments/assets/0f75f245-78f7-4739-8324-b2c89d6a79f9)


To run the analysis we must have ride length on the proper format for descriptive analysis. Also, an additional format transform will be done, to guarantee that start and end station - id has the correct format.

```
CyclisticTripData <- mutate(CyclisticTripData, start_station_id = as.character(start_station_id)
                                    ,end_station_id = as.character(end_station_id)
                                    ,ride_length = as.numeric(hms(ride_length)))

```
![image](https://github.com/user-attachments/assets/7562c3ce-5559-4fe7-a769-baaa50a49ece)

![image](https://github.com/user-attachments/assets/14864a20-2210-4e45-9e57-9eca3b906f96)

![image](https://github.com/user-attachments/assets/9fd8946c-aa3f-4279-900a-ff6f3b67bfd0)

The data is now properly formatted!

### Descriptive analysis

Important metrics such as mean and maximum for the ride length are calculated for each member type.

```
CyclisticTripData_RideLengthMetrics <- CyclisticTripData %>% 
  group_by(member_casual) %>%
  summarise(mean_ride_length = round(mean(ride_length), 0)
            , median_ride_length = median(ride_length)
            , max_ride_length = max(ride_length))

CyclisticTripData_RideLengthMetrics <- mutate(CyclisticTripData_RideLengthMetrics
                                           , mean_ride_length = hms(mean_ride_length)
                                           , median_ride_length = hms(median_ride_length)
                                           , max_ride_length = hms(max_ride_length))
```
![image](https://github.com/user-attachments/assets/207f43a9-9ed5-487f-91ff-805547a3016f)
![image](https://github.com/user-attachments/assets/c7456d36-0a42-48de-938f-e4ba39d05268)



Next, the mode of day of week is also calculated.
To calculate the mode, R does not provide a built-in funciton to calculate it. The built-in function mode() in R gives the variable type instead of the most frequently occurring value. Thus, a [User defined-function](https://www.scaler.com/topics/mean-median-mode-in-r/) was used to calculate the mode.


```
calculate_mode <- function(data) {
  uniq_vals <- unique(data)
  uniq_counts <- table(data)
  mode_value <- uniq_vals[which.max(uniq_counts)]
  return(mode_value)
}
CyclisticTripData_ModeDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual) %>%
  summarise(mode_day_of_week = calculate_mode(day_of_week))
```
![image](https://github.com/user-attachments/assets/4ad8ecdd-f7ff-4faa-a3ef-fc9f69bec0b4)


The mean ride length by day of week can be also calculate.

```
CyclisticTripData_Mean_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(mean_ride_length = round(mean(ride_length), 0), .groups = 'drop') %>%
  mutate(mean_ride_length = hms(mean_ride_length))

```
![image](https://github.com/user-attachments/assets/b6c5a1f7-4d9c-4297-83ee-df304a86eb8f)
![image](https://github.com/user-attachments/assets/7e5d71a7-2954-48ce-9690-c9b7553cf91f)



And, the total number of rides for each member type by day of week can be also calculated.

```
CyclisticTripData_Rides_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(number_rides = n(), .groups = 'drop')

CyclisticTripData_TotalRides <- CyclisticTripData %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = n())

```
![image](https://github.com/user-attachments/assets/0e3aa10d-57a1-4978-a0e5-f4b6e559c1fe)

Also, the total number of rides for each member type can be calculated.

```
CyclisticTripData_TotalRides <- CyclisticTripData %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = n()) %>%
  mutate(percentage_rides = round(ride_count/sum(ride_count)*100,2))
```
![image](https://github.com/user-attachments/assets/e9d0c616-9a9a-44f8-8a0b-952269902472)

And, for each member type per day of week.

```
CyclisticTripData_Rides_UserDayOfWeek <- CyclisticTripData %>% 
  group_by(member_casual, day_of_week) %>%
  summarise(number_rides = n(), .groups = 'drop') %>%
  mutate(percentage_number_rides = round(number_rides/sum(number_rides) * 100,2))
```
![image](https://github.com/user-attachments/assets/61e6e49c-2df5-4942-8f97-90b5c023f8e4)



Key findings:
- Casual members ride more frequently at Friday, for longer ride length
- Members ride more frequently on Sunday, for shorter ride length
- Members ride higher mean ride length on weekends
- The lower mean ride length for casual members is on Monday
- There are more rides of casual members on weekends than during week days. At the opposite, there are more rides of members during week days than weekends
- Only circa of 14% total rides are casual members
- Rides of members during week days range between circa 12 to 16% of the total number of rides. While for the casual members is always less than circa 2% of the total number of rides

Important data insights were already obtained and can be translated visually to present data more clearly.

<br/>

## Share

In this step, after the analysis is performed and some insights are obtained, relevant visualizations are created to share findings.

- 





<br/>

## Act


<br/>

## What's in this project? 👩‍💻

`README.md`: That's this file, where you can describe your project and how you built it.

<p/>
  
`20241113_DataPreparation_CyclisticBikeShareCapstone.R`: That's R script with the code for the steps [Data Preparation](#data-preparation) and [Process - Data Cleaning](#data-cleaning).

<p/>

`20241120_DataManipulation_CyclisticBikeShareCapstone`: That's R script with the code for the steps [Process - Data Manipulation](#data-manipulation).

<p/>

<p/>

`20241128_ExtraDataManipulation_CyclisticBikeShareCapstone.R`: That's R script with the code for the steps [Process - Data Manipulation](#data-manipulation) with additional step that intended to calculate ride distance.

<p/>

<p/>

`20241202_DataAnalyze_CyclisticBikeShareCapstone.R`: That's R script with the code for the steps [Analyze](#analyze).

<p/>


<br/>

## Resources

[Background and Business Question](#background-and-business-question) was inspired by the business case description provided on [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

<p/>

