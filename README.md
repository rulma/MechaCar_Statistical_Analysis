# MechaCar_Statistical_Analysis

## Overview

In this project we have been tasked with analyzing proudction data to assist AutoRUs's manufacturing team. We will conduct a linear regression analysis to predict which variables in the dataset predict the mpg of MechaCar prototypes. In addition, we will collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots. Lastly we will design a statistical study to compare MechaCar's pefomance to it's competitors.

## Linear Regression Analysis

For our initial analysis in helping the manufacturing team, we wanted to see how lenth, weight, spoiler angle, ground clearence and all wheel drive. effect the fuel efficiency of the MechCar. To do this we performed a linear regression to better understand which qualities have the greatest estimated impact on fuel efficiency. Having this knowlodge will allow the production team to design better more effficient machines.

**Code**
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
**Output**
```r
Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = Car)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11
```
## Summary Statistics on Suspension Coils
```r
Coil <- read.csv(file="Resources/Suspension_Coil.csv")
head(Coil)

total_summary <- Coil %>% summarize(Mean=mean(PSI),
                                    Median=median(PSI),
                                    Variance=var(PSI),
                                    SD=sd(PSI),
                                    .groups = 'keep')

lot_summary <- Coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
                                                                   Median=median(PSI),
                                                                   Variance=var(PSI),
                                                                   SD=sd(PSI),
                                                                   .groups = 'keep')
```

## T-test on on Suspension Coils
```r
plt1 <- ggplot(Coil,aes(y=PSI))
plt1 + geom_boxplot(
  
plt2 <- ggplot(Coil,aes(x=Manufacturing_Lot,y=PSI)) 
plt2 + geom_boxplot()


t.test(Coil$PSI,mu=1500)

lot1 <- subset(Coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(Coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(Coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
```
```r
> t.test(lot1$PSI,mu=1500)

	One Sample t-test

data:  lot1$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

> t.test(lot2$PSI,mu=1500)

	One Sample t-test

data:  lot2$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

> t.test(lot3$PSI,mu=1500)

	One Sample t-test

data:  lot3$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 

```
## Study Design: MechaCar vs Competition
