SELECT e.name AS employee_name, e.hire_date, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.hire_date = (
    SELECT MIN(e2.hire_date)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
GROUP BY d.name, e.name, e.hire_date;
