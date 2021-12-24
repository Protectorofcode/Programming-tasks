/*
Найти производителей любой компьютерной техники, у которых нет моделей ПК, не представленных в таблице PC.
*/

select distinct maker from product  where maker not in ( select distinct maker from product where model in ( select model from product where type='pc' except select model from pc ))