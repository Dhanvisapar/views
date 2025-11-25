-- =============================
-- TASK 7: CREATING VIEWS
-- =============================

-- 1. SIMPLE VIEW
CREATE VIEW employee_basic AS
SELECT emp_id, name, department
FROM employees;

-- 2. CONDITIONAL VIEW (NO CHECK OPTION)
CREATE VIEW high_salary AS
SELECT emp_id, name, salary
FROM employees
WHERE salary > 50000;

-- 3. VIEW WITH CHECK OPTION
CREATE VIEW active_employees AS
SELECT emp_id, name, status
FROM employees
WHERE status = 'Active'
WITH CHECK OPTION;

-- 4. JOIN VIEW
CREATE VIEW emp_with_dept AS
SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 5. AGGREGATED VIEW
CREATE VIEW department_salary AS
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

-- 6. VIEW FOR LIMITED COLUMN ACCESS (SECURITY)
CREATE VIEW employee_public AS
SELECT emp_id, name
FROM employees;

-- 7. USING THE VIEWS
SELECT * FROM employee_basic;
SELECT * FROM high_salary;
SELECT * FROM active_employees;
SELECT * FROM emp_with_dept;
SELECT * FROM department_salary;

-- 8. UPDATE THROUGH VIEW (ONLY IF ALLOWED)
UPDATE employee_basic
SET department = 'Finance'
WHERE emp_id = 102;

-- 9. DELETE THROUGH VIEW (ONLY IF ALLOWED)
DELETE FROM employee_basic
WHERE emp_id = 110;

-- 10. DROP VIEWS
DROP VIEW IF EXISTS employee_basic;
DROP VIEW IF EXISTS high_salary;
DROP VIEW IF EXISTS active_employees;
DROP VIEW IF EXISTS emp_with_dept;
DROP VIEW IF EXISTS department_salary;
DROP VIEW IF EXISTS employee_public;
