/*
 * Buchberger Christopher
 * Stranguss Views
 * 18.02.2021
 */
--Alle chargen in Zeitlicher Reihenfolge
CREATE OR REPLACE VIEW TimeOrderdCharges AS
Select c.id,c.ezv_id,c.weight,C.POSITIONID,T.PFANNESTART as Start_Time from charge c  
inner join time_table t on C.ID = T.ID
order by T.PFANNESTART asc;

select * from TimeOrderdCharges;


--Alle Produkte in Zeitlicher Reihenfolge
CREATE OR REPLACE VIEW TimeOrderdProducts AS
SELECT product_id,PRODUCT_NAME,CHARGE_ID,start_time,end_time from produkt
order by end_time;

select * from TimeOrderdProducts;

--Die Chargen die sich momentan in Anlageteilen befinden.
CREATE OR REPLACE VIEW ProcessedCharges AS 
Select c.name as "Charge",c.weight as "WEIGHT (Kg)",an.name  as "Position",TT.PFANNESTART, TT.PFANNEEND, TT.VERTEILERSTART, TT.VERTEILEREND,TT.KOKILESTART,TT.KOKILEEND,TT.STRANGSTART,TT.STRANGEND  from charge c
inner join ANLAGETEILNAME an on c.id = an.id
inner join Time_Table tt on c.id = tt.id
where c.POSITIONID=1
order by c.id;

select * from ProcessedCharges;

select * from ANLAGETEILNAME;


--Anzahl an Chargen und all' deren Produkte
select count(*) from CHARGE c
inner join PRODUKT p on c.ID = P.CHARGE_ID;


--Zeigen sie gesamten Zeitlichen Ablauf der Charge n.
select * from Charge c 
inner join TIME_TABLE t on T.ID =C.ID
where c.id=8;