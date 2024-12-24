# Library-Management-System-by-sql

This project is a comprehensive **Library Management System** designed to manage and track library operations. It involves creating a database schema, populating tables, and executing SQL queries to fulfill various requirements.

## Features
- Tracks book details including availability, cost, and category.
- Manages employees, customers, branches, and their interactions.
- Records book issue and return statuses.

---

## Database Structure
### Tables and Attributes

1. **Branch**
   - `Branch_no` (Primary Key)
   - `Manager_Id`
   - `Branch_address`
   - `Contact_no`

2. **Employee**
   - `Emp_Id` (Primary Key)
   - `Emp_name`
   - `Position`
   - `Salary`
   - `Branch_no` (Foreign Key referencing `Branch.Branch_no`)

3. **Books**
   - `ISBN` (Primary Key)
   - `Book_title`
   - `Category`
   - `Rental_Price`
   - `Status` (Available: `yes`, Not Available: `no`)
   - `Author`
   - `Publisher`

4. **Customer**
   - `Customer_Id` (Primary Key)
   - `Customer_name`
   - `Customer_address`
   - `Reg_date`

5. **IssueStatus**
   - `Issue_Id` (Primary Key)
   - `Issued_cust` (Foreign Key referencing `Customer.Customer_Id`)
   - `Issued_book_name`
   - `Issue_date`
   - `Isbn_book` (Foreign Key referencing `Books.ISBN`)

6. **ReturnStatus**
   - `Return_Id` (Primary Key)
   - `Return_cust`
   - `Return_book_name`
   - `Return_date`
   - `Isbn_book2` (Foreign Key referencing `Books.ISBN`)

---

## Queries

### 1. Retrieve book title, category, and rental price of all available books
```sql
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
```

### 2. List employee names and salaries in descending order of salary
```sql
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
```

### 3. Retrieve book titles and corresponding customers who issued them
```sql
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
```

### 4. Display the total count of books in each category
```sql
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;
```

### 5. Retrieve employee names and positions with salaries above Rs.50,000
```sql
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
```

### 6. List customer names registered before 2022-01-01 who haven't issued books
```sql
SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;
```

### 7. Display branch numbers and total count of employees in each branch
```sql
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;
```

### 8. Display names of customers who issued books in June 2023
```sql
SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;
```

### 9. Retrieve book titles containing "history"
```sql
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';
```

### 10. Retrieve branch numbers with more than 5 employees
```sql
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
```

### 11. Retrieve employee names managing branches and their branch addresses
```sql
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;
```

### 12. Display names of customers who issued books with rental price > Rs.25
```sql
SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;
```
## Submission
- The project includes the following files:
  1. SQL script for database creation and queries.
  2. Screenshots of query outputs.
  3. This README file.
## Author
- **Name:** Aswin Kumar TS
- **Role:** Aspiring Data Analyst
