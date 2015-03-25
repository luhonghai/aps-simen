create database currency;

use currency;

CREATE TABLE IF NOT EXISTS `currency` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `rate` double  DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into `currency` (`name`, `code`, `rate`) values('Pound', 'GBP', 1);
insert into `currency` (`name`, `code`, `rate`) values('Euro', 'EUR', 1.36);
insert into `currency` (`name`, `code`, `rate`) values('Yen', 'JPY', 178.07);
insert into `currency` (`name`, `code`, `rate`) values('US Dollar', 'USD', 1.49);
insert into `currency` (`name`, `code`, `rate`) values('Chinese Yuan', 'CNY', 9.26);