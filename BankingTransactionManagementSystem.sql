
CREATE DATABASE BankingTransactionManagementSystem ;
Go

USE BankingTransactionManagementSystem;
Go

--Table 1 

CREATE TABLE Customers (
CustomerID int PRIMARY KEY IDENTITY(1,1),
FullName NVARCHAR(100) NOT NULL,
Email NVARCHAR(100) NOT NULL,
Phone NVARCHAR(20),
Address NVARCHAR(200),
CreatedAt DATETIME DEFAULT GETDATE()
);

INSERT INTO Customers(FullName,Email,Phone,Address)
VALUES
('Ali Raza', 'ali@example.com', '03001234567', 'Lahore'),
('Sana Khan', 'sana@example.com', '03111234567', 'Karachi'),
('Bilal Ahmed', 'bilal@example.com', '03221234567', 'Islamabad'),
('Ayesha Noor', 'ayesha@example.com', '03331234567', 'Faisalabad'),
('Usman Tariq', 'usman@example.com', '03441234567', 'Peshawar'),
('Zara Iqbal', 'zara@example.com', '03551234567', 'Multan'),
('Hamza Saeed', 'hamza@example.com', '03661234567', 'Quetta'),
('Mehwish Ali', 'mehwish@example.com', '03771234567', 'Sialkot'),
('Faizan Rauf', 'faizan@example.com', '03881234567', 'Rawalpindi'),
('Noor Fatima', 'noor@example.com', '03991234567', 'Gujranwala');

--Table 2

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    AccountType NVARCHAR(50),
    Balance DECIMAL(10,2) NOT NULL,
    OpenedDate DATE DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Active'
);

INSERT INTO Accounts (CustomerID, AccountType, Balance)
VALUES
(1, 'Savings', 10000.00),
(2, 'Checking', 15000.00),
(3, 'Savings', 20000.00),
(4, 'Checking', 12000.00),
(5, 'Savings', 8000.00),
(6, 'Savings', 25000.00),
(7, 'Checking', 16000.00),
(8, 'Savings', 11000.00),
(9, 'Checking', 5000.00),
(10, 'Savings', 18000.00);

--Table 3

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES Accounts(AccountID),
    TransactionType NVARCHAR(50),
    Amount DECIMAL(10,2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    Note NVARCHAR(100)
);

INSERT INTO Transactions (AccountID, TransactionType, Amount, Note)
VALUES
(1, 'Deposit', 2000.00, 'Initial Deposit'),
(2, 'Withdraw', 1000.00, 'ATM Withdrawal'),
(3, 'Deposit', 5000.00, 'Salary'),
(4, 'Withdraw', 2000.00, 'Bill Payment'),
(5, 'Deposit', 3000.00, 'Online Transfer'),
(6, 'Deposit', 4500.00, 'Cash Deposit'),
(7, 'Withdraw', 1500.00, 'Utility Bill'),
(8, 'Deposit', 10000.00, 'Cheque Clearance'),
(9, 'Withdraw', 700.00, 'Mobile Recharge'),
(10, 'Deposit', 2500.00, 'UPI Transfer');

--Table 4

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    HireDate DATE DEFAULT GETDATE()
);

INSERT INTO Employees (FullName, Position, Email, Phone)
VALUES
('Ahmed Rafi', 'Manager', 'ahmed@bank.com', '03112223333'),
('Sadia Yousaf', 'Teller', 'sadia@bank.com', '03213334444'),
('Rehan Tariq', 'Cashier', 'rehan@bank.com', '03314445555'),
('Sara Naveed', 'IT Officer', 'sara@bank.com', '03415556666'),
('Imran Ali', 'Loan Officer', 'imran@bank.com', '03516667777'),
('Hira Zahid', 'Customer Support', 'hira@bank.com', '03617778888'),
('Umar Sadiq', 'Auditor', 'umar@bank.com', '03718889999'),
('Areeba Khan', 'Receptionist', 'areeba@bank.com', '03819990000'),
('Talha Asim', 'Assistant Manager', 'talha@bank.com', '03910001111'),
('Anum Raza', 'HR Officer', 'anum@bank.com', '03011112222');

--Table 5

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    LoanAmount DECIMAL(12,2),
    LoanType NVARCHAR(50),
    Status NVARCHAR(50),
    IssuedDate DATE DEFAULT GETDATE()
);

INSERT INTO Loans (CustomerID, LoanAmount, LoanType, Status)
VALUES
(1, 50000.00, 'Personal', 'Approved'),
(2, 75000.00, 'Auto', 'Approved'),
(3, 100000.00, 'Home', 'Pending'),
(4, 25000.00, 'Education', 'Rejected'),
(5, 30000.00, 'Personal', 'Approved'),
(6, 60000.00, 'Business', 'Pending'),
(7, 15000.00, 'Education', 'Approved'),
(8, 40000.00, 'Auto', 'Rejected'),
(9, 55000.00, 'Home', 'Approved'),
(10, 45000.00, 'Business', 'Approved');

--Table 6


CREATE TABLE Branches (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100),
    City NVARCHAR(100),
    ManagerName NVARCHAR(100),
    Contact NVARCHAR(20),
    EstablishedYear INT
);

INSERT INTO Branches (BranchName, City, ManagerName, Contact, EstablishedYear)
VALUES
('Main Branch', 'Lahore', 'Ahmed Rafi', '03112223333', 2010),
('North Branch', 'Islamabad', 'Sadia Yousaf', '03213334444', 2012),
('South Branch', 'Karachi', 'Rehan Tariq', '03314445555', 2011),
('East Branch', 'Peshawar', 'Sara Naveed', '03415556666', 2015),
('West Branch', 'Quetta', 'Imran Ali', '03516667777', 2013),
('Central Branch', 'Faisalabad', 'Hira Zahid', '03617778888', 2016),
('City Branch', 'Multan', 'Umar Sadiq', '03718889999', 2014),
('Uptown Branch', 'Rawalpindi', 'Areeba Khan', '03819990000', 2018),
('Downtown Branch', 'Sialkot', 'Talha Asim', '03910001111', 2017),
('Valley Branch', 'Gujranwala', 'Anum Raza', '03011112222', 2019);

--Using Quries After Creating a Database

-- How to join Two Tables

SELECT Customers.FullName, Accounts.AccountType, Accounts.Balance 
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Joins more than Two Tables

select Customers.FullName , Loans.LoanAmount , Accounts.AccountType 
from Customers
JOIN Loans ON Customers.CustomerID = Loans.CustomerID
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Finding SUM of Balance

select SUM(Balance) AS TotalBAlance from Accounts ;
Select * from Accounts;

-- Finding Average Balance

SELECT AVG(Balance) AS AverageBalance
FROM Accounts;

--View transactions of a customer

SELECT c.FullName, t.TransactionType, t.Amount 
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID;

-- Show Loan Types with Total Approved Loan Greater Than 50,000

SELECT LoanType, SUM(LoanAmount) AS TotalLoanByType
FROM Loans
WHERE Status = 'Approved'
GROUP BY LoanType
HAVING SUM(LoanAmount) > 50000;

--How many customers are registered in each city?

SELECT Address AS City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Address;

--Which branches were established before 2015, and who manages them?

SELECT BranchName, City, ManagerName, EstablishedYear
FROM Branches
WHERE EstablishedYear < 2015;

-- Stored Procedure to List Employees by Position

CREATE PROCEDURE GetEmployeesByPosition
    @Position NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Employees
    WHERE Position = @Position;
END;

EXEC GetEmployeesByPosition @Position = 'Manager';
