--Querries
------------------------------------------------------
-- Zeige alle vorhandenen Parameter, die in einem bestimmten Bereich vorkommen, 2)
--stranguss

select distinct p.name,pe.min,pe.aim, pe.max from PARAMETER p
inner join PARAMETER_EZV  pe on p.id = pe.Parameter_ID
inner join EZV ez on ez.id = pe.EZV_ID
inner join EZV_GRUPPE eg on EG.PID = p.id
where eg.eID = 2;

--zeige vorschrift für  eine Vorschrift t

-- 'Autoblech'
-- 'Stahlplatte'
select distinct p.name,pe.min,pe.aim, pe.max from PARAMETER p
inner join PARAMETER_EZV  pe on p.id = pe.Parameter_ID
inner join EZV ez on ez.id = pe.EZV_ID
inner join EZV_GRUPPE eg on EG.PID = p.id
where ez.name LIKE 'Autoblech';

select * from strang;
select * from Pfanne;
select * from Verteiler;
select * from Kokille;
select * from Charge;
select * from TIME_JUNCTION;
select * from TIME_TABLE;
select * from EZV_Gruppe;
select * from EZV;
select * from PARAMETER;
select * from Parameter_EZV;
select * from Text_PARAM;





