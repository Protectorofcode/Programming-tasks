/*
Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день 
*/


select income.point, income.date, 'inc' as operation, sum(income.inc) from income 
left join outcome on income.point=outcome.point and income.date = outcome.date where outcome.date is null  group by income.point, income.date
union 
select outcome.point, outcome.date, 'out' as operation, sum(outcome.out) from income 
right join outcome on income.point=outcome.point and income.date=outcome.date where income.date is null group by outcome.point, outcome.date
