---- Первый этап
----CREATE DATABASE p311_school_database

----USE p311_school_database


---- Второй этап
--CREATE TABLE Cabinets (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(20) NOT NULL
--)
--CREATE TABLE DayOfWeeks (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(15) NOT NULL
--)
--CREATE TABLE LessonNumbers (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	start_time TIME NOT NULL,
--	end_time TIME NOT NULL
--)
--CREATE TABLE Disciplines (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL
--)
--CREATE TABLE Teachers (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name NVARCHAR(25) NOT NULL,
--	last_name NVARCHAR(25) NOT NULL,
--	phone VARCHAR(15) NOT NULL UNIQUE
--)



---- Третий этап
--CREATE TABLE Classes (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL,
--	start_year INT NOT NULL,
--	class_teacher_id INT,
--	CONSTRAINT FK_Classes_Teachers FOREIGN KEY (class_teacher_id) REFERENCES Teachers(id)
--)

--CREATE TABLE Students (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name NVARCHAR(25) NOT NULL,
--	last_name NVARCHAR(25) NOT NULL,
--	birthday DATE NOT NULL,
--	class_id INT,
--	CONSTRAINT FK_Students_Classes FOREIGN KEY (class_id) REFERENCES Classes(id)
--)

--CREATE TABLE Marks (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	discipline_id INT NOT NULL,
--	teacher_id INT NOT NULL,
--	student_id INT NOT NULL,
--	mark INT NOT NULL,
--	mark_date DATE NOT NULL,
--	CONSTRAINT FK_Marks_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id),
--	CONSTRAINT FK_Marks_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
--	CONSTRAINT FK_Marks_Students FOREIGN KEY (student_id) REFERENCES Students(id),
--	CONSTRAINT CHK_Marks_mark CHECK(mark >= 1 AND mark <= 5)
--)



---- Четвёртый этап
--CREATE TABLE TeacherDisciplines (
--	teacher_id INT NOT NULL,
--	discipline_id INT NOT NULL,
--	PRIMARY KEY (teacher_id, discipline_id),
--	CONSTRAINT FK_TeacherDisciplines_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
--	CONSTRAINT FK_TeacherDisciplines_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id)
--)

--CREATE TABLE Shedule (
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	class_id INT NOT NULL,
--	discipline_id INT NOT NULL,
--	teacher_id INT NOT NULL,
--	cabinet_id INT NOT NULL,
--	lesson_number_id INT NOT NULL,
--	day_of_week_id INT NOT NULL,
--	CONSTRAINT FK_Shedule_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
--	CONSTRAINT FK_Shedule_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id),
--	CONSTRAINT FK_Shedule_Cabinets FOREIGN KEY (cabinet_id) REFERENCES Cabinets(id),
--	CONSTRAINT FK_Shedule_LessonNumbers FOREIGN KEY (lesson_number_id) REFERENCES LessonNumbers(id),
--	CONSTRAINT FK_Shedule_DayOfWeeks FOREIGN KEY (day_of_week_id) REFERENCES DayOfWeeks(id)
--)













-- Вставка данных
--INSERT INTO Cabinets 
--(name)
--VALUES 
--('1'),
--('2'),
--('3'),
--('4'),
--('5'),
--('6'),
--('7'),
--('8'),
--('9'),
--('10'),
--('11'),
--('12'),
--('13'),
--('14'),
--('15'),
--('16'),
--('17'),
--('18'),
--('19'),
--('20'),
--(N'Спорт-зал'),
--(N'Актовый зал')






-- Вставка данных
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




--INSERT INTO LessonNumbers 
--(start_time, end_time)
--VALUES 
--('08:00:00.000', '08:40:00.000'),
--('08:50:00.000', '09:30:00.000'),
--('09:40:00.000', '10:20:00.000'),
--('10:40:00.000', '11:20:00.000'),
--('12:00:00.000', '12:40:00.000'),
--('12:50:00.000', '13:30:00.000'),
--('13:40:00.000', '14:20:00.000'),
--('14:30:00.000', '15:10:00.000'),
--('15:20:00.000', '16:00:00.000')




--INSERT INTO Disciplines 
--(name)
--VALUES 
--(N'Математика'),
--(N'Физика'),
--(N'Химия'),
--(N'География'),
--(N'История'),
--(N'Русский язык'),
--(N'Литература'),
--(N'Физкультура'),
--(N'Обществознание'),
--(N'Экономика'),
--(N'ИЗО'),
--(N'Биология'),
--(N'Английския язык'),
--(N'Информатика')






--INSERT INTO Teachers 
--(first_name, last_name, phone)
--VALUES
--(N'Вася', N'Эейнштейн', N'67287621872'),
--(N'Петя', N'Дарвин', N'2234345345'),
--(N'Вася', N'Колумб', N'56354245624'),
--(N'Вася', N'Менделеев', N'2546223435'),
--(N'Вася', N'Перельман', N'34567678'),
--(N'Вася', N'Пушкин', N'866344234'),
--(N'Вася', N'Гумилёв', N'45623424'),
--(N'Вася', N'Смит', N'32254566'),
--(N'Вася', N'Да Винчи', N'233445678'),
--(N'Вася', N'Дуров', N'2344567234'),
--(N'Вася', N'Роналду', N'567565345')




--INSERT INTO Classes 
--(name, start_year, class_teacher_id)
--VALUES
--(N'9-Б', 2016, (SELECT id FROM Teachers WHERE last_name = N'Эейнштейн')),
--(N'9-А', 2016, (SELECT id FROM Teachers WHERE last_name = N'Менделеев')),
--(N'8-Б', 2016, (SELECT id FROM Teachers WHERE last_name = N'Пушкин')),
--(N'8-А', 2016, (SELECT id FROM Teachers WHERE last_name = N'Смит')),
--(N'7-А', 2016, (SELECT id FROM Teachers WHERE last_name = N'Роналду')),
--(N'7-Б', 2016, (SELECT id FROM Teachers WHERE last_name = N'Дуров')),
--(N'7-В', 2016, (SELECT id FROM Teachers WHERE last_name = N'Колумб')),
--(N'6-Б', 2016, (SELECT id FROM Teachers WHERE last_name = N'Дарвин')),
--(N'6-А', 2016, (SELECT id FROM Teachers WHERE last_name = N'Да Винчи'))







--INSERT INTO Students 
--(first_name, last_name, birthday, class_id)
--VALUES
--(N'Петя', N'Петин', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'вапар', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'вфвапвафп', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-А')),
--(N'Петя', N'прповпр', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'провапроп', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'пвропро', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'провп', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'про', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'пропро', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'ваыуыцкцк', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'фывфыв', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'чясчсм', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'смимит', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'имтьить', '2010-10-18', (SELECT id FROM Classes WHERE name = N'8-Б')),
--(N'Петя', N'фывйцуц', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'вапфывап', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б')),
--(N'Петя', N'йцуцукуке', '2010-10-18', (SELECT id FROM Classes WHERE name = N'9-Б'))








--INSERT INTO TeacherDisciplines
--(teacher_id, discipline_id)
--VALUES
--((SELECT id FROM Teachers WHERE last_name = N'Пушкин'), (SELECT id FROM Disciplines WHERE name = N'Литература')),
--((SELECT id FROM Teachers WHERE last_name = N'Дарвин'), (SELECT id FROM Disciplines WHERE name = N'Биология')),
--((SELECT id FROM Teachers WHERE last_name = N'Колумб'), (SELECT id FROM Disciplines WHERE name = N'География')),
--((SELECT id FROM Teachers WHERE last_name = N'Менделеев'), (SELECT id FROM Disciplines WHERE name = N'Химия')),
--((SELECT id FROM Teachers WHERE last_name = N'Перельман'), (SELECT id FROM Disciplines WHERE name = N'Математика')),
--((SELECT id FROM Teachers WHERE last_name = N'Смит'), (SELECT id FROM Disciplines WHERE name = N'Экономика')),
--((SELECT id FROM Teachers WHERE last_name = N'Гумилёв'), (SELECT id FROM Disciplines WHERE name = N'История')),
--((SELECT id FROM Teachers WHERE last_name = N'Да Винчи'), (SELECT id FROM Disciplines WHERE name = N'ИЗО')),
--((SELECT id FROM Teachers WHERE last_name = N'Дуров'), (SELECT id FROM Disciplines WHERE name = N'Информатика')),
--((SELECT id FROM Teachers WHERE last_name = N'Роналду'), (SELECT id FROM Disciplines WHERE name = N'Физкультура')),
--((SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'), (SELECT id FROM Disciplines WHERE name = N'Физика')),
--((SELECT id FROM Teachers WHERE last_name = N'Пушкин'), (SELECT id FROM Disciplines WHERE name = N'Русский язык')),
--((SELECT id FROM Teachers WHERE last_name = N'Смит'), (SELECT id FROM Disciplines WHERE name = N'Английския язык'))














--INSERT INTO Shedule 
--(
--discipline_id,
--teacher_id,
--cabinet_id,
--class_id,
--lesson_number_id,
--day_of_week_id
--)
--VALUES
--(
--(SELECT id FROM Disciplines WHERE name = N'Математика'),
--(SELECT id FROM Teachers WHERE last_name = N'Перельман'),
--(SELECT id FROM Cabinets WHERE name = N'2'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 1),
--(SELECT id FROM DayOfWeeks WHERE id = 1)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Математика'),
--(SELECT id FROM Teachers WHERE last_name = N'Перельман'),
--(SELECT id FROM Cabinets WHERE name = N'8'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 2),
--(SELECT id FROM DayOfWeeks WHERE id = 1)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Химия'),
--(SELECT id FROM Teachers WHERE last_name = N'Менделеев'),
--(SELECT id FROM Cabinets WHERE name = N'9'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 3),
--(SELECT id FROM DayOfWeeks WHERE id = 1)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Экономика'),
--(SELECT id FROM Teachers WHERE last_name = N'Смит'),
--(SELECT id FROM Cabinets WHERE name = N'2'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 4),
--(SELECT id FROM DayOfWeeks WHERE id = 1)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физкультура'),
--(SELECT id FROM Teachers WHERE last_name = N'Роналду'),
--(SELECT id FROM Cabinets WHERE name = N'Спорт-зал'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 5),
--(SELECT id FROM DayOfWeeks WHERE id = 1)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Химия'),
--(SELECT id FROM Teachers WHERE last_name = N'Перельман'),
--(SELECT id FROM Cabinets WHERE name = N'12'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 1),
--(SELECT id FROM DayOfWeeks WHERE id = 2)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--(SELECT id FROM Cabinets WHERE name = N'15'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 2),
--(SELECT id FROM DayOfWeeks WHERE id = 2)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Математика'),
--(SELECT id FROM Teachers WHERE last_name = N'Менделеев'),
--(SELECT id FROM Cabinets WHERE name = N'9'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 3),
--(SELECT id FROM DayOfWeeks WHERE id = 2)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Экономика'),
--(SELECT id FROM Teachers WHERE last_name = N'Смит'),
--(SELECT id FROM Cabinets WHERE name = N'2'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 4),
--(SELECT id FROM DayOfWeeks WHERE id = 2)
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физкультура'),
--(SELECT id FROM Teachers WHERE last_name = N'Роналду'),
--(SELECT id FROM Cabinets WHERE name = N'Спорт-зал'),
--(SELECT id FROM Classes WHERE name = N'9-Б'),
--(SELECT id FROM LessonNumbers WHERE id = 5),
--(SELECT id FROM DayOfWeeks WHERE id = 2)
--)















/*
Вывести всех учеников 9-Б в алфавитном порядке
*/
--SELECT *
--FROM Students AS S
--JOIN Classes AS C ON S.class_id = C.id 
--WHERE C.name = N'9-Б'
--ORDER BY (last_name)



/*
Посчитать сколько всего учеников в школе
*/
--SELECT COUNT(id) AS result
--FROM Students






/*
Все учителя школы и их классы(даже если их нет, это будет указано)
*/
--SELECT *
--FROM Teachers AS T
--LEFT JOIN Classes AS C ON C.class_teacher_id = T.id



/*
Учителя, которые не приписаны как классный руководитель к какому-либо классу.
*/
--SELECT *
--FROM Teachers AS T
--LEFT JOIN Classes AS C ON C.class_teacher_id = T.id
--WHERE C.id is NULL







/*
Вывести всё расписание для определённого класса
*/
--SELECT 
--DOW.name AS 'День недели', 
--LN.id AS 'Номер урока',
--Di.name AS 'Урок', 
--Cl.name AS 'Класс', 
--Ca.name AS 'Кабинет', 
--LN.start_time AS 'Начало урока', 
--LN.end_time AS 'Конец урока', 
--Te.last_name + ' ' + Te.first_name AS 'Учитель'
--FROM Shedule AS Sh
--JOIN Classes AS Cl ON Sh.class_id = Cl.id
--JOIN Cabinets AS Ca ON Sh.cabinet_id = Ca.id
--JOIN Disciplines AS Di ON Sh.discipline_id = Di.id
--JOIN Teachers AS Te ON Sh.teacher_id = Te.id
--JOIN LessonNumbers AS LN ON Sh.lesson_number_id = LN.id
--JOIN DayOfWeeks AS DOW ON Sh.day_of_week_id = DOW.id
--WHERE Cl.name = N'9-Б'









-- Вставка данных про оценки
-- вставка через переменные
--DECLARE 
--@discipline_name NVARCHAR = N'Физика',
--@teacher_last_name NVARCHAR = N'Эейнштейн',	
--@student_id INT = 6,
--@mark INT = 3,
--@date DATE = '2025-10-20'

--INSERT INTO Marks 
--(
--discipline_id,
--teacher_id,
--student_id,
--mark,
--mark_date
--)
--VALUES
--(
--(SELECT id FROM Disciplines WHERE name = @discipline_name),
--(SELECT id FROM Teachers WHERE last_name = @teacher_last_name),
--@student_id,
--@mark,
--@date
--)



-- множественная вставка оценок
--INSERT INTO Marks 
--(
--discipline_id,
--teacher_id,
--student_id,
--mark,
--mark_date
--)
--VALUES
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--6,
--3,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--3,
--5,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--8,
--5,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--9,
--3,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--2,
--4,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--1,
--2,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--9,
--5,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Физика'),
--(SELECT id FROM Teachers WHERE last_name = N'Эейнштейн'),
--10,
--5,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--5,
--3,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--1,
--4,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--7,
--5,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--10,
--5,
--'2025-10-20'
--),(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--10,
--2,
--'2025-10-20'
--),
--(
--(SELECT id FROM Disciplines WHERE name = N'Биология'),
--(SELECT id FROM Teachers WHERE last_name = N'Дарвин'),
--12,
--2,
--'2025-10-20'
--)









/*
Показать все оценки которые есть у всех
*/
--SELECT 
--M.mark_date AS 'дата',
--M.mark AS 'оценка',
--D.name AS 'дисциплина',
--S.last_name + ' ' + S.first_name AS 'ученик',
--C.name AS 'класс',
--T.last_name + ' ' + T.first_name AS 'учитель'

--FROM Marks AS M
--JOIN Students AS S ON M.student_id = S.id
--JOIN Disciplines AS D ON M.discipline_id = D.id
--JOIN Teachers AS T ON M.teacher_id = T.id
--JOIN Classes AS C ON S.class_id = C.id






/*
Показать все оценки определённого студента
*/
--SELECT 
--M.mark_date AS 'дата',
--M.mark AS 'оценка',
--D.name AS 'дисциплина',
--S.last_name + ' ' + S.first_name AS 'ученик',
--C.name AS 'класс',
--T.last_name + ' ' + T.first_name AS 'учитель'
--FROM Marks AS M
--JOIN Students AS S ON M.student_id = S.id
--JOIN Disciplines AS D ON M.discipline_id = D.id
--JOIN Teachers AS T ON M.teacher_id = T.id
--JOIN Classes AS C ON S.class_id = C.id
--WHERE S.id = 5










/*
Посчитать среднюю арифметическую оценку по каждому модулю
*/
--SELECT 
--D.id, D.name, AVG(CAST(M.mark AS FLOAT))
--FROM Marks AS M
--FULL JOIN Disciplines AS D ON M.discipline_id = D.id
--GROUP BY D.id, D.name





/*
Получить среднюю оценку по всем модулям у каждого студента
*/
--SELECT 
--S.id, S.last_name, AVG(CAST(M.mark AS FLOAT))
--FROM Marks AS M
--JOIN Disciplines AS D ON M.discipline_id = D.id
--JOIN Students AS S ON M.student_id = S.id
--GROUP BY S.id, S.last_name





/*
Посчитать сколько всего учеников в школе
*/
--SELECT COUNT(id) AS result
--FROM Students

/*
Посчитать сколько учеников в каждом классе
*/
--SELECT C.id, C.name, COUNT(S.id) AS 'Кол-во сучеников в классе'
--FROM Students AS S
--JOIN Classes AS C ON S.class_id = C.id
--GROUP BY C.id, C.name








/*
Вывести расписание для учителя
*/
--SELECT 
--DoW.name AS 'День недели',
--LN.id AS 'Номер урока',
--LN.start_time AS 'Начало урока',
--LN.end_time AS 'Конец урока',
--D.name AS 'Дисциплина',
--CA.name AS 'Кабинет',
--CL.name AS 'Класс'
--FROM Shedule AS SH
--JOIN Cabinets AS CA ON SH.cabinet_id = CA.id
--JOIN DayOfWeeks AS DoW ON SH.day_of_week_id = DoW.id
--JOIN LessonNumbers AS LN ON SH.lesson_number_id = LN.id
--JOIN Disciplines AS D ON SH.discipline_id = D.id
--JOIN Teachers AS T ON SH.teacher_id = T.id
--JOIN Classes AS CL ON SH.class_id = CL.id
--WHERE T.last_name = N'Перельман'
--ORDER BY Dow.id, LN.id












--/*
--Найти кабинеты, которые свободны или заняты в выбранный день и выбранное время
--*/
--DECLARE @day INT = 1,
--@lesson_number INT = 4
--/*
--Найти кабинеты, которые ЗАНЯТЫ в выбранный день и выбранное время
--*/
--SELECT cabinet_id FROM Shedule WHERE day_of_week_id = @day AND lesson_number_id = @lesson_number


--/*
--Найти кабинеты, которые СВОБОДНЫ в выбранный день и выбранное время
--*/
--SELECT * 
--FROM Cabinets AS C
--WHERE C.id NOT IN (SELECT cabinet_id FROM Shedule WHERE day_of_week_id = @day AND lesson_number_id = @lesson_number)










/*
Студенты без оценок
*/
--SELECT 
--S.last_name + ' ' + S.first_name AS 'Ученик',
--C.name AS 'Класс'
--FROM Marks AS M
--RIGHT JOIN Students AS S ON M.student_id = S.id
--JOIN Classes AS C ON S.class_id = C.id
--WHERE M.id IS NULL

