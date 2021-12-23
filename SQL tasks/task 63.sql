/*
Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.
*/

select name from Passenger where ID_psg in (select left([ol], CHARINDEX (' ', ol)) from (Select CAST(concat(ID_psg,' ', place) AS VARCHAR(30)) 
as ol, trip_no as o, ID_psg as psg from Pass_in_trip) as query group by ol having count(ol) > 1)