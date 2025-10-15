CREATE DATABASE InternetStore

USE InternetStore


CREATE TABLE Categories (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
)
CREATE TABLE Manufacturers (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	country NVARCHAR(50),
)


CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	price INT NOT NULL,
	description NVARCHAR(256),
	manufacturer_id INT,
	category_id INT NOT NULL,
	amount_on_store INT NOT NULL,
	sale_percent INT CONSTRAINT DF_Products_sale_percent DEFAULT 0,
	CONSTRAINT FK_Products_Manufacturers FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(id),
	CONSTRAINT FK_Products_Categories FOREIGN KEY (category_id) REFERENCES Categories(id),
	CONSTRAINT CHK_Products_price CHECK (price >= 0),
	CONSTRAINT CHK_Products_amount_on_store CHECK (amount_on_store >= 0 AND amount_on_store <= 100)
)




CREATE TABLE Users (
	id INT IDENTITY(1,1) PRIMARY KEY,
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	phone NVARCHAR(15) UNIQUE,
	email NVARCHAR(256) UNIQUE,
	password NVARCHAR(256)
)



CREATE TABLE UsersProducts (
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	product_count INT NOT NULL,
	CONSTRAINT FK_UsersProducts_Users FOREIGN KEY (user_id) REFERENCES Users(id),
	CONSTRAINT FK_UsersProducts_Products FOREIGN KEY (product_id) REFERENCES Products(id),
	CONSTRAINT CHK_UsersProducts_product_count CHECK (product_count > 0)
)





USE InternetStore


INSERT INTO Categories (name)
VALUES
(N'видеокарты'),
(N'процессоры'),
(N'мониторы'),
(N'SSD')


INSERT INTO Manufacturers (name, country)
VALUES
(N'Nvidea', N'США'),
(N'AMD', N'США'),
(N'INTEL', N'США'),
(N'Samsung', N'Южная Корея'),
(N'Philips', N'Нидерланды'),
(N'HP', N'США'),
(N'Kingston', N'США')


INSERT INTO Products (name, description, price, amount_on_store, manufacturer_id, category_id)
VALUES
('4090', '', 50000, 20, (SELECT id FROM Manufacturers WHERE name = N'Nvidea'), (SELECT id FROM Categories WHERE name = N'видеокарты')), 
('5080', '', 150000, 10, (SELECT id FROM Manufacturers WHERE name = N'Nvidea'), (SELECT id FROM Categories WHERE name = N'видеокарты')), 
('i9-14900', '', 50000, 50, (SELECT id FROM Manufacturers WHERE name = N'INTEL'), (SELECT id FROM Categories WHERE name = N'процессоры')), 
('i7-15600', '', 34000, 20, (SELECT id FROM Manufacturers WHERE name = N'INTEL'), (SELECT id FROM Categories WHERE name = N'процессоры')), 
('Odyssey Neo', '', 150000, 20, (SELECT id FROM Manufacturers WHERE name = N'Samsung'), (SELECT id FROM Categories WHERE name = N'мониторы')), 
('OMEN X', '', 250000, 20, (SELECT id FROM Manufacturers WHERE name = N'HP'), (SELECT id FROM Categories WHERE name = N'мониторы')), 
('9100 PRO', '', 50000, 20, (SELECT id FROM Manufacturers WHERE name = N'Samsung'), (SELECT id FROM Categories WHERE name = N'SSD')), 
('Fury', '', 50000, 20, (SELECT id FROM Manufacturers WHERE name = N'Kingston'), (SELECT id FROM Categories WHERE name = N'SSD'))




INSERT INTO USERS (first_name, last_name, phone, email, password)
VALUES
(N'Вася', N'Васин', '846513615', 'asdas@asd.com', '12321was'),
(N'Петя', N'Васин', '82342342', 'dfgdf@asd.com', '12321was'),
(N'Боб', N'Васин', '12334', 'fghgh@asd.com', '12321was'),
(N'Джон', N'Васин', '2343454456', 'dfr3@asd.com', '12321was'),
(N'Акакий', N'Васин', '4234235345', '3453er@asd.com', '12321was'),
(N'Лионель', N'Васин', '234534456', '345sdf@asd.com', '12321was'),
(N'Криштиану', N'Васин', '765353534', '3245345@asd.com', '12321was')





DECLARE 
@amount INT = 1,
@user INT = 6,
@product INT = 2;


INSERT INTO UsersProducts (user_id, product_id, product_count)
VALUES
(@user, @product, @amount)

UPDATE Products
SET amount_on_store = amount_on_store - @amount
WHERE id = @product 

SELECT * FROM UsersProducts





/*
Получить все товары
*/
SELECT * 
FROM Products


/*
Получить все товары, дороже 50 000
*/
SELECT * 
FROM Products
WHERE price > 50000

/*
Получить все товары из США
*/
SELECT P.name, M.name, P.price, P.description, P.amount_on_store, P.sale_percent, M.country 
FROM Products AS P
JOIN Manufacturers AS M ON P.manufacturer_id = M.id
WHERE M.country = N'США'


/*
Получить все товары определённой категории
*/
SELECT P.name, M.name, P.price, P.description, P.amount_on_store, P.sale_percent, M.country, C.name
FROM Products AS P
JOIN Manufacturers AS M ON P.manufacturer_id = M.id
JOIN Categories AS C ON P.category_id = C.id
WHERE C.name = N'видеокарты'




/*
Показать все товары, которые есть в корзине у конкретного пользователя.
*/
SELECT P.name, M.name AS manufacturer, P.price, P.description, P.amount_on_store, P.sale_percent, C.name AS category 
FROM UsersProducts AS UP
JOIN Users AS U ON UP.user_id = U.id
JOIN Products AS P ON UP.product_id = P.id
JOIN Categories AS C ON C.id = P.category_id
JOIN Manufacturers AS M ON M.id = P.manufacturer_id
WHERE U.id = 3







/*
Показать все товары, которые есть в корзине у конкретного пользователя.
*/
SELECT SUM(P.price)
FROM UsersProducts AS UP
JOIN Users AS U ON UP.user_id = U.id
JOIN Products AS P ON UP.product_id = P.id
JOIN Categories AS C ON C.id = P.category_id
JOIN Manufacturers AS M ON M.id = P.manufacturer_id
WHERE U.id = 3
