-- Первый этап
--CREATE DATABASE p311_school_database

--USE p311_school_database


-- Второй этап
CREATE TABLE Cabinets (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(20) NOT NULL
)
CREATE TABLE DayOfWeeks (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(15) NOT NULL
)
CREATE TABLE LessonNumbers (
	id INT IDENTITY(1,1) PRIMARY KEY,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL
)
CREATE TABLE Disciplines (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL
)
CREATE TABLE Teachers (
	id INT IDENTITY(1,1) PRIMARY KEY,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	phone VARCHAR(15) NOT NULL UNIQUE
)



-- Третий этап
CREATE TABLE Classes (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	start_year INT NOT NULL,
	class_teacher_id INT,
	CONSTRAINT FK_Classes_Teachers FOREIGN KEY (class_teacher_id) REFERENCES Teachers(id)
)

CREATE TABLE Students (
	id INT IDENTITY(1,1) PRIMARY KEY,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	birthday DATE NOT NULL,
	class_id INT,
	CONSTRAINT FK_Students_Classes FOREIGN KEY (class_id) REFERENCES Classes(id)
)

CREATE TABLE Marks (
	id INT IDENTITY(1,1) PRIMARY KEY,
	discipline_id INT NOT NULL,
	teacher_id INT NOT NULL,
	student_id INT NOT NULL,
	mark INT NOT NULL,
	mark_date DATE NOT NULL,
	CONSTRAINT FK_Marks_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id),
	CONSTRAINT FK_Marks_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
	CONSTRAINT FK_Marks_Students FOREIGN KEY (student_id) REFERENCES Students(id),
	CONSTRAINT CHK_Marks_mark CHECK(mark >= 1 AND mark <= 5)
)



-- Четвёртый этап
CREATE TABLE TeacherDisciplines (
	teacher_id INT NOT NULL,
	discipline_id INT NOT NULL,
	PRIMARY KEY (teacher_id, discipline_id),
	CONSTRAINT FK_TeacherDisciplines_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
	CONSTRAINT FK_TeacherDisciplines_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id)
)

CREATE TABLE Shedule (
	id INT IDENTITY(1,1) PRIMARY KEY,
	class_id INT NOT NULL,
	discipline_id INT NOT NULL,
	teacher_id INT NOT NULL,
	cabinet_id INT NOT NULL,
	lesson_number_id INT NOT NULL,
	day_of_week_id INT NOT NULL,
	CONSTRAINT FK_Shedule_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
	CONSTRAINT FK_Shedule_Disciplines FOREIGN KEY (discipline_id) REFERENCES Disciplines(id),
	CONSTRAINT FK_Shedule_Cabinets FOREIGN KEY (cabinet_id) REFERENCES Cabinets(id),
	CONSTRAINT FK_Shedule_LessonNumbers FOREIGN KEY (lesson_number_id) REFERENCES LessonNumbers(id),
	CONSTRAINT FK_Shedule_DayOfWeeks FOREIGN KEY (day_of_week_id) REFERENCES DayOfWeeks(id)
)
