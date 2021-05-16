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


select * from users;


-- -----------------------------------------------------
-- Table `mydb`.`theaters`
-- -----------------------------------------------------
CREATE TABLE `theaters` (
  `theater_id` INT NOT NULL auto_increment UNIQUE,
  `Name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`theater_id`));




Drop table Movies;

CREATE TABLE `movies` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(35) NOT NULL,
  `description` VARCHAR(45),
  `genre` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `image_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);


Select * from movies;
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Demon Slayer', 'This film is presented in telugu..', 'demon.jpeg', 'Action','Telugu',10.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Profile', 'PROFILE follows an undercover British..', 'profile.jpeg', 'Action','English',12.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Spiral', 'A criminal mastermind unleashes a ..', 'spiral.jpeg', 'Horror','Hindi',13.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Goon', 'Doug Glatt and (Seann William Scott) the..', 'goon.jpeg', 'Comedy','English',5.29);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Tom & Jerry', 'One of the most beloved rivalries in..', 'tom.jpeg', 'Animation','English',10);


INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('The Croods:A NewAge', 'The Croods have survived their fair...', 'croods.jpeg', 'Adventure, Animation','English',10.25);


INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'cruella.jpeg', 'Thriller','English',9.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Those Who Wished', 'From New Line Cinema comes thriller..', 'those.jpeg', 'Thriller','English',9.99);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('Wrath Of Man', 'A mysterious and wild-eyed new cash truck..', 'wrath.jpeg', 'Action','English',8.29);




Select * from Movies;



-- users
 insert into users (name, address, phone_number, email, password, role) values ('test', '123 123 add', 'ddl345ghdd', '7656473333', 'test@gmail.com', 'test' ,'employee');
 insert into users (name, address, phone_number, email, password, role) values ('test1', 'abcd', 'qwwl345ghd', '7656473663', 'test1@gmail.com', 'test1' ,'employee');

