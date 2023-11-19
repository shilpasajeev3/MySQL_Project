# Library Management System Database
This repository contains SQL code for creating and managing a Library Management System database. The database includes tables for branches, employees, customers, books, issued books status, and returned books status.

## Tables
1. Branch
   
Branch_no: Unique branch number.
Manager_Id: Unique manager ID.
Branch_address: Address of the branch.
Contact_no: Contact number of the branch.
3. Employee
Emp_Id: Unique employee ID.
Emp_name: Name of the employee.
Position: Job position of the employee.
Salary: Salary of the employee.
B_no: Foreign key referencing Branch_no from the Branch table.
4. Customer
Customer_Id: Unique customer ID.
Customer_name: Name of the customer.
Customer_address: Address of the customer.
Reg_date: Registration date of the customer.
5. Books
ISBN: Unique book ISBN.
Book_title: Title of the book.
Category: Category of the book.
Rental_Price: Rental price of the book.
Status: Availability status of the book.
Author: Author of the book.
Publisher: Publisher of the book.
6. IssueStatus
Issue_Id: Unique issue ID.
Issued_cust: Foreign key referencing Customer_Id from the Customer table.
Issued_book_name: Name of the issued book.
Issue_date: Date of issuing the book.
Isbn_book: Foreign key referencing ISBN from the Books table.
7. ReturnStatus
Return_Id: Unique return ID.
Return_cust: Customer returning the book.
Return_book_name: Name of the returned book.
Return_date: Date of returning the book.
Isbn_book2: Foreign key referencing ISBN from the Books table.
### SQL Queries
The repository includes several SQL queries for retrieving information from the database, such as listing available books, employee details, issued books, and more.
### Usage
Feel free to use this SQL code as a basis for creating a Library Management System database or as a reference for your own projects. Make sure to customize the code according to your specific requirements.
Note: This is a simple example, and in a real-world scenario, you might need additional features and security measures.
