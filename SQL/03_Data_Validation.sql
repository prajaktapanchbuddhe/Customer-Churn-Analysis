/*
=========================================================
Project : Customer Churn Analysis
Author  : Prajakta Panchbuddhe
Purpose : Validate imported customer data
=========================================================
*/

USE CustomerChurnDB;
GO

/*-------------------------------------------------------
1. Total Records
-------------------------------------------------------*/
SELECT COUNT(*) AS TotalRecords
FROM Customers;


/*-------------------------------------------------------
2. Check for Duplicate Customer IDs
-------------------------------------------------------*/
SELECT
    customerID,
    COUNT(*) AS DuplicateCount
FROM Customers
GROUP BY customerID
HAVING COUNT(*) > 1;


/*-------------------------------------------------------
3. Check for NULL Customer IDs
-------------------------------------------------------*/
SELECT *
FROM Customers
WHERE customerID IS NULL;


/*-------------------------------------------------------
4. Check for NULL Total Charges
-------------------------------------------------------*/
SELECT *
FROM Customers
WHERE TotalCharges IS NULL;


/*-------------------------------------------------------
5. Verify Churn Values
-------------------------------------------------------*/
SELECT DISTINCT Churn
FROM Customers;


/*-------------------------------------------------------
6. Verify Contract Types
-------------------------------------------------------*/
SELECT DISTINCT Contract
FROM Customers;


/*-------------------------------------------------------
7. Verify Internet Service Types
-------------------------------------------------------*/
SELECT DISTINCT InternetService
FROM Customers;


/*-------------------------------------------------------
8. Verify Payment Methods
-------------------------------------------------------*/
SELECT DISTINCT PaymentMethod
FROM Customers;

/*-------------------------------------------------------
Validation Summary
---------------------------------------------------------

✓ Total Records Verified : 7043

✓ No Duplicate Customer IDs Found

✓ No Missing Customer IDs

✓ NULL TotalCharges Found Only For New Customers (Tenure = 0)

✓ Churn Values Valid

✓ Contract Types Valid

✓ Internet Service Values Valid

✓ Payment Methods Valid

Result:
Dataset Passed Validation And Is Ready For Business Analysis.

-------------------------------------------------------*/