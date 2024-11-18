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
|--YYYYMMDD_CyclisticBikeShare
  |-- 1.OriginalData
  |-- 2.PreparedData
  |-- 3.UploadedData
    |-- !YYYYMMDD
  |-- 4.Analysis
    |-- DataErrors
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
Q1 datasets

The Cyclistic’s historical trip data is available to download in zip files (‘Divvy_Trips_2019_Q2.csv’ and ‘Divvy_Trips_2020_Q1.csv’). After downloaded and stored in a folder (1.OriginalData), the zip files were unzipped locally giving the original .CSV data files (‘Divvy_Trips_2019_Q2.csv’ and ‘Divvy_Trips_2020_Q1.csv’). This study uses [Posit’s RStudio - free version](https://posit.co/download/rstudio-desktop/) for the analysis because it is a powerful tool for performing statistical analyses and data visualizations.

The original data files, naming convention of Divvy_Trips_YYYY_(Q1/Q4), were loaded into R-Studio Desktop and renamed for simplicity and improve readability.



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
The summary data includes tripe id, started and ended time, bike id, trip duration, start and end station - name and id, user type, gender and birthyear.
  
![image](https://github.com/user-attachments/assets/d7f2d564-f512-4ee9-aa6e-8404bf661411)

- **CyclisticTripData_2020_Q1**
The summary data includes ride id, rideable type, started and ended time, start and end station - name, id, latitude and longitude, and member type.

![image](https://github.com/user-attachments/assets/eccabba5-f857-4528-ac29-57a518aa388d)


And, in a very exploratory analysis, there are some datatype inconsistencies.

- **CyclisticTripData_2019_Q4**

![image](https://github.com/user-attachments/assets/4d214729-ba46-43d1-bef1-f4c93704507f)



- **CyclisticTripData_2020_Q1**

![image](https://github.com/user-attachments/assets/fd0f335d-9ba5-4789-bd28-5690dab695d0)


The data can be trusted, it is published in a trustworthiness source and it is aligned with the question that was assigned to me. However, all ride ids are unique and due to data privacy prohibiting
using rider's personally identifiable information, it will not be possible to determine if riders have purchased multiple single passes. Moreover, the problems with data identified lead to the need to process the data and clean it for analysis.

<br/>

## Process

The Process step is where the data is processed for analysis:
- data cleaning
- data manipulation

### Data cleaning


### Data manipulation

<br/>

## Analyze



<br/>

## Share



<br/>

## Act



<br/>

## What's in this project? 👩‍💻

`README.md`: That's this file, where you can describe your project and how you built it. 

<p/>

<br/>

## Resources

[Background and Business Question](#background-and-business-question) was inspired by the business case description provided on [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

<p/>

