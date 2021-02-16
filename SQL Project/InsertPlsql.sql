truncate TABLE FORMAT;
truncate TABLE VERTEILER;
truncate TABLE STRANG;
truncate TABLE PFANNE;
truncate TABLE KOKILLE;
truncate TABLE AREA;
truncate TABLE SUBAREA;
truncate TABLE EZV_GRUPPE;
truncate TABLE EZV;
truncate TABLE PARAMETER;
truncate TABLE PARAMETER_EZV;
truncate TABLE TEXT_PARAM;
truncate TABLE PATTERN_PARAM;
truncate TABLE CHARGE;
truncate TABLE TIME_JUNCTION;
truncate TABLE TIME_TABLE;
truncate Table Produkt;
truncate Table PRODUCT_JUNCTION;

SET SERVEROUTPUT ON;

DECLARE 
    --editable variables
    v_charges number:=100;                      --amount of charges
    v_maxChildren number:=10;                   --maximum amount of products for a charge
    v_product_process_time number:=10;          --time between product entry to product ending
    v_time_skip number:= 1;                     --amount of days skiped every cycle
    
    
    --not editable variables
    v_index number(2);
    v_weight number(6); 
    v_children number;
    v_children_produkt_index number;
    v_produkt_id number:=0;
    v_produkt_time date:=to_date('01/01/2000 8:00:00', 'DD/MM/YYYY HH:MI:SS');
    v_produkt_time_tmp date:=to_date('01/01/2000 8:00:00', 'DD/MM/YYYY HH:MI:SS');
    v_produkt_name varchar2(64);
    v_time_tmp1 date;  v_time_tmp2 date;  v_time_tmp3 date;  v_time_tmp4 date;  v_time_tmp5 date; v_time_tmp6 date;  v_time_tmp7 date; v_time_tmp8 date;
    
BEGIN 
    FOR v_index IN 1 .. v_charges+1  LOOP
        SELECT dbms_random.value(1000,10000) num into v_weight FROM dual; --make a random weight
        Insert into Charge Values(v_index,v_index,v_weight,-1);
        --add one day to the date time
       select v_produkt_time + v_time_skip*INTERVAL '1' DAY into v_produkt_time from dual;
       if MOD(v_index,10)= 0 then
        select v_produkt_time + INTERVAL '1' YEAR into v_produkt_time from dual;
       end if;
        v_produkt_time_tmp:=v_produkt_time;
    
        --Fill timetable for charge
        v_time_tmp1:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp2:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp3:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp4:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp5:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp6:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp7:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        v_time_tmp8:=v_produkt_time; select v_produkt_time + 1/8*v_time_skip*INTERVAL '1' minute into v_produkt_time from dual;
        
        Insert into Time_Table VALUES(v_index,v_time_tmp1,v_time_tmp2,v_time_tmp3,v_time_tmp4,v_time_tmp5,v_time_tmp6,v_time_tmp7,v_time_tmp8);
        
        
        

        dbms_output.put_line(to_char(v_produkt_time));
        SELECT dbms_random.value(v_maxChildren/2,v_maxChildren) num into v_children FROM dual;
        FOR v_children_produkt_index IN 1 .. v_children+1  LOOP

            --Insert into the Junction
            Insert into PRODUCT_JUNCTION Values(v_index,v_produkt_id);
           
            v_produkt_name:= 'C'||to_char(v_index)||'_P'||to_char(v_children_produkt_index);
            v_produkt_time_tmp:= v_produkt_time;
            select v_produkt_time_tmp + 10*INTERVAL'1' minute into v_produkt_time_tmp from dual;
            Insert into PRODUKT VALUES(
                v_produkt_id,
                v_produkt_name,
                v_index,
                1,
                v_produkt_time,
                v_produkt_time_tmp
            ); 
            select v_produkt_time + 10*INTERVAL '1' minute into v_produkt_time from dual;            
            dbms_output.put_line('    '||to_char(v_produkt_time));
            v_produkt_id:=v_produkt_id+1; --add one to product for next entry
        END LOOP;
    END LOOP; 
END; 
/





