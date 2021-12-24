/*
Найти производителей, у которых больше всего моделей в таблице Product, а также тех, у которых меньше всего моделей. Вывод: maker, число моделей
*/

select maker, count(maker) from product group by maker  having count(maker) in (  
select max(D.cnt) from  ( select maker, count(maker) as cnt from product group by maker ) as D 
union 
select min(F.cnt) from ( select maker, count(maker) as cnt from product group by maker ) as F ) 

