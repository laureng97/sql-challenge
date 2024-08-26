Drop TABLE IF EXISTS Employees CASCADE;
Drop TABLE IF EXISTS Departments CASCADE;
Drop TABLE IF EXISTS Titles CASCADE;
Drop TABLE IF EXISTS Dept_emp CASCADE;
Drop TABLE IF EXISTS Salaries CASCADE;
Drop TABLE IF EXISTS Dept_Manager CASCADE;

-- Create Departments Table
CREATE TABLE Departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(40) NOT NULL
);

-- Create Employees Table
CREATE TABLE Employees (
	emp_no INT ,
	emp_title_id VARCHAR(10),
	birth_date DATE NOT NULL, 
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no, emp_title_id)
);

-- Create Department Employees Table
CREATE TABLE Dept_Emp (
	emp_no INT ,
	dept_no VARCHAR(10) NOT NULL REFERENCES departments(dept_no),
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES Employees(emp_no, emp_title_id),
	PRIMARY KEY(emp_no, dept_no)
);

ALTER TABLE Dept_Emp DROP column emp_title_id;

-- Create Dept Manager Table
CREATE TABLE Dept_Manager(
	dept_no VARCHAR(10),
    emp_no INT,
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES Employees(emp_no, emp_title_id),
	PRIMARY KEY(dept_no, emp_no)
);

ALTER TABLE Dept_Manager DROP COLUMN emp_title_id;

-- Create Salaries Table
CREATE TABLE Salaries (
    emp_no INT,
    salary INT,
	emp_title_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_no, emp_title_id) REFERENCES Employees(emp_no, emp_title_id)
);

ALTER TABLE Salaries DROP column emp_title_id;

-- Create Titles Table
CREATE TABLE Titles(
	emp_title_id VARCHAR(10) NOT NULL,
	title VARCHAR(40) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no,emp_title_id) REFERENCES Employees(emp_no,emp_title_id),
	PRIMARY KEY (emp_title_id, title)
);

-- Drop emp_no Column in Titles Table
ALTER TABLE Titles DROP COLUMN emp_no;

SELECT * FROM Departments
SELECT * FROM Dept_Emp
SELECT * FROM Dept_Manager
SELECT * FROM Employees
SELECT * FROM Salaries
SELECT * FROM Titles

