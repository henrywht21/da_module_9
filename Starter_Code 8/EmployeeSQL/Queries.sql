--List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employee e 
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	e.first_name ASC;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	first_name,
	last_name,
	hire_date
FROM
	employee
WHERE
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'
Order By
	hire_date ASC,
	last_name ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.first_name,
	e.last_name
FROM
	department_manager dm
	Inner join employee e on dm.emp_no = e.emp_no
	Inner join department d on dm.dept_no = d.dept_no
Order By
	dept_no ASC;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.	
SELECT
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	department_employee de
	Inner join employee e on de.emp_no = e.emp_no
	Inner join department d on de.dept_no = d.dept_no
Order By
	de.emp_no ASC;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
	last_name,
	sex
FROM
	employee
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%'
Order by
	last_name ASC;

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name
FROM
	employee e
	Inner Join department_employee de on de.emp_no = e.emp_no
	Inner Join department d on de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'
Order By
	e.last_name

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employee e
	Inner Join department_employee de on de.emp_no = e.emp_no
	Inner Join department d on de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales' OR d.dept_name = 'Development'
Order By
	e.last_name

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	e.last_name,
	count(e.emp_no) as count_by_last_name
FROM
	employee e
GROUP BY
	e.last_name
ORDER BY
	count_by_last_name ASC;

