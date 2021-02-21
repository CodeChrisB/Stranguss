/*
 * Buchberger Christopher
 * Stranguss Views
 * 18.02.2021
 */
 
 CREATE OR REPLACE TRIGGER ... 
BEFORE DELETE OR INSERT OR UPDATE ON ... 
FOR EACH ROW  
DECLARE 
   
BEGIN  
   dbms_output.put_line('Trigger'); 
END; 
/ 