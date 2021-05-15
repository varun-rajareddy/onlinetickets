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
select * from users;

CREATE TABLE `movies` (
  `id` INT NOT NULL auto_increment UNIQUE,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45),
  `genre` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `image_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('moive1', 'This is about movie1', 'movie1.jpg', 'comedy','telugu',100);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('moive2', 'This is about movie2', 'movie2.jpg', 'action','english',100);
INSERT INTO movies(name, description, image_name, genre, language, amount) VALUES ('moive3', 'This is about movie3', 'movie3.jpg', 'horror','hindi',100);


-- -----------------------------------------------------
-- Table `mydb`.`theaters`
-- -----------------------------------------------------
CREATE TABLE `theaters` (
  `theater_id` INT NOT NULL auto_increment UNIQUE,
  `Name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`theater_id`)
);
