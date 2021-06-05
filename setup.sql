CREATE DATABASE my_shows_db;
USE my_shows_db;

Drop database my_shows_db;

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


select * from users;


-- -----------------------------------------------------
-- Table `mydb`.`theaters`
-- -----------------------------------------------------
CREATE TABLE `theaters` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO theaters(name) VALUES ('Theater 1');
INSERT INTO theaters(name) VALUES ('Theater 2');
INSERT INTO theaters(name) VALUES ('Theater 3');
INSERT INTO theaters(name) VALUES ('Theater 4');
INSERT INTO theaters(name) VALUES ('Theater 5');
INSERT INTO theaters(name) VALUES ('Theater 6');
INSERT INTO theaters(name) VALUES ('Theater 7');
INSERT INTO theaters(name) VALUES ('Theater 8');
INSERT INTO theaters(name) VALUES ('Theater 9');
INSERT INTO theaters(name) VALUES ('Theater 10');
INSERT INTO theaters(name) VALUES ('Theater 11');

select * from theaters;


CREATE TABLE `seats` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `seat_number` INT NOT NULL,
  `status` VARCHAR(35) NOT NULL,
  `cost` INT NULL,
  `theater_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

drop table seats;

Select * from seats;



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

Drop table Movies;


Select * from movies;

INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Demon Slayer', 'This film is presented in telugu..', 'demon.jpeg', 'Action','Telugu',10.99,1);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Profile', 'PROFILE follows an undercover British..', 'profile.jpeg', 'Action','English',12.99,2);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Spiral', 'A criminal mastermind unleashes a ..', 'spiral.jpeg', 'Horror','Hindi',13.99,3);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99,4);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,5);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Goon', 'Doug Glatt and (Seann William Scott) the..', 'goon.jpeg', 'Comedy','English',5.29,6);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Tom & Jerry', 'One of the most beloved rivalries in..', 'tom.jpeg', 'Animation','English',10,7);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('The Croods:A NewAge', 'The Croods have survived their fair...', 'croods.jpeg', 'Adventure, Animation','English',10.25,8);
INSERT INTO movies(name, description, image_name, genre, language, amount, theater_id) VALUES ('Cruella', 'From New Line Cinema comes family..', 'cruella.jpeg', 'Adventure, Family','Telugu',9.99, 9);




INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'cruella.jpeg', 'Thriller','English',9.99,9);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,10);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99,11);
INSERT INTO movies(name, description, image_name, genre, language, amount,theater_id) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29,12);

Select * from Movies;

UPDATE Movies
SET theater_id = 10
WHERE id = 10;


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

drop table booking_history;

select * from booking_history;


-- users
 insert into users (name, address, phone_number, email, password, role) values ('user', '123 123 add', '765647397', 'user@gmail.com', 'test' ,'customer');
 insert into users (name, address, phone_number, email, password, role) values ('user2', 'abcd', '8856473663', 'user2@gmail.com', 'test' ,'customer');


insert into users (name, address, phone_number, email, password, role) values ('varun', '67664 rtt', '9956473333', 'varun@gmail.com', 'test' ,'customer');
 insert into users (name, address, phone_number, email, password, role) values ('harish', 'abcd', '8956473663', 'harish@gmail.com', 'test' ,'customer');





INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (18, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (19, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (20, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (21, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (22, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (23, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (24, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (25, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (26, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (27, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (28, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (29, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (30, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (31, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (32, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (33, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (34, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (35, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (36, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (37, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (38, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (39, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (40, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (41, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (42, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (43, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (44, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (45, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (46, 'empty', 1);
INSERT INTO seats (seat_number, status, theater_id) values (47, 'empty', 1);




INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 2);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 2);


INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 3);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 3);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 4);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 4);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 5);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 5);

INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 6);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 6);








INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 7);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 7);



INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 8);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 8);



INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 9);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 9);





INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 10);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 10);






INSERT INTO seats (seat_number, status, theater_id) values (0, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (1, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (2, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (3, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (4, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (5, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (6, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (7, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (8, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (9, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (10, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (11, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (12, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (13, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (14, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (15, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (16, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (17, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (18, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (19, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (20, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (21, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (22, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (23, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (24, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (25, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (26, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (27, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (28, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (29, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (30, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (31, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (32, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (33, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (34, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (35, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (36, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (37, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (38, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (39, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (40, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (41, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (42, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (43, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (44, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (45, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (46, 'empty', 11);
INSERT INTO seats (seat_number, status, theater_id) values (47, 'empty', 11);



