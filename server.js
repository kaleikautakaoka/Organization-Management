//Import my dependencies
const mysql = require('mysql2');
const inquirer = require('inquirer');
const consoleTable = require('console.table');
require('dotenv').config()
console.log(process.env.MY_SQL_USER) // remove this after you've confirmed it is working
const util = require('node:util');

//Create connection to database
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: process.env.MY_SQL_USER,
    password: process.env.MY_SQL_PASSWORD,
    database: 'employee_trackerDB',
});

consoleTable;

connection.query = util.promisify(connection.query);

connection.connect((err) => {
    if (err) throw err;
    console.log('connected as id ' + connection.threadId);
    start();
});

//Start function
let start = () => {
    inquirer.prompt({
        name: 'action',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
            'View all employees',
            'View all departments',
            'View all position',
            'Add employee',
            'Add department',
            'Add position',
            'Update employee position',
            'Delete employee',
            'Exit'
        ]
    }).then((answer) => {
        switch (answer.action) {
            case 'View all employees':
                viewAllEmployees();
                break;
            case 'View all departments':
                viewAllDepartments();
                break;
            case 'View all position':
                viewAllPosition();
                break;
            case 'Add employee':
                addEmployee();
                break;
            case 'Add department':
                addDepartment();
                break;
            case 'Add position':
                addPosition();
                break;
            case 'Update employee position':
                updateEmployeePosition();
                break;
            case 'Delete employee':
                deleteEmployee();
                break;
            case 'Exit':
                connection.end();
                break;
        }
    })
};

//View all employees
let viewAllEmployees = () => {
    connection.query('SELECT * FROM employee', (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    })
}

//View all departments
let viewAllDepartments = () => {
    connection.query('SELECT * FROM department', (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    })
}

//View all position
let viewAllPosition = () => {
    connection.query('SELECT * FROM position', (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    })
};

//Add employee
let addEmployee = () => {
    connection.query('SELECT * FROM position', (err, res) => {
        if (err) throw err;
        inquirer.prompt([
            {
                name: 'first_name',
                type: 'input',
                message: 'What is the employee\'s first name?'

            },
            {
                name: 'last_name',
                type: 'input',
                message: 'What is the employee\'s last name?'

            },

            {
                name: 'position',
                type: 'list',
                message: 'What is the employee\'s position?',
                choices: () => {
                    let positionArray = [];
                    for (let i = 0; i < res.length; i++) {
                        positionArray.push(res[i].title);
                    }
                    return positionArray;
                }
            }
        ]).then((answer) => {
            let positionID;
            for (let i = 0; i < res.length; i++) {
                if (res[i].title == answer.position) {
                    positionID = res[i].id;
                }
            }
            connection.query('INSERT INTO employee SET ?',

                {
                    first_name: answer.first_name,
                    last_name: answer.last_name,
                    position_id: positionID,
                },
                (err, res) => {
                    if (err) throw err;
                    console.log('Employee added!');
                    start();
                })
        })
    })
};

//Add department
let addDepartment = () => {
    inquirer.prompt([
        {
            name: 'newDepartment',
            type: 'input',
            message: 'What is the name of the new department?'

        }
    ]).then((answer) => {
        connection.query('INSERT INTO department SET ?',
            {
                name: answer.newDepartment
            },
            (err, res) => {
                if (err) throw err;
                console.log('Department added!');
                start();
            })
    })
};

//Add position
let addPosition = () => {
    connection.query('SELECT * FROM department', (err, res) => {
        if (err) throw err;
        inquirer.prompt([
            {
                name: 'newPosition',
                type: 'input',
                message: 'What is the name of the new position?'

            },
            {
                name: 'salary',
                type: 'input',
                message: 'What is the salary of the new position?'

            },
            {
                name: 'department',
                type: 'list',
                message: 'Which department does the new position belong to?',
                choices: () => {
                    let departmentArray = [];
                    for (let i = 0; i < res.length; i++) {
                        departmentArray.push(res[i].name);
                    }
                    return departmentArray;
                }
            }
        ]).then((answer) => {
            let departmentID;
            for (let i = 0; i < res.length; i++) {
                if (res[i].name == answer.department) {
                    departmentID = res[i].id;
                }
            }
            connection.query('INSERT INTO position SET ?',
                {
                    title: answer.newPosition,
                    salary: answer.salary,
                    department_id: departmentID
                },
                (err, res) => {
                    if (err) throw err;
                    console.log('Position added!');
                    start();
                })
        })
    })
};

//Update employee position
let updateEmployeePosition = () => {
    connection.query('SELECT * FROM employee', (err, res) => {
        if (err) throw err;
        inquirer.prompt([
            {
                name: 'employee',
                type: 'list',
                message: 'Which employee would you like to update?',
                choices: () => {
                    let employeeArray = [];
                    for (let i = 0; i < res.length; i++) {
                        employeeArray.push(res[i].first_name + ' ' + res[i].last_name);
                    }
                    return employeeArray;
                }
            }
        ]).then((answer) => {
            let employeeID;
            for (let i = 0; i < res.length; i++) {
                if (answer.employee == res[i].first_name + ' ' + res[i].last_name) {
                    employeeID = res[i].id;
                }
            }
            connection.query('SELECT * FROM position', (err, res) => {
                if (err) throw err;
                inquirer.prompt([
                    {
                        name: 'position',
                        type: 'list',
                        message: 'What is the employee\'s new position?',
                        choices: () => {
                            let positionArray = [];
                            for (let i = 0; i < res.length; i++) {
                                positionArray.push(res[i].title);
                            }
                            return positionArray;
                        }
                    }
                ]).then((answer) => {
                    let positionID;
                    for (let i = 0; i < res.length; i++) {
                        if (res[i].title == answer.position) {
                            positionID = res[i].id;
                        }
                    }
                    connection.query('UPDATE employee SET ? WHERE ?',
                        [
                            {
                                position_id: positionID
                            },
                            {
                                id: employeeID
                            }
                        ],
                        (err, res) => {
                            if (err) throw err;
                            console.log('Employee position updated!');
                            start();
                        })
                })
            })
        })
    })
};

let deleteEmployee = () => {
    connection.query('SELECT * FROM employee', (err, res) => {
        if (err) throw err;
        inquirer.prompt([
            {
                name: 'employee',
                type: 'list',
                message: 'Which employee would you like to delete?',
                choices: () => {
                    let employeeArray = [];
                    for (let i = 0; i < res.length; i++) {
                        employeeArray.push(res[i].first_name + ' ' + res[i].last_name);
                    }
                    return employeeArray;
                }
            }
        ]).then((answer) => {
            let employeeID;
            for (let i = 0; i < res.length; i++) {
                if (answer.employee == res[i].first_name + ' ' + res[i].last_name) {
                    employeeID = res[i].id;
                }
            }
            connection.query('DELETE FROM employee WHERE id=?', [employeeID], (err, res) => {
                if (err) throw err;
                console.log('Employee deleted!');
                start();
            })
        })
    })
}

