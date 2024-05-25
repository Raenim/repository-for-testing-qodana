
DROP DATABASE IF EXISTS `book_store`;
CREATE DATABASE `book_store`;
USE `book_store`;

CREATE TABLE `authors` (
  `author_id` int primary key AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `books` (
  `book_id` int primary key AUTO_INCREMENT,
  `book_name` varchar(255) NOT NULL,
  `date_added` date,
  `publish_date` date,
  `ISBN` varchar(255) NOT NULL,
  `author_id`int NOT NULL,
  `file_name` varchar(255),
  FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int primary key AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `purchases` (
  `purchase_id` int primary key AUTO_INCREMENT,
  `purchase_date` datetime,
  `user_id`int NOT NULL,
  `book_id`int NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE VIEW `books_view` AS
SELECT book_id, book_name, date_added, publish_date, ISBN, author_name
FROM books b
INNER JOIN authors a ON a.author_id = b.author_id;

CREATE VIEW `purchases_view` AS
SELECT purchase_id, user_name, book_name, ISBN, purchase_date
FROM purchases p 
INNER JOIN books b on b.book_id = p.book_id
INNER JOIN users u on u.user_id = p.user_id
order by purchase_date;

CREATE VIEW `file_view` AS
SELECT book_name, file_name
FROM books;

CREATE VIEW `users_view` AS
SELECT user_name, user_password
FROM users;