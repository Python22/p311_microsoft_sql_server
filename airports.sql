---- 1
--CREATE DATABASE p311_airport_database_prep

---- 2
--USE p311_airport_database_prep



-- 3
--CREATE TABLE Passengers (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name NVARCHAR(50) NOT NULL,
--	last_name NVARCHAR(50) NOT NULL,
--	phone NVARCHAR(15) NOT NULL UNIQUE
--)

--CREATE TABLE Airports (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	full_name NVARCHAR(50) NOT NULL,
--	short_name NVARCHAR(3) NOT NULL,
--	city NVARCHAR(50) NOT NULL
--)

--CREATE TABLE DayOfWeeks (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(20) NOT NULL UNIQUE
--)

--CREATE TABLE Airplanes (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(20) NOT NULL UNIQUE,
--	max_passengers_capacity INT NOT NULL,
--	max_business_capacity INT NOT NULL,
--	CONSTRAINT CHK_Airplanes_max_passengers_capacity CHECK(max_passengers_capacity >= 0),
--	CONSTRAINT CHK_Airplanes_max_business_capacity CHECK(max_business_capacity <= max_passengers_capacity)
--)
--CREATE TABLE TicketsType (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(20) NOT NULL UNIQUE
--)


-- 4
--CREATE TABLE Shedule (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	departure_airport_id INT NOT NULL,
--	destination_airport_id INT NOT NULL,
--	departure_time TIME NOT NULL,
--	arrival_time TIME NOT NULL,
--	CONSTRAINT FK_Shedule_Airports_departure FOREIGN KEY (departure_airport_id) REFERENCES Airports(id),
--	CONSTRAINT FK_Shedule_Airports_destination FOREIGN KEY (destination_airport_id) REFERENCES Airports(id)
--)



-- 5
--CREATE TABLE SheduleDays (
--	shedule_id INT NOT NULL,
--	day_of_weeks_id INT NOT NULL,
--	PRIMARY KEY (day_of_weeks_id, shedule_id),
--	CONSTRAINT FK_SheduleDays_Shedule FOREIGN KEY (shedule_id) REFERENCES Shedule(id),
--	CONSTRAINT FK_SheduleDays_DayOfWeeks FOREIGN KEY (day_of_weeks_id) REFERENCES DayOfWeeks(id)
--)


-- 6
--CREATE TABLE Flights (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	shedule_id INT NOT NULL,
--	airplane_id INT NOT NULL,
--	CONSTRAINT FK_Flights_Shedule FOREIGN KEY (shedule_id) REFERENCES Shedule(id),
--	CONSTRAINT FK_Flights_Airplanes FOREIGN KEY (airplane_id) REFERENCES Airplanes(id)
--)



-- 7
--CREATE TABLE Tickets (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	passenger_id INT NOT NULL,
--	flight_id INT NOT NULL,
--	ticket_type INT NOT NULL,
--	CONSTRAINT FK_Tickets_Passengers FOREIGN KEY (passenger_id) REFERENCES Passengers(id),
--	CONSTRAINT FK_Tickets_Flights FOREIGN KEY (flight_id) REFERENCES Flights(id),
--	CONSTRAINT FK_Tickets_TicketsType FOREIGN KEY (ticket_type) REFERENCES TicketsType(id)
--)









INSERT INTO Airports 
(city, full_name, short_name)
VALUES
(N'Калининград', N'Храброво', N'KGD'),
(N'Москва', N'Домодедово', N'DMD'),
(N'Москва', N'Шереметьево', N'SVO'),
(N'Москва', N'Внуково', N'VKO'),
(N'Москва', N'Жуковский', N'ZIA'),
(N'Санкт-Петербург', N'ПУлково', N'LED'),
(N'Екатеринбург', N'Кольцово', N'SVX'),
(N'Сочи', N'Адлер', N'AER'),
(N'Уфа', N'Уфа', N'UFA'),
(N'Краснодар', N'	Пашковский', N'KRR')
