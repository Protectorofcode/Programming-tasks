/*
Найти производителей, которые выпускают только принтеры или только PC. При этом искомые производители PC должны выпускать не менее 3 моделей.
*/


select maker from ( select maker from product where type='printer'  except  
select maker from product where type='laptop' except select maker from product where type='pc' ) as T 
union 
select maker from ( select maker from product inner join pc on pc.model=product.model group by maker 
having count(maker)>=3 except select maker from product where type='laptop' except  
select maker from product where type='printer' ) as S
