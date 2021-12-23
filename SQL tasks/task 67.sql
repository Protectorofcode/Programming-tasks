/*
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов. Замечания.  1) A - B и B - A считать РАЗНЫМИ маршрутами. 2) Использовать только таблицу Trip
*/


select count(town_from) as qty from (select town_from, town_to, count(trip_no) as trip_no from Trip group by town_from, town_to 
having count(trip_no) >= all(select count(trip_no) as trip_no from Trip group by town_from, town_to)) as query