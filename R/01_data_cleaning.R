# 01_data_cleaning.R
application_train <- read.csv("application_data.csv")

dim(application_train)
head(application_train)
table(application_train$TARGET)

missing_pct <- colMeans(is.na(application_train))*100
missing_pct[missing_pct > 0]
sort(missing_pct[missing_pct > 0], decreasing = TRUE)

keep_cols <- names(missing_pct[missing_pct < 50])
clean_data <- application_train[, keep_cols]
dim(clean_data)

for (col in names(clean_data)) {
  if (any(is.na(clean_data[[col]]))){
    if (is.numeric(clean_data[[col]])){
      clean_data[[col]][is.na(clean_data[[col]])] <- median(clean_data[[col]], na.rm = TRUE)
    } else {
      clean_data[[col]][is.na(clean_data[[col]])] <- names(sort(table(clean_data[[col]]), decreasing = TRUE))[1]
    }
  }
}
sum(is.na(clean_data))

# Save cleaned
write.csv(clean_data, "cleaned_data.csv", row.names=FALSE)
