






-- этап 1
-- сначала создаём
CREATE DATABASE p311_hospital_lesson_2_prepod


-- этап 2
-- потом переключаемся на неё после создания
USE p311_hospital_lesson_2_prepod



-- этап 3
---- потом делаем отдельные таблицы
---- таблица про врачей
CREATE TABLE Doctors (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	salary INT NOT NULL,
	phone VARCHAR(15) NOT NULL UNIQUE,
	CONSTRAINT CHK_Doctors_salary_not_negative CHECK (salary >= 0)
)


-- таблица про отделения
CREATE TABLE Departments (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)

-- таблица палат
CREATE TABLE Wards (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(25) NOT NULL,
	department_id INT NOT NULL,
	max_patients_count INT NOT NULL,
	current_patients_count INT NOT NULL,
	CONSTRAINT CHK_Wards_patients_count CHECK (current_patients_count <= max_patients_count),
	CONSTRAINT FK_Wards_Departments FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE
)

-- таблица обследований
CREATE TABLE Examinations (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	type NVARCHAR(50) NOT NULL UNIQUE
)

-- таблица диагнозов
CREATE TABLE Diagnoses (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL UNIQUE
)


-- 4 этап, связанные таблицы
---- таблица пациентов
CREATE TABLE Patients (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	medical_id INT,
	ward_id INT,
	CONSTRAINT FK_Patients_Wards FOREIGN KEY (ward_id) REFERENCES Wards(id) 
)



-- 5 этап, связи many to many

CREATE TABLE PatientsDiagnoses (
	patient_id INT NOT NULL,
	diagnosis_id INT NOT NULL,
	PRIMARY KEY (patient_id, diagnosis_id),
	CONSTRAINT FK_PatientsDiagnoses_Patients FOREIGN KEY (patient_id) REFERENCES Patients(id),
	CONSTRAINT FK_PatientsDiagnoses_Diagnoses FOREIGN KEY (diagnosis_id) REFERENCES Diagnoses(id)
)









