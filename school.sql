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
--('Математика'),
--('Физика'),
--('Химия'),
--('География'),
--('История'),
--('Русский язык'),
--('Литература'),
--('Физкультура'),
--('Обществознание'),
--('Экономика'),
--('ИЗО'),
--('Биология'),
--('Английския язык'),
--('Информатика')






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









