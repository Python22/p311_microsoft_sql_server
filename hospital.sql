






---- этап 1
---- сначала создаём
--CREATE DATABASE p311_hospital_lesson_2_prepod


---- этап 2
---- потом переключаемся на неё после создания
--USE p311_hospital_lesson_2_prepod



---- этап 3
------ потом делаем отдельные таблицы
------ таблица про врачей
--CREATE TABLE Doctors (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	first_name NVARCHAR(25) NOT NULL,
--	last_name NVARCHAR(25) NOT NULL,
--	salary INT NOT NULL,
--	phone VARCHAR(15) NOT NULL UNIQUE,
--	CONSTRAINT CHK_Doctors_salary_not_negative CHECK (salary >= 0)
--)


---- таблица про отделения
--CREATE TABLE Departments (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL UNIQUE
--)

---- таблица палат
--CREATE TABLE Wards (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	name NVARCHAR(25) NOT NULL,
--	department_id INT NOT NULL,
--	max_patients_count INT NOT NULL,
--	current_patients_count INT NOT NULL,
--	CONSTRAINT CHK_Wards_patients_count CHECK (current_patients_count <= max_patients_count),
--	CONSTRAINT FK_Wards_Departments FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE
--)

---- таблица обследований
--CREATE TABLE Examinations (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	type NVARCHAR(50) NOT NULL UNIQUE
--)

---- таблица диагнозов
--CREATE TABLE Diagnoses (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL UNIQUE
--)


---- 4 этап, связанные таблицы
------ таблица пациентов
--CREATE TABLE Patients (
--	id INT IDENTITY(1, 1) PRIMARY KEY,
--	first_name NVARCHAR(25) NOT NULL,
--	last_name NVARCHAR(25) NOT NULL,
--	medical_id INT,
--	ward_id INT,
--	CONSTRAINT FK_Patients_Wards FOREIGN KEY (ward_id) REFERENCES Wards(id) 
--)



---- 5 этап, связи many to many

--CREATE TABLE PatientsDiagnoses (
--	patient_id INT NOT NULL,
--	diagnosis_id INT NOT NULL,
--	PRIMARY KEY (patient_id, diagnosis_id),
--	CONSTRAINT FK_PatientsDiagnoses_Patients FOREIGN KEY (patient_id) REFERENCES Patients(id),
--	CONSTRAINT FK_PatientsDiagnoses_Diagnoses FOREIGN KEY (diagnosis_id) REFERENCES Diagnoses(id)
--)





---- связь врачей с отделениями
--CREATE TABLE DoctorsDepartments (
--	doctor_id INT NOT NULL,
--	department_id INT NOT NULL,
--	PRIMARY KEY(doctor_id, department_id),
--	CONSTRAINT FK_DoctorsDepartments_Doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(id),
--	CONSTRAINT FK_DoctorsDepartments_Departments FOREIGN KEY (department_id) REFERENCES Departments(id)
--)



---- связь вида обследований с пациентом и врачом
--CREATE TABLE PatientsExaminations (
--	patient_id INT NOT NULL,
--	examination_id INT NOT NULL,
--	doctor_id INT NOT NULL,
--	PRIMARY KEY(patient_id, examination_id),
--	CONSTRAINT FK_PatientsExaminations_Patients FOREIGN KEY (patient_id) REFERENCES Patients(id),
--	CONSTRAINT FK_PatientsExaminations_Examinations FOREIGN KEY (examination_id) REFERENCES Examinations(id),
--	CONSTRAINT FK_PatientsExaminations_Doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
--)







---- Этап 6, вставка данных.
--INSERT INTO Doctors 
--(first_name, last_name, salary, phone)
--VALUES
--('Vasya', 'Vasin', 100000, '8893457893'),
--('Petya', 'Petin', 200000, '567343564'),
--('Bob', 'Bobov', 150000, '4624654757'),
--('Anna', 'Annovna', 180000, '4562456456'),
--('John', 'Johnsonsdf', 120000, '4567167567'),
--('Lionell', 'Johnson', 400000, '864563523')



--INSERT INTO Departments 
--(name)
--VALUES
--(N'ЛОР'),
--(N'Психиатрия'),
--(N'Стоматология'),
--(N'Педиатрия'),
--(N'Хирургия'),
--(N'Онкология'),
--(N'Неврология')





--INSERT INTO Diagnoses 
--(name)
--VALUES
--(N'Ангина'),
--(N'Насморк'),
--(N'Грипп'),
--(N'Шизофрения'),
--(N'Рак'),
--(N'Кариес'),
--(N'Пульпит')




--INSERT INTO Examinations 
--(type)
--VALUES
--(N'Анализ крови'),
--(N'Первичный приём'),
--(N'Вторичный приём'),
--(N'Химиотерапия'),
--(N'Удаление зуба'),
--(N'Лечение кариеса'),
--(N'Восстановление зуба')




--INSERT INTO Wards 
--(name, department_id, max_patients_count, current_patients_count)
--VALUES
--('123', 1, 5, 0),
--('234', 1, 15, 0),
--('452', 2, 10, 0),
--('345', 2, 7, 0),
--('124', 2, 8, 0),
--('125', 3, 8, 0),
--('126', 4, 8, 0),
--('567', 5, 8, 0),
--('568', 5, 3, 0),
--('334', 6, 3, 0)




--INSERT INTO Patients 
--(first_name, last_name, medical_id, ward_id)
--VALUES
--('Lionell', 'Messi', 2344, 1),
--('Cristiano', 'Ronaldo', 3455, 1),
--('Killian', 'Mbappe', 23344, 1),
--('Neimar', 'Junior', 23344, 1),
--('Andrey', 'Arshavin', 22344, 2),
--('Egor', 'Titov', 23344, 2),
--('Andrea', 'Pirlo', 23244, 3),
--('Filippo', 'Indzaghi', 23444, 3),
--('Zinedin', 'Zidane', 23434, 4),
--('Karen', 'Benzema', 21344, 4)




--INSERT INTO DoctorsDepartments 
--(doctor_id, department_id)
--VALUES
--(1, 1),
--(2, 2),
--(3, 3),
--(4, 4),
--(1, 5),
--(1, 6),
--(1, 7),
--(2, 7),
--(2, 1)


--INSERT INTO PatientsDiagnoses 
--(patient_id, diagnosis_id)
--VALUES
--(1, 1),
--(2, 2),
--(3, 3),
--(4, 4),
--(1, 5),
--(1, 6),
--(1, 7),
--(2, 7),
--(2, 1)






--INSERT INTO PatientsExaminations 
--(patient_id, examination_id, doctor_id)
--VALUES
--(1, 1, 1),
--(2, 2, 2),
--(3, 3, 2),
--(4, 4, 2),
--(1, 5, 3),
--(1, 6, 3),
--(1, 7, 4),
--(2, 7, 1),
--(2, 1, 2)
