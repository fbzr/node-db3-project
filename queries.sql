-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName,
       CategoryName
FROM Product AS p
JOIN Category AS c 
ON P.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT id
    , CompanyName
FROM [Order] 
JOIN Customer 
ON [Order].CustomerId = Customer.id
WHERE OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT ProductName, Quantity
FROM OrderDetail as OD
JOIN Product as P
ON OD.ProductId=P.Id
WHERE OrderId=10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT Id AS 'OrderID'
    , CompanyName AS 'Customer Company Name'
    , LastName as 'Employee Last Name'
FROM [Order] AS O
JOIN Customer AS C
ON O.CustomerId = C.Id
JOIN Employee AS E
ON O.EmployeeId = E.Id;


-- Stretch Problems
-- In [SQL Try Editor at W3Schools.com](https://www.w3schools.com/Sql/tryit.asp?filename=trysql_select_top):

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT CategoryName
, CategoryCount
FROM Categories as Cat
JOIN 
(SELECT Count (*) AS CategoryCount, CategoryID FROM Products GROUP BY CategoryID) as CT
ON Cat.CategoryID = CT.CategoryID;

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID
, COUNT(ProductID) AS "Number of products"
FROM OrderDetails 
GROUP BY OrderID;

-- -   Add the following method to your API
--     -   `addStep(step, scheme_id)`: This method expects a step object and a scheme id. It inserts the new step into the database, correctly linking it to the intended scheme.
--     -   You may use `POST /api/schemes/:id/addStep` to test this method.
