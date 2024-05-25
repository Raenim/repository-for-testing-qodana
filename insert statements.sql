
INSERT INTO `book_store`.`authors` (`author_name`) ValUES
('testAuthor'), ('Rebecca Solnit'), ('Steven McCornack');

INSERT INTO `book_store`.`books` ( `book_name`, `date_added`, `publish_date`, `ISBN`, `author_id`, `file_name`) ValUES
('testbook', '2024-05-22', '2024-02-22', '123456789', 1, 'testfile.txt'), ('Call Them by Their True Names', '2024-05-24', '2018-09-04', '9781608469475', 2, 'Call Them by Their True Names - Rebecca Solnit.pdf'), 
( 'Reflect and Relate', '2024-05-24', '2000-09-01', '9781457697180', 3, 'Steven McCornack - Reflect and Relate_ An Introduction to Interpersonal Communication-Bedford_St. Martin\'s (2015).pdf');

INSERT INTO `book_store`.`users` (`user_name`, `user_password`) ValUES
('testuser', 'testpassword');

INSERT INTO `book_store`.`purchases` (`purchase_date`, `user_id`, `book_id`) ValUES
('2024-05-22 07:53:32', 1, 1);
