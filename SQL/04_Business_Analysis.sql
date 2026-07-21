/*
=========================================================
Project : Customer Churn Analysis
Author  : Prajakta Panchbuddhe
Purpose : Business Analysis using SQL
=========================================================

Objective:
Analyze customer churn patterns and identify key business
factors contributing to customer attrition.
*/

USE CustomerChurnDB;
GO

/*=========================================================
Business Question 1
What is the overall churn rate?
=========================================================*/

SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
        2
    ) AS ChurnRate
FROM Customers;

/*=========================================================
Business Question 2
Which contract type has the highest churn?
=========================================================*/

SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY Contract
ORDER BY ChurnRate DESC;

/*=========================================================
Business Question 3
Does customer tenure affect churn?
=========================================================*/

SELECT
CASE
WHEN tenure BETWEEN 0 AND 12 THEN '0-12 Months'
WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
ELSE '49+ Months'
END AS TenureGroup,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY
CASE
WHEN tenure BETWEEN 0 AND 12 THEN '0-12 Months'
WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
ELSE '49+ Months'
END

ORDER BY ChurnRate DESC;

/*=========================================================
Business Question 4
Which internet service customers churn the most?
=========================================================*/

SELECT

InternetService,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY InternetService

ORDER BY ChurnRate DESC;

/*=========================================================
Business Question 5
Does payment method influence churn?
=========================================================*/

SELECT

PaymentMethod,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY PaymentMethod

ORDER BY ChurnRate DESC;

/*=========================================================
Business Question 6
Do customers with higher monthly charges churn more?
=========================================================*/

SELECT

CASE
WHEN MonthlyCharges <30 THEN 'Below $30'
WHEN MonthlyCharges BETWEEN 30 AND 59.99 THEN '$30-$59'
WHEN MonthlyCharges BETWEEN 60 AND 89.99 THEN '$60-$89'
ELSE '$90+'
END AS ChargeGroup,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY
CASE
WHEN MonthlyCharges <30 THEN 'Below $30'
WHEN MonthlyCharges BETWEEN 30 AND 59.99 THEN '$30-$59'
WHEN MonthlyCharges BETWEEN 60 AND 89.99 THEN '$60-$89'
ELSE '$90+'
END

ORDER BY ChurnRate DESC;


/*
=========================================================
Business Insights
=========================================================

1. Month-to-month customers have the highest churn rate
   (~42.7%), indicating lower customer commitment.

2. Customers with less than one year of tenure are the
   most likely to churn.

3. Fiber optic customers show significantly higher churn
   than DSL customers.

4. Customers using Electronic Check have the highest
   churn rate among all payment methods.

5. Customers paying higher monthly charges are more
   likely to leave the company.

6. Long-term contracts (One Year and Two Year)
   substantially reduce churn.

=========================================================
*/

