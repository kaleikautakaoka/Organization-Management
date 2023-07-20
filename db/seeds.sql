use employee_trackerDB;

INSERT INTO department (department_name) VALUES ('Sales');
INSERT INTO department (department_name) VALUES ('Engineering');
INSERT INTO department (department_name) VALUES ('Finance');
INSERT INTO department (department_name) VALUES ('Legal');
INSERT INTO department (department_name) VALUES ('Human Resources');
INSERT INTO department (department_name) VALUES ('Marketing');
INSERT INTO department (department_name) VALUES ('Customer Service');
INSERT INTO department (department_name) VALUES ('Research and Development');
INSERT INTO department (department_name) VALUES ('Information Technology');
INSERT INTO department (department_name) VALUES ('Purchasing');
INSERT INTO department (department_name) VALUES ('Production');
INSERT INTO department (department_name) VALUES ('Quality Assurance');
INSERT INTO department (department_name) VALUES ('Shipping');
INSERT INTO department (department_name) VALUES ('Administration');
INSERT INTO department (department_name) VALUES ('Executive');
INSERT INTO department (department_name) VALUES ('Facilities');
INSERT INTO department (department_name) VALUES ('Maintenance');
INSERT INTO department (department_name) VALUES ('Security');

INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Marie', 'Curie', 1, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('William', 'Shakespeer', 2, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Magdalena', 'Andersson', 3, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Kim', 'Jun-Un', 4, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Abe', 'Lincoln', 5, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Zee', 'Avi', 6, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Fredrick', 'Douglas', 7, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Bob', 'Marley', 8, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('William', 'Harrison', 9, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Salmon', 'Khan', 10, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Sacajawea', 'Na', 11, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Zachary', 'Taylor', 12, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Amelia', 'Earheart', 13, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Nelson', 'Mandela', 14, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Marilyn', 'Monroe', 15, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('John', 'Lennon', 16, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Samuel', 'Jackson', 17, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Xi', 'Jingping', 18, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Mao', 'Zedong', 19, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Vladimir', 'Putin', 20, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Napoleon', 'Bonaparte', 21, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Julius', 'Caesar', 22, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Alexander', 'Hoffman', 23, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Genghis', 'Khan', 24, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Cleopatra', 'Cleopatra', 25, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Karl', 'Rove', 26, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('James', 'Comie', 27, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Joe', 'Washington', 28, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Tsai', 'Ing-wen', 29, true);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Condelisa', 'Rice', 30, false);
INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES ('Ruth', 'Ginsgurg', 31, true);



INSERT INTO position (title, salary, department_id) VALUES ('Sales Manager', 900000, 1);
INSERT INTO position (title, salary, department_id) VALUES ('Sales Associate', 50000, 1);
INSERT INTO position (title, salary, department_id) VALUES ('Software Development', 50000, 2);
INSERT INTO position (title, salary, department_id) VALUES ('Software Testing', 50000, 2);
INSERT INTO position (title, salary, department_id) VALUES ('Book Keeping', 50000, 3);
INSERT INTO position (title, salary, department_id) VALUES ('Accountant', 50000, 3);
INSERT INTO position (title, salary, department_id) VALUES ('Lawyer', 90000, 4);
INSERT INTO position (title, salary, department_id) VALUES ('Paralegal', 50000, 4);
INSERT INTO position (title, salary, department_id) VALUES ('Human Resources Manager', 90000, 5);
INSERT INTO position (title, salary, department_id) VALUES ('Human Resources Associate', 50000, 5);
INSERT INTO position (title, salary, department_id) VALUES ('Marketing Manager', 90000, 6);
INSERT INTO position (title, salary, department_id) VALUES ('Marketing Associate', 50000, 6);
INSERT INTO position (title, salary, department_id) VALUES ('Customer Service Manager', 90000, 7);
INSERT INTO position (title, salary, department_id) VALUES ('Customer Service Associate', 50000, 7);
INSERT INTO position (title, salary, department_id) VALUES ('Research and Development Manager', 90000, 8);
INSERT INTO position (title, salary, department_id) VALUES ('Research and Development Associate', 50000, 8);
INSERT INTO position (title, salary, department_id) VALUES ('Information Technology Manager', 90000, 9);
INSERT INTO position (title, salary, department_id) VALUES ('Information Technology Associate', 50000, 9);
INSERT INTO position (title, salary, department_id) VALUES ('Purchasing Manager', 90000, 10);
INSERT INTO position (title, salary, department_id) VALUES ('Purchasing Associate', 50000, 10);
INSERT INTO position (title, salary, department_id) VALUES ('Production Manager', 90000, 11);
INSERT INTO position (title, salary, department_id) VALUES ('Production Associate', 50000, 11);
INSERT INTO position (title, salary, department_id) VALUES ('Quality Assurance Manager', 90000, 12);
INSERT INTO position (title, salary, department_id) VALUES ('Quality Assurance Associate', 50000, 12);
INSERT INTO position (title, salary, department_id) VALUES ('Shipping Manager', 90000, 13);
INSERT INTO position (title, salary, department_id) VALUES ('Shipping Associate', 50000, 13);
INSERT INTO position (title, salary, department_id) VALUES ('Administration Manager', 90000, 14);
INSERT INTO position (title, salary, department_id) VALUES ('Administration Associate', 50000, 14);
INSERT INTO position (title, salary, department_id) VALUES ('Executive Manager', 950000, 15);
INSERT INTO position (title, salary, department_id) VALUES ('Executive Associate', 50000, 15);
INSERT INTO position (title, salary, department_id) VALUES ('Facilities Manager', 90000, 16);
INSERT INTO position (title, salary, department_id) VALUES ('Facilities Associate', 50000, 16);
INSERT INTO position (title, salary, department_id) VALUES ('Maintenance Manager', 90000, 17);
INSERT INTO position (title, salary, department_id) VALUES ('Maintenance Associate', 50000, 17);
INSERT INTO position (title, salary, department_id) VALUES ('Security Manager', 90000, 18);
INSERT INTO position (title, salary, department_id) VALUES ('Security Associate', 50000, 18);

```






