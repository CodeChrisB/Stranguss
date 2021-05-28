--Alle EZV_Gruppen
select * from EZV_GRUPPE;
--Alle EZV Junction
select * from ezv_junction;
--alle chargen ids die zur gruppen id 1 gehören
select * from ezv_junction where GRUPPEID=1;
--Alle EZV
select * from EZV;
--timetable
select * from time_table;

--Alle Chargen die zu einer bestimmten EZV Gruppe gehören
select distinct(c.id), c.name as "Charge Name",c.weight as "Charge Weight",EZV.EZV_GRUPPE_ID as "Group Id",
G.NAME as "Group Name" from charge c 
inner join EZV ezv on C.EZV_ID = EZV.ID
inner join EZV_JUCTION j on EZV.ID = J.EZVID
inner join EZV_GRUPPE g on G.ID = J.GRUPPEID
where G.NAME LIKE 'Edelstahlplatten'
order by c.id;
--'Baublech','Flugzeugstahl','Autostahl','Aluminium','Edelstahl','Metal',
--'Stahlplatten','Edelstahlplatten','Metallplatten','Plattinenmetall',
--'Stoßstangen Stahl','Metall Pfosten'

--Alle Parameter
select * from Parameter;

--Alle text parameter
select * from Text_Param;

--alle Textparameter aus allen Chargen
select distinct(C.NAME) as "Charge Name",c.id,c.weight,TP.MIN,TP.MAX,TP.AIM from charge c
right join EZV e on C.EZV_ID =E.ID
right join PARAMETER_EZV pe on E.ID = PE.EZV_ID
right join Parameter p on PE.PARAMETER_ID = P.ID
right join Text_Param tp on p.id = tp.id
where p.isText =1; --isText =1 --> dieser parameter ist ein text parameter

--alle Parameter die KEIN text parameter sind
select p.id,p.name,p.einheit,P.STANDARDWERT,P.MAXIMUM,P.MINIMUM from Parameter p
where P.ISTEXT=0;


--alle Chargen die vor april 2001 verlassen haben
select c.id,c.name,c.weight,T.STRANGEND from charge c
inner join TIME_TABLE t on C.ID = T.ID
where
T.STRANGEND < to_date('01/4/2001 1:00:00','DD/MM/YYYY HH:MI:SS');
