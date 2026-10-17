# 01_data_cleaning.R - Home Credit Risk
library(tidyverse)

# Load data
df <- read.csv("application_data.csv")

# Handle missing values, create Age Group
df <- df %>%
  mutate(
    Age = -DAYS_BIRTH / 365,
    Age_Group = cut(Age, breaks=c(20,30,40,50,60,70), 
                    labels=c("20-29","30-39","40-49","50-59","60+"))
  ) %>%
  filter(!is.na(AMT_CREDIT))

# Save cleaned
write.csv(df, "cleaned_data.csv", row.names=FALSE)
