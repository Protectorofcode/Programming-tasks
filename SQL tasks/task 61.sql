/*
Посчитать остаток денежных средств на всех пунктах приема для базы данных с отчетностью не чаще одного раза в день.
*/


select ISNULL((select sum(inc) from income_o),0) - ISNULL((select sum(out) from outcome_o),0) as remain
