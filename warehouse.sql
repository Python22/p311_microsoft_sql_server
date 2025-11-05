CREATE DATABASE p311_warehouse_prep

USE p311_warehouse_prep

CREATE TABLE Categories (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Countries (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Manufacturers (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	country_id INT NOT NULL,
	CONSTRAINT FK_Manufacturers_Countries FOREIGN KEY (country_id) REFERENCES Countries(id)
)


CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	price DECIMAL(15,2) NOT NULL,
	amount INT NOT NULL,
	manufacturer_id INT NOT NULL,
	CONSTRAINT FK_Products_Manufacturers FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(id),
	CONSTRAINT CHK_Products_price CHECK (price >= 0),
	CONSTRAINT CHK_Products_amount CHECK (amount >= 0)
)




CREATE TABLE ProductsCategories (
	product_id INT NOT NULL,
	category_id INT NOT NULL,
	PRIMARY KEY (product_id, category_id),
	CONSTRAINT FK_ProductsCategories_Products FOREIGN KEY (product_id) REFERENCES Products(id),
	CONSTRAINT FK_ProductsCategories_Categories FOREIGN KEY (category_id) REFERENCES Categories(id)
)






INSERT INTO Countries
(name)
VALUES
(N'Россия'),
(N'Китай'),
(N'США'),
(N'Япония'),
(N'Южная Корея')




INSERT INTO Categories
(name)
VALUES
(N'Видеокарты'),
(N'Еда'),
(N'Мониторы'),
(N'SSD'),
(N'Автомобили'),
(N'Процессоры')




INSERT INTO Manufacturers
(name, country_id)
VALUES
(N'NVidea', (SELECT id FROM Countries WHERE name = N'США')),
(N'AMD', (SELECT id FROM Countries WHERE name = N'США')),
(N'Intel', (SELECT id FROM Countries WHERE name = N'США')),
(N'Samsung', (SELECT id FROM Countries WHERE name = N'Южная Корея')),
(N'HP', (SELECT id FROM Countries WHERE name = N'США')),
(N'Nissan', (SELECT id FROM Countries WHERE name = N'Япония')),
(N'Lada', (SELECT id FROM Countries WHERE name = N'Россия')),
(N'ОАО Молоко', (SELECT id FROM Countries WHERE name = N'Россия')),
(N'Русский хлеб', (SELECT id FROM Countries WHERE name = N'Россия')),
(N'Балтагрос', (SELECT id FROM Countries WHERE name = N'Россия'))





INSERT INTO Products 
(name, price, amount, manufacturer_id)
VALUES 
(N'GeForce RTX 5070', 100000, 5, (SELECT id FROM Manufacturers WHERE name = N'NVidea')),
(N'GeForce RTX 5080', 130000, 10, (SELECT id FROM Manufacturers WHERE name = N'NVidea')),
(N' 9070 xt', 90000, 3, (SELECT id FROM Manufacturers WHERE name = N'AMD')),
(N'Core i9-10980', 35000, 25, (SELECT id FROM Manufacturers WHERE name = N'Intel')),
(N'Core i9-14900', 50000, 5, (SELECT id FROM Manufacturers WHERE name = N'Intel')),
(N'Ryzen 9 9950X3D', 100000, 5, (SELECT id FROM Manufacturers WHERE name = N'AMD')),
(N'9100 PRO', 80000, 5, (SELECT id FROM Manufacturers WHERE name = N'Samsung')),
(N'Odyssey Neo G9 G95NC S57CG952NI', 200000, 15, (SELECT id FROM Manufacturers WHERE name = N'Samsung')),
(N'OMEN X Emperium 65 w', 290000, 5, (SELECT id FROM Manufacturers WHERE name = N'HP')),
(N'Skyline R34', 10000000, 5, (SELECT id FROM Manufacturers WHERE name = N'Nissan')),
(N'Vesta', 1800000, 5, (SELECT id FROM Manufacturers WHERE name = N'Lada')),
(N'Granta', 1200000, 6, (SELECT id FROM Manufacturers WHERE name = N'Lada')),
(N'Kalina', 1000000, 15, (SELECT id FROM Manufacturers WHERE name = N'Lada')),
(N'Молоко 1Л', 80, 5, (SELECT id FROM Manufacturers WHERE name = N'ОАО Молоко')),
(N'Сырок', 60, 5, (SELECT id FROM Manufacturers WHERE name = N'ОАО Молоко')),
(N'Хлеб тостовый', 60, 55, (SELECT id FROM Manufacturers WHERE name = N'Русский хлеб')),
(N'Хлеб бородинский', 50, 35, (SELECT id FROM Manufacturers WHERE name = N'Русский хлеб')),
(N'Коппа', 200, 5, (SELECT id FROM Manufacturers WHERE name = N'Балтагрос'))











INSERT INTO ProductsCategories 
(product_id, category_id)
VALUES 
((SELECT id FROM Products WHERE name = N'GeForce RTX 5070'), (SELECT id FROM Categories WHERE name = N'Видеокарты')),
((SELECT id FROM Products WHERE name = N'GeForce RTX 5080'), (SELECT id FROM Categories WHERE name = N'Видеокарты')),
((SELECT id FROM Products WHERE name = N' 9070 xt'), (SELECT id FROM Categories WHERE name = N'Видеокарты')),
((SELECT id FROM Products WHERE name = N'Core i9-10980'), (SELECT id FROM Categories WHERE name = N'Процессоры')),
((SELECT id FROM Products WHERE name = N'Core i9-14900'), (SELECT id FROM Categories WHERE name = N'Процессоры')),
((SELECT id FROM Products WHERE name = N'Ryzen 9 9950X3D'), (SELECT id FROM Categories WHERE name = N'Процессоры')),
((SELECT id FROM Products WHERE name = N'9100 PRO'), (SELECT id FROM Categories WHERE name = N'SSD')),
((SELECT id FROM Products WHERE name = N'Odyssey Neo G9 G95NC S57CG952NI'), (SELECT id FROM Categories WHERE name = N'Мониторы')),
((SELECT id FROM Products WHERE name = N'OMEN X Emperium 65 w'), (SELECT id FROM Categories WHERE name = N'Процессоры')),
((SELECT id FROM Products WHERE name = N'Skyline R34'), (SELECT id FROM Categories WHERE name = N'Автомобили')),
((SELECT id FROM Products WHERE name = N'Vesta'), (SELECT id FROM Categories WHERE name = N'Автомобили')),
((SELECT id FROM Products WHERE name = N'Granta'), (SELECT id FROM Categories WHERE name = N'Автомобили')),
((SELECT id FROM Products WHERE name = N'Kalina'), (SELECT id FROM Categories WHERE name = N'Автомобили')),
((SELECT id FROM Products WHERE name = N'Молоко 1Л'), (SELECT id FROM Categories WHERE name = N'Еда')),
((SELECT id FROM Products WHERE name = N'Сырок'), (SELECT id FROM Categories WHERE name = N'Еда')),
((SELECT id FROM Products WHERE name = N'Хлеб тостовый'), (SELECT id FROM Categories WHERE name = N'Еда')),
((SELECT id FROM Products WHERE name = N'Хлеб бородинский'), (SELECT id FROM Categories WHERE name = N'Еда')),
((SELECT id FROM Products WHERE name = N'Коппа'), (SELECT id FROM Categories WHERE name = N'Еда'))

