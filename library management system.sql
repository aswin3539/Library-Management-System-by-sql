CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(20));
  INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '555-123-4567'),
(4, 104, '321 Maple St', '111-222-3333'),
(5, 105, '901 Pine St', '444-555-6666'),
(6, 106, '234 Cedar St', '777-888-9999'),
(7, 107, '567 Spruce St', '222-333-4444'),
(8, 108, '890 Fir St', '666-777-8888');
select * from branch;
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(100),
  Position VARCHAR(50),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
  INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'John Smith', 'Manager', 60000.00, 1),
(2, 'Jane Doe', 'Assistant', 30000.00, 1),
(3, 'Bob Johnson', 'Librarian', 40000.00, 3),
(4, 'Alice Brown', 'Clerk', 55000.00, 4),
(5, 'Mike Davis', 'Security', 85000.00, 3),
(6, 'Emily Miller', 'Cataloger', 28000.00, 6),
(7, 'Sarah Taylor', 'Reference', 32000.00, 3),
(8, 'Tom Harris', 'Maintenance', 53000.00, 5);
select * from employee;
CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(100),
  Category VARCHAR(50),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(3),
  Author VARCHAR(100),
  Publisher VARCHAR(100));
  INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('1234567890', 'To Kill a Mockingbird', 'Fiction', 27.99, 'yes', 'Harper Lee', 'J.B. Lippincott'),
('2345678901', 'The Great Gatsby', 'history', 39.49, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner'),
('3456789012', '1984', 'Science Fiction', 21.49, 'yes', 'George Orwell', 'Secker and Warburg'),
('4567890123', 'Pride and Prejudice', 'Romance', 35.99, 'yes', 'Jane Austen', 'T. Egerton'),
('5678901234', 'The Catcher in the Rye', 'Fiction', 29.99, 'yes', 'J.D. Salinger', 'Little, Brown'),
('6789012345', 'The Hunger Games', 'Science Fiction', 35.49, 'yes', 'Suzanne Collins', 'Scholastic'),
('7890123456', 'The Lord of the Rings', 'Fantasy', 42.99, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
('8901234567', 'The Lion, the Witch and the Wardrobe', 'Fantasy', 36.99, 'yes', 'C.S. Lewis', 'Geoffrey Bles');
select * from books;
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(100),
  Customer_address VARCHAR(255),
  Reg_date DATE);
  INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Doe', '123 Main St', '2020-01-01'),
(2, 'Jane Smith', '456 Elm St', '2020-02-01'),
(3, 'Bob Johnson', '789 Oak St', '2020-03-01'),
(4, 'Alice Brown', '321 Maple St', '2020-04-01'),
(5, 'Mike Davis', '901 Pine St', '2020-05-01'),
(6, 'Emily Miller', '234 Cedar St', '2020-06-01'),
(7, 'Sarah Taylor', '567 Spruce St', '2020-07-01'),
(8, 'Tom Harris', '890 Fir St', '2020-08-01');
select * from customer;
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(100),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
  INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'To Kill a Mockingbird', '2022-01-01', '1234567890'),
(2, 2, 'The Great Gatsby', '2023-06-15', '2345678901'),
(3, 3, '1984', '2022-02-01', '3456789012'),
(4, 3, 'Pride and Prejudice', '2022-03-01', '4567890123'),
(5, 5, 'The Catcher in the Rye', '2022-04-01', '5678901234'),
(6, 5, 'The Hunger Games', '2022-05-01', '6789012345'),
(7, 7, 'The Lord of the Rings', '2023-06-01', '7890123456'),
(8, 2, 'The Lion, the Witch and the Wardrobe', '2022-07-01', '8901234567');
select * from issuestatus;
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(100),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),foreign key (isbn_book2)references books (isbn));
  insert INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'To Kill a Mockingbird', '2022-01-31', '1234567890'),
(2, 2, 'The Great Gatsby', '2022-02-14', '2345678901'),
(3, 3, '1984', '2022-03-15', '3456789012'),
(4, 4, 'Pride and Prejudice', '2022-04-30', '4567890123'),
(5, 5, 'The Catcher in the Rye', '2022-05-31', '5678901234'),
(6, 6, 'The Hunger Games', '2022-06-30', '6789012345'),
(7, 7, 'The Lord of the Rings', '2022-07-31', '7890123456'),
(8, 8, 'The Lion, the Witch and the Wardrobe', '2022-08-31', '8901234567');
select * from returnstatus;
  SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
SELECT Category, COUNT(*) as Total_Books
FROM Books
GROUP BY Category;
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
SELECT Branch_no, COUNT(*) as Total_Employees
FROM Employee
GROUP BY Branch_no;
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';
SELECT Branch_no, COUNT(*) as Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
SELECT Emp_name, Branch_address
FROM Employee 
JOIN Branch ON Emp_Id = 'Branch_no';
use library;
select * from issuestatus;
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;

