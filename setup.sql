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
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45),
  `type` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `image_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive1', 'This is about movie1', 'movie1.jpg', 'comedy','telugu',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive2', 'This is about movie2', 'movie2.jpg', 'comedy','english',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive3', 'This is about movie3', 'worth.jpeg', 'comedy','hindi',100);


INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive1', 'This is about movie1', 'movie1.jpg', 'comedy','telugu',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive2', 'This is about movie2', 'movie2.jpg', 'comedy','english',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive3', 'This is about movie3', 'worth.jpeg', 'comedy','hindi',100);


INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive1', 'This is about movie1', 'movie1.jpg', 'comedy','telugu',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive2', 'This is about movie2', 'movie2.jpg', 'comedy','english',100);
INSERT INTO movies(name, description, image_name, type, language, amount) VALUES ('moive3', 'This is about movie3', 'worth.jpeg', 'comedy','hindi',100);






