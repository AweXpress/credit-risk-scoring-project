# 03 - Predictions & Expected Loss
pred_prob <- predict(model, test_set, type="response")
pred_class <- ifelse(pred_prob > 0.5, 1, 0)
table(test_set$TARGET, pred_class)

# Accuracy - fixed
mean(as.numeric(as.character(test_set$TARGET)) == pred_class)

# Expected Loss Calculation: EL = PD * LGD * EAD
LGD <- 0.45
test_set$PD <- pred_prob
test_set$EAD <- test_set$AMT_CREDIT
test_set$Expected_Loss <- test_set$PD * LGD * test_set$EAD

# Tuned threshold 0.3 for imbalanced data
pred_class_03 <- ifelse(pred_prob > 0.3, 1, 0)
table(test_set$TARGET, pred_class_03)

# Final portfolio for Power BI
scored_loan_portfolio <- test_set
write.csv(scored_loan_portfolio, "scored_loan_portfolio.csv", row.names=FALSE)
head(scored_loan_portfolio[, c("AMT_CREDIT", "PD", "EAD", "Expected_Loss")])
getwd()
