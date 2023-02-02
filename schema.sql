-- schema.sql
DROP DATABASE
IF
	EXISTS myweb;
DROP USER
IF
	EXISTS 'www-data' @'localhost';
CREATE DATABASE myweb;
USE myweb;
CREATE USER 'www-data' @'localhost' IDENTIFIED BY 'www-data';
ALTER USER 'www-data' @'localhost' IDENTIFIED WITH mysql_native_password BY 'www-data';
GRANT SELECT
	,
	INSERT,
	UPDATE,
	DELETE ON myweb.* TO 'www-data' @'localhost';
CREATE TABLE users (
	`id` VARCHAR ( 50 ) NOT NULL,
	`email` VARCHAR ( 50 ) NOT NULL,
	`passwd` VARCHAR ( 50 ) NOT NULL,
	`admin` bool NOT NULL,
	`name` VARCHAR ( 50 ) NOT NULL,
	`image` VARCHAR ( 500 ) NOT NULL,
	`created_at` REAL NOT NULL,
	UNIQUE KEY `idx_email` ( `email` ),
	KEY `idx_created_at` ( `created_at` ),
	PRIMARY KEY ( `id` )
) ENGINE = INNODB DEFAULT charset = utf8;
CREATE TABLE blogs (
	`id` VARCHAR ( 50 ) NOT NULL,
	`user_id` VARCHAR ( 50 ) NOT NULL,
	`user_name` VARCHAR ( 50 ) NOT NULL,
	`user_image` VARCHAR ( 500 ) NOT NULL,
	`name` VARCHAR ( 50 ) NOT NULL,
	`summary` VARCHAR ( 200 ) NOT NULL,
	`content` MEDIUMTEXT NOT NULL,
	`created_at` REAL NOT NULL,
	KEY `idx_created_at` ( `created_at` ),
	PRIMARY KEY ( `id` )
) ENGINE = INNODB DEFAULT charset = utf8;
CREATE TABLE comments (
	`id` VARCHAR ( 50 ) NOT NULL,
	`blog_id` VARCHAR ( 50 ) NOT NULL,
	`user_id` VARCHAR ( 50 ) NOT NULL,
	`user_name` VARCHAR ( 50 ) NOT NULL,
	`user_image` VARCHAR ( 500 ) NOT NULL,
	`content` MEDIUMTEXT NOT NULL,
	`created_at` REAL NOT NULL,
	KEY `idx_created_at` ( `created_at` ),
PRIMARY KEY ( `id` )
) ENGINE = INNODB DEFAULT charset = utf8;