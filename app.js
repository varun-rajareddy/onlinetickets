const express = require('express');
const path = require("path");
const cors = require('cors');
const mysql = require('mysql');

const app = express();
app.use(cors());

app.use(express.json())
app.use(express.urlencoded({extended: true}))

const viewsDirPath = path.join(__dirname, "client");
app.set("view engine", "ejs");
app.set("views", viewsDirPath);
app.use(express.static(path.join(__dirname, "public")));

// DB connection
const dbConnection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'rootroot',
  database : 'my_shows_db',
  port: 3306
});

dbConnection.connect(function(err) {
  if (err) throw err;
  console.log("Database Connected!");
});

// App Routes
app.get('/', (request, response) => {
  response.render('home');
})

app.listen(process.env.port || 3000);
console.log('Web Server is listening at port '+ (process.env.port || 3000));
