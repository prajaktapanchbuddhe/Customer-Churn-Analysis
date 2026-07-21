/*
=========================================================
Project : Customer Churn Analysis
Author  : Prajakta Panchbuddhe
Purpose : Import telecom customer dataset
=========================================================

Dataset:
WA_Fn-UseC_-Telco-Customer-Churn.csv

Source:
IBM Telco Customer Churn Dataset

Database:
CustomerChurnDB

Destination Table:
dbo.Customers

Rows Imported:
7043

Import Method:
SQL Server Management Studio - Import Flat File Wizard

Notes:
- customerID imported as NVARCHAR(50)
- TotalCharges allows NULL values because some new customers have no total charges yet.
*/