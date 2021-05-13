const express = require('express');
const path = require("path");
const cors = require('cors');
const mysql = require('mysql');
const https = require('https');


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

app.get('/', (req, res) => {
  dbConnection.query(
    `SELECT * from movies`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.render('home', { movies: success });
      }
    }
  );
});


app.get('/login', (request, response) => {
  response.render('login');
})

app.get('/signup', (request, response) => {
  response.render('signup');
})

app.post('/register', (req, res) => {
  dbConnection.query(
    `INSERT INTO users (name, address, phone_number, email, password)
    VALUES ('${req.body.Name}', '${req.body.Address}', '${req.body.PhoneNumber}', '${req.body.Email}', '${req.body.Password}')`,
    (err, success) => {
      if (err) {
        res.send(err);
      };

      if (success) {
        res.send(success)
      }
    }
  );
});

app.post('/loginUser', (req, res) => {
  dbConnection.query(
    `SELECT id, email, password, role FROM users where email='${req.body.email}'`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.send(success)
      }
    }
  );
});



app.get('/admin', (req, res) => {
  dbConnection.query(
    `SELECT role from users where id='${req.query.userId}'`,
    (err, success) => {
      if (err) throw err;

      if (success[0] && success[0].role === 'employee') {
        dbConnection.query(
          `SELECT * from movies`,
          (err, success) => {
            if (err) throw err;

            if (success) {
              res.render('admin-home', { movies: success });
            }
          }
        )
      } else {
        dbConnection.query(
          `SELECT * from movies`,
          (err, success) => {
            if (err) throw err;

            if (success) {
              res.render('home', { movies: success });
            }
          }
        );
      }
    }
  );
})

app.listen(process.env.port || 3000);
console.log('Web Server is listening at port '+ (process.env.port || 3000));
