/*
Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.
*/

select classes.class, count(query_1.ship) as Sunks from classes left join (select ship, class from outcomes left join ships on ships.name = outcomes.ship  where result='sunk'
union
select ship, class from outcomes left join classes on classes.class = outcomes.ship where result='sunk'
) as query_1  on classes.class=query_1.class group by classes.class