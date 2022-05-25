TRUNCATE TABLE verteiler;
TRUNCATE TABLE strang;
TRUNCATE TABLE ezv_junction;
TRUNCATE TABLE pfanne;
TRUNCATE TABLE kokille;
TRUNCATE TABLE area;
TRUNCATE TABLE subarea;
TRUNCATE TABLE ezv_gruppe;
TRUNCATE TABLE ezv;
TRUNCATE TABLE parameter;
TRUNCATE TABLE parameter_ezv;
TRUNCATE TABLE text_param;
TRUNCATE TABLE pattern_param;
TRUNCATE TABLE charge;
TRUNCATE TABLE time_table;
TRUNCATE TABLE produkt;
TRUNCATE TABLE product_junction;

/*
 * Buchberger Christopher
 * Stranguss Insert Script
 * 18.02.2021
 */
SET serveroutput ON;
DECLARE
    --Editable Variables
    v_charges                NUMBER := 1000; --amount of charges 
    --max weight of a charge in kg
    --maximum amount of products for a charge
    v_parameter_amount       NUMBER := 4;
    v_product_process_time   NUMBER := 10;
    --time between product entry to product out
    v_day                    NUMBER := 1; --amount of days skiped every cycle
    v_start_time             VARCHAR2(18) := '01/01/2000 8:00:00';
    --the start Date of prodcution
    --Variables used in the script.
    v_index                  NUMBER; --charge index
    v_ezv_amount             NUMBER;
    v_ezv_group_amount       NUMBER;
    v_text_param_amount      NUMBER := 0;
    v_text_param_index       NUMBER := 0;
    v_param_istext           NUMBER;
    v_param_index            NUMBER; --index for the param loop
    v_param_max              NUMBER; --max amount of parameters inside a ezv
    v_param_value            NUMBER; --is used for random parameter insertion
    v_param_ezv_index        NUMBER := 0;
    v_params                 NUMBER;
    v_weight                 NUMBER; --charge weight
    v_children               NUMBER; --amount of children for a charge
    v_children_produkt_index NUMBER; --the produkt index
    v_produkt_id             NUMBER := 1; --the produkt id
    v_produkt_name           VARCHAR2(32); --product name
    v_time_table_entries     NUMBER;
    --amount of time table entries that will be filled
    v_produkt_time           DATE := To_date(v_start_time, 'DD/MM/YYYY HH:MI:SS'
                                     ); --product start time
    v_produkt_time_end       DATE := To_date(v_start_time, 'DD/MM/YYYY HH:MI:SS'
                                     ); --end time
    v_anlageteil_time        DATE := v_produkt_time;
    TYPE r_charge_time_table IS varray(8) OF DATE;
    -- array type for the timetable
    v_tarray                 R_CHARGE_TIME_TABLE;
    --actual array for the timetable
    v_position_id            NUMBER := -1;

        TYPE t_params IS VARRAY(120) 
    OF VARCHAR2(64) NOT NULL;
    t_param_name t_params  := t_params(
    'Flie�geschwindigkeit','M^2',
    'H�rte','HB',
    'Aussentemperatur','Celsius',
    'Kerntemperatur','Celsius',
    'Dauer','Seconds',
    'L�nge','Meter',
    'Breite','Meter',
    'H�he','Meter',
    'Gewicht','Kilogram',
    'Gewicht/M^3','Kilogram per Cubic Meter',
    'Dichte','Density',
    'Belastbarkeit','Kilogram',
    'Lochgr��e','Centimeter',
    'Fehlertolleranz Oberfl�che','Millimeter',
    'Durchgangszeit','Sekunden',
    'Dynamische Viskosit�t','D Viskosit�t',
    'Kinematische Viskosit�t','K Viskosit�t',
    'Presskraft','Newton',
    'Spannung','Pascal',
    'Ben�tigte Leistung','Watt',
    'Massentr�gheitsmoment','Kilogramm*M^2',
    'Impuls','Kilogramm M/Sekunde',
    'Werkzeugtemperatur','350C',
    'Stempelgeschwindigkeit','mm/s',
    'Presskraft','MN',
    'Rezipientendurchmesser','mm',
    'Bolzenvorw�rmetemeperatur','C',
    'Latente W�rme Masse','kJ/Kg',
    'Latente W�rme Vol.','MJ/m^3',
    'Cp Masse','kJ/K kg',
    'Cp Vol','kJ/K M^3',
    'Cp Masse Liquidus','kg/K kg',
    'Schmelze Solidus','W/mK',
    'Gie�leistung','t/a',
    'Gie�rollen-Drm','mm',
    'Banddicke','mm',
    'Bandbreite','mm'
    );
    
    t_param_ezv t_params  := t_params('Baublech','Flugzeugstahl','Autostahl','Aluminium','Edelstahl','Metal','Stahlplatten','Edelstahlplatten','Metallplatten','Plattinenmetall','Sto�stangen Stahl','Metall Pfosten');
   --param name min max aim
   t_param_text t_params  := t_params
    (
    'Pulver','Rot','Blau','Gr�n',
    'Pulver Feinheit','Sehr Fein','Fein','Grob',
    'Stahlfarbe','Grau','Dunkel Grau','Standard',
    'Stahlpulver Zusatz','Rot','Gr�n','Gelb',
    'Zusatzpulver','Gr�n','Blau','Gelb',
    'Metalpulver Zusatz','Schwarz','Dunkelgrau','Grau',
    'Pulverst�rke','Gemischt','Nicht Gemischt','Stark Gemischt',
    'Legierung','OF','ETP','DHP',
    'Verfahren','Indirekt','Direkt','Direkt',
    'Gie�richtung','vertikal','horizontal','horizontal'
    );
BEGIN
    --get the amount entries of the arrays
    v_params := t_param_name.count / 2; --first is parameter second is unit
    v_ezv_group_amount := t_param_ezv.count;
    v_text_param_amount := t_param_text.count / 4; --param name min max aim
    --ezv    
    FOR v_index IN 1..v_ezv_group_amount LOOP
        INSERT INTO ezv_gruppe
        VALUES     (T_param_ezv(v_index),
                    v_index);
    END LOOP;

    --text params
    FOR v_index IN 1..v_text_param_amount LOOP
        --text parameter values with min max aim
        INSERT INTO text_param
        VALUES     ( v_text_param_index,
                    T_param_text(v_index * 4 - 3),
                    v_text_param_index,
                    T_param_text(v_index * 4 - 2),--min
                    T_param_text(v_index * 4 - 1),--max
                    T_param_text(v_index * 4)--aim
        );

        --text parameter inside the parameter table the min max aim is null bc it can  not be numeric
        INSERT INTO parameter
        VALUES     (v_index - 1,
                    T_param_text(v_index * 4 - 3),
                    1,
                    'Text',
                    NULL,
                    NULL,
                    NULL);

        v_text_param_index := v_text_param_index + 1;
    END LOOP;

    --the text params are already added to keep the id uniqe start with text param latest entry
    FOR v_index IN 1 .. v_params LOOP
        dbms_output.Put_line(v_param_istext);

        SELECT Round(dbms_random.Value(4, 1000)) num
        INTO   v_param_max
        FROM   dual; --make a random weight
        INSERT INTO parameter
        VALUES     ( v_index + v_text_param_amount,--id
                    T_param_name(v_index * 2 - 1),--name
                    0,--istext
                    T_param_name(v_index * 2),--unit
                    v_param_max / 2,--standard value,
                    v_param_max,--highest possible value
                    v_param_max / 4 --minimum
        );

        FOR v_param_index IN 1 .. v_params LOOP
            SELECT ( dbms_random.Value(1, v_params) ) num
            INTO   v_param_value
            FROM   dual; --make a random weight
            INSERT INTO parameter_ezv
            VALUES     (
                        v_param_ezv_index,--id
                        v_param_index,--ezv
                        Trunc(v_param_value),--parameter_id
                        Round(v_param_max / 1.8 * ( 1 / Trunc(v_param_value) ) * 5)/ 10,
                        Round(v_param_max / 1.5 * ( 1 / Trunc(v_param_value) ) * 5)/ 10,
                        Round(v_param_max / 1.6 * ( 1 / Trunc(v_param_value) ) * 5)/ 10
                        );

            v_param_ezv_index := v_param_ezv_index + 1;
        END LOOP;
    END LOOP;

    /*
    Outer Loop filling the Charge and the Timetable
    */
    FOR v_index IN 1 .. v_charges LOOP
        --the first 4 charges will be placed inside the process steps
        IF v_index < 5 THEN
          v_position_id := v_index; --inside a process step.
        ELSE
          IF( MOD(v_index, 7) = 0 ) THEN
            v_position_id := 5; -- is finished
          ELSE
            v_position_id := -1; --waiting to get inside strang    
          END IF;
        END IF;

        SELECT dbms_random.Value(10000 / 5, 10000 - 1) num
        INTO   v_weight
        FROM   dual; --make a random weight
        INSERT INTO charge
        VALUES     ( v_index,
                    'C'
                    ||v_index,
                    MOD(v_index, v_ezv_group_amount),
                    v_weight,
                    v_position_id );

        INSERT INTO ezv
        VALUES     (v_index,
                    MOD(v_index, v_ezv_group_amount));

        INSERT INTO ezv_junction
        VALUES     (
                    MOD(v_index, v_ezv_group_amount)
                    ,v_index);

        --add n days to the date time
        SELECT v_produkt_time + 1
        INTO   v_produkt_time
        FROM   dual;

        --to make the time diffrence between the charges bigger
        --every 10th charge an additional year will be added.
        IF MOD(v_index, 10) = 0 THEN
          SELECT v_produkt_time + 365 * 1.4
          INTO   v_produkt_time
          FROM   dual;
        END IF;

        --Timetable Loop filling the timetable array with valid data
        --The first 4 Charges are currently in side a specific part of 
        --the process so we have to declare their position manual
        --init the charge timetable array
        v_tarray := R_charge_time_table();

        --remove 50 minutes so that when charge enters a part the next one leaves the part
        FOR i IN 1..8 LOOP
            v_anlageteil_time := v_anlageteil_time + ( v_product_process_time /24 /60);
            v_tarray.Extend();
            V_tarray(i) := v_anlageteil_time;
      END LOOP;
      
      if MOD(v_index,5)= 0 THEN
        v_anlageteil_time:=v_anlageteil_time+12;
      end if;

        v_anlageteil_time := v_anlageteil_time - ( 1 / 24 ) - 1 / 24 / 6;
        INSERT INTO time_table
        VALUES     (v_index,
                    V_tarray(1),
                    V_tarray(2),
                    V_tarray(3),
                    V_tarray(4),
                    V_tarray(5),
                    V_tarray(6),
                    V_tarray(7),
                    V_tarray(8));

        --Inner Loop Creating the Products for a Charge
        --and filling the Product_Junction          
        FOR v_children_produkt_index IN 1 .. 10 LOOP
            SELECT v_produkt_time + ( v_product_process_time / 24 / 60 )
            INTO   v_produkt_time
            FROM   dual;

            INSERT INTO produkt
            VALUES     ( v_produkt_id,
                        v_produkt_name,
                        v_index,
                        1,
                        v_produkt_time,
                        v_produkt_time_end );

            v_produkt_time := v_produkt_time_end;
            -- set the new start time to the old end time

            v_produkt_id := v_produkt_id + 1;
        --add one to product for next entry
        END LOOP;
    END LOOP;
END;
/ 
