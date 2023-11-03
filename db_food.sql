/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_restaurant` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `dis_like` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_restaurant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_restaurant_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `food_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_restaurant` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `rate_comment` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_restaurant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_restaurant_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `face_app_id` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Food 1', 'food_image_1.jpg', 10.99, 'Description for Food 1', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Food 2', 'food_image_2.jpg', 8.99, 'Description for Food 2', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Food 3', 'food_image_3.jpg', 12.99, 'Description for Food 3', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Food 4', 'food_image_4.jpg', 9.99, 'Description for Food 4', 4),
(5, 'Food 5', 'food_image_5.jpg', 15.99, 'Description for Food 5', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Type 1');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Type 2');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Type 3');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Type 4'),
(5, 'Type 5');

INSERT INTO `like_restaurant` (`like_id`, `date_create`, `dis_like`, `user_id`, `res_id`) VALUES
(1, '2023-11-03 10:00:00', 0, 1, 1);
INSERT INTO `like_restaurant` (`like_id`, `date_create`, `dis_like`, `user_id`, `res_id`) VALUES
(2, '2023-11-03 11:00:00', 1, 2, 1);
INSERT INTO `like_restaurant` (`like_id`, `date_create`, `dis_like`, `user_id`, `res_id`) VALUES
(3, '2023-11-03 12:00:00', 0, 3, 2);
INSERT INTO `like_restaurant` (`like_id`, `date_create`, `dis_like`, `user_id`, `res_id`) VALUES
(4, '2023-11-03 13:00:00', 0, 4, 2),
(5, '2023-11-03 14:00:00', 1, 5, 3);

INSERT INTO `orders` (`order_id`, `food_id`, `user_id`) VALUES
(1, 1, 1);
INSERT INTO `orders` (`order_id`, `food_id`, `user_id`) VALUES
(2, 1, 1);
INSERT INTO `orders` (`order_id`, `food_id`, `user_id`) VALUES
(3, 1, 1);
INSERT INTO `orders` (`order_id`, `food_id`, `user_id`) VALUES
(4, 1, 1),
(5, 3, 2),
(6, 4, 2);

INSERT INTO `rate_restaurant` (`rate_id`, `rate_comment`, `user_id`, `res_id`) VALUES
(1, 'Comment 1', 1, 1);
INSERT INTO `rate_restaurant` (`rate_id`, `rate_comment`, `user_id`, `res_id`) VALUES
(2, 'Comment 2', 2, 1);
INSERT INTO `rate_restaurant` (`rate_id`, `rate_comment`, `user_id`, `res_id`) VALUES
(3, 'Comment 3', 1, 2);
INSERT INTO `rate_restaurant` (`rate_id`, `rate_comment`, `user_id`, `res_id`) VALUES
(4, 'Comment 4', 3, 2),
(5, 'Comment 5', 2, 3),
(6, 'Comment 6', 4, 3),
(7, 'Comment 7', 2, 1),
(8, 'Comment 8', 3, 2),
(9, 'Comment 9', 4, 2),
(10, 'Comment 10', 5, 3),
(11, 'Comment 11', 1, 1),
(12, 'Comment 12', 2, 3),
(13, 'Comment 13', 3, 1),
(14, 'Comment 14', 4, 1),
(15, 'Comment 15', 5, 2),
(16, 'COMMENT ABC', 1, 1),
(17, 'COMMENT bdf', 1, 1);

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant A', 'image_a.jpg', 'Description A');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Restaurant B', 'image_b.jpg', 'Description B');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Restaurant C', 'image_c.jpg', 'Description C');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Restaurant D', 'image_d.jpg', 'Description D'),
(5, 'Restaurant E', 'image_e.jpg', 'Description E');

INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`) VALUES
(1, 'John Doe', 'john@example.com', 'avatar1.jpg', 'hashed_pass1', 'face123', 'user');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`) VALUES
(2, 'Jane Smith', 'jane@example.com', 'avatar2.jpg', 'hashed_pass2', 'face456', 'user');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`) VALUES
(3, 'Admin User', 'admin@example.com', 'admin_avatar.jpg', 'hashed_pass3', 'face789', 'admin');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`) VALUES
(4, 'Alice Johnson', 'alice@example.com', 'avatar3.jpg', 'hashed_pass4', 'face987', 'user'),
(5, 'Bob Brown', 'bob@example.com', 'avatar4.jpg', 'hashed_pass5', 'face654', 'user');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;