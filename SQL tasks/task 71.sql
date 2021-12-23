/*
Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
*/


select p.maker from product p where p.type='pc' group by p.maker having count(DISTINCT p.model) = (select count(DISTINCT pc.model) 
from pc where pc.model in (select DISTINCT pr.model from product pr where pr.maker=p.maker))
