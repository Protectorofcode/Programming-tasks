/*
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
*/

select product.maker, avg(pc.hd) from pc inner join product on pc.model = product.model
and product.maker in (select distinct maker from product where product.type = 'printer')
group by maker