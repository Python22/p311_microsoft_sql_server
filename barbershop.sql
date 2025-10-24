--CREATE DATABASE p311_barbershop_prep


--USE p311_barbershop_prep



--CREATE TABLE Vacancy (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(50) UNIQUE NOT NULL
--)

--CREATE TABLE Services (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(50) UNIQUE NOT NULL,
--	price INT NOT NULL,
--	CONSTRAINT CHK_Services_price CHECK (price >= 0)
--)


--CREATE TABLE Barbers (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name NVARCHAR(50) NOT NULL,
--	last_name NVARCHAR(50) NOT NULL,
--	patronymic NVARCHAR(50),
--	phone NVARCHAR(15) NOT NULL UNIQUE,
--	email NVARCHAR(255) UNIQUE,
--	birthday DATE,
--	start_working_date DATE,
--	vacancy_id INT NOT NULL,
--	CONSTRAINT FK_Barbers_Vacancy FOREIGN KEY (vacancy_id) REFERENCES Vacancy(id)
--)



--CREATE TABLE Clients (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name NVARCHAR(50) NOT NULL,
--	last_name NVARCHAR(50) NOT NULL,
--	patronymic NVARCHAR(50),
--	phone NVARCHAR(15) NOT NULL UNIQUE,
--	email NVARCHAR(255) UNIQUE
--)




--CREATE TABLE Reviews (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	mark INT NOT NULL,
--	review_text NVARCHAR(255),
--	CONSTRAINT CHK_Reviews_mark CHECK (mark >= 1 AND mark <= 5)
--)








--CREATE TABLE Meetings (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	barber_id INT NOT NULL,
--	client_id INT NOT NULL,
--	start_time TIME NOT NULL,
--	end_time TIME NOT NULL,
--	meeting_date DATE NOT NULL,
--	total_cost_on_meeting INT NOT NULL,
--	review_id INT,
--	CONSTRAINT CHK_Meetings_time CHECK (
--		start_time < end_time AND 
--		start_time >= '09:00:00.000' AND 
--		end_time <= '21:00:00.000'
--	),
--	CONSTRAINT CHK_Meetings_total_price CHECK (total_cost_on_meeting >= 0),
--	CONSTRAINT FK_Meetings_Barbers FOREIGN KEY (barber_id) REFERENCES Barbers(id),
--	CONSTRAINT FK_Meetings_Clients FOREIGN KEY (client_id) REFERENCES Clients(id),
--	CONSTRAINT FK_Meetings_Reviews FOREIGN KEY (review_id) REFERENCES Reviews(id)
--)




--CREATE TABLE MeetingsServices (
--	meeting_id INT NOT NULL,
--	service_id INT NOT NULL,
--	PRIMARY KEY(meeting_id, service_id),
--	CONSTRAINT FK_MeetingsServices_meeting_id FOREIGN KEY (meeting_id) REFERENCES Meetings(id),
--	CONSTRAINT FK_MeetingsServices_service_id FOREIGN KEY (service_id) REFERENCES Services(id)
--)








--INSERT INTO Vacancy 
--(name)
--VALUES
--(N'Чиф-барбер'),
--(N'Джуниор-барбер'),
--(N'Сениор-барбер')





--INSERT INTO Services 
--(name, price)
--VALUES
--(N'Стрижка мужская', 1500),
--(N'Стрижка детская', 1000),
--(N'Бритьё королевское', 1500),
--(N'Коррекция бороды', 1000),
--(N'Камуфляж седины', 1000),
--(N'Мытьё и укладка волос', 500),
--(N'Друг + Друг', 2500),
--(N'Папа + Сын', 2000),
--(N'Стрижка + Коррекция бороды', 2000)






--INSERT INTO Barbers 
--(first_name, 
--last_name, 
--patronymic, 
--phone, 
--email,
--birthday,
--start_working_date, 
--vacancy_id)
--VALUES
--(N'Вася',
--N'Васин',
--N'Васильевич', 
--N'8345345334', 
--N'vasya@mail.com',
--'2000-01-23',
--'2024-01-23',
--1),
--(N'Петя',
--N'Петин',
--N'Васильевич', 
--N'7823423445', 
--N'petya@mail.com',
--'2003-01-23',
--'2025-01-23',
--2),
--(N'Женя',
--N'Петин',
--N'Васильевич', 
--N'782345643445', 
--N'jen@mail.com',
--'2003-01-23',
--'2025-05-23',
--2),
--(N'Боб',
--N'Бобов',
--N'Васильевич', 
--N'78234456546445', 
--N'bob@mail.com',
--'1998-01-23',
--'2025-04-23',
--3)




--INSERT INTO Clients 
--(first_name, 
--last_name, 
--patronymic, 
--phone, 
--email)
--VALUES
--(N'Лионель',
--N'Месси',
--N'мессик', 
--N'123214234', 
--N'messi@mail.com'
--),
--(N'Криштиану',
--N'Роналду',
--N'Порт', 
--N'12454564234', 
--N'cry@mail.com'
--),
--(N'Киллиан',
--N'Мбаппе',
--N'фран', 
--N'32435434', 
--N'mbappe@mail.com'
--),
--(N'Андрей',
--N'Аршавин',
--N'ар', 
--N'8665614234', 
--N'arsh@mail.com'
--),
--(N'Зинедин',
--N'Зидан',
--N'зизу', 
--N'4453534546', 
--N'zizu@mail.com'
--)










--INSERT INTO Meetings 
--(barber_id,
--client_id,
--start_time,
--end_time,
--meeting_date,
--total_cost_on_meeting)
--VALUES
--(1,2, '15:00:00.000', '16:00:00.000', '2025-10-24', 0),
--(1,3, '16:00:00.000', '17:00:00.000', '2025-10-24', 0),
--(2,4, '17:00:00.000', '18:00:00.000', '2025-10-24', 0),
--(2,5, '18:00:00.000', '19:00:00.000', '2025-10-24', 0),
--(3,2, '19:00:00.000', '20:00:00.000', '2025-10-24', 0),
--(3,1, '12:00:00.000', '13:00:00.000', '2025-10-25', 0),
--(1,5, '13:00:00.000', '14:00:00.000', '2025-10-25', 0),
--(1,2, '14:00:00.000', '15:00:00.000', '2025-10-25', 0)





--select * FROM Services


--INSERT INTO MeetingsServices 
--(meeting_id, service_id)
--VALUES
--(2,1),
--(2,3),
--(3,2),
--(4,1),
--(4,5),
--(4,6),
--(5,7),
--(6,8),
--(7,9)













-- ЗАПРОСЫ

/*
1. Вернуть ФИО всех барберов салона
*/
--SELECT 
--first_name AS 'Имя',
--last_name AS 'Фамилия',
--patronymic AS 'Отчество',
--Vacancy.name AS 'Должность'
--FROM Barbers
--JOIN Vacancy ON Barbers.vacancy_id = Vacancy.id




/*
2. Вернуть информацию о всех синьор-барберах
*/
--SELECT 
--first_name AS 'Имя',
--last_name AS 'Фамилия',
--patronymic AS 'Отчество',
--Vacancy.name AS 'Должность'
--FROM Barbers
--JOIN Vacancy ON Barbers.vacancy_id = Vacancy.id
--WHERE Vacancy.name = N'Сениор-барбер'






/*
5. Вернуть информацию о всех барберах, 
которые работают свыше указанного количества лет. 
Количество лет передаётся в качестве параметра
*/
--DECLARE 
--@experience_years INT = 1

--SELECT * 
--FROM Barbers
--WHERE DATEDIFF(YEAR, start_working_date, GETDATE()) >= @experience_years






/*
6. Вернуть количество 
синьор-барберов и количество джуниор-барберов
*/ 
--SELECT COUNT(B.id) AS 'Кол-во джуниор и сениор барберов'
--FROM Barbers AS B
--JOIN Vacancy AS V ON B.vacancy_id = V.id
--WHERE V.name = N'Джуниор-барбер' OR V.name = N'Сениор-барбер'










/*
7. Вернуть информацию о постоянных клиентах. 
Критерий постоянного клиента: 
был в салоне заданное количество раз. 
Количество передаётся в качестве параметра
*/
--DECLARE 
--@number_of_visits INT = 2

--SELECT 
--COUNT(M.id) AS 'Количество посещений', 
--C.last_name + ' ' + C.first_name AS 'Клиент',
--C.id AS 'id клиента'
--FROM Meetings AS M
--JOIN Clients AS C ON M.client_id = C.id
--GROUP BY C.id, C.last_name, C.first_name
--HAVING COUNT(M.id) > 1

















/*
9. Запретить добавлять барберов младше 18 лет.
*/

--CREATE TRIGGER TRG_check_new_barber_age
--ON Barbers
--INSTEAD OF INSERT
--AS 
--BEGIN 
	
--	IF EXISTS (
--		SELECT 1 
--		FROM inserted
--		WHERE DATEDIFF(YEAR, birthday, GETDATE()) < 18 OR birthday is NULL
--	)
--	BEGIN
--		RAISERROR('Барбер должен быть от 18 лет.', 16, 1)
--		ROLLBACK TRAN
--		RETURN
--	END

--	IF EXISTS (SELECT * FROM inserted)
--	BEGIN 
--		INSERT INTO Barbers 
--		(id, first_name, last_name, patronymic, phone, email, birthday, start_working_date, vacancy_id)
--		SELECT id, first_name, last_name, patronymic, phone, email, birthday, start_working_date, vacancy_id 
--		FROM inserted	
--	END
--END





--INSERT INTO Barbers 
--(first_name, 
--last_name, 
--patronymic, 
--phone, 
--email,
--birthday,
--start_working_date, 
--vacancy_id)
--VALUES
--(N'Акак',
--N'Акакин',
--N'Васильевич', 
--N'4456456', 
--N'asdas@mail.com',
--'2015-01-23',
--'2025-01-23',
--1)











