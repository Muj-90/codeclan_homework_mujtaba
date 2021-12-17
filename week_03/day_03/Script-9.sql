--mpv



--Q1
SELECT 
    first_name,
    last_name,
    department,
    salary,
    MIN(salary) OVER (PARTITION BY department) AS min_sal_dept,
    MAX(salary) OVER (PARTITION BY department) AS max_sal_dept
FROM employees
ORDER BY id;

--Q2
SELECT 
  first_name, 
  last_name, 
  department 
FROM employees
ORDER BY department
ASC NULLS LAST, last_name ASC NULLS LAST



SELECT *
FROM employees e 
WHERE last_name ILIKE 'A'


--Q3


SELECT *
FROM employees e 
WHERE last_name ILIKE 'A'



--Q4

select 
    department,
    count(id) AS num_employees_started_2003
    from employees e 
where start_date between ('2003-01-01' and '2003-12-31')
group by department

--Q5
SELECT 
department, 
fte_hours, 
COUNT(id) AS num_employees
FROM employees 
GROUP BY department, 
fte_hours
ORDER BY department ASC NULLS LAST,
fte_hours ASC NULLS LAST

--6

SELECT 
pension_enrol AS pension_last_enrol,
count(id) AS num_employees 
FROM employees e 
GROUP BY pension_enrol 


--Q7

SELECT 
  MAX(salary) AS max_salary_Acou_1_ftehours
FROM employees
WHERE department = 'Accounting' 
ORDER BY department ASC NULLS LAST,
Accounting ASC NULLS LAST




--Q8

SELECT
    country,
    count(*),
    round(avg(salary))
FROM employees e
WHERE country IN (SELECT country
  FROM employees e2
  GROUP BY country
  HAVING count(country) > 30)
GROUP BY country;


--Q9

SELECT 
first_name,
last_name,
fte_hours,
salary ,
fte_hours * salary AS effective_yearly_salary
FROM employees e 
fte_hours * salary AS effective_yearly_salary

--Q10

SELECT *
first_name, 
last_name  
FROM employees e 
WHERE dt_1 = ? OR dt_2 = ?





--Q11

SELECT
first_name,
last_name
FROM employees AS e INNER JOIN pay_details AS pd 
ON e.pay_detail_id = pd.id 
WHERE pd.local_tax_code IS NULL 