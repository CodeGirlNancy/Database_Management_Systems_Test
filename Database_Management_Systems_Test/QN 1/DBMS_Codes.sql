CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(255);
CREATE TABLE employees (                                              V 
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE
);
SELECT * FROM departments;
INSERT INTO departments (id, name)
VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'HR')
ON CONFLICT (id) DO NOTHING;

SELECT * FROM employees;
INSERT INTO employees (id, name, salary, department_id, hire_date)
VALUES
(1, 'Alice', 60000.00, 1, '2020-01-01'),
(2, 'Bob', 70000.00, 1, '2020-01-15'),
(3, 'Charlie', 80000.00, 2, '2020-02-01'),
(4, 'Dave', 90000.00, 3, '2020-02-15'),
(5, 'Eve', 100000.00, 4, '2020-03-01')
ON CONFLICT (id) DO NOTHING;


SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    e.salary,
    e.hire_date,
    d.name AS department_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.id;

SELECT e.name AS employee_name, e.salary, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
)
GROUP BY e.id, d.name
ORDER BY d.name;
SELECT e.name AS employee_name, e.hire_date, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.hire_date = (
    SELECT MIN(hire_date)
    FROM employees
    WHERE department_id = e.department_id
)
GROUP BY e.id, d.name
ORDER BY d.name;
SELECT e.name AS employee_name, e.salary, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
ORDER BY d.name, e.salary DESC;
