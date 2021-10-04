/*
For this challenge you need to create a SELECT statement that will contain data about departments that had a sale with a price over 98.00 dollars. 
This SELECT statement will have to use an EXISTS to achieve the task.

departments table schema
	id
	name

sales table schema
	id
	department_id (department foreign key)
	name
	price
	card_name
	card_number
	transaction_date

resultant table schema
	id
	name
*/



select d.id, d.name from departments as d where exists 
(select s.name from sales as s where s.department_id = d.id and s.price > 98.00);