-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);


CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);


CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL
);


CREATE TABLE Titles (
	emp_no INT,
	title VARCHAR,
	from_date date,
	to_date date,
	PRIMARY KEY (emp_no, title, from_date)
); 



-- Module 7.3.2 join-the-tables
-- Create new table for "retiring employees" (earlier in the module this table did not have emp_no)
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

-- ---------------------------------------------- 
-- Module 7.3.3
-- We want a retirement_info table to have all the columns we need
-- 1- the list of only those who are about to retire and not all th employees
-- 2- we want the deprtment of these employees who are about to retire, so that 
-- those departments will have job opennings

-- First, we start with the SELECT statement.
-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date

-- Next, we assign the left table with FROM.
FROM retirement_info

-- Then we specify a LEFT JOIN to include every row of the first table (retirement_info).
LEFT JOIN dept_emp

-- Now we need to tell Postgres where the two tables are linked with the ON clause.
ON retirement_info.emp_no = dept_emp.emp_no;
-- The result was successful and the table with the needed info of RETIRING OR RETIRED employees  
-- was created (looking at the table showed soe of them had retired years ago).

-- --------------------------------------------------

-- <<<SKIP this block of codes>>> as they are the repeat of the previous block with a practice on aliases only

-- An "alias" in SQL allows developers to give nicknames to tables. This helps improve code 
-- readability by shortening longer names into one-, two-, or three-letter temporary names. 
-- This is commonly used in joins. Using alias the above code will look like:

-- Joining "departments" and "dept_manager tables"
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- -------------------------------------------------
-- Selecting REAL REATIRING employees
-- Now that we have a list of all retirement-eligible employees, it's important 
-- to make sure that they are actually still employed with PH. To do so, we're 
-- going to perform another join, this time between the retirement_info and dept_emp 
-- tables. The basic information to include in the new list is:
-- * Employee number
-- * First name
-- * Last name
-- * To-date

-- In the pgAdmin query editor, let's begin by specifying these columns and tables.
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date

-- Next, we need to create a new table to hold the information. Let's name it "current_emp."
INTO current_emp

-- The next step is to add the code that will join these two tables.
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')
;
-- Finally, because this is a table of current employees, we added a filter, 
-- using the WHERE keyword and the date 9999-01-01.


-- #################

-- MODULE 7.3.4

-- Now we will need to use "COUNT" and "GROUP BY" with joins, 
-- to separate the employees into their departments.
-- But the data output would'tbe in any particular order. 
-- Therefor, we will add ORDER BY clause to put everything in good otder.

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- ########

-- * Update the block of codes and save it into a csv file (retiring_emp_by_dept)

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO retiring_emp_by_dept
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


-- ##########################

-- * 7.3.5 Creating Additional Lists


-- "1- Employee list" with gender and salary
SELECT e.emp_no,	e.first_name,	e.last_name,	e.gender,	s.salary,	de.to_date
-- Save into a new table
INTO emp_info
FROM employees as e INNER JOIN salaries as s	ON (e.emp_no = s.emp_no) INNER JOIN dept_emp as de	ON (e.emp_no = de.emp_no)-- Add filters
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')AND (de.to_date = '9999-01-01');
 
 
-- "2- List of managers" per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
						
		
-- "List 3: Department Retirees"
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info

FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);
 
-- ###################

