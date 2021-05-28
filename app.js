const express = require('express');
const path = require("path");
const cors = require('cors');
const mysql = require('mysql');
const https = require('https');
const fileupload = require('express-fileupload')

const app = express();
app.use(cors(),express.json(),express.urlencoded({extended: true}),fileupload());

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
  const pageNumber = ((req.query.page || 1) - 1) * 9;

  dbConnection.query(
    `SELECT * FROM movies LIMIT 9 OFFSET ${pageNumber}`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.render('home', { movies: success });
      }
    }
  );
});

app.get('/upcoming-movies', (req, res) => {
  const pageNumber = req.query.page;

  https.get(`https://api.themoviedb.org/3/movie/upcoming?api_key=0e73c053f96903f9c84cf94862fc7e08&page=${pageNumber}`, (resp) => {
    let data = '';
    resp.on('data', (chunk) => {
      data += chunk;
    });

    resp.on('end', () => {
      https.get(`https://api.themoviedb.org/3/genre/movie/list?api_key=0e73c053f96903f9c84cf94862fc7e08`, (response) => {
        let genresData = '';
        response.on('data', (chunk) => {
          genresData += chunk;
        });

        response.on('end', () => {
          const genres=JSON.parse(genresData)['genres'];
          const movies=JSON.parse(data);

          movies.results.map(result=>{
            result.original_language=(result.original_language=='en')?'English':(result.original_language=='fr')?'French':(result.original_language=='te')?'Telugu':'Hindi';

            result['genre']=genres.filter(genre=>genre.id==result.genre_ids[0])[0].name
          })
          res.render('upcoming-movies', { movies: movies });
        });
      })
    });
  }).on("error", (err) => {
    console.log("Error: " + err.message);
  });
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

app.get('/profile', (req, res) => {
  dbConnection.query(
    `SELECT name, address, phone_number, email, password ,role FROM users WHERE id='${req.query.userId}'`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.render('profile', { user: success[0] })
      }
    }
  )
});


app.post('/update_profile', (req, res) => {
  dbConnection.query(
    `UPDATE users SET name='${req.body.Name}', address='${req.body.Address}', phone_number='${req.body.PhoneNumber}', email='${req.body.Email}', password='${req.body.Password}' WHERE id='${req.body.userId}'`,
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

app.get('/create_movie', (req, res) => {
  res.render('create-movie');
});


app.post('/create_movie', (req, res) => {
  const image=req.files.myFile;
  const path=__dirname + '/public/images/' + image.name;

  image.mv(path, (error) => {
    if (error) {
      res.writeHead(500, {
        'Content-Type': 'application/json'
      })
      res.end(JSON.stringify({ status: 'error', message: error }))
      return
    }
  })

  dbConnection.query(
    `SELECT id FROM theaters ORDER BY RAND() LIMIT 1`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        const theater_id=success[0].id;

        dbConnection.query(
          `INSERT INTO movies (name, description, genre, language, amount, image_name, theater_id) VALUES ('${req.body.name}', '${req.body.description}', '${req.body.genre}', '${req.body.language}', '${req.body.amount}', '${image.name}', '${theater_id}')`,
          (err, success) => {
            if (err) {
              res.send(err);
            };
            if (success) {
              res.send(success)
            }
          }
        );
      }
    }
  )
});

app.post('/delete_movie', (req, res) => {
  dbConnection.query(
    `DELETE FROM movies where id='${req.body.movieId}'`,
    (err, success) => {
      if (err) {
        res.send(err);
      };

      if (success) {
        res.send(success)
      }
    }
  )
})

app.get('/customer_profiles', (req, res) => {
  dbConnection.query(
    `SELECT users.name, users.address, users.phone_number, users.email FROM users where users.role='customer'`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.render('customer-profiles', { profiles: success })
      }
    }
  )
})


app.get('/update-movie', (req, res) => {
  dbConnection.query(
    `SELECT name, description, genre, language, amount , image_name FROM movies WHERE id='${req.query.movieId}'`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        res.render('update-movie', { movies: success[0] })
      }
    }
  )
});

app.get('/book-movie', (req, res) => {
  dbConnection.query(
    `SELECT * FROM movies WHERE id='${req.query.movieId}'`,
    (err, success) => {
      if (err) throw err;

      if (success) {
        const movie = success[0];

        dbConnection.query(
          `SELECT * FROM seats WHERE theater_id='${movie.theater_id}'`,
          (err, success) => {
            if (err) throw err;

            if (success) {
              var seats=[], chunkSize=8;

              success.forEach((item)=>{
                if(!seats.length || seats[seats.length-1].length == chunkSize)
                  seats.push([]);

                seats[seats.length-1].push(item);
              });

              movie['seats']=seats;
              res.render('book-movie', { movie: movie })
            }
          }
        )
      }
    }
  )
})

app.post('/reserve', (req, res) => {
  const selectedSeats = JSON.parse(req.body.selectedSeats);
  const totalPrice=Number(selectedSeats.length*req.body.ticket_price);

  selectedSeats.forEach((seat,index)=>{
    dbConnection.query(
      `UPDATE seats SET status='occupied' where seat_number='${seat}'`,
      (err, success) => {
        if (err) {
          res.send(err);
        };

        if (success && (selectedSeats.length-1 === index)) {
          dbConnection.query(
            `INSERT INTO booking_history (user_id, movie_id, number_of_tickets, cost) VALUES ('${req.body.user_id}', '${req.body.movie_id}', '${selectedSeats.length}', '${totalPrice}')`,
            (err, success) => {
              if (err) {
                res.send(err);
              };

              if (success) {
                res.send(success)
              }
            }
          );
        }
      }
    );
  })
});



app.listen(process.env.port || 3000);
console.log('Web Server is listening at port '+ (process.env.port || 3000));
