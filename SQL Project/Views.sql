--eine view alle chargen in zeitlicher reihenfolge
--CREATE VIEW TimeOrderdCharges AS
drop view TimeOrderdCharges;
CREATE VIEW TimeOrderdCharges AS
Select c.id,c.ezv_id,c.weight,C.POSITIONID,T.KOKILEEND as End_Time from charge c  
inner join time_table t on C.ID = T.ID
order by t.kokileend asc;


--eine view alle produkte in zeitlicher reihenfolge
drop view TimeOrderdProducts;
CREATE VIEW TimeOrderdProducts AS
SELECT * from produkt
order by end_time;
select * from TimeOrderdProducts;

