const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const path = require('path');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static('public'));

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'to-do-list',
  password: 'Active1234',
  port: 5432,
});


app.post('/signup', (req, res) => {

});


app.post('/login', (req, res) => {
});

app.get('/project.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'project.html'));
});
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});