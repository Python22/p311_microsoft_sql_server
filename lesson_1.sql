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


