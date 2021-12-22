/*
Определите среднее число орудий для классов линейных кораблей.Получить результат с точностью до 2-х десятичных знаков.
*/

select cast(avg(numguns * 1.0) as numeric(4,2)) as avg_numb_guns from classes where type='bb'