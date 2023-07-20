DROP DATABASE IF EXISTS employee_trackerDB;

CREATE DATABASE employee_trackerDB;

USE employee_trackerDB;

CREATE TABLE department(
 id INT AUTO_INCREMENT NOT NULL,
 department_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (department_name)
);

CREATE TABLE employee(
 id INT AUTO_INCREMENT NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 position_id INT NOT NULL,
 PRIMARY KEY (id),
);

CREATE TABLE position(
 id INT AUTO_INCREMENT NOT NULL,
 title VARCHAR(30) NOT NULL,
 salary DECIMAL NOT NULL,
 department_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (department_id) REFERENCES employee(id)
);