/*
Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
*/




select a.point as point, (case when o is null then i else i-o end) as remain FROM  
(select point, sum(inc) as i from Income_o group by point) as A left join (select point, sum(out) as o from Outcome_o group by point) as B on A.point=B.point

select A.point, (COALESCE (si, 0) - COALESCE (so, 0) ) 
from (select point, sum(inc) as si from income_o as i group by point) as A full join (select point, sum(out) as so from outcome_o as o group by point) as B on A.point=B.point