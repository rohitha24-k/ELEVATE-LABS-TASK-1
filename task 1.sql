USE schema1;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    Phone VARCHAR(15)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Order_Items (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Customers (CustomerID, Name, Email, Address, Phone)
VALUES
(1, 'Rohitha Konakalla', 'rohitha@example.com', 'Chintalapudi, AP', '9876543210'),
(2, 'John Doe', 'john@example.com', 'Hyderabad, TS', '9123456780');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products (ProductID, ProductName, Price, Stock, CategoryID)
VALUES
(101, 'Smartphone', 699.99, 50, 1),
(102, 'Laptop', 999.99, 30, 1),
(103, 'T-Shirt', 19.99, 100, 2),
(104, 'Novel - Fiction', 14.99, 80, 3);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES
(201, 1, '2025-06-20', 'Shipped'),
(202, 2, '2025-06-22', 'Processing');

INSERT INTO Order_Items (OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES
(301, 201, 101, 1, 699.99),  
(302, 201, 104, 2, 14.99),  
(303, 202, 103, 3, 19.99);

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
(401, 201, '2025-06-21', 729.97, 'UPI'),  
(402, 202, '2025-06-23', 59.97, 'Credit Card');     

SELECT * FROM Customers;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Payments
