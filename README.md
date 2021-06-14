# Pewlett Hackard Analysis

## Background
Pewlett Hackard is a large long-established company with many employees. Baby boomers who have been born between the years 1946-1964 are 57-75 years now and consequently many are in the retirement age. Their retirement has even been likened to a grey tsunami and Pewlett Hackard is no exception among other large organizations that will have to be prepare a contingency plan to manage a prevailing human resource disaster. As a result, we have been tasked to prepare a list of those who are retiring soon.
Using the ERD we created in this module as a reference and knowledge of SQL queries, we will create a Retirement Titles table that will hold all the titles of current employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions— we will need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, we will use the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.

### We have been asigned to: 
  1- The Number of Retiring Employees by Title
  2- The Employees Eligible for the Mentorship Program
  3: A written report on the employee database analysis
  
To clearly see the relations between tables in SQL databases we can use Entity Relationship Diagrams or ERDs, or ER Diagram or ER model, that are a type of structural diagram used in database design. The following ERD shows the relations between the table we have created for PH Analysis.


-----------------------
![EmployeeDB.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/EmployeeDB.png)

-----------------------



## Retirement Titles
We created the Retirement Titles table, shown below, to hold all the titles of current employees who were born between January 1, 1952 and December 31, 1955. As it is seen, in the table some employees have multiple titles.



-----------------------
![1-retirement_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/1-retirement_titles.png)

-----------------------



## Most recent job titles

Because some employees have multiple titles in the database, e.g. due to promotions or other reasons, we used the DISTINCT ON statement to create a table that contains the most recent title of each employee as shown in the image below.



----------------------
![2-unique_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/2-unique_titles.png)

----------------------


Finally, we used the COUNT() function to create a summary table that holds the number of retirement-age employees by most recent job title, as shown below.


----------------------
![3_retiring_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/3_retiring_titles.png)



----------------------

