const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 3000;

// MySQL connection configuration
const connection = mysql.createConnection({
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'user',
  password: process.env.DATABASE_PASSWORD || 'password',
  database: process.env.DATABASE_NAME || 'myappdb'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

app.get('/', (req, res) => {
  connection.query('SELECT NOW()', (err, results) => {
    if (err) {
      res.status(500).send('Error querying database');
      return;
    }
    res.send(`Current time: ${results[0]['NOW()']}`);
  });
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
