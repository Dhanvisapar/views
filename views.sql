
-- create view
CREATE VIEW employee_basic AS
SELECT emp_id, name, department
FROM employees;
-- conditional view
CREATE VIEW high_salary AS
SELECT emp_id, name, salary
FROM employees
WHERE salary > 50000;
-- view with check option
CREATE VIEW active_employees AS
SELECT emp_id, name, status
FROM employees
WHERE status = 'Active'
WITH CHECK OPTION;
-- aggregated view
CREATE VIEW department_salary AS
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

-- create view with condition
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000
WITH CHECK OPTION;
-- create a join view
CREATE VIEW employee_department AS
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
-- use the view
SELECT * FROM employee_department;
-- update through a view
UPDATE employee_basic
SET department = 'Finance'
WHERE emp_id = 102;
-- drop a view
DROP VIEW employee_basic;
