# 02 - Split & Model
set.seed(123)
sample_row <- sample(1:nrow(clean_data), 0.7*nrow(clean_data))
train_set <- clean_data[sample_row, ]
test_set <- clean_data[-sample_row, ]

dim(train_set)
dim(test_set)

# Logistic Model - Key Factors
model <- glm(TARGET ~ AMT_INCOME_TOTAL + AMT_CREDIT + AMT_ANNUITY + 
             DAYS_BIRTH + DAYS_EMPLOYED + EXT_SOURCE_2 + EXT_SOURCE_3 + 
             CNT_FAM_MEMBERS + REGION_RATING_CLIENT, 
             data=train_set, family=binomial)
summary(model)
