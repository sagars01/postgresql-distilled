

-- Create the "employees" table to store employee information
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL,
    manager_id INT REFERENCES employees(employee_id) ON DELETE SET NULL
);

CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id) ON DELETE CASCADE,
    salary_amount NUMERIC(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);


-- Create the "attendance" table to store employee attendance records
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id) ON DELETE CASCADE,
    check_in TIMESTAMP NOT NULL,
    check_out TIMESTAMP
);


-- Create the "tasks" table to store employee tasks
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id) ON DELETE CASCADE,
    task_description TEXT NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);