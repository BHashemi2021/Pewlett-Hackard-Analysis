-- ! Module 7 Chllenge:

-- TODO The Number of Retiring Employees by Title

-- * Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- * Retrieve the title, from_date, and to_date columns from the Titles table.
-- * Create a new table using the INTO clause.
-- * Join both tables on the primary key.
-- * Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- * Then, order by the employee number.
-- * Export the Retirement Titles table from the previous step as retirement_titles.csv and 
-- * save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT e.emp_no, 
e.first_name, 
e.last_name,
t.title, 
t.from_date, 
t.to_date 	
INTO Retirement_Titles

FROM employees AS e  

-- * join on primary key
LEFT OUTER JOIN titles AS t ON (e.emp_no = t.emp_no)   
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Select * from Retirement_Titles; 
-- -------------------------------------------------------------

-- ! Deliverable 2

-- There are duplicate entries for some employees because they have switched titles over the years. 
-- Use the following instructions to remove these duplicates and keep only the most recent title of each employee.

-- TODO Use Dictinct with Orderby to remove duplicate rows

-- * Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- * Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- * These columns will be in the new table that will hold the most recent title of each employee.
-- * Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined 
-- *    by the ON () clause.
-- * Create a Unique Titles table using the INTO clause.
-- * Sort the Unique Titles table in ascending order by the employee number and descending order by the last date 
-- *    (i.e. to_date) of the most recent title.
-- * Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- * Before you export your table, confirm that it looks like this image:


SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name,
title
INTO Unique_Titles 
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Select * from Unique_Titles; 

-- -----------------------------------------------------
-- Summary table (the number of employees by their most recent job title)

-- Write another query in the Employee_Database_challenge.sql file to 
-- retrieve the number of employees by their most recent job title who 
-- are about to retire.

-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.
-- Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- Before you export your table, confirm that it looks like this image:

SELECT COUNT (ut.emp_no), ut.title
INTO Retiring_Titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT (title) DESC;

-- And to show the Retirement_Titles table:
-- SELECT * FROM Retiring_Titles;






