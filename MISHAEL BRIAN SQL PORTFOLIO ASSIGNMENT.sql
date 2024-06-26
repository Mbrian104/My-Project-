--1. LIST ALL PRODUCTS
SELECT* 
FROM [Production].[Product];
GO

--2. FIND THE TOTAL NUMBER OF ORDERS
SELECT COUNT(*) AS TOTAL_ORDERS
FROM [Sales].[SalesOrderHeader];
GO

--3. GET THE LIST OF CUSTOMERS WHO HAVE PLACED ORDERS
SELECT DISTINCT CustomerID
FROM [Sales].[SalesOrderHeader];
GO

--4. FIND THE TOTAL NUMBER OF VENDORS
SELECT COUNT(*) AS TOTAL_VENDORS
FROM [Purchasing].[Vendor];
GO

--5. GET (SINGLE) MARITAL STATUS OF EMPLOYEES
SELECT E.JobTitle, E.MaritalStatus, P.FirstName, P.LastName
FROM [HumanResources].[Employee] E
JOIN [Person].[Person] P ON E.BusinessEntityID=P.BusinessEntityID
WHERE MaritalStatus='S';
GO

--6. GET (MARRIED) MARITAL STATUS OF EMPLOYEES
SELECT E.JobTitle, E.MaritalStatus, P.FirstName, P.LastName
FROM [HumanResources].[Employee] E
JOIN [Person].[Person] P ON E.BusinessEntityID=P.BusinessEntityID
WHERE MaritalStatus='M';
GO

--7. LIST THE ORDER ALONG THE NAMES OF THE CUSTOMERS WHO PLACED THEM
SELECT S.SalesOrderID, P.FirstName, P.LastName
FROM [Sales].[SalesOrderHeader] S
JOIN [Sales].[Customer] SC ON S.AccountNumber=SC.AccountNumber
JOIN [Person].[Person] P ON SC.ModifiedDate =P.ModifiedDate;
GO

--8. LIST THE TOP 7 MOST EXPENSIVE PRODUCTS
SELECT TOP 7 Name, ListPrice
FROM [Production].[Product]
ORDER BY ListPrice DESC;
GO

--9. WHAT'S THE CHEAPEST PRODUCT
SELECT TOP 1 Name, ListPrice
FROM [Production].[Product]
ORDER BY ListPrice;
GO

--10. LIST THE NAMES OF ALL VENDORS
SELECT Name
FROM [Purchasing].[Vendor];
GO

--11. GET THE DETAILS OF CUSTOMERS WHOSE LASTNAME START WITH C
SELECT SC.CUSTOMERID, P.FIRSTNAME, P.LASTNAME
FROM [SALES].[CUSTOMER] SC
JOIN [PERSON].[PERSON] P ON SC.PERSONID=P.BUSINESSENTITYID
WHERE P.LASTNAME LIKE 'C%';
GO

--12. GET THE TOTAL SALES AMOUNT FOR EACH CUSTOMERS
SELECT CustomerID, SUM(TOTALDUE) AS TOTAL_SALES
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID;
GO

--13. LIST THE EMPLOYEES AND THEIR RESPECTIVE DEPARTMENT NAMES
SELECT P.FIRSTNAME, P.LASTNAME, D.NAME AS DEPARTMENTNAME
FROM HUMANRESOURCES.EMPLOYEE E
JOIN PERSON.PERSON P ON E.BUSINESSENTITYID = P.BUSINESSENTITYID
JOIN HUMANRESOURCES.EMPLOYEEDEPARTMENTHISTORY EDH ON E.BUSINESSENTITYID = EDH.BUSINESSENTITYID
JOIN HUMANRESOURCES.DEPARTMENT D ON EDH.DEPARTMENTID = D.DEPARTMENTID
WHERE EDH.ENDDATE IS NULL;
GO

--14. LIST ALL THE SALES TERRITORY
SELECT*
FROM [Sales].[SalesTerritory];
GO

--15. LIST THE TOP TEN CUSTOMERS BY TOTAL SALES AMOUNT
SELECT TOP 10 SC.CUSTOMERID, P.FIRSTNAME, P.LASTNAME, SUM(SOH.TOTALDUE) AS TOTALSALES
FROM SALES.CUSTOMER SC
JOIN PERSON.PERSON P ON SC.PERSONID = P.BUSINESSENTITYID
JOIN SALES.SALESORDERHEADER SOH ON SC.CUSTOMERID = SOH.CUSTOMERID
GROUP BY SC.CUSTOMERID, P.FIRSTNAME, P.LASTNAME
ORDER BY TOTALSALES DESC;
GO


