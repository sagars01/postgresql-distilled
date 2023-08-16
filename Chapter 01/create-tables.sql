CREATE TABLE employees (
	id VARCHAR(21) PRIMARY KEY,
    first_name VARCHAR(50),
    gender VARCHAR(10),
    start_date DATE,
    last_login_time TIME,
    salary INTEGER,
    bonus_percent DECIMAL(5,3),
    senior_management BOOLEAN,
    team VARCHAR(50),
	employee_id VARCHAR(21)
);


SELECT * FROM employees