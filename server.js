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

const viewEmployees =  () => {
    connection.query('SELECT * FROM employee', function (err, result){
        if (err) throw err;
        console.table(result);
        start();
    });
}
//edit viewPosition
const viewPosition = async () => {
    const position = await connection.query('SELECT * FROM position');
    console.table(position);
    return start();
}
//edit viewDepartments
const viewDepartments = async () => {
    const departments = await connection.query('SELECT * FROM department');
    console.table(departments);
    return start();
}

const addEmployee = async () => {
    const position = await connection.query('SELECT * FROM position');
    const employees = await connection.query('SELECT * FROM employee');
    const employee = await inquirer.prompt([
        {
            name: 'first_name',
            type: 'input',
            message: "What is the employee's first name?"
        },
        {
            name: 'last_name',
            type: 'input',
            message: "What is the employee's last name?"
        },
        {
            name: 'position_id',
            type: 'list',
            message: "What is the employee's position?",
            choices: position.map((position) => ({
                name: position.title,
                value: position.id
            }))
        },
        {
            name: 'manager_id',
            type: 'list',
            message: "Who is the employee's manager?",
            choices: employees.map((employee) => ({
                name: `${employee.first_name} ${employee.last_name}`,
                value: employee.id
            }))
        }
    ]);
    await connection.query('INSERT INTO employee SET ?', employee);
    return start();
}

const addPosition = async () => {
    const departments = await connection.query('SELECT * FROM department');
    const position = await inquirer.prompt([
        {
            name: 'title',
            type: 'input',
            message: "What is the position title?"
        },
        {
            name: 'salary',
            type: 'input',
            message: "What is the position salary?"
        },
        {
            name: 'department_id',
            type: 'list',
            message: "What is the position department?",
            choices: departments.map((department) => ({
                name: department.name,
                value: department.id
            }))
        }
    ]);
    await connection.query('INSERT INTO position SET ?', position);
    return start();
}

const addDepartment = async () => {
    const department = await inquirer.prompt([
        {
            name: 'name',
            type: 'input',
            message: "What is the department name?"
        }
    ]);
    await connection.query('INSERT INTO department SET ?', department);
    return start();
}

const updateEmployeeposition = async () => {
    const employees = await connection.query('SELECT * FROM employee');
    const position = await connection.query('SELECT * FROM position');
    const employee = await inquirer.prompt([
        {
            name: 'id',
            type: 'list',
            message: "Which employee's position would you like to update?",
            choices: employees.map((employee) => ({
                name: `${employee.first_name} ${employee.last_name}`,
                value: employee.id
            }))
        },
        {
            name: 'position_id',
            type: 'list',
            message: "What is the employee's new position?",
            choices: position.map((position) => ({
                name: position.title,
                value: position.id
            }))
        }
    ]);
    await connection.query('UPDATE employee SET position_id = ? WHERE id = ?', [employee.position_id, employee.id]);
    return start();
}

const exit = () => {
    connection.end();
    process.exit();
};