# Data Cleaning 

library(tidyverse)


file_name <- read.csv("cardio_train.csv", header =  TRUE, sep = ";")
my_data <- file_name
# get counts for number of female and male in the dataset 
my_data %>% count(gender)
# encode gender, female ==1 , male == 0  
my_new_data <-my_data %>% mutate(gender_updated = ifelse(my_data$gender == 1, 1, 0))
# remove duplicated values 
my_new_data %>%
  distinct(.keep_all = TRUE)
# balance number of active/inactive , male/female 
data_updated <- my_new_data[-sample(which(my_new_data$gender_updated == 1 & my_new_data$active == 1), 21069),]
#data_updated  <- my_new_data[-sample(1:nrow(my_new_data), 20000), ]

# count of female/male 
data_updated%>% count(gender_updated)
# count of active/inactive 
data_updated %>% count(active)

library("writexl")
write_xlsx(data_updated,"cvd_train_updated.csv")

# Run Statistical Analysis 

# lm() 
# Response variable : 
# Independent variables: 
