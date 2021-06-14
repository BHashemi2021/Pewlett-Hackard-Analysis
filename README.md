# Pewlett Hackard Analysis

## Overview 

Pewlett Hackard is a large long-established company with many employees. Baby boomers who have been born between the years 1946-1964 are 57-75 years now and consequently many are in the retirement age. Their retirement has even been likened to a grey tsunami and Pewlett Hackard is no exception among other large organizations that will have to be prepare a contingency plan to manage a prevailing human resource disaster. As a result, we have been tasked to prepare a list of those who are retiring soon.

Using the ERD we created in this module as a reference and knowledge of SQL queries, we will create a Retirement Titles table that will hold all the titles of current employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions— we will need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, we will use the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.

### We have been assigned to: 
  1- The Number of Retiring Employees by Title
  2- The Employees Eligible for the Mentorship Program
  3: A written report on the employee database analysis

To clearly see the relations between tables in SQL databases we can use Entity Relationship Diagrams or ERDs, or ER Diagram or ER model, that are a type of structural diagram used in database design. The following ERD shows the relations between the table we have created for PH Analysis (Figure 1).


#### Figure 1: The Pewlett Hackard ERD

-----------------------
![EmployeeDB.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/EmployeeDB.png)

-----------------------


We need to get some information about the employees who are about to retire from Employee and Titles tables. The best way to retrieve the information would be an outer left join between these two tables as shown in Figure 2 below.

#### Figure 2: Left Outer Join on Employees and Titles Tables

------------------------
![Left-outer-join.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/Left-outer-join.png)

------------------------



### Retirement Titles

We created the Retirement Titles table, shown below, to hold all the titles of current employees who were born between January 1, 1952 and December 31, 1955. As it is seen, in the table some employees have multiple titles that is indicative of promotions or changing roles over he years (Figure 3).


#### Figure 3: Retirement Titles

-----------------------
![1-retirement_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/1-retirement_titles.png)

-----------------------



### Most recent job titles

Because some employees have multiple titles in the database, e.g. due to promotions or other reasons, we used the DISTINCT ON statement to create a table that contains the most recent title of each employee as shown in Figure 4 below.


#### Figure 4: Table of Retirees with Unique Titles
----------------------
![2-unique_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/2-unique_titles.png)

----------------------


Finally, we used the COUNT() function to create a summary table that holds the number of retirement-age employees (90,398 employees) by most recent job title, as shown in Figure 5 below.



#### Figure 5: Summary Table

----------------------
![3_retiring_titles.png](https://github.com/BHashemi2021/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/Images/3_retiring_titles.png)

----------------------


## Results 

1- In Pewlett Hackard Company 90,398 employees will retire soon .
2- The highest employee numbers who will retire are senior engineers and the second most are senior staff.
3- Engineer also comprise a noticeable number of employees who wil retire.
4- Managers are the lowest number of employees who will retire (Figure 5).


## Summary

o	On the whole, 90,398 roles will need to be filled as the "silver tsunami" begins to make its impact. Most of the retirees will be among engineers in general (45397 or 50.2%) and senior engineers in particular (29414 or 32.5%)

o	There seems to be enough retirement ready staff to mentor the next generation of employees as this wave of retirement will go on for the next few years until all those born between 1946-1964 or baby boomers will retire. 
