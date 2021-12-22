/*
Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.
*/


select class, count(class) as sunken from (select class, ship from classes inner join outcomes on classes.class = outcomes.ship where outcomes.result = 'sunk'
union
select class, ship from ships inner join outcomes on ships.name = outcomes.ship where outcomes.result = 'sunk') as query_1 where class in (select query_2.class from 
(select C.class, O.ship from classes as C join outcomes as O on C.class=O.ship 
union
select C.class, S.name from classes as C join ships as S on C.class=S.class) 
as query_2 group by query_2.class having count(query_2.class) >= 3) group by class