/*Achieving 1NF (First Normal Form)*/
SELECT 
  OrderID, 
  CustomerName, 
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM ProductDetail
JOIN (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3
) n ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1;

/*Achieving 2NF (Second Normal Form)*/
/*Create a separate Customers table*/
CREATE TABLE Customers AS
SELECT DISTINCT OrderID, CustomerName FROM OrderDetails;
/*Create a new OrderItems table without CustomerName*/
CREATE TABLE OrderItems AS
SELECT OrderID, Product, Quantity FROM OrderDetails;
