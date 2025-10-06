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






INSERT INTO Brands
VALUES
('Lada', 'Russia'),
('BMW', 'Germany'),
('Opel', 'Germany'),
('Audi', 'Germany'),
('Mercedes', 'Germany'),
('Porshe', 'Germany'),
('Ferrari', 'Italy'),
('Lamborghini', 'Italy'),
('Ford', 'USA'),
('Dodge', 'USA')





INSERT INTO Models
VALUES
('Vesta', 2020, 1),
('Granta', 2019, 1),
('Niva', 2015, 1),
('M3', 2005, 2),
('M5', 2010, 2),
('X5', 2012, 2),
('X7', 2020, 2),
('Astra', 2008, 3),
('A-100', 2000, 4),
('A-80', 1995, 4),
('R8', 2009, 4),
('S-class', 2020, 5),
('E-class', 2021, 5),
('911', 2000, 6),
('Carrera', 2012, 6),
('Maranello', 2005, 7),
('550', 2010, 7),
('Enzo', 2012, 7),
('F-40', 1990, 7),
('Gallardo', 2005, 8),
('Murcielago', 2008, 8),
('Diablo', 1985, 8),
('Aventador', 2020, 8),
('Focus', 2015, 9),
('GT', 2010, 9),
('Viper', 2013, 10),
('Charger', 1975, 10)

