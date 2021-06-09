
-- QUESRIES START FROM HERE

-- finding the name of employees born between 1952 and 1955 who will begin to retire
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
;





-- Create another query that will search for only 1952 birth dates.	
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'
;






-- Finding the retirement eligibility and those hired between 1985 to 1988 
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;





-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;





-- Using SELECT INTO to save data as a new table INTO retirement_info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;






-- To  see what the retirement_info​ table looks like we query it with a SELECT statement 
SELECT * FROM retirement_info
;

-- To see how many records are there in thid table
SELECT COUNT (first_name)
FROM retirement_info
;







