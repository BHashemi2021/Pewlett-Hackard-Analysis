
-- ! QUESRIES START FROM HERE

-- ! 7.3.1 Query Dates

-- -- * finding the name of employees born between 1952 and 1955 who will begin to retire
-- -- * Finding the retirement eligibility and those hired between 1985 to 1988 
-- SELECT first_name, last_name
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- SELECT first_name, last_name
-- INTO retirement_info
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- -- * To  see what the retirement_info​ table looks like we query it
-- -- with a SELECT statement 
-- SELECT * FROM retirement_info
-- ;

-- -- * To see how many records are there in third table
-- SELECT COUNT (first_name)
-- FROM retirement_info
-- ;
 
-- Then export the content of the table to a csv file named "retirement_info.csv":


-- #############################################
--
-- ! 7.3.2 join-the-tables

-- Create new table for "retiring employees" 
-- (earlier in the 7.3.1 module this table did not have emp_no) 
-- so we need to drop the previous table and delete its csv and recreae things again)
-- DROP TABLE retirement_info;


SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

-- Then export the content of the table to a csv file named "retirement_info.csv"


-- #############################################

-- ! Module 7.3.3

-- We want a retirement_info table to have all the columns we need
-- 1- the list of only those who are about to retire and not all th employees
-- 2- we want the deprtment of these employees who are about to retire, so that 
-- those departments will have job opennings

-- First, we start with the SELECT statement.
-- * Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date

-- * Next, we assign the left table with FROM.
FROM retirement_info

-- * Then we specify a LEFT JOIN to include every row of the first table (retirement_info).
LEFT JOIN dept_emp

-- * Now we need to tell Postgres where the two tables are linked with the ON clause.
ON retirement_info.emp_no = dept_emp.emp_no;

-- The result was successful and the table with the needed info of 
-- RETIRING OR RETIRED employees was created (looking at the table 
-- shows some of the people had retired years ago).

-- --------------------------------------------------

-- ! <<<SKIP this <<block of codes>>> as they are the repeat of the previous block with a practice on aliases only

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

-- * Selecting REAL REATIRING employees only
-- Now that we have a list of all retirement-eligible employees, it's important 
-- to make sure that they are actually still employed with PH. To do so, we're 
-- going to perform another join, this time between the retirement_info and dept_emp tables. 

-- * The basic information to include in the new list is:
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
WHERE de.to_date = ('9999-01-01');

-- Finally, because this is a table of current employees (current_emp), we added a filter, 
-- using the WHERE keyword and the date 9999-01-01.

-- #############################################

-- ! MODULE 7.3.4

-- Now we will need to use "COUNT" and "GROUP BY" with joins, 
-- to separate the employees into their departments.
-- But the data output would'tbe in any particular order. 
-- Therefor, we will add ORDER BY clause to organize the  output by the department number.

-- SELECT ri.emp_no,
--     ri.first_name,
--     ri.last_name,
-- de.to_date   
-- FROM retirement_info as ri
-- LEFT JOIN dept_emp as de
-- ON ri.emp_no = de.emp_no
-- WHERE de.to_date = ('9999-01-01')

SELECT COUNT(ce.emp_no), de.dept_no
INTO retiring_emp_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Saved thw "Employee count by department number" as "retiring_emp_by_dept" by using the tabs

-- ####################################

-- ! Module 7.3.5 Create Additional Lists

-- Because of the number of people leaving each department, we have been asked to prepare three lists 

-- * 1- Employee Information: with unique employee number, their last name, first name, gender, and salary
-- * 2- Management: A list of managers for each department, department number, name, and the manager's 
-- *    employee number, last name, first name, and the starting and ending employment dates
-- * 3- Department Retirees: An updated current_emp list that includes everything it currently has, 
-- *   but also the employee's departments

-- TODO We run a SELECT statement in the query editor to take a look at Salaries table

-- SELECT * FROM salaries;

-- We want to know what the most recent date on this list is, so we sort 
-- that column in descending order. (updated the code and commented out the previous code)

-- SELECT * FROM salaries
-- ORDER BY to_date DESC;

-- * The date listed in the column is not the most recent date of employment, 
-- * So, we'll need to pull employment dates from the dept_emp table

-- SELECT emp_no, first_name, last_name
-- INTO retirement_info
-- FROM employees 
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- TODO  the only thing we're missing is the "gender". 
-- Add that to our SELECT statement and also format it (to fit best practices guidelines)
-- so updted and then comented out the previous block of codes
-- SELECT emp_no, 
--     first_name, 
--     last_name, 
--     gender
-- * INTO retirement_info
-- FROM employees 
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
    
-- * We won't want to save this query into the same table we used before. 
-- Not only would it be confusing, but Postgres wouldn't allow it anyway.
-- We'll want to update the INTO portion. The rest of the code looks good, 
-- as we want the same filters to be in place, so leave it as-is.


-- ! 1- Employee list with gender and salary

-- Then:
SELECT e.emp_no,	e.first_name,	e.last_name,	e.gender,	s.salary,	de.to_date
-- Save into a new table
INTO emp_info
FROM employees as e INNER JOIN salaries as s ON (e.emp_no = s.emp_no) INNER JOIN dept_emp as de	ON (e.emp_no = de.emp_no) -- Add filters
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31') AND (de.to_date = '9999-01-01');
 
 -- ===============================================

-- ! 2- List of managers" per department

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


-- =================================		
		
-- ! "List 3: Department Retirees"

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
 
-- #################################



