






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
















/*
1. Вывести полные имена врачей и их отделения.
*/
--SELECT Doc.last_name, Doc.first_name, Dep.name
--FROM DoctorsDepartments AS DD
--JOIN Doctors AS Doc ON Doc.id = DD.doctor_id
--JOIN Departments Dep ON Dep.id = DD.department_id
--ORDER BY (Doc.last_name)


/*
3. Вывести названия палат, которые находятся в отделении
“Стоматология”.
*/
-- способ 1
--SELECT W.name 
--FROM Wards AS W
--JOIN Departments AS D ON W.department_id = D.id
--WHERE D.name = N'Стоматология'


-- способ 2, с помощью вложенного запроса

--SELECT name
--FROM Wards
--WHERE department_id = (
--	SELECT id FROM Departments
--	WHERE name = N'Стоматология'
--)









/*
Вывести палаты, отделения, и их пациентов
*/

--SELECT P.last_name, P.first_name, P.medical_id, W.name AS ward, D.name AS department
--FROM Patients AS P
--JOIN Wards AS W ON P.ward_id = W.id
--JOIN Departments AS D ON D.id = W.department_id




/*
Вывести палату и отделение где лежит определённый пациент
*/
--SELECT P.last_name, P.first_name, P.medical_id, W.name AS ward, D.name AS department
--FROM Patients AS P
--JOIN Wards AS W ON P.ward_id = W.id
--JOIN Departments AS D ON D.id = W.department_id
--WHERE P.last_name = 'Messi' AND P.first_name = 'Lionell'




/*
Вывести все процедуры(обследования), с полной информацией которые есть в больнице
*/
--SELECT E.type, P.last_name + ' ' + P.first_name AS patient, D.last_name + ' ' + D.first_name AS doctor, W.name AS ward
--FROM PatientsExaminations AS PE
--JOIN Examinations AS E ON PE.examination_id = E.id
--JOIN Doctors AS D ON PE.doctor_id = D.id 
--JOIN Patients AS P ON PE.patient_id = P.id
--JOIN Wards AS W ON P.ward_id = W.id



/*
Вывести все процедуры(обследования), которые есть у определённого пациента
*/
--SELECT E.type, P.last_name + ' ' + P.first_name AS patient, D.last_name + ' ' + D.first_name AS doctor, W.name AS ward
--FROM PatientsExaminations AS PE
--JOIN Examinations AS E ON PE.examination_id = E.id
--JOIN Doctors AS D ON PE.doctor_id = D.id 
--JOIN Patients AS P ON PE.patient_id = P.id
--JOIN Wards AS W ON P.ward_id = W.id
--WHERE P.last_name = 'Messi'








/*
7. Вывести названия палат и корпуса отделений, в которых
проводит обследования определённый врач
*/
--SELECT W.name AS ward, Dep.name AS department, Doc.last_name + ' ' + Doc.first_name AS doctor
--FROM PatientsExaminations AS PE
--JOIN Doctors AS Doc ON Doc.id = PE.doctor_id
--JOIN DoctorsDepartments AS DD ON Doc.id = DD.doctor_id
--JOIN Departments AS Dep ON Dep.id = DD.department_id
--JOIN Wards AS W ON W.department_id = Dep.id
--WHERE Doc.last_name = 'Vasin'




/*
8. Вывести названия отделений и врачей, 
у которых ставка больше 150000.
*/
--SELECT Doc.last_name, Doc.first_name, Dep.name, Doc.salary
--FROM DoctorsDepartments AS DD
--JOIN Doctors AS Doc ON Doc.id = DD.doctor_id
--JOIN Departments AS Dep ON Dep.id = DD.department_id
--WHERE Doc.salary > 150000





/*
Вывести диагнозы определённого пациента
*/
--SELECT P.last_name + ' ' + P.first_name AS patient, D.name AS diagnosis 
--FROM PatientsDiagnoses AS PD
--JOIN Patients AS P ON P.id = PD.patient_id
--JOIN Diagnoses AS D ON D.id = PD.diagnosis_id
--WHERE P.last_name = 'Ronaldo'





-- показать сколько диагнозов у определённого пациента
--SELECT COUNT(P.id)
--FROM PatientsDiagnoses AS PD
--JOIN Patients AS P ON P.id = PD.patient_id
--JOIN Diagnoses AS D ON D.id = PD.diagnosis_id
--WHERE P.last_name = 'Ronaldo'
--GROUP BY (P.id)
