CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT UNIQUE NOT NULL,
Branch_address VARCHAR(50) UNIQUE NOT NULL,
Contact_no VARCHAR(10) UNIQUE NOT NULL);

DESC Branch;

INSERT INTO Branch(Branch_no, Manager_Id, Branch_address, Contact_no) VALUES 
(1,101,'Mavoor road, Calicut',9876787656),
(2,102,'Kakkodi, Calicut',9876787653),
(3,103,'Chavakkad, Thrissur',9876787655),
(4,104,'Chevoor, Thrissur',9876787654),
(5,105,'Thiruvalla, Alappuzha',9876787657),
(6,106,'Pandalam, Pathanamthitta',9876787658);

SELECT * FROM Branch;

CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(40) NOT NULL,
Position VARCHAR(50) NOT NULL,
Salary INT NOT NULL,
B_no INT, FOREIGN KEY (B_no) REFERENCES Branch(Branch_no));

DESC Employee;

INSERT INTO Employee(Emp_Id, Emp_name, Position, Salary, B_no)  VALUES 
(101,'Jonathan','Manager',60000,1),
(102,'Mike','Manager',55000,2),
(103,'Lucas','Manager',41000,3),
(104,'Eleven','Manager',45000,4),
(105,'Max','Manager',52000,5),
(106,'Nancy','Manager',54000,6),
(107,'Will','Staff',35000,1),
(108,'Jonas','Staff',27000,2),
(109,'Tom','Librarian',53000,1),
(110,'Ben','Librarian',47000,4),
(111,'Jackie','Staff',43000,1),
(112,'Tracy','Staff',44000,1),
(113,'Jamie','Assistant',45000,1);

SELECT * FROM Employee;

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(40),
Customer_address VARCHAR(50),
Reg_date DATE);

DESC Customer;

INSERT INTO Customer(Customer_Id, Customer_name, Customer_address, Reg_date)  VALUES
 (1001,'Sreya','Calicut','2023-01-01'),
(1002,'Dustin','Calicut','2023-02-02'),
(1003,'Steve','Calicut','2023-03-03'),
(1004,'Jerry','Thrissur','2023-04-04'),
(1005,'Owen','Alappuzha','2021-04-12'),
(1006,'Claire','Pathanamthitta','2021-05-15'),
(1007,'Alan','Thrissur','2021-06-16');

SELECT * FROM Customer;

CREATE TABLE Books(
ISBN INT PRIMARY KEY,
Book_title VARCHAR(100) NOT NULL,
Category VARCHAR(60),
Rental_Price INT,
Status VARCHAR(5),
Author VARCHAR(50),
Publisher VARCHAR(50));

DESC Books;

INSERT INTO Books(ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(400,'Heidi','Childrens Fiction',150,'yes','Johanna Spyri','Verlag von Karl Schmid'),
(401,'The Alchemist','Adventure fiction',200,'yes','Paulo Coelho','Editora Rocco'),
(402,'Black Beauty','Childrens Fiction',160,'yes','Anna Sewell','Jarrold & Sons'),
(403,'Kidnapped','Adventure fiction',170,'yes','Robert Louis Stevenson','Cassell & Co'),
(404,'A Tale of Two Cities','Historical Fiction',140,'yes','Charles Dickens','Chapman & Hall'),
(405,'The Count of Monte Cristo','Adventure fiction',200,'yes','Alexandre Dumas','Petion'),
(406,'Journey to the Center of the Earth','Science Fiction Adventure',180,'yes','Jules Verne','Pierre Jules Hetzel'),
(407,'The Three Musketeers','Historical Fiction',140,'no','Alexandre Dumas','Baudrys French Library'),
(408,'The Lost World','Historical Fiction',190,'no','Arthur Conan Doyle','Hodder & Stoughton');

SELECT * FROM Books;

CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT, FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
Issued_book_name VARCHAR(100),
Issue_date DATE,
Isbn_book INT, FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));

DESC IssueStatus;

INSERT INTO IssueStatus(Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(200,1001,'Heidi','2023-02-01',400),
(201,1002,'The Alchemist','2023-02-02',401),
(202,1003,'Black Beauty','2023-03-03',402),
(203,1001,'Kidnapped','2023-02-12',403),
(204,1004,'Journey to the Center of the Earth','2023-06-04',406),
(205,1002,'The Count of Monte Cristo','2023-06-12',405),
(206,1005,'A Tale of Two Cities','2021-04-12',404);

SELECT * FROM IssueStatus;

CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(100),
Return_date DATE,
Isbn_book2 INT, FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));

DESC ReturnStatus;

INSERT INTO ReturnStatus(Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(300,1001,'Heidi','2023-02-01',400),
(301,1002,'The Alchemist','2023-02-23',401),
(302,1003,'Black Beauty','2023-03-21',402),
(303,1004,'Journey to the Center of the Earth','2023-06-11',406),
(304,1005,'A Tale of Two Cities','2021-04-28',404),
(305,1001,'Kidnapped','2023-03-23',403),
(306,1002,'The Count of Monte Cristo','2023-05-23',405);

SELECT * FROM ReturnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books. 

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status='yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT IssueStatus.Issued_book_name, Customer.Customer_name FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_cust= Customer.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_count FROM Books GROUP BY Category; 

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT B_no, COUNT(*) AS Total_employee FROM Employee GROUP BY B_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT Customer.Customer_name FROM Customer INNER JOIN IssueStatus ON Customer.Customer_id=IssueStatus.Issued_cust WHERE IssueStatus.Issue_date BETWEEN '2023-05-31' AND '2023-07-01';

-- 9. Retrieve book_title from book table containing history. 

SELECT Book_title FROM Books WHERE Category='Historical Fiction';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT B_no, COUNT(*) AS Total_employee FROM Employee GROUP BY B_no HAVING COUNT(*) > 5;








