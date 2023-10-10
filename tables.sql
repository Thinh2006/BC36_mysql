-- -------------------------------------------------------------
-- TablePlus 5.4.2(506)
--
-- https://tableplus.com/
--
-- Database: bt_mysql
-- Generation Time: 2023-10-10 15:27:44.5280
-- -------------------------------------------------------------


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
  `food_name` varchar(30) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `arr_sub_id` varchar(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(30) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(20) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(11, 'Pizza', 'pizza.jpg', 12.99, 'Delicious cheese pizza', 1),
(12, 'Burger', 'burger.jpg', 8.49, 'Juicy beef burger', 1),
(13, 'Salad', 'salad.jpg', 7.99, 'Fresh garden salad', 2),
(14, 'Sushi', 'sushi.jpg', 15.99, 'Assorted sushi rolls', 3),
(15, 'Pasta', 'pasta.jpg', 11.49, 'Spaghetti with marinara sauce', 1),
(16, 'Ice Cream', 'icecream.jpg', 4.99, 'Vanilla ice cream', 4),
(17, 'Steak', 'steak.jpg', 18.99, 'Grilled sirloin steak', 1),
(18, 'Soup', 'soup.jpg', 6.99, 'Chicken noodle soup', 2),
(19, 'Sandwich', 'sandwich.jpg', 5.49, 'Classic ham sandwich', 1),
(20, 'Fries', 'fries.jpg', 3.99, 'Crispy french fries', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Pizza'),
(2, 'Burger'),
(3, 'Salad'),
(4, 'Sushi'),
(5, 'Fast Food');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 5, '2023-01-23 14:11:53'),
(8, 1, '2022-12-30 17:31:19'),
(1, 1, '2023-10-02 14:20:10'),
(2, 3, '2023-09-29 16:45:35'),
(3, 5, '2023-09-26 11:55:20'),
(4, 2, '2023-09-23 13:30:45'),
(5, 4, '2023-09-21 09:40:15'),
(1, 6, '2023-09-19 20:15:30'),
(3, 5, '2023-01-23 14:11:53'),
(1, 6, '2023-09-19 20:15:30'),
(8, 1, '2022-12-30 17:31:19');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 11, 2, 'ORDER123', '1'),
(2, 13, 1, 'ORDER124', '3'),
(3, 15, 3, 'ORDER125', '5'),
(4, 12, 2, 'ORDER126', '2'),
(5, 14, 1, 'ORDER127', '4'),
(1, 16, 2, 'ORDER128', '6'),
(2, 17, 1, 'ORDER129', '7'),
(3, 18, 1, 'ORDER130', '8'),
(4, 19, 4, 'ORDER131', '9'),
(5, 20, 2, 'ORDER132', '10'),
(2, 13, 1, 'ORDER133', '11');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2023-10-01 12:30:45'),
(2, 2, 4, '2023-09-28 15:20:30'),
(3, 3, 5, '2023-09-25 18:45:22'),
(4, 4, 4, '2023-09-22 14:10:17'),
(5, 5, 3, '2023-09-20 11:55:55'),
(1, 6, 5, '2023-09-18 10:05:40'),
(2, 7, 4, '2023-09-15 17:30:12'),
(3, 8, 5, '2023-09-12 19:40:28');

INSERT INTO `restaurant` (`res_id`, `res_name`, `img`, `description`) VALUES
(1, 'Pizza Palace', 'pizza_palace.jpg', 'Best pizza in town!'),
(2, 'Burger Barn', 'burger_barn.jpg', 'Home of the juiciest burgers!'),
(3, 'Salad Spot', 'salad_spot.jpg', 'Fresh and healthy salads!'),
(4, 'Sushi Haven', 'sushi_haven.jpg', 'Exquisite sushi and sashimi!'),
(5, 'Fast Food Junction', 'fast_food_junction.jpg', 'Quick and tasty fast food!'),
(6, 'Ice Cream Parlor', 'ice_cream_parlor.jpg', 'Wide variety of ice cream flavors!'),
(7, 'Steakhouse', 'steakhouse.jpg', 'Premium steaks and grilled dishes!'),
(8, 'Soup Shack', 'soup_shack.jpg', 'Soul-warming soups and stews!');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(11, 'Cheese', 1.5, 11),
(12, 'Bacon', 2, 12),
(13, 'Grilled Chicken', 2.5, 12),
(14, 'Caesar', 1.99, 13),
(15, 'California Roll', 3.5, 14),
(16, 'Alfredo', 2.99, 15),
(17, 'Chocolate', 1.75, 16),
(18, 'Ribeye', 5.99, 17),
(19, 'Tomato', 0.75, 18),
(20, 'Curly', 1.25, 19);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 'password123'),
(2, 'Alice Smith', 'alice@example.com', 'securepass'),
(3, 'Bob Johnson', 'bob@example.com', 'letmein'),
(4, 'Eva Davis', 'eva@example.com', 'abc123'),
(5, 'Michael Wilson', 'michael@example.com', 'userpass'),
(6, 'Emily Brown', 'emily@example.com', 'mypassword'),
(7, 'Daniel Lee', 'daniel@example.com', 'changeme'),
(8, 'Olivia Harris', 'olivia@example.com', 'test123'),
(9, 'Sophia Clark', 'sophia@example.com', 'newpass'),
(10, 'William Young', 'william@example.com', 'pass123');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;