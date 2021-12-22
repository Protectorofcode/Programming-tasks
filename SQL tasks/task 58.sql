/*
Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков найти процентное отношение числа 
моделей данного типа данного производителя к общему числу моделей этого производителя. 
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя
*/


select main_maker ,main_type ,CONVERT(NUMERIC(5,2),((sub_num*100.00)/(total_num*100.00)*100.00)) from 
(select count(p5.model) total_num ,p5.maker main_maker from product p5 group by p5.maker) p6 JOIN 
(select p3.maker sub_maker ,p3.type main_type ,count(p4.model) sub_num from (select p1.maker maker, p2.type type from product p1 cross join product p2 group by p1.maker, p2.type) p3 
left join product p4 on p3.maker = p4.maker and p3.type = p4.type group by  p3.maker,p3.type) p7 ON p7.sub_maker = p6.main_maker
