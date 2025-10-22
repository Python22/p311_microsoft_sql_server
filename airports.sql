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









--INSERT INTO Airports 
--(city, full_name, short_name)
--VALUES
--(N'Калининград', N'Храброво', N'KGD'),
--(N'Москва', N'Домодедово', N'DMD'),
--(N'Москва', N'Шереметьево', N'SVO'),
--(N'Москва', N'Внуково', N'VKO'),
--(N'Москва', N'Жуковский', N'ZIA'),
--(N'Санкт-Петербург', N'ПУлково', N'LED'),
--(N'Екатеринбург', N'Кольцово', N'SVX'),
--(N'Сочи', N'Адлер', N'AER'),
--(N'Уфа', N'Уфа', N'UFA'),
--(N'Краснодар', N'	Пашковский', N'KRR')



--INSERT INTO DayOfWeeks 
--(name)
--VALUES
--(N'Понедельник'),
--(N'Вторник'),
--(N'Среда'),
--(N'Четверг'),
--(N'Пятница'),
--(N'Суббота'),
--(N'Воскресенье')



--INSERT INTO Airplanes
--(name, max_passengers_capacity, max_business_capacity)
--VALUES
--('Airbus A330-300', 375, 50),
--('Airbus A220', 200, 20),
--('Boeing 777', 375, 50),
--('Boeing 747', 300, 50),
--('Boeing 787 Dreamline', 325, 50),
--(N'Ту-204', 200, 50),
--('Sukhoi Superjet 100', 150, 20),
--('Як-42', 100, 20),
--('Embraer E-Jet', 70, 20),
--(N'Ил-86', 200, 20)




--INSERT INTO TicketsType
--(name)
--VALUES
--(N'Эконом класс'),
--(N'Бизнес класс')







--INSERT INTO Shedule
--(departure_airport_id, 
--destination_airport_id, 
--departure_time,
--arrival_time)
--VALUES
--(
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--(SELECT id FROM Airports WHERE full_name = N'Домодедово'),
--'16:00:00.00000',
--'19:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--(SELECT id FROM Airports WHERE full_name = N'Шереметьево'),
--'17:00:00.00000',
--'20:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--(SELECT id FROM Airports WHERE full_name = N'Пулково'),
--'12:00:00.00000',
--'14:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--(SELECT id FROM Airports WHERE full_name = N'Пулково'),
--'21:00:00.00000',
--'23:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Шереметьево'),
--(SELECT id FROM Airports WHERE full_name = N'Пулково'),
--'16:00:00.00000',
--'17:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Пулково'),
--(SELECT id FROM Airports WHERE full_name = N'Шереметьево'),
--'16:00:00.00000',
--'17:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Домодедово'),
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--'14:00:00.00000',
--'17:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--(SELECT id FROM Airports WHERE full_name = N'Домодедово'),
--'18:00:00.00000',
--'21:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Домодедово'),
--(SELECT id FROM Airports WHERE full_name = N'Адлер'),
--'16:00:00.00000',
--'19:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Адлер'),
--(SELECT id FROM Airports WHERE full_name = N'Домодедово'),
--'16:00:00.00000',
--'19:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Шереметьево'),
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--'09:00:00.00000',
--'12:00:00.00000'
--),
--(
--(SELECT id FROM Airports WHERE full_name = N'Пулково'),
--(SELECT id FROM Airports WHERE full_name = N'Храброво'),
--'13:00:00.00000',
--'15:00:00.00000'
--)



--SELECT * FROM Airplanes


--INSERT INTO Flights
--(shedule_id, airplane_id)
--VALUES
--(1, (SELECT id FROM Airplanes WHERE name = N'Airbus A330-300')),
--(2, (SELECT id FROM Airplanes WHERE name = N'Airbus A330-300')),
--(3, (SELECT id FROM Airplanes WHERE name = N'Airbus A330-300')),
--(4, (SELECT id FROM Airplanes WHERE name = N'Boeing 747')),
--(5, (SELECT id FROM Airplanes WHERE name = N'Boeing 747')),
--(6, (SELECT id FROM Airplanes WHERE name = N'Boeing 777')),
--(7, (SELECT id FROM Airplanes WHERE name = N'Sukhoi Superjet 100')),
--(8, (SELECT id FROM Airplanes WHERE name = N'Sukhoi Superjet 100')),
--(9, (SELECT id FROM Airplanes WHERE name = N'Embraer E-Jet')),
--(10, (SELECT id FROM Airplanes WHERE name = N'Embraer E-Jet')),
--(11, (SELECT id FROM Airplanes WHERE name = N'Sukhoi Superjet 100')),
--(12, (SELECT id FROM Airplanes WHERE name = N'Sukhoi Superjet 100')),
--(13, (SELECT id FROM Airplanes WHERE name = N'Boeing 787 Dreamline'))







--INSERT INTO SheduleDays
--(shedule_id, day_of_weeks_id)
--VALUES
--(1, 1),
--(2, 2),
--(3, 5),
--(4, 6),
--(5, 7),
--(6, 6),
--(7, 3),
--(8, 5),
--(9, 2),
--(10, 6),
--(11, 1),
--(12, 2),
--(13, 3)











--INSERT INTO Passengers
--(first_name, last_name, phone)
--VALUES
--(N'Вася', N'Васин', '7827348927'),
--(N'Петя', N'Васин', '9823123'),
--(N'Боб', N'Васин', '6767867867'),
--(N'Джон', N'Васин', '23423423423'),
--(N'Вася', N'аыаыпр', '12312424'),
--(N'Вася', N'пвровпро', '234242345'),
--(N'Вася', N'пропвро', '45656746'),
--(N'Вася', N'епвчро', '65746475678'),
--(N'Вася', N'првпро', '3154264256'),
--(N'Вася', N'впро', '2456245624'),
--(N'Вася', N'вповп', '34556456'),
--(N'Вася', N'смисми', '1313434657'),
--(N'Вася', N'чясчясчя', '6783282858'),
--(N'Вася', N'фывфывф', '21252365467'),
--(N'Вася', N'чсмчси', '254627536856'),
--(N'Вася', N'итьтбть', '24562456426'),
--(N'Вася', N'апркен', '234256782244'),
--(N'Вася', N'йцуййй', '12212122332'),
--(N'Вася', N'щшзшзщшз', '78777878787')














/*
Вывести информацию про аэропорты
*/
--SELECT * 
--FROM Airports


/*
Вывести расписание всех аэропортов
*/
--SELECT 
--A.city AS 'Город отправления',
--A.full_name AS 'Аэропорт отправления',
--A.short_name AS 'ИКАО',
--(SELECT city FROM Airports WHERE id = S.destination_airport_id) AS 'Город прибытия',
--(SELECT full_name FROM Airports WHERE id = S.destination_airport_id) AS 'Аэропорт прибытия',
--(SELECT short_name FROM Airports WHERE id = S.destination_airport_id) AS 'ИКАО',
--S.departure_time AS 'Время вылета',
--S.arrival_time AS 'Время прилёта',
--DoW.name AS 'День вылета'
--FROM Shedule AS S
--JOIN Airports AS A ON S.departure_airport_id = A.id
--JOIN SheduleDays AS SD ON SD.shedule_id = S.id
--JOIN DayOfWeeks AS DoW ON SD.day_of_weeks_id = DoW.id
--ORDER BY (A.city)




--/*
-- вывести все рейсы в определенный город на произвольную дату, упорядочив их по времени вылета;
--*/
--SELECT 
--A.city AS 'Город отправления',
--A.full_name AS 'Аэропорт отправления',
--A.short_name AS 'ИКАО',
--(SELECT city FROM Airports WHERE id = S.destination_airport_id) AS 'Город прибытия',
--(SELECT full_name FROM Airports WHERE id = S.destination_airport_id) AS 'Аэропорт прибытия',
--(SELECT short_name FROM Airports WHERE id = S.destination_airport_id) AS 'ИКАО',
--S.departure_time AS 'Время вылета',
--S.arrival_time AS 'Время прилёта',
--DoW.name AS 'День вылета'
--FROM Shedule AS S
--JOIN Airports AS A ON S.departure_airport_id = A.id
--JOIN SheduleDays AS SD ON SD.shedule_id = S.id
--JOIN DayOfWeeks AS DoW ON SD.day_of_weeks_id = DoW.id
--WHERE S.destination_airport_id = (SELECT id FROM Airports WHERE full_name = N'Домодедово')
--ORDER BY (S.arrival_time)









/*
 вывести все рейсы из определённого города, упорядочив их по времени вылета;
*/
--SELECT 
--A.city AS 'Город отправления',
--A.full_name AS 'Аэропорт отправления',
--A.short_name AS 'ИКАО',
--(SELECT city FROM Airports WHERE id = S.destination_airport_id) AS 'Город прибытия',
--(SELECT full_name FROM Airports WHERE id = S.destination_airport_id) AS 'Аэропорт прибытия',
--(SELECT short_name FROM Airports WHERE id = S.destination_airport_id) AS 'ИКАО',
--S.departure_time AS 'Время вылета',
--S.arrival_time AS 'Время прилёта',
--DoW.name AS 'День вылета'
--FROM Shedule AS S
--JOIN Airports AS A ON S.departure_airport_id = A.id
--JOIN SheduleDays AS SD ON SD.shedule_id = S.id
--JOIN DayOfWeeks AS DoW ON SD.day_of_weeks_id = DoW.id
--WHERE S.departure_airport_id = (SELECT id FROM Airports WHERE full_name = N'Храброво')
--ORDER BY (S.departure_time)

