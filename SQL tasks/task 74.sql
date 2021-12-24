/*
Вывести классы всех кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
Вывод: страна, класс
*/

select c.country, c.class from classes c where c.country like 
(case when  (select count(*) from classes c where c.country='Russia' group by c.country) is not null THEN ('Russia') else c.country end)



