SELECT * FROM employee_trackerDB;

SELECT employee.first_name, employee.last_name, position.title, position.salary, department.department_name FROM employee
INNER JOIN position ON employee.position_id = position.id
INNER JOIN department ON position.department_id = department.id;


