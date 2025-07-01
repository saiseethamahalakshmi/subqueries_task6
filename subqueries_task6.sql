CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    name TEXT,
    department_id INTEGER,
    salary INTEGER
);

CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT
);
SELECT 
    e.name,
    e.salary,
    (
        SELECT AVG(salary)
        FROM Employees
        WHERE department_id = e.department_id
    ) AS dept_avg_salary
FROM Employees e;
SELECT name
FROM Employees
WHERE department_id IN (
    SELECT department_id
    FROM Employees
    GROUP BY department_id
    HAVING COUNT(*) > 3
);
SELECT e.name, e.salary
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Employees e2
    WHERE e2.department_id = e.department_id
    GROUP BY e2.department_id
    HAVING e.salary > AVG(e2.salary)
);
SELECT 
    d.department_name,
    avg_salaries.avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
) AS avg_salaries
JOIN Departments d ON d.department_id = avg_salaries.department_id
ORDER BY avg_salaries.avg_salary DESC;

