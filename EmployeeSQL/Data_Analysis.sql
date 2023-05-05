-- List employee number, last name, first name, sex and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e, salaries AS s
WHERE e.emp_no = s.emp_no;

-- List first name, last name & hire date if hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List manager of each department; department number, department name, employee number, last name, first name & department name.
SELECT m.dept_no, m.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_manager AS m, employees AS e, departments AS d
WHERE m.dept_no = d.dept_number AND m.emp_no = e.emp_no
ORDER BY m.dept_no;

-- List each employee's department number, employee number, last name, first name and department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de, employees AS e, departments AS d
WHERE de.emp_no = e.emp_no AND de.dept_no = d.dept_number
ORDER BY e.emp_no;

-- List first name, last name and sex of employees named Hercules B%
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List employee number, last name and first name for all Sales employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, departments AS d, dept_emp AS de
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_number AND d.dept_name = 'Sales';

-- List employee number, last name, first name and department name for all Sales and Development employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, departments AS d, dept_emp AS de
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_number AND (d.dept_name = 'Sales' OR d.dept_name = 'Development');

-- List the frequency counts of all employee last names (descending order)
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC;
