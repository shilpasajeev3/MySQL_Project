# Library Management System Database
This repository contains SQL code for creating and managing a Library Management System database. The database includes tables for branches, employees, customers, books, issued books status, and returned books status.

## Tables
#### Branch
Information about library branches, including branch number, manager ID, address, and contact number.
#### Employee
Details about employees, such as employee ID, name, position, salary, and the branch they belong to.
#### Customer
Customer-related information, including customer ID, name, address, and registration date.
#### Books
Book details, covering ISBN, title, category, rental price, availability status, author, and publisher.
#### IssueStatus
Records of books issued, including issue ID, customer ID, issued book name, issue date, and corresponding book ISBN.
#### ReturnStatus
Records of returned books, containing return ID, customer ID, returned book name, return date, and corresponding book ISBN.

## SQL Queries
Explore the power of SQL queries to extract valuable insights from the Library Management System database. Below are key queries offering diverse functionalities:
#### Available Books Details:
Retrieve titles, categories, and rental prices of all currently available books for rental.
#### Employee Salaries:
List employee names and salaries in descending order of their salary.
#### Issued Books and Customers:
Get titles of books issued along with corresponding customer names.
#### Total Book Count by Category:
Display the total count of books in each category.
#### High-Salaried Employees:
Retrieve names and positions of employees with salaries above Rs. 50,000.
#### Inactive Customers:
List customer names registered before January 2022 who have not issued any books yet.
#### Branch Employee Count:
Display branch numbers and the total count of employees in each branch, considering managers.
#### June 2023 Issuers:
Identify customer names who issued books in June 2023.
#### History Category Books:
Retrieve book titles from the 'History' category.
#### Branches with More Employees:
Find branch numbers and their employee counts for branches with more than 5 employees.
## Conclusion
In conclusion, this Library Management System database project offers a comprehensive set of SQL queries and tables for effective management of library operations. Whether you're building a new system or enhancing an existing one, these queries provide valuable insights into book availability, employee details, and customer interactions. 

Remember to customize the code to fit your database environment and specific project requirements. It's important to note that this is a foundational example, and real-world applications may necessitate additional features and security measures. Feel free to use, adapt, and contribute to this project, making it a valuable resource for the library management community. Happy coding!
