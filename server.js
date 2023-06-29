const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const path = require('path');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static('public'));

// Set up the database connection pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'to-do-list',
  password: 'Active1234',
  port: 5432,
});

// Handle POST request for signing up
app.post('/signup', (req, res) => {
  // Your signup logic here
  // ...
});

// Handle POST request for login
app.post('/login', (req, res) => {
  // Your login logic here
  // ...
});

// Serve the project.html file
app.get('/project.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'project.html'));
});

// Serve the index.html file for the root path
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
