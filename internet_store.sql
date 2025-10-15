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
