--  BASIC CTE
WITH DepartmentCTE AS

(SELECT e.first_name, e.last_name, d.name FROM employees e 
INNER JOIN departments d 
ON
e.department_id = d.department_id
)

SELECT * FROM DepartmentCTE LIMIT 5
MULTIPLE CTEs

-- MULTIPLE CTE
WITH EmployeeSalaries AS (
  SELECT e.employee_id, e.first_name, e.last_name, c.salary 
  FROM employees e 
  JOIN compensation c ON e.employee_id = c.employee_id
),
EmployeeDepartments AS (
	SELECT e.employee_id , d.name FROM employees e 
	JOIN departments d 
	ON
	e.department_id = d.department_id 
)
SELECT DISTINCT * FROM EmployeeSalaries as es
JOIN EmployeeDepartments ed ON
es.employee_id = ed.employee_id 

-- ==== WRITABLE CTES =======

WITH UpdatedSalaries AS (
  SELECT employee_id, salary * 1.1 AS new_salary
  FROM compensation
)
UPDATE compensation AS c
SET salary = us.new_salary
FROM UpdatedSalaries AS us
WHERE c.employee_id = us.employee_id;


-- WRITABLE CTEs WITH CONDITIONS
WITH EligibleForPromotion AS (
  SELECT e.employee_id, c.salary
	FROM employees e
	JOIN
	compensation c
	ON e.employee_id = c.employee_id
  WHERE c.salary > 50000 AND department_id = 7
)
UPDATE employees
SET position_id = 7
FROM EligibleForPromotion
WHERE employees.employee_id = EligibleForPromotion.employee_id;

