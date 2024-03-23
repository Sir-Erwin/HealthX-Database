// db.js
import mysql from 'mysql2';
import http from "http";


const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Xtreme',
  database: 'sys'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

export default connection;


// Create HTTP server
const server = http.createServer((req, res) => {
  // Handle HTTP requests
  
});

const PORT = process.env.PORT || 5000;

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
