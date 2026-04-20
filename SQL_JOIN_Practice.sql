
-- Creating the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactNumber VARCHAR(15)
);

-- Inserting data into the Customer table
INSERT INTO Customers (CustomerID, CustomerName, ContactNumber) VALUES
    (1, 'John Doe', '123-456-7890'),
    (2, 'Jane Smith', '987-654-3210'),
    (3, 'Mike Johnson', '555-666-7777');

--Display all the Customers table records
SELECT * from Customers

-- Creating the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into the Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) VALUES
    (1, '2023-10-01', 1, 100.25),
    (2, '2023-10-05', 2, 200.50),
    (3, '2023-10-06', 1, 150.75),
    (4, '2023-10-08', 3, 175.00);

--Display all the Orders table records 
SELECT * from Orders


-- Using LEFT JOIN, returns all records from the left table(Oreders) and the matched records from the right(Customers) table
SELECT OrderDate, Amount, CustomerName
FROM Orders
LEFT JOIN Customers on Orders.CustomerID = Customers.CustomerID

--insert new data to the Orders table 
INSERT INTO Orders
(OrderID, OrderDate, CustomerID, Amount)
VALUES(10, '2026-04-26', 9, 10.5);


--Display all the Orders table records after inserting new data
SELECT * from Orders

--Using LEFT JOIN after updating the Orders table
SELECT OrderDate, Amount, CustomerName
FROM Orders
LEFT JOIN Customers on Orders.CustomerID = Customers.CustomerID

--Using Inner JOIN 
SELECT OrderDate, Amount, CustomerName
FROM Orders
Inner JOIN Customers on Orders.CustomerID = Customers.CustomerID

--insert new data to the Customers table 
INSERT INTO Customers
(CustomerID, CustomerName, ContactNumber)
VALUES(11, 'David G', '046321785');

--Display all the Customers table records after inserting new data
SELECT * From Customers

-- RIGHT JOIN, returns all records from the right table(Customers) and the matched records from the left(Orders) table
SELECT OrderDate, Amount, CustomerName
FROM Orders
RIGHT JOIN Customers on Orders.CustomerID = Customers.CustomerID

-- FULL JOIN, returns all records from both (Orders and Customers) tables 
SELECT OrderDate, Amount, CustomerName
FROM Orders
FULL JOIN Customers on Orders.CustomerID = Customers.CustomerID

--To display total sum amount of Orders table Amount column
SELECT sum(Amount)
from Orders 

--To display total sum amount using INNER JOIN
SELECT sum(Amount)
from Orders 
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID

--To display total sum amount using FULL JOIN
SELECT sum(Amount)
from Orders 
FULL JOIN Customers on Orders.CustomerID = Customers.CustomerID
