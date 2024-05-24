-- basic SELECT Statements --
-- retrieve all list of all employees-

select * from employees

-- Filtering Data with WHERE Clause --
-- find employees with the last name "Piveteau"--

select * 
from employees
where last_name = 'Piveteau';

-- Sorting Results --
-- list employees ordered by hire date in ascending order--

select * 
from employees
ORDER BY hire_date asc;

-- Using Aggregate Functions --
-- count the number of employees --

SELECT COUNT(*)
from employees;

-- Group BY Clause --
-- find the number of employees hired each year--

SELECT YEAR(hire_date) AS year, COUNT(*) AS number_of_employees
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY year;

-- Basic INNER JOIN --
-- retrieve a list of employees along with their department names--

SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    de.dept_no,
    d.dept_name
from 
employees e
	JOIN
    dept_emp de ON e.emp_no = de.emp_no
	LEFT JOIN
    departments d ON de.dept_no = d.dept_no
    
-- LEFT JOIN --
-- get a list of employees and their titles, including those who do not have a title currently assigned

select
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title
from
employees e
LEFT JOIN
titles t ON e.emp_no = t.emp_no;

-- Using Subqueries --
-- find employees above the average salary rate from the Sales department--

select
e.first_name as firstName,
AVG(s.salary) as averageSalary,
d.dept_name
from 
employees e
LEFT JOIN
salaries s ON e.emp_no = s.emp_no
LEFT JOIN
dept_emp de ON s.emp_no = de.emp_no
LEFT JOIN
departments d ON de.dept_no = d.dept_no
where
dept_name = 'Sales'
group by first_name

-- Subqueries in the SELECT Clause --
-- list each employee along with the number of titles they have held

select emp_no, (SELECT count(*) from titles
where titles.emp_no = employees.emp_no) from employees

--bonus only but this is not subquery--
-- select emp_no, COUNT(*) as totalEMP
-- from titles
-- GROUP BY emp_no


-- INNER JOIN with Multiple Conditions --
-- retrieve a list of employees who are currently in a specific department (e.g., 'd005')--

select * 
from employees e
JOIN
dept_emp de ON e.emp_no = de.emp_no
JOIN
departments d ON de.dept_no = d.dept_no
where
d.dept_no = 'd005';

 -- INNER JOIN with Aggregate Functions --
-- find the average salary for each department --

select
d.dept_name,
AVG(s.salary) as average_salary
from
salaries s
LEFT JOIN
dept_emp de ON s.emp_no = de.emp_no
LEFT JOIN
departments d on de.dept_no = d.dept_no
group by dept_name

 -- LEFT JOIN with Filtering --
-- list all employees along with their manager's name, if they have one --
select 
e.emp_no,
e.first_name,
e.last_name,
dm.emp_no as managerID,
e2.first_name as managerFirstName

from employees e
LEFT JOIN
dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN
dept_manager dm ON de.dept_no = dm.dept_no
LEFT JOIN
employees e2 ON dm.emp_no = e2.emp_no

 -- SELF JOIN --
-- list all pairs of employees who share the same birth date--
select
e1.first_name as Employee1, 
e2.first_name as Employee2,
e1.birth_date

from employees e1

join employees e2 ON e1.birth_date = e2.birth_date;
select
e1.first_name as Employee1, 
e2.first_name as Employee2,
e1.birth_date
from employees e1
join employees e2 ON e1.birth_date = e2.birth_date and e1.emp_no !=e2.emp_no;

 -- JOIN with Conditional Logic --
-- list employees and indicidate if they have ever worked in the 'Sales' department --

select
* from dept_emp

where dept_no = 'd007'

 -- Multiple Joins and Grouping --
-- find the highest salary for each department along with the department name --
select
e.emp_no,
e.first_name,
s.salary, MAX(s.salary) as highest_salary,
d.dept_name as departmentName
from
employees e
LEFT JOIN
salaries s ON e.emp_no = s.emp_no
LEFT JOIN
dept_emp de ON s.emp_no = de.emp_no
LEFT JOIN
departments d ON de.dept_no = d.dept_no

group by d.dept_name






