SELECT e.name AS employee_name, e.salary, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
GROUP BY d.name, e.name, e.salary;

