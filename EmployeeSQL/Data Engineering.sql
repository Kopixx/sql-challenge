-- Create Departments Table
DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments(
	dept_number VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_number)
);

-- Create Titles Table
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

-- Create Employees Table
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR,
	PRIMARY KEY (emp_no)
);

-- Create Salaries Table
DROP TABLE IF EXISTS salaries CASCADE;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT,
	PRIMARY KEY (emp_no)
);

-- Create Dept_Manager Table
DROP TABLE IF EXISTS dept_manager CASCADE;

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_number),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

-- Create Dept_Emp Table
DROP TABLE IF EXISTS dept_emp CASCADE;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_number),
	PRIMARY KEY (emp_no, dept_no)
);