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

