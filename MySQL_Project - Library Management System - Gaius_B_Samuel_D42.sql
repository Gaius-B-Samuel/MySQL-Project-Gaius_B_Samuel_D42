CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT NOT NULL,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Main Street, New York', '1234567890'),
(2, 102, 'Park Avenue, California', '9876543210'),
(3, 103, 'Broadway, Texas', '1122334455'),
(4, 104, 'Elm Street, Florida', '6677889900'),
(5, 105, '5th Avenue, Illinois', '2233445566'),
(6, 106, 'Sunset Blvd, Nevada', '7788990011'),
(7, 107, 'Oak Street, Oregon', '4455667788'),
(8, 108, 'Pine Street, Washington', '9988776655');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Pearly', 'Manager', 70000, 1),
(2, 'Will Smith', 'Clerk', 30000, 2),
(3, 'Charlie Thomas', 'Librarian', 50000, 3),
(4, 'Diana Mary', 'Manager', 75000, 4),
(5, 'Ethan Lukos', 'Assistant', 40000, 5),
(6, 'Fiona Varkey', 'Librarian', 55000, 6),
(7, 'George Bush', 'Clerk', 32000, 7),
(8, 'Cyril Thomas', 'Assistant', 45000, 8);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(101, 'The Great Gatsby', 'Fiction', 20.5, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(102, '1984', 'Dystopian', 15.0, 'no', 'George Orwell', 'Secker & Warburg'),
(103, 'To Kill a Mockingbird', 'Classic', 18.0, 'yes', 'Harper Lee', 'J.B. Lippincott'),
(104, 'Moby Dick', 'Adventure', 22.5, 'yes', 'Herman Melville', 'Harper & Brothers'),
(105, 'War and Peace', 'Historical', 25.0, 'no', 'Leo Tolstoy', 'The Russian Messenger'),
(106, 'Pride and Prejudice', 'Romance', 19.5, 'yes', 'Jane Austen', 'T. Egerton'),
(107, 'The Hobbit', 'Fantasy', 23.0, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
(108, 'Hamlet', 'Drama', 20.0, 'yes', 'William Shakespeare', 'Nonesuch Press');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Gaius B Samuel', '123 Maple St, NY', '2020-06-15'),
(2, 'Joel S Paul', '456 Oak St, CA', '2021-03-12'),
(3, 'Jibin Thomas', '789 Pine St, TX', '2022-01-18'),
(4, 'Sethu Mohanan', '321 Elm St, FL', '2020-09-20'),
(5, 'Akhil Mathew', '654 Birch St, IL', '2021-05-25'),
(6, 'Jobin P Joseph', '987 Aspen St, NV', '2022-08-10'),
(7, 'Philemon Philip', '741 Cedar St, OR', '2023-03-05'),
(8, 'Joel Johnson', '852 Walnut St, WA', '2020-12-30');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The Great Gatsby', '2023-06-10', 101),
(2, 2, '1984', '2023-07-15', 102),
(3, 3, 'To Kill a Mockingbird', '2023-06-20', 103),
(4, 4, 'Moby Dick', '2023-05-10', 104),
(5, 5, 'War and Peace', '2023-07-01', 105),
(6, 6, 'Pride and Prejudice', '2023-04-25', 106),
(7, 7, 'The Hobbit', '2023-08-30', 107),
(8, 8, 'Hamlet', '2023-06-12', 108);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Great Gatsby', '2023-06-15', 101),
(2, 2, '1984', '2023-07-20', 102),
(3, 3, 'To Kill a Mockingbird', '2023-06-25', 103),
(4, 4, 'Moby Dick', '2023-05-15', 104),
(5, 5, 'War and Peace', '2023-07-05', 105),
(6, 6, 'Pride and Prejudice', '2023-04-30', 106),
(7, 7, 'The Hobbit', '2023-09-05', 107),
(8, 8, 'Hamlet', '2023-06-17', 108);

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

SELECT B.Book_title, C.Customer_name FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

SELECT C.Customer_name FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

SELECT DISTINCT C.Customer_name FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

SELECT Book_title FROM Books WHERE Book_title LIKE '%Hamlet%';

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee 
GROUP BY Branch_no HAVING Total_Employees > 5;

SELECT E.Emp_name, B.Branch_address FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

SELECT DISTINCT C.Customer_name FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price >= 25;

