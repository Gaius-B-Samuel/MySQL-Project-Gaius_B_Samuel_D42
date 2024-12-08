# MySQL-Project-Gaius_B_Samuel_D42
MySQL Project File with Output Files.

# Library Management System
- Project Overview
The Library Management System (LMS) is a project designed to automate and manage the operations of a library. This system keeps track of books, employees, customers, and the status of book issues and returns. It allows the library to efficiently manage the books in its collection, track customer activities, and manage employee data.

# This system contains the following main tables:

  -Branch: Stores information about the branches of the library.
  -Employee: Contains information about employees, their positions, and salaries.
  -Books: Stores information about the books in the library, such as ISBN, title, category, rental price, and availability.
  -Customer: Contains details about customers who register at the library.
  -IssueStatus: Tracks information about the books issued to customers.
  -ReturnStatus: Stores details about the returned books.

Database Structure
The database library contains the following tables:

1. Branch Table
Branch_no: Primary key.
Manager_Id: Unique ID of the branch manager.
Branch_address: Address of the branch.
Contact_no: Contact number of the branch.

2. Employee Table
Emp_Id: Primary key.
Emp_name: Name of the employee.
Position: Job title/role of the employee.
Salary: Salary of the employee.
Branch_no: Foreign key referring to Branch_no in the Branch table.

3. Books Table
ISBN: Primary key.
Book_title: Title of the book.
Category: Genre or category of the book.
Rental_Price: Rental price of the book.
Status: Availability status (yes/no).
Author: Author of the book.
Publisher: Publisher of the book.

4. Customer Table
Customer_Id: Primary key.
Customer_name: Name of the customer.
Customer_address: Address of the customer.
Reg_date: Registration date of the customer.

5. IssueStatus Table
Issue_Id: Primary key.
Issued_cust: Foreign key referring to Customer_Id in the Customer table.
Issued_book_name: Name of the issued book.
Issue_date: Date when the book was issued.
Isbn_book: Foreign key referring to ISBN in the Books table.

6. ReturnStatus Table
Return_Id: Primary key.
Return_cust: Name of the customer returning the book.
Return_book_name: Name of the returned book.
Return_date: Date when the book was returned.
Isbn_book2: Foreign key referring to ISBN in the Books table.


# Summary of Queries
1. Retrieve the book title, category, and rental price of all available books.
2. List the employee names and their respective salaries in descending order of salary.
3. Retrieve the book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for employees whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books in the month of June 2023.
9. Retrieve book_title from the book table containing the word "history".
10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
11. Retrieve the names of employees who manage branches and their respective branch addresses.
12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

# Project Setup Instructions
Install MySQL: Make sure MySQL is installed on your system.

- Create the Database:
- Create Tables: Use the provided SQL queries to create tables and their respective relationships.
- Insert Data: Insert the sample data into each table using the INSERT INTO queries provided.
- Run Queries: After inserting the data, run the queries to retrieve the required information.

Screenshots
- Screenshots of Output have been uploaded in PDF File.

Conclusion
This project demonstrates the effective use of SQL queries to manage library operations. The use of joins, aggregations, and filtering helps in providing useful insights, such as listing available books, and tracking employees, customers, and book transactions. It ensures a smooth library management process for both employees and customers.

