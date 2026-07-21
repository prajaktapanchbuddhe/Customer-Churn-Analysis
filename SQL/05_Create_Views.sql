/*
=========================================================
Project : Customer Churn Analysis
Author  : Prajakta Panchbuddhe
Purpose : Create SQL Views for Business Reporting
=========================================================
*/

USE CustomerChurnDB;
GO

/*=========================================================
View 1: Churn by Contract
=========================================================*/

IF OBJECT_ID('dbo.vw_ChurnByContract', 'V') IS NOT NULL
    DROP VIEW dbo.vw_ChurnByContract;
GO

CREATE VIEW dbo.vw_ChurnByContract
AS
SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 100.0 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY Contract;
GO

SELECT *
FROM dbo.vw_ChurnByContract;


/*=========================================================
View 2: Churn by Tenure
=========================================================*/

IF OBJECT_ID('dbo.vw_ChurnByTenure', 'V') IS NOT NULL
    DROP VIEW dbo.vw_ChurnByTenure;
GO

CREATE VIEW dbo.vw_ChurnByTenure
AS
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
END;
GO

/*=========================================================
View 3: Churn by Internet Service
=========================================================*/

IF OBJECT_ID('dbo.vw_ChurnByInternetService', 'V') IS NOT NULL
DROP VIEW dbo.vw_ChurnByInternetService;
GO

CREATE VIEW dbo.vw_ChurnByInternetService
AS

SELECT

InternetService,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY InternetService;
GO


/*=========================================================
View 4: Churn by Payment Method
=========================================================*/

IF OBJECT_ID('dbo.vw_ChurnByPaymentMethod', 'V') IS NOT NULL
DROP VIEW dbo.vw_ChurnByPaymentMethod;
GO

CREATE VIEW dbo.vw_ChurnByPaymentMethod
AS

SELECT

PaymentMethod,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 100.0 ELSE 0 END)/COUNT(*),
2
) AS ChurnRate

FROM Customers

GROUP BY PaymentMethod;
GO


/*=========================================================
View 5: Churn by Monthly Charges
=========================================================*/

IF OBJECT_ID('dbo.vw_ChurnByMonthlyCharges', 'V') IS NOT NULL
DROP VIEW dbo.vw_ChurnByMonthlyCharges;
GO

CREATE VIEW dbo.vw_ChurnByMonthlyCharges
AS

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
END;
GO