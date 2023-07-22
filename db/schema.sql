DROP DATABASE IF EXISTS employee_trackerdb;

CREATE DATABASE employee_trackerdb;

USE employee_trackerdb;

CREATE TABLE department (
 id INT NOT NULL AUTO_INCREMENT,
 department_name VARCHAR(40),
 PRIMARY KEY (id)
);

CREATE TABLE position (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100),
 salary DECIMAL,
 department_id INT,
 FOREIGN KEY (department_id) REFERENCES department (id)
);

-- Boolean cannot be primary key
CREATE TABLE employee (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(30),
 last_name VARCHAR(30),
 position_id INT,
 manager_id INT,

 FOREIGN KEY (position_id) REFERENCES position (id) ON DELETE SET NULL,
 FOREIGN KEY (manager_id) REFERENCES employee (id)
);