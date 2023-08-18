-- Creating Employees Table
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(255),
    work_type VARCHAR(50) CHECK (work_type IN ('Remote', 'In-office')),
    married BOOLEAN,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    hire_date DATE,
    department_id INTEGER,
    position_id INTEGER,
    employee_type VARCHAR(50) CHECK (employee_type IN ('Full-time', 'Part-time', 'Contractor')),
    manager_id INTEGER REFERENCES Employees(employee_id)
);

-- Creating Departments Table
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    head_id INTEGER REFERENCES Employees(employee_id)
);

-- Creating Positions Table
CREATE TABLE Positions (
    position_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    primary_skillsets VARCHAR(255),
    level VARCHAR(50),
    next_level INTEGER REFERENCES Positions(position_id)
);

-- Creating Performance_Reviews Table
CREATE TABLE Performance_Reviews (
    review_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES Employees(employee_id),
    date DATE,
    rating INTEGER,
    comments TEXT
);

-- Creating Compensation Table
CREATE TABLE Compensation (
    compensation_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES Employees(employee_id),
    salary NUMERIC(10, 2),
    bonus NUMERIC(10, 2),
    date_updated DATE
);

-- Adding Foreign Key Constraints to Employees Table
ALTER TABLE Employees
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id),
ADD FOREIGN KEY (position_id) REFERENCES Positions(position_id);