--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no as employee_number, e.last_name as last_name, e.first_name as first_name, e.gender as gender, s.salary as salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
ORDER BY e.emp_no ASC
LIMIT 100;

--List employees who were hired in 1986.

SELECT emp_no as Employee_no, first_name as First_Name, last_name as Last_Name, to_char("hire_date",'MM/DD/YYYY') as Hire_Date
FROM employees
WHERE EXTRACT(year FROM "hire_date")=1986
ORDER BY hire_date ASC
LIMIT 100;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no as Department_Number, d.dept_name as Department_Name, dm.emp_no as Manager_Employeeno, e.last_name as Manager_Lastname, e.first_name as Manager_Firstname, to_char(s."from_date",'MM/DD/YYYY') as Start_employment_date, to_char(s."to_date",'MM/DD/YYYY') as End_employment_date
from departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY d.dept_name;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no as Employee_Number, e.last_name as Last_Name, e.first_name as First_Name, d.dept_name as Department_Name
FROM employees e
INNER JOIN dept_emp dm on dm.emp_no = e.emp_no
INNER JOIN departments d on dm.dept_no = d.dept_no
ORDER BY e.last_name ASC
LIMIT 1000;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Included d.to_date to list only those currently in the Sales Department (no end date = 9999-01-01). 

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name, d.to_date
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN departments AS dp ON dp.dept_no = d.dept_no 
WHERE dp.dept_name = 'Sales' AND d.to_date = '9999-01-01';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN departments AS dp ON dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Development' OR dp.dept_name = 'Sales'
ORDER BY dp.dept_name ASC;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;







