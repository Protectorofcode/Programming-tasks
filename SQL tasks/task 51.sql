/*
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
*/


SELECT name
FROM (SELECT O.ship AS name, numGuns, displacement
FROM Outcomes O INNER JOIN
Classes C ON O.ship = C.class AND
O.ship NOT IN (SELECT name
FROM Ships
)
UNION
SELECT S.name AS name, numGuns, displacement
FROM Ships S INNER JOIN
Classes C ON S.class = C.class
) OS INNER JOIN
(SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Outcomes O INNER JOIN
Classes C ON O.ship = C.class AND
O.ship NOT IN (SELECT name
FROM Ships
)
GROUP BY displacement
UNION
SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Ships S INNER JOIN
Classes C ON S.class = C.class
GROUP BY displacement
) GD ON OS.numGuns = GD.MaxNumGuns AND
OS.displacement = GD.displacement


