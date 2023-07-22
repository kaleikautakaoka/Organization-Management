//Import my dependencies
const mysql = require('mysql2');
const inquirer = require('inquirer');
const consoleTable = require('console.table');
require('dotenv').config();

const util = require('node:util');
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'Pickles2020',
    database: 'employee_trackerdb'
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected to the database!");
    start();
});

const start = async () => {
    const { choice } = await inquirer.prompt({
        name: 'choice',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
            'View all employees',
            'View all positions',
            'View all departments',
            'Add an employee',
            'Add a position',
            'Add a department',
            'Update an employee position',
            'Exit'
        ]
    });
    switch (choice) {
        case 'View all employees':
            return viewEmployees();
        case 'View all positions':
            return viewPosition();
        case 'View all departments':
            return viewDepartments();
        case 'Add an employee':
            return addEmployee();
        case 'Add a position':
            return addPosition();
        case 'Add a department':
            return addDepartment();
        case 'Update an employee position':
            return updateEmployeeposition();
        default:
            return exit();
    }
}

const viewEmployees = () => {
    connection.query('SELECT * FROM employee', function (err, result){
        if (err) throw err;
        console.table(result);
        start();
    });
}

const viewPosition = () => {
    connection.query('SELECT * FROM position', function (err, result){
        if (err) throw err;
    console.table(result);
        start();
    });
}


const viewDepartments = () => {
    connection.query('SELECT * FROM department', function (err, result){
        if (err) throw err;
    console.table(result);
        start();
    });
}

const addEmployee = () => {
    inquirer.prompt([
        {
            type: 'input',
            name: 'first_name',
            message: 'What is the employees first name?'
        },
        {
            type: 'input',
            name: 'last_name',
            message: 'What is the employees last name?'
        },
        {
            type: 'input',
            name: 'position_id',
            message: 'What is the employees position id?'
        },
        {
            type: 'input',
            name: 'manager_id',
            message: 'What is the employees manager id?'
        }
    ]).then(function (res) {
        connection.query('INSERT INTO employee SET ?', res, function (err, result) {
            if (err) throw err;
            console.table(result);
            start();
        });
    });
}

const addPosition = () => {
    inquirer.prompt([
        {
            type: 'input',
            name: 'title',
            message: 'What is the position title?'
        },
        {
            type: 'input',
            name: 'salary',
            message: 'What is the position salary?'
        },
        {
            type: 'input',
            name: 'department_id',
            message: 'What is the position department id?'
        }
    ]).then(function (res) {
        connection.query('INSERT INTO position SET ?', res, function (err, result) {
            if (err) throw err;
            console.table(result);
            start();
        });
    });
}

const addDepartment = () => {
    inquirer.prompt([
        {
            type: 'input',
            name: 'department_name',
            message: 'What is the department name?'
        }
    ]).then(function (res) {
        connection.query('INSERT INTO department SET ?', res, function (err, result) {
            if (err) throw err;
            console.table(result);
            start();
        });
    });
}

const updateEmployeeposition = () => {
    inquirer.prompt([
        {
            type: 'input',
            name: 'id',
            message: 'What is the employee id?'
        },
        {
            type: 'input',
            name: 'position_id',
            message: 'What is the new role id?'
        }
    ]).then(function (res) {
        connection.query('UPDATE employee SET position_id = ? WHERE id = ?', [res.position_id, res.id], function (err, result) {
            if (err) throw err;
            console.table(result);
            start();
        });
    });
}

const exit = () => {
    connection.end();
    process.exit();
}