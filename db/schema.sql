DROP DATABASE IF EXISTS employee_trackerdb;

CREATE DATABASE employee_trackerdb;

USE employee_trackerdb;

CREATE TABLE department (
 id INT NOT NULL AUTO_INCREMENT,
 department_name VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE employee (
 id INT NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(30),
 last_name VARCHAR(30),
 position_id INT,
 manager_id BOOLEAN,
 PRIMARY KEY (id)
    FOREIGN KEY (position_id) REFERENCES position (id),
   --  ON DELETE SET NULL,
   --  FOREIGN KEY (salary) REFERENCES position(salary),
   --  ON DELETE SET NULL,
   --  FOREIGN KEY (department_name) REFERENCES department(department_name),
   --  ON DELETE SET NULL,
);

CREATE TABLE position (
 id INT NOT NULL AUTO_INCREMENT,
 title VARCHAR(30),
 salary DECIMAL,
 department_id INT,
 PRIMARY KEY (id)
 FOREIGN KEY (department_id) REFERENCES department (id),
    ON DELETE SET NULL,
--  FOREIGN KEY (first_name) REFERENCES employee(first_name),
--     ON DELETE SET NULL,
--  FOREIGN KEY (last_name) REFERENCES employee(last_name),
--     ON DELETE SET NULL,
--  FOREIGN KEY (position_id) REFERENCES employee(position_id),
--     ON DELETE SET NULL,
--  FOREIGN KEY (manager_id) REFERENCES employee(manager_id),
--     ON DELETE SET NULL,
);