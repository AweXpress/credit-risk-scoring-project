# Credit Risk Scoring & $55.2bn Expected Loss Dashboard

End-to-end credit risk model: 307k loans, Logistic Regression, Power BI | PD * LGD * EAD

## Business Problem
Bank needs to quantify risk on $55.2bn loan portfolio and price loans by risk tier.

## Key Results (from Power BI)
- Total Exposure: $55.20bn
- Total Expected Loss: $1.88bn
- Avg PD: 8.1%, High Risk Tier: 52.7% PD, $1.19bn exposure

## Model
- Logistic Regression (glm)
- Accuracy: 91.9% at 0.3 threshold
- AUC: 0.76
- Formula: Expected Loss = PD * LGD (0.45) * EAD (AMT_CREDIT)

## Files
- R/ - 3 scripts (cleaning, risk metrics, model)
- dashboard/screenshots/ - Power BI dashboard
- data/ - sample scored_loan_portfolio.csv (first 1k rows only - no PII)

## How to Run
1. R: Run R/01 -> 02 -> 03
2. Power BI: Open dashboard/Credit_Risk_Dashboard.pbix
3. Output: scored_loan_portfolio.csv with PD, EAD, Expected_Loss, Risk_Tier

## Tech Stack
R, Logistic Regression, Power BI, DAX, pROC, caret

Author: AweExpress | LinkedIn:(https://www.linkedin.com/in/temitope-awe-79a75b1a9/)
