/* MVP */



/* Q1 */

SELECT *
FROM employees  
WHERE department = 'Human Resources'



/* Q2 */

SELECT 
first_name,
last_name,
country
FROM employees
WHERE department = 'Legal'


/* Q3 */

SELECT 
count (id) AS num_employees_in_Portugal
FROM employees 
WHERE country = 'Portugal'

/* Q4 */
SELECT 
count (id) AS num_employees_in_Portugal
FROM employees 
WHERE country IN ('Portugal' , 'Spain')

/* Q5 */

SELECT 
count(id) AS num_local_account_no_pay_details
FROM pay_details
WHERE local_account_no IS null

/* Q6 */
SELECT 
  DISTINCT(pay_details) 
FROM employees;



/* Q7 */
SELECT 
first_name, last_name 
FROM employees 
ORDER BY first_name ASC NULLS Last


/* Q8 */

SELECT 
first_name, last_name 
FROM employees 
ORDER BY last_name ASC NULLS LAST


/* Q9 */

SELECT * 
FROM employees 
ORDER BY salary DESC NULLS LAST 
LIMIT 10;

/* Q10 */
SELECT * 
FROM employees 
ORDER BY salary ASC NULLS LAST 
LIMIT 1;

/* Q11 */
SELECT 
COUNT(id) AS num_employees_first_name_F 
FROM employees 
WHERE email ILIKE 'F%'


/* Q12 */
SELECT 

FROM employees 
WHERE first_name 

/* QQ14 */

SELECT 
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary
FROM employees
WHERE department = 'Engineering';


/* Q15 */
SELECT * 
FROM employees 
ORDER BY 
  fte_hours DESC NULLS LAST, 
  last_name ASC NULLS LAST;

