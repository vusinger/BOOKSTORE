drop database if EXISTS Bookstoredb;
CREATE DATABASE `bookstoredb`;

USE `bookstoredb`;

CREATE TABLE `users` (
    `user_id` INT(11) NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(30) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `full_name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `user_id_UNIQUE` (`user_id`)
)  ENGINE=INNODB AUTO_INCREMENT=19 DEFAULT CHARSET=UTF8;

CREATE TABLE `category` (
    `category_id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`category_id`),
    UNIQUE KEY `category_id_UNIQUE` (`category_id`)
)  ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=UTF8;

CREATE TABLE `book` (
    `book_id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(128) NOT NULL,
    `author` VARCHAR(64) NOT NULL,
    `description` MEDIUMTEXT NOT NULL,
    `isbn` VARCHAR(15) NOT NULL,
    `image` BLOB NOT NULL,
    `price` FLOAT NOT NULL,
    `publish_date` DATE NOT NULL,
    `last_update_time` DATETIME NOT NULL,
    `category_id` INT(11) NOT NULL,
    PRIMARY KEY (`book_id`),
    UNIQUE KEY `book_id_UNIQUE` (`book_id`),
    UNIQUE KEY `title_UNIQUE` (`title`),
    KEY `category_fk_idx` (`category_id`),
    CONSTRAINT `category_fk` FOREIGN KEY (`category_id`)
        REFERENCES `category` (`category_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB AUTO_INCREMENT=32 DEFAULT CHARSET=UTF8;


CREATE TABLE `customer` (
    `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL,
    `fullname` VARCHAR(30) NOT NULL,
    `address` VARCHAR(128) NOT NULL,
    `city` VARCHAR(32) NOT NULL,
    `country` VARCHAR(64) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `zipcode` VARCHAR(24) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `register_date` DATETIME NOT NULL,
    PRIMARY KEY (`customer_id`),
    UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
    UNIQUE KEY `email_UNIQUE` (`email`)
)  ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=UTF8;


CREATE TABLE `review` (
    `review_id` INT(11) NOT NULL AUTO_INCREMENT,
    `book_id` INT(11) NOT NULL,
    `customer_id` INT(11) NOT NULL,
    `rating` INT(11) NOT NULL,
    `headline` VARCHAR(128) NOT NULL,
    `comment` VARCHAR(500) NOT NULL,
    `review_time` DATETIME NOT NULL,
    PRIMARY KEY (`review_id`),
    UNIQUE KEY `review_id_UNIQUE` (`review_id`),
    KEY `book_fk_idx` (`book_id`),
    KEY `customer_fk_idx` (`customer_id`),
    CONSTRAINT `book_fk` FOREIGN KEY (`book_id`)
        REFERENCES `book` (`book_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `customer_fk` FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`customer_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB AUTO_INCREMENT=15 DEFAULT CHARSET=UTF8;

CREATE TABLE `book_order` (
    `order_id` INT(11) NOT NULL AUTO_INCREMENT,
    `customer_id` INT(11) NOT NULL,
    `order_date` DATETIME NOT NULL,
    `shipping_address` VARCHAR(256) NOT NULL,
    `recipient_name` VARCHAR(30) NOT NULL,
    `recipient_phone` VARCHAR(15) NOT NULL,
    `payment_method` VARCHAR(20) NOT NULL,
    `total` FLOAT NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`order_id`),
    UNIQUE KEY `order_id_UNIQUE` (`order_id`),
    KEY `customer_fk_2_idx` (`customer_id`),
    CONSTRAINT `customer_fk_2` FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`customer_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=UTF8;

CREATE TABLE `order_detail` (
    `order_id` INT(11) DEFAULT NULL,
    `book_id` INT(11) DEFAULT NULL,
    `quantity` INT(11) NOT NULL,
    `subtotal` FLOAT NOT NULL,
    KEY `order_fk_idx` (`order_id`),
    KEY `book_fk_2_idx` (`book_id`),
    CONSTRAINT `book_fk_2` FOREIGN KEY (`book_id`)
        REFERENCES `book` (`book_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `order_fk` FOREIGN KEY (`order_id`)
        REFERENCES `book_order` (`order_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;
