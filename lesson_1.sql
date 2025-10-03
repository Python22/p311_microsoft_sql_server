-- комментарий CTRL + K потом CTRL + C
-- раскомментировать  CTRL + K потом CTRL + U

-- взять все данные из таблицы Departments
--SELECT [id]
--      ,[building]
--      ,[financing]
--      ,[name]
--FROM Departments

-- вариант 2
--SELECT * FROM Departments



-- если надо получить данные только с указанных столбцов
-- SELECT name, financing FROM Departments


-- все записи из таблицы Doctors
--SELECT * FROM Doctors


-- показать полное имя(склеенное) и ставку
--SELECT last_name + ' ' + first_name AS full_name, salary FROM Doctors



-- показать 3 столбца. Полное имя, ставка, ставка с + 20% премии
--SELECT 
--	last_name + ' ' + first_name AS full_name, 
--	salary,
--	salary * 1.2 AS salary_with_premy
--FROM Doctors


-- получить названия болезней и степени тяжести
--SELECT name, severity FROM Diseases



-- получить степени тяжести без повторов
--SELECT DISTINCT severity FROM Diseases




---- получить все болезни со степенью тяжести 1
--SELECT name, severity 
--FROM Diseases
--WHERE severity = 1




---- получить все болезни со степенью тяжести больше 1
--SELECT name, severity 
--FROM Diseases
--WHERE severity > 1


---- получить все болезни со степенью тяжести не равняется 1
--SELECT name, severity 
--FROM Diseases
--WHERE severity != 1




-- получить все данные про докторов, у которых ставка больше 100 000
--SELECT * 
--FROM Doctors
--WHERE salary > 100000




-- получить все данные про врачей, у которых длина имени больше 5
--SELECT * 
--FROM Doctors
--WHERE LEN(first_name) > 5



---- получить все данные про врачей, у которых длина имени и фамилии больше 5
--SELECT * 
--FROM Doctors
--WHERE LEN(first_name) > 5 AND LEN(last_name) > 5



-- получить все данные про врачей, у которых длина имени или фамилии больше 5
--SELECT * 
--FROM Doctors
--WHERE (LEN(first_name) > 5) OR (LEN(last_name) > 5)



---- получить все данные врачей, отсортировать по фамилии в порядке возрастания
--SELECT * 
--FROM Doctors
--ORDER BY last_name




-- получить все данные врачей, отсортировать по фамилии в порядке убывания
-- SELECT * 
-- FROM Doctors
-- ORDER BY last_name DESC




-- находится ли имя среди указанных
--SELECT first_name, last_name, phone, salary
--FROM Doctors
--WHERE first_name IN ('Вася', 'Петя', 'Лионель')




--SELECT first_name, last_name, phone, salary
--FROM Doctors
--WHERE salary > 100000.0 AND salary < 200000.0




---- Получить болезни, у которых степень тяжести от 1 до 3 включительно
--SELECT * 
--FROM Diseases
--WHERE severity <= 3 AND severity >= 1





---- Получить болезни, у которых степень тяжести от 1 до 3 включительно
--SELECT * 
--FROM Diseases
--WHERE severity BETWEEN 1 AND 3





---- Получить болезни, у которых степень тяжести иная, чем от 1 до 3 
--SELECT * 
--FROM Diseases
--WHERE severity NOT BETWEEN 1 AND 3




---- вернуть всех врачей, у которых телефон начинается с цифры от 3 до 8
--SELECT *
--FROM Doctors
--WHERE phone BETWEEN '3' AND '8'





---- вернуть всех врачей, у которых имя начинается с буквы в диапазоне от А до О
--SELECT *
--FROM Doctors
--WHERE first_name BETWEEN N'А' AND N'О'






---- вернуть всех врачей, у которых имя заканчивается на букву я
--SELECT *
--FROM Doctors
--WHERE first_name LIKE N'%я'

---- вернуть всех врачей, у которых имя заканчивается НЕ на букву я
--SELECT *
--FROM Doctors
--WHERE first_name NOT LIKE N'%я'


---- вернуть всех врачей, у которых имя начинается на букву К
--SELECT *
--FROM Doctors
--WHERE first_name LIKE N'К%'




---- вернуть всех врачей, у которых имя начинается на букву, указанную в диапазоне [КМЙЦУЛ]
--SELECT *
--FROM Doctors
--WHERE first_name LIKE N'[КМЙЦУЛ]%'




---- вернуть всех врачей, у которых имя начинается НЕ на букву, указанную в диапазоне [КМЙЦУЛ]
--SELECT *
--FROM Doctors
--WHERE first_name LIKE N'[^КМЙЦУЛ]%'











-- ОПЕРАЦИИ ВСТАВКИ			INSERT
-- Вставить в таблицу врачей в указанные столбцы новые строки
--INSERT INTO Doctors(first_name, last_name, phone, salary)
--VALUES (N'Боб', N'Бобов', '82378293', '150000')


--SELECT * FROM Doctors



-- вставка в таблицу сразу нескольких записей
--INSERT INTO Doctors(first_name, last_name, phone, salary)
--VALUES 
--(N'Анна', N'Анновна', '34535656', '150000'),
--(N'Акакий', N'Бобов', '56456346', '1050000')




-- ОБНОВЛЕНИЕ ДАННЫХ	UPDATE
-- обязательно ставьте фильтр/уточнение
-- без фильтра изменения затронут сразу все записи

--SELECT * FROM Doctors


-- Обновить данные в таблице врачей, установить ставку в 500 000, 
-- тому, у кого id = 2
--UPDATE Doctors
--SET salary = 500000
--WHERE id = 2





-- Удаление записей		DELETE
-- обязательно ставьте фильтр/уточнение
-- без фильтра изменения затронут сразу все записи


-- Удалить записи из таблицы врачей, у которых id = 6
--DELETE FROM Doctors
--WHERE id = 6





-- ПРАКТИКА 1
/*
1. Вывести содержимое таблицы палат.
*/
--SELECT building, floor, name 
--FROM Wards


/*
2. Вывести фамилии и телефоны всех врачей.
*/
--SELECT last_name, phone
--FROM Doctors


/*
3. Вывести все этажи без повторений, на которых располагаются палаты.
*/
--SELECT DISTINCT floor 
--FROM Wards





/*
4. Вывести названия заболеваний под именем “Name of Disease”
и степень их тяжести под именем “Severity of Disease”
*/
--SELECT name AS 'Name of Disease', severity AS 'Severity of Disease'
--FROM Diseases



/*
6. Вывести названия отделений, расположенных в корпусе
5 и имеющих фонд финансирования менее 30000.
*/
--SELECT name
--FROM Departments
--WHERE building = 5 AND financing < 30000


/*
7. Вывести названия отделений, расположенных в 3-м корпусе
с фондом финансирования в диапазоне от 12000 до 15000.
*/
-- Вариант 1
--SELECT name
--FROM Departments
--WHERE building = 3 AND financing BETWEEN 12000 AND 15000

---- Вариант 2
--SELECT name
--FROM Departments
--WHERE building = 3 AND financing >= 12000 AND financing <= 15000





/*
8. Вывести названия палат, расположенных в корпусах 4 и 5
на 1-м этаже.
*/
--SELECT name
--FROM Wards
--WHERE building IN (4, 5) AND floor = 1


/*
9. Вывести названия, корпуса и фонды финансирования отделений, 
расположенных в корпусах 3 или 6 и имеющих
фонд финансирования меньше 1 100 000 или больше 2500000.
*/
--SELECT name, building, financing
--FROM Departments
--WHERE building IN (3, 6) AND (financing < 1100000 OR financing > 2500000)



/*
10. Вывести фамилии врачей, чья зарплата (сумма ставки
и надбавки) превышает 150000.
*/
--SELECT last_name
--FROM Doctors
--WHERE salary > 150000



/*
12. Вывести названия обследований без повторений, 
проводимых в первые три дня недели, 
которые начинались в диапазоне от 12:00 до 15:00.
*/
--SELECT * 
--FROM Examinations
--WHERE day_of_week <= 3 AND start_time >= '12:00' AND start_time <= '15:00'




/*
13. Вывести названия и номера корпусов отделений, 
расположенных в корпусах 1, 3, 8 или 10.
*/
--SELECT [name], [building] 
--FROM Departments
--WHERE building IN (1, 3, 8, 10)




/*
14. Вывести названия заболеваний всех степеней тяжести,
кроме 1-й и 2-й.
*/
---- вариант 1
--SELECT * 
--FROM Diseases
--WHERE severity NOT IN (1, 2)

---- вариант 2
--SELECT * 
--FROM Diseases
--WHERE severity != 1 AND severity != 2

---- вариант 3
--SELECT * 
--FROM Diseases
--WHERE severity > 2




/*
15. Вывести названия отделений, которые не располагаются
в 1-м или 3-м корпусе.
*/
--SELECT name
--FROM Departments
--WHERE building != 1 AND building != 3



/*
16. Вывести названия отделений, которые располагаются в 1-м
или 3-м корпусе.
*/
--SELECT name
--FROM Departments
--WHERE building = 1 OR building = 3




/*
17. Вывести фамилии врачей, начинающиеся на букву “П”.
*/
--SELECT last_name
--FROM Doctors
--WHERE last_name LIKE N'П%'









