--MVP



--Q1


SELECT 
e.first_name,
e.last_name,
t.name AS team_name 
FROM employees 
AS e INNER JOIN teams AS t 
ON e.team_id = t.id;





SELECT
e.first_name, 
e.last_name, 
t.name AS team_name 
FROM employees AS e 
INNER JOIN teams AS t 
ON e.team_id = t.id 
WHERE e.pension_enrol = TRUE;



SELECT
e.first_name,
e.last_name, 
t.name AS team_name
FROM employees AS e 
INNER JOIN teams AS t
ON e.team_id = t.id 
WHERE CAST(t.charge_cost AS INT) > 80;



--Q2

SELECT 
  e.*,
  pd.local_account_no,
  pd.local_sort_code
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
 


SELECT 
  e.*,
  pd.local_account_no,
  pd.local_sort_code,
  t.name AS team_name
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
LEFT JOIN teams AS t
ON e.team_id = t.id


--Q3

SELECT 
COUNT(e.id), t.name AS team_name
FROM employees AS e 
LEFT JOIN teams as t
ON e.team_id = t.id 
GROUP BY t.name;



SELECT 
  t.name AS team_name, 
  COUNT(e.id) AS num_employees
FROM teams AS t LEFT JOIN employees AS e
ON e.team_id = t.id
GROUP BY t.name
ORDER BY num_employees ASC


--Q4

SELECT 
  t.id,  
  t.name,
  COUNT(e.id)
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id


SELECT 
  t.name,
  COUNT(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
HAVING COUNT(e.id) * CAST(t.charge_cost AS INT) > 5000

SELECT 
  COUNT(DISTINCT(employee_id)) AS num_employees_on_committees
FROM employees_committees

XPLAIN ANALYZE


SELECT
  department,
    AVG(salary) AS avg_salary
FROM employees 
WHERE country IN ('Germany', 'France', 'Italy', 'Spain')
GROUP BY department
ORDER BY AVG(salary);



SELECT *
FROM employees
WHERE country = 'United States' AND fte_hours IN (
  SELECT fte_hours
  FROM employees
  GROUP BY fte_hours
  HAVING COUNT(*) = (
    SELECT MAX(count)
    FROM (
      SELECT COUNT(*) AS count
      FROM employees
      GROUP BY fte_hours
    ) AS temp
  )
)




WITH fte_count AS (
    SELECT
        fte_hours,
        COUNT(*) AS count
    FROM employees
    GROUP BY fte_hours
),
max_fte_count AS (
    SELECT 
        MAX(count) AS max_count
    FROM fte_count
),
most_common_fte AS (
    SELECT
        fte_hours
    FROM fte_count 
    WHERE count = (
        SELECT 
          max_count 
        FROM max_fte_count
    )
)
SELECT *
FROM employees
WHERE country = 'United States' AND fte_hours IN (
    SELECT
        fte_hours 
    FROM most_common_fte
)



SELECT
  first_name,
  last_name,
  department,
  salary,
  MIN(salary) OVER (PARTITION BY department) as min_sal_dept,
  MAX(salary) OVER (PARTITION BY department) as max_sal_dept
FROM employees
ORDER BY id