-- создаём базу данных
CREATE DATABASE p_311_cars_db_code


-- переключаемся на указанную базу данных
USE p_311_cars_db_code


-- Создаём таблицу брендов
CREATE TABLE Brands(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(25) NOT NULL UNIQUE,
	country NVARCHAR(50) NOT NULL
)



-- Создаём таблицу моделей машин
CREATE TABLE Models(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	year INT NOT NULL,
	brand_id INT NOT NULL,
	CONSTRAINT FK_Models_Brands FOREIGN KEY (brand_id) REFERENCES Brands(id) ON DELETE CASCADE
)
