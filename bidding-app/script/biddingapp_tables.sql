CREATE DATABASE IF NOT EXISTS `biddingapp` ;

USE `biddingapp`;


CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `user_item` (
  `user_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `seller_data` (
  `seller_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `user_item_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`seller_data_id`),
  KEY `username_fk_idx` (`username`),
  KEY `item_fk_idx` (`user_item_id`),
  CONSTRAINT `item_fk` FOREIGN KEY (`user_item_id`) REFERENCES `user_item` (`user_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    
CREATE TABLE IF NOT EXISTS `buyer_data` (
  `buyer_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `user_item_id` int(11) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`buyer_data_id`),
  KEY `username_fk_idx` (`username`),
  KEY `item_fk_idx` (`user_item_id`),
  CONSTRAINT `user_buy_fk` FOREIGN KEY (`user_item_id`) REFERENCES `user_item` (`user_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username_buyer_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_roles` (
 `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(45) NOT NULL,
 `role` varchar(45) NOT NULL,
 PRIMARY KEY (`user_role_id`),
 UNIQUE KEY `uni_username_role` (`role`,`username`),
 KEY `fk_username_idx` (`username`),
 CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

