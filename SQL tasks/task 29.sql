/*
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], 
написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
*/

select t1.point, t1.date, inc, out from income_0 t1 left join outcome_o t2 on t1.point = t2.point
and t1.date = t2.date
union
select t2.point, t2.date, inc, out from income_0 t1 right join outcome_o t2 on t1.point = t2.point
and t1.date = t2.date  