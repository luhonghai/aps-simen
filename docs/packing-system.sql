create database packing_system;
use packing_system;

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` int, -- 0 is staff, 1 is customer
  `first_name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL ,
  `password` VARCHAR(100) NOT NULL ,
  `gender` BIT DEFAULT 1,
  `dob` DATETIME,
  `phone` VARCHAR(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `air_port` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100),
  `location` varchar(200) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `car_park` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `air_port_id` BIGINT(20),
  `name` VARCHAR(200),
  `phone`VARCHAR(50),
  `capacity` int,
  `price` FLOAT
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `booking` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `car_park_id` BIGINT(20),
  `customer_id` BIGINT(20),
  `created_date` DATETIME,
  `arrival_date` DATETIME,
  `departure_date` DATETIME,
  `car_reg_no` VARCHAR(100),
  `car_brand` VARCHAR(200),
  `car_model` VARCHAR(200),
  `parking_type` int -- 0 = default, 1 = family, 2 = disabled
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

