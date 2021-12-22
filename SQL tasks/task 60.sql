/*
Посчитать остаток денежных средств на начало дня 15/04/01 на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. 
Вывод: пункт, остаток. Замечание. Не учитывать пункты, информации о которых нет до указанной даты.
*/

select a.point,  case when o is null  then i else i-o end remain FROM 
(select point, sum(inc) as i from Income_o where date < '20010415' group by point) as A left join 
(select point, sum(out) as o from Outcome_o  where date < '20010415' group by point) as B on A.point=B.point
