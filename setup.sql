CREATE DATABASE my_shows_db;
USE my_shows_db;

CREATE TABLE `users` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(11) NOT NULL UNIQUE,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) DEFAULT 'customer',
  PRIMARY KEY (`id`)
);

-- users
insert into users (name, address, phone_number, email, password, role) values ('test', '123 123 add', '7656473333', 'test@gmail.com', 'test' ,'employee');
insert into users (name, address, phone_number, email, password, role) values ('test1', 'abcd', '7656473663', 'test1@gmail.com', 'test1' ,'employee');
insert into users (name, address, phone_number, email, password, role) values ('test', '123 123 add', 'ddl345ghdd', '7656473333', 'test@gmail.com', 'test' ,'employee');
insert into users (name, address, phone_number, email, password, role) values ('test1', 'abcd', 'qwwl345ghd', '7656473663', 'test1@gmail.com', 'test1' ,'employee');

select * from users;

-- theaters
-- create theaters before creating movies. Because we need to assign theater_id to movies
CREATE TABLE `theaters` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO theaters(name) VALUES ('Theater 1');

-- seats
-- status - empty, occupied
-- Each theater will have 8 seats of 6 rows i.e., total 48 seats
-- Insert seats for all the created theaters as like below
-- For example, I created 5 seats for every theater. So, for demo, we need to create as many as we want
CREATE TABLE `seats` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `seat_number` INT NOT NULL,
  `status` VARCHAR(35) NOT NULL,
  `cost` INT NULL,
  `theater_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);
-- Start seat_number from 0 and on (Ex: 0,1,2,...48)
INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 1);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 2);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 3);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 4);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 5);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 6);

-- booking history
CREATE TABLE `booking_history` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `user_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `seat_numbers` VARCHAR(35) NOT NULL,
  `cost` INT NOT NULL,
  `created_at`  VARCHAR(100),
  PRIMARY KEY (`id`)
);

-- movies
-- Drop the movies table. New columns were added
Drop table Movies;

CREATE TABLE `movies` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(35) NOT NULL,
  `description` VARCHAR(45),
  `genre` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `image_name` VARCHAR(255) NOT NULL,
  `theater_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

Select * from movies;

INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Demon Slayer', 'This film is presented in telugu..', 'demon.jpeg', 'Action','Telugu',10.99,1);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Profile', 'PROFILE follows an undercover British..', 'profile.jpeg', 'Action','English',12.99,2);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Spiral', 'A criminal mastermind unleashes a ..', 'spiral.jpeg', 'Horror','Hindi',13.99,3);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99,4);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,5);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Goon', 'Doug Glatt and (Seann William Scott) the..', 'goon.jpeg', 'Comedy','English',5.29,6);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Tom & Jerry', 'One of the most beloved rivalries in..', 'tom.jpeg', 'Animation','English',10,7);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('The Croods:A NewAge', 'The Croods have survived their fair...', 'croods.jpeg', 'Adventure, Animation','English',10.25,8);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'cruella.jpeg', 'Thriller','English',9.99,9);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,10);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99,11);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,12);

Select * from Movies;

