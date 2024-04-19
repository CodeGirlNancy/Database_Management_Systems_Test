SELECT e.name AS employee_name, e.salary, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS avg_salaries ON e.department_id = avg_salaries.department_id
WHERE e.salary > avg_salaries.avg_salary
GROUP BY d.name, e.name, e.salary;
