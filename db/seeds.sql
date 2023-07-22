use employee_trackerdb;

INSERT INTO department (department_name) VALUES 
 ('Sales'),
 ('Accounting'),
 ('Engineering'),
 ('Finance'),
 ('Legal'),
 ('Human Resources'),
 ('Marketing'),
 ('Customer Service'),
 ('Research and Development'),
 ('Information Technology'),
 ('Purchasing'),
 ('Production'),
 ('Quality Assurance'),
 ('Shipping'),
 ('Administration'),
 ('Executive'),
 ('Facilities'),
 ('Maintenance'),
 ('Security');

INSERT INTO position (title, salary, department_id) VALUES 
('Sales Manager', 900000, 1),
('Sales Associate', 50000, 1),
('Software Development', 50000, 2),
('Software Testing', 50000, 2),
('Book Keeping', 50000, 3),
('Accountant', 50000, 3),
('Lawyer', 90000, 4),
('Paralegal', 50000, 4),
('Human Resources Manager', 90000, 5),
('Human Resources Associate', 50000, 5),
('Marketing Associate', 50000, 6),
('Customer Service Manager', 90000, 7),
('Customer Service Associate', 50000, 7),
('Research and Development Manager', 90000, 8),
('Research and Development Associate', 50000, 8),
('Information Technology Manager', 90000, 9),
('Information Technology Associate', 50000, 9),
('Purchasing Manager', 90000, 10),
('Purchasing Associate', 50000, 10),
('Production Manager', 90000, 11),
('Production Associate', 50000, 11),
('Quality Assurance Manager', 90000, 12),
('Quality Assurance Associate', 50000, 12),
('Shipping Manager', 90000, 13),
('Shipping Associate', 50000, 13),
('Administration Manager', 90000, 14),
('Administration Associate', 50000, 14),
('Executive Manager', 950000, 15),
('Executive Associate', 50000, 15),
('Facilities Manager', 90000, 16),
('Facilities Associate', 50000, 16),
('Maintenance Manager', 90000, 17),
('Maintenance Associate', 50000, 17),
('Security Manager', 90000, 18),
('Security Associate', 50000, 18);

INSERT INTO employee (first_name, last_name, position_id, manager_id) VALUES 
 ('Marie', 'Curie', 1, NULL),
 ('William', 'Shakespeer', 2, NULL),
 ('Magdalena', 'Andersson', 3, NULL),
 ('Kim', 'Jun-Un', 4, NULL),
 ('Abe', 'Lincoln', 5, NULL),
 ('Zee', 'Avi', 6, 1),
 ('id, Fredrick', 'Douglas', 7, 2),
 ('Bob', 'Marley', 8, 3),
 ('William', 'Harrison', 9, 3),
 ('Salmon', 'Khan', 10, 4),
 ('Sacajawea', 'Na', 11, 5);






