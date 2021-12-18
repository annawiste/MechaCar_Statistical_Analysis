library(dplyr)

# Linear model predicting mpg
data_mpg<-read.csv("MechaCar_mpg.csv")
lm_mpg<-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data_mpg)
summary(lm_mpg)

# summary statistics for PSI
data_coil<-read.csv("Suspension_Coil.csv")
total_summary<-data_coil %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# PSI divided by lot
lot_summary<-data_coil %>%
  group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Test for difference from population mean

t.test(data_coil$PSI, mu=1500)

data_coil1<-filter(data_coil, Manufacturing_Lot =="Lot1")
data_coil2<-filter(data_coil, Manufacturing_Lot =="Lot2")
data_coil3<-filter(data_coil, Manufacturing_Lot =="Lot3")

t.test(data_coil1$PSI, mu=1500)
t.test(data_coil2$PSI, mu=1500)
t.test(data_coil3$PSI, mu=1500)
