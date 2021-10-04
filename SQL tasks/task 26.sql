/*
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
*/

select sum(s.price)/sum(s.kol) as avg_price from
(select price, 1 as kol from pc inner join product on pc.model = product.model where product.maker = 'A'
union all
select price, 1 as kol from laptop inner join product on laptop.model = product.model where product.maker = 'A') as s