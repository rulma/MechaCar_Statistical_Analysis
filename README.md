# MechaCar_Statistical_Analysis

## Overview

In this project we have been tasked with analyzing proudction data to assist AutoRUs's manufacturing team. We will conduct a linear regression analysis to predict which variables in the dataset predict the mpg of MechaCar prototypes. In addition, we will collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots. Lastly we will design a statistical study to compare MechaCar's pefomance to it's competitors.

## Linear Regression Analysis
```r
Car <- read.csv(file="Resources/MechaCar_mpg.csv")
library(dplyr)
library(magrittr)
library(knitr)

head(Car)

summary(Car)

linear_Regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Car)

summary(linear_Regression)
```
## Summary Statistics on Suspension Coils

## Study Design: MechaCar vs Competition
