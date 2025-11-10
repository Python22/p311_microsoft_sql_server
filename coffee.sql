--CREATE DATABASE p311_cofeshop_prep
--GO
--USE p311_cofeshop_prep
--GO



CREATE TABLE TypesOfCoffee (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)
CREATE TABLE Countries (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Coffee (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	type_of_coffee_id INT NOT NULL,
	country_id INT NOT NULL,
	description NVARCHAR(250),
	prime_cost DECIMAL(15,2) NOT NULL,
	total_cost DECIMAL(15,2) NOT NULL,
	weight INT NOT NULL,
	CONSTRAINT CHK_Coffee_prime_cost CHECK (prime_cost >= 0),
	CONSTRAINT CHK_Coffee_total_cost CHECK (total_cost >= 0),
	CONSTRAINT FK_Coffee_TypesOfCoffee FOREIGN KEY (type_of_coffee_id) REFERENCES TypesOfCoffee(id),
	CONSTRAINT FK_Coffee_Countries FOREIGN KEY (country_id) REFERENCES Countries(id)
)


INSERT INTO TypesOfCoffee 
(name)
VALUES
(N'Арабика'),
(N'Робуста'),
(N'Купаж/Бленд')


INSERT INTO Countries 
(name)
VALUES
(N'Бразилия'),
(N'Вьетнам'),
(N'Колумбия'),
(N'Индонезия'),
(N'Эфиопия'),
(N'Гондурас'),
(N'Индия'),
(N'Уганда'),
(N'Гватемала'),
(N'Кения')



INSERT INTO Coffee
(name, type_of_coffee_id, country_id, prime_cost, total_cost, weight)
VALUES
(N'Nescafe arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Эфиопия'), 1000, 1200, 7234623),
(N'Jacobs arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Эфиопия'), 900, 1300, 56454),
(N'Barista arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Колумбия'), 1100, 1300, 567576),
(N'Jardin arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Колумбия'), 1200, 1250, 454566),
(N'LavaZZa arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Колумбия'), 1300, 1260, 45646),
(N'Tchibo arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Бразилия'), 1240, 1230, 545756),
(N'Pele arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Бразилия'), 1200, 1500, 565675),
(N'Swisso arabica', (SELECT id FROM TypesOfCoffee WHERE name = N'Арабика'), (SELECT id FROM Countries WHERE name = N'Бразилия'), 900, 1000, 456456),

(N'Nescafe robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Вьетнам'), 1000, 1200, 7234623),
(N'Jacobs robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Гватемала'), 900, 1300, 56454),
(N'Barista robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Индонезия'), 1100, 1300, 567576),
(N'Jardin robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Колумбия'), 1200, 1250, 454566),
(N'LavaZZa robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Кения'), 1300, 1260, 45646),
(N'Tchibo robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Бразилия'), 1240, 1230, 545756),
(N'Pele robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Бразилия'), 1200, 1500, 565675),
(N'Swisso robusta', (SELECT id FROM TypesOfCoffee WHERE name = N'Робуста'), (SELECT id FROM Countries WHERE name = N'Кения'), 900, 1000, 456456),

(N'Tchibo blend', (SELECT id FROM TypesOfCoffee WHERE name = N'Купаж/Бленд'), (SELECT id FROM Countries WHERE name = N'Вьетнам'), 1240, 1230, 545756),
(N'Pele blend', (SELECT id FROM TypesOfCoffee WHERE name = N'Купаж/Бленд'), (SELECT id FROM Countries WHERE name = N'Уганда'), 1200, 1500, 565675),
(N'Swisso blend', (SELECT id FROM TypesOfCoffee WHERE name = N'Купаж/Бленд'), (SELECT id FROM Countries WHERE name = N'Кения'), 900, 1000, 456456)
