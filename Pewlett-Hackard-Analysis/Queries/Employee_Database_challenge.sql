-- ! Module 7 Chllenge:

-- TODO for Deliverable 1.

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

-- ****************************
