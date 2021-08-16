Car <- read.csv(file="Resources/MechaCar_mpg.csv")
library(dplyr)
library(magrittr)
library(knitr)

head(Car)

summary(Car)

linear_Regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Car)

summary(linear_Regression)

# Deliverable 2

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
# Deliverable 3 

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