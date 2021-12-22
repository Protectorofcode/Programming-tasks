/*
С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).
*/

select cast(avg(numguns*1.0) as numeric(4,2)) as avg_num_gun 
from (select name, type, numguns from Ships as s inner join Classes as c on S.class = c.class
union
select ship, type, numguns from Outcomes as o inner join Classes as c on o.ship = c.class) as query_1 
where type = 'bb'