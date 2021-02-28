-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM
	employees
JOIN salaries on 
	employees.emp_no = salaries.emp_no
	

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	employees.first_name,
	employees.last_name,
	employees.hire_date,
	to_date(hire_date,'MM/DD/YYYY') AS hire_date
FROM
	employees
WHERE
	to_date(hire_date,'MM/DD/YYYY') BETWEEN '1986-01-01'::DATE AND '1986-12-31'::DATE

-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM
	employees
JOIN dept_manager on 
	employees.emp_no = dept_manager.emp_no
JOIN departments on
	departments.dept_no = dept_manager.dept_no

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no
FROM
	employees
JOIN dept_emp on 
	employees.emp_no = dept_emp.emp_no


-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT 
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	employees.sex
FROM
	employees
WHERE
	employees.first_name = 'Hercules' AND
	employees.last_name LIKE 'B%' ;

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN dept_emp on 
	employees.emp_no = dept_emp.emp_no
JOIN departments on
	departments.dept_no = dept_emp.dept_no
WHERE 
	departments.dept_name = 'Sales'
	

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN dept_emp on 
	employees.emp_no = dept_emp.emp_no
JOIN departments on
	departments.dept_no = dept_emp.dept_no
WHERE 
	departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

-- Count the number of employees, grouped by last name
SELECT
	COUNT(employees.emp_no) AS num_emp,
	employees.last_name
FROM
	employees
GROUP BY
	employees.last_name

