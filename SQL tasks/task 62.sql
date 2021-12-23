/*
Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/01 для базы данных с отчетностью не чаще одного раза в день.
*/


select  ISNULL((select sum(inc) from income_o where date < '20010415'),0) - ISNULL((select sum(out) from outcome_o where date < '20010415'),0)  as remain