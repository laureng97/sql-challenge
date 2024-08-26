-- Showcase the tables to see that data imported correctly
SELECT * FROM Departments
SELECT * FROM Dept_Emp
SELECT * FROM Dept_Manager
SELECT * FROM Employees
SELECT * FROM Salaries
SELECT * FROM Titles

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees as e
INNER JOIN Salaries as s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(year from hire_date) = 1986;

-- List the manager of each department and their dept number, dept name, 
-- emp number, & first and last name
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.first_name, e.last_name
FROM Dept_Manager as d_m
INNER JOIN Departments as d
ON d_m.dept_no = d.dept_no
INNER JOIN Employees as e
ON d_m.emp_no = e.emp_no
ORDER BY d_m.dept_no

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name
FROM Employees as e
INNER JOIN Dept_Emp as de
ON e.emp_no = de.emp_no
INNER JOIN Departments as d
on de.dept_no = d.dept_no
ORDER BY e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no 
AS employee_number, e.first_name, e.last_name
FROM Employees e
JOIN Dept_Emp d_e 
ON e.emp_no = d_e.emp_no
JOIN Departments d 
ON d_e.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
SELECT e.emp_no 
AS employee_number, e.last_name, e.first_name, d.dept_name 
AS department_name
FROM Employees e
JOIN Dept_Emp d_e 
ON e.emp_no = d_e.emp_no
JOIN Departments d 
ON d_e.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;