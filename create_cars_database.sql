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













SELECT * 
FROM Brands AS B, Models M
WHERE B.id = M.brand_id



SELECT B.name, M.name, M.year, B.country
FROM Brands AS B, Models M
WHERE B.id = M.brand_id



SELECT B.name AS brand, M.name AS model, M.year, B.country
FROM Brands AS B, Models M
WHERE B.id = M.brand_id





/*
Получить все модели, который принадлежат производителям из Германии, 
сортировать по бренду.
*/
-- Способ 1
SELECT * 
FROM Models M, Brands B
WHERE M.brand_id = B.id AND B.country = 'Germany'
ORDER BY B.name



-- Способ 2
SELECT * 
FROM Models AS M
JOIN Brands AS B ON B.id = M.brand_id
WHERE B.country = 'Germany'
ORDER BY B.name





/*
Вывести бренды и количество моделей у каждого из них
*/
SELECT B.name AS brand, COUNT(M.id) AS count_of_models
FROM Brands AS B
JOIN Models AS M ON B.id = M.brand_id
GROUP BY B.id, B.name
ORDER BY B.name







/*
Показать все модели определённого бренда,
например Ferrari,
которые новее 2010 года
*/
---- Способ 1
SELECT B.name AS brand, M.name AS model, M.year, B.country 
FROM Brands AS B
JOIN Models AS M ON B.id = M.brand_id
WHERE B.name = 'Ferrari' AND M.year > 2010



---- Способ 2
SELECT B.name AS brand, M.name AS model, M.year, B.country 
FROM Brands AS B, Models AS M
WHERE B.id = M.brand_id AND B.name = 'Ferrari' AND M.year > 2010







/*
Вывести модели с полной инфой, у которых в названии модели есть буква 'e'
*/
---- Способ 1
SELECT *
FROM Brands AS B, Models AS M
WHERE B.id = M.brand_id AND M.name LIKE '%e%'


---- Способ 2
SELECT *
FROM Brands AS B
JOIN Models AS M ON B.id = M.brand_id
WHERE M.name LIKE '%e%'



/*
Вывести полную инфу про модели, которые выпускались между 2010 и 2020
*/
---- способ 1
SELECT *
FROM Brands AS B, Models AS M
WHERE B.id = M.brand_id AND M.year >= 2010 AND M.year <= 2020



---- способ 2
SELECT *
FROM Brands AS B, Models AS M
WHERE B.id = M.brand_id AND M.year BETWEEN 2010 AND 2020










-- Создание таблицы пользователей
CREATE TABLE Users (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	first_name NVARCHAR(50) NOT NULL,
	last_name NVARCHAR(50) NOT NULL,
	phone NVARCHAR(15) NOT NULL UNIQUE
)



-- создание сквозной таблиц для связи многие-ко-многим(many-to-many)
CREATE TABLE UsersModels (
	user_id INT NOT NULL,
	model_id INT NOT NULL,
	PRIMARY KEY(user_id, model_id),
	CONSTRAINT FK_UsersModels_Users FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
	CONSTRAINT FK_UsersModels_Models FOREIGN KEY (model_id) REFERENCES Models(id) ON DELETE CASCADE
)





--SELECT * FROM UsersModels







/*
Вывести все машины определённого человека
*/
---- способ 1
SELECT * 
FROM Models AS M, Users AS U, UsersModels AS UM
WHERE UM.model_id = M.id AND UM.user_id = U.id AND U.first_name = 'vasya'


---- способ 2
SELECT * 
FROM UsersModels AS UM
JOIN Users AS U ON UM.user_id = U.id
JOIN Models AS M ON UM.model_id = M.id
WHERE U.first_name = 'vasya'









