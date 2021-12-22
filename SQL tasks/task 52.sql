/*
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн
*/



select distinct name from ships inner join classes on ships.class = classes.class where 
(country='japan' and (numGuns>=9 or numGuns is NULL) and (bore<19 or bore is NULL) and (displacement<=65000 or displacement is NULL) and type='bb')
