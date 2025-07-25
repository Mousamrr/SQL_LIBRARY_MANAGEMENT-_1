create database mousamproject;
use mousamproject;


# LIBRARY MANAGEMENT SYSTEM 

#CREATING BRANCH TABLE
DROP TABLE IF EXISTS branch;
CREATE TABLE branch 
(
	branch_id VARCHAR(10) PRIMARY KEY,	
	manager_id VARCHAR(10),
	branch_address VARCHAR(55),	
	contact_no VARCHAR(20)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
	emp_id	VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(25),	
    position VARCHAR(15),	
    salary INTEGER,
    branch_id VARCHAR(25) 		#FOREIGN KEY
);

DROP TABLE IF EXISTS books;
CREATE TABLE books 
(
	isbn VARCHAR(17) PRIMARY KEY,	
    book_title VARCHAR(53),
    category VARCHAR(20),	
    rental_price FLOAT,	
    status VARCHAR(10),
    author VARCHAR(22),	
    publisher VARCHAR(25)
);


DROP TABLE IF EXISTS members;
CREATE TABLE members
(
	member_id VARCHAR(10) PRIMARY KEY,
    member_name	VARCHAR(15),
    member_address VARCHAR(15),	
    reg_date DATE 
);


DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status 
(
	issued_id VARCHAR(10) PRIMARY KEY,	
    issued_member_id VARCHAR(10),	#FOREIGN KEY	
    issued_book_name VARCHAR(53),		
    issued_date DATE,	
    issued_book_isbn VARCHAR(17),	# FOREIGN KEY
    issued_emp_id VARCHAR(10)		#FOREIGN KEY
);



DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
	return_id VARCHAR(15) PRIMARY KEY,
    issued_id VARCHAR(15),				#FOREIGN KEY 
    return_book_name VARCHAR(53),	
    return_date	DATE,
    return_book_isbn VARCHAR(20) 	
);

## ADDING FOREIGN KEY 
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id) REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id ) REFERENCES issued_status(issued_id);

INSERT INTO members (member_id, member_name, member_address, reg_date) VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),
('C119', 'John', '143 Main St', '2024-05-01');

INSERT INTO return_status (return_id, issued_id, return_book_name, return_date, return_book_isbn) VALUES
('RS101', 'IS101', NULL, '2023-06-06', NULL),
('RS102', 'IS105', NULL, '2023-06-07', NULL),
('RS103', 'IS103', NULL, '2023-08-07', NULL),
('RS104', 'IS106', NULL, '2024-05-01', NULL),
('RS105', 'IS107', NULL, '2024-05-03', NULL),
('RS106', 'IS108', NULL, '2024-05-05', NULL),
('RS107', 'IS109', NULL, '2024-05-07', NULL),
('RS108', 'IS110', NULL, '2024-05-09', NULL),
('RS109', 'IS111', NULL, '2024-05-11', NULL),
('RS110', 'IS112', NULL, '2024-05-13', NULL),
('RS111', 'IS113', NULL, '2024-05-15', NULL),
('RS112', 'IS114', NULL, '2024-05-17', NULL),
('RS113', 'IS115', NULL, '2024-05-19', NULL),
('RS114', 'IS116', NULL, '2024-05-21', NULL),
('RS115', 'IS117', NULL, '2024-05-23', NULL),
('RS116', 'IS118', NULL, '2024-05-25', NULL),
('RS117', 'IS119', NULL, '2024-05-27', NULL),
('RS118', 'IS120', NULL, '2024-05-29', NULL);

INSERT INTO issued_status (issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

INSERT INTO employees (emp_id, emp_name, position, salary, branch_id) VALUES
('E101', 'John Doe', 'Clerk', 60000, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000, 'B005');

INSERT INTO branch (branch_id, manager_id, branch_address, contact_no) VALUES
('B001', 'E109', '123 Main St', 919100000000),
('B002', 'E109', '456 Elm St', 919100000000),
('B003', 'E109', '789 Oak St', 919100000000),
('B004', 'E110', '567 Pine St', 919100000000),
('B005', 'E110', '890 Maple St', 919100000000);

INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher) VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.0, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.5, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.5, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.0, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.0, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.5, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.0, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.0, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.5, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.0, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.0, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.0, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.5, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.5, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.0, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.5, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.5, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.0, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.5, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.0, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.0, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.5, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.5, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.0, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.5, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.5, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.0, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.5, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.5, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.0, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.5, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.0, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.5, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.5, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.0, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');


###PROJECT TASK

###Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
 INSERT INTO  books(isbn, book_title, category,	rental_price,	status,	author,	publisher)
 VALUES 
 ( "978-1-60129-456-2", 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
 

###Task 2: Update an Existing Member's Address
UPDATE members 
SET member_address = '111 Main St'
WHERE member_id = 'C101';


###Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
DELETE FROM issued_status
WHERE issued_id = 'IS121';


###Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT issued_book_name FROM issued_status
where issued_emp_id = 'E101';

###Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT (member_name) ,count(issued_book_name) from members m1
JOIN issued_status i1
ON m1.member_id = i1.issued_member_id
GROUP BY member_name
HAVING count(issued_book_name) > 1;

###Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE books_counts 
AS
SELECT book_title, count(issued_book_name)
FROM books b
JOIN
issued_status i 
ON b.isbn = i.issued_book_isbn
GROUP BY book_title;

SELECT * FROM 
books_counts;

###Task 7. Retrieve All Books in a Specific Category Called Classic:
SELECT * FROM books
WHERE category = 'Classic';

###Task 8: Find Total Rental Income by Category:
SELECT category,
sum(rental_price),
count(*)
FROM books b 
JOIN 
issued_status i
ON b.isbn = i.issued_book_isbn
GROUP BY category;

### Task 9 List Members Who Registered in the Last 180 Days:
SELECT *
FROM members 
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

INSERT INTO members(member_id, member_name,member_address,reg_date)
VALUES
('C122', 'Mousam', '111Kdb St', '2025-07-20'),
('C121', 'Manab', '123Mdb St', '2025-05-20');


### List Employees with Their Branch Manager's Name and their branch details:
SELECT 
e.*,
b.manager_id,
e2.emp_name AS manager
FROM employees e 
JOIN branch b 
ON e.branch_id = b.branch_id
join employees e2
ON e2.emp_id = b.manager_id;

###Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 10 $:
CREATE TABLE rental_avove_certain AS
SELECT sum(rental_price),(issued_book_name) FROM books b
join issued_status i 
ON b.isbn = i.issued_book_isbn
GROUP BY issued_book_name
HAVING sum(rental_price) > 10 ;

###Task 12: Retrieve the List of Books Not Yet Returned
SELECT DISTINCT issued_book_name
FROM issued_status i
LEFT JOIN return_status r 
ON i.issued_id = r.issued_id
WHERE r.return_date IS NULL;


SELECT * FROM employees;
SELECT count(*) FROM books;
SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM members;
SELECT count(*) FROM branch;