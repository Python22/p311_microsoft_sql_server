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
