const mysql = require('mysql');

const dbConnection = mysql.createConnection({
    host: '127.0.0.1',
    port: 3306,
    database: 'bharris_AWS',
    user: 'bharris_AWS',
    password: 'ha4463100',
    debug: true
});

module.exports = dbConnection;


