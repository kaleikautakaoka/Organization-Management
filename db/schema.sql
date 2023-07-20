DROP DATABASE IF EXISTS employee_trackerDB;

CREATE DATABASE employee_trackerDB;

USE employee_trackerDB;

CREATE TABLE department(
 id INT AUTO_INCREMENT NOT NULL,
 department_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employee(
 id INT AUTO_INCREMENT NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 position_id INT NOT NULL,
 manager_id BOOLEAN NOT NULL,
 PRIMARY KEY (id),
    FOREIGN KEY (title) REFERENCES position(title),
    ON DELETE SET NULL,
    FOREIGN KEY (salary) REFERENCES position(salary),
    ON DELETE SET NULL,
    FOREIGN KEY (department_name) REFERENCES department(department_name),
    ON DELETE SET NULL,
);

CREATE TABLE position(
 id INT AUTO_INCREMENT NOT NULL,
 title VARCHAR(30) NOT NULL,
 salary INT NOT NULL,
 department_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (department_name) REFERENCES department(department_name),
    ON DELETE SET NULL,
 FOREIGN KEY (first_name) REFERENCES employee(first_name),
    ON DELETE SET NULL,
 FOREIGN KEY (last_name) REFERENCES employee(last_name),
    ON DELETE SET NULL,
 FOREIGN KEY (position_id) REFERENCES employee(position_id),
    ON DELETE SET NULL,
 FOREIGN KEY (manager_id) REFERENCES employee(manager_id),
    ON DELETE SET NULL,
);