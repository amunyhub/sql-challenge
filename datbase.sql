-- create and load all the data in 

-- Order to upload:1
CREATE TABLE departments(
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR 
);

-- Order to upload:5
CREATE TABLE dept_emp(
emp_no VARCHAR,
dept_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Order to upload:4
CREATE TABLE dept_manager(
-- no primary key because both are duplicated
dept_no VARCHAR,
emp_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Order to upload:3
CREATE TABLE employees(
emp_no VARCHAR PRIMARY KEY, 
emp_title_id VARCHAR,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


-- Order to upload:6
CREATE TABLE salaries(
emp_no VARCHAR,
salaries INTEGER,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Order to upload:2
CREATE TABLE titles(
title_id VARCHAR PRIMARY KEY,
title VARCHAR 
);


select * 
from salaries;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name,employees.sex, salaries.salaries
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name,employees.hire_date
FROM employees
WHERE hire_date between '1/1/1986' and '12/31/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name,dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager,employees, departments
WHERE departments.dept_no = dept_manager.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp_no, first_name, last_name, dept_name FROM employees join dept_emp using (emp_no) join departments using(dept_no);

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
Where first_name = 'Hercules' and left(last_name,1)= 'B';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, first_name, last_name, dept_name FROM employees join dept_emp using (emp_no) join departments using(dept_no)
where dept_name ='Sales' or dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY count(*) DESC;




