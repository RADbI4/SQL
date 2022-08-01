CREATE DATABASE managment;
USE managment; 

-- DDL на таблицу chiphers
DROP TABLE IF EXISTS chiphers;
CREATE TABLE chiphers (
	file_cipher VARCHAR(100) DEFAULT NULL,
	file_head_cipher ENUM(
	'715.', -- help_stuff
	'728.', -- sql_request
	'735.', -- functions
	'712.', -- constants
	'799.', -- docker_file
	'788.', -- script
	'745.', -- subscript
	'756.', -- requirments
	'775.'-- yml
	) NOT NULL,
	file_main_cipher VARCHAR(4) NOT NULL,
	file_body_cipher VARCHAR(4) NOT NULL,
	is_project BOOL DEFAULT FALSE,
	file_name VARCHAR(145) NOT NULL,
	project_name VARCHAR(145) NOT NULL,
	file_category ENUM(
	'help_stuff', 
	'sql_request', 
	'functions', 
	'constants', 
	'docker_file',
	'script',
	'subscript',
	'requirments.txt',
	'yml'
	) NOT NULL,
	file_type ENUM('py', 'sql', 'txt', 'md', 'csv', 'ipynb', 'png') NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
	);

-- DDL на триггер chiphers
DROP TRIGGER IF EXISTS tr_file_full_chipher;
CREATE TRIGGER tr_file_full_chipher BEFORE INSERT
ON chiphers
FOR EACH ROW
SET NEW.file_cipher =(SELECT CONCAT(NEW.file_head_cipher, NEW.file_main_cipher, '.', NEW.file_body_cipher));

-- Запрос на инсёрт нового шифра
INSERT INTO chiphers (file_head_cipher, file_main_cipher, file_body_cipher, is_project, file_name, project_name, file_category, file_type)
VALUES(
'715.', 
'0001', 
'0000',
TRUE, 
'Readme', 
'Test_project_pls ignore',
'help_stuff',
'txt');

--ЗАпрос на проверку вставки
SELECT * FROM chiphers;




