truncate TABLE VERTEILER;
truncate TABLE STRANG;
truncate TABLE PFANNE;
truncate TABLE KOKILLE;
truncate TABLE EZV_GRUPPE;
truncate TABLE EZV;
truncate TABLE PARAMETER;
truncate TABLE PARAMETER_EZV;
truncate TABLE TEXT_PARAM;
truncate TABLE PATTERN_PARAM;
truncate TABLE CHARGE;
truncate TABLE TIME_TABLE;
truncate Table Produkt;
truncate Table PRODUCT_JUNCTION;


Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(1,5,'Rot');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(2,5,'Grau');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(3,5,'Glanz Grau');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(4,5,'Matt Schwarz');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(5,6,'Kaltverform');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(6,6,'Angelassen');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(7,6,'Normalgegl?ht');
Insert into Text_Param(ID,PARAMETER_NO,TEXT) VALUES(8,6,'Verg?tet');

Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(1,'Bandgeschwindigkeit',0,'m/s',CURRENT_TIMESTAMP,10,0.1);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(3,'Error',0,'NaN',CURRENT_TIMESTAMP,null,null);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(4,'Gie?geschwindigkeit',0,'m/s',CURRENT_TIMESTAMP,5,0.01);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(5,'Pressdruck',0,'Pa',CURRENT_TIMESTAMP,1000,2);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(6,'Verformungsgrad',0,'Grad',CURRENT_TIMESTAMP,360,0); 
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(7,'Stahltemperatur',0,'Celsius',CURRENT_TIMESTAMP,-273,3000); --Verdampft bei 3000 Grad
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(8,'Stahlfarbe',1,'Farbe',CURRENT_TIMESTAMP,0,0);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(9,'Stahlart',1,'Stahlname',CURRENT_TIMESTAMP,0,0);
Insert into Parameter(ID,NAME,ISTEXT,EINHEIT,MESSZEITPUNKT,MAXIMUM,MINIMUM)
VALUES(10,'Bandgeschwindigkeit',0,'m/s',CURRENT_TIMESTAMP,10,0.1);

Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(1,3,1,8,1.5,3);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(2,1,3,8,4,3);
Insert into Parameter_EZV(ID, EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(3,4,2,444,6,103);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(4,4,5,302,8,152);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(5,5,4,102,12,56);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(6,6,7,50,48,49);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(7,7,6,40,20,31);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(8,8,9,70,60,64);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(9,10,8,120,60,75);
Insert into Parameter_EZV(ID,EZV_ID,Parameter_ID,Max,Min,AIM)VALUES(10,7,100,57,5,87);

Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(1,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(2,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(3,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(4,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(5,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));
Insert into TIME_TABLE(id,strangStart,strangENd,pfanneStart,pfanneEnd,VerteilerStart,VerteilerEnd,KokileStart,KokileEnd)
VALUES(6,TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-08-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-09-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-11-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2014-12-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'),TO_TIMESTAMP('2015-01-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'));

Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(1,3,100,1);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(2,5,4552,2);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(3,6,6012,3);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(4,7,4100,4);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(5,8,950,-1);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(6,4,1206,-1);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(7,9,1350,-1);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(8,1,1480,-1);
Insert into Charge(ID,EZV_ID,weight,positionID)VALUES(9,2,1545,-1);

Insert into Strang(ID,CurrentCharge,AGE) values(1,2,365);
Insert into PFANNE(ID,CurrentCharge,AGE) values(1,2,365);
Insert into KOKILLE(ID,CurrentCharge,AGE) values(1,2,365);
Insert into VERTEILER(ID,CurrentCharge,AGE) values(1,2,365);

Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(1,1,'Autoblech');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(2,2,'Stahlplatte');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(3,2,'Stahlw?rfel');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(4,3,'Eisenpaltte');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(5,4,'Metallplatte');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(6,4,'Hart Metallplatte');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(7,2,'Edelstahlplatte');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(8,5,'Rahmenstahl');
Insert into EZV( ID ,EZV_GRUPPE_ID,NAME) values(9,5,'Rahmenmetall');

Insert into EZV_Gruppe(ID,eID,pId) values(1,1,1); 
Insert into EZV_Gruppe(ID,eID,pId) values(2,2,2); 
Insert into EZV_Gruppe(ID,eID,pId) values(3,2,3); 
Insert into EZV_Gruppe(ID,eID,pId) values(4,3,4);  
Insert into EZV_Gruppe(ID,eID,pId) values(5,4,5); 
Insert into EZV_Gruppe(ID,eID,pId) values(6,4,6); 
Insert into EZV_Gruppe(ID,eID,pId) values(7,5,8); 
Insert into EZV_Gruppe(ID,eID,pId) values(8,5,9); 



