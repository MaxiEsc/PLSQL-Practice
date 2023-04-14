/*
Bucles Anidados
*/

--Ejercicio 1: Ejercicio Basico
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE 
    variable1 NUMBER(3) := 0;
    variable2 NUMBER(3);
BEGIN

    LOOP
        DBMS_OUTPUT.PUT_LINE('___________________________________________________________________');
        DBMS_OUTPUT.PUT_LINE('Valor de la primera variable en la primer iteraccion = ' || variable1);
        DBMS_OUTPUT.PUT_LINE('___________________________________________________________________');
        variable2 := 0;
        LOOP 
            DBMS_OUTPUT.PUT_LINE('Valor de la segunda iteracion anidada = ' || variable2);
            variable2 := variable2 + 1;
            EXIT WHEN variable2 = 5;
        END LOOP;
    
    variable1 := variable1 + 1;
    EXIT WHEN variable1 = 5;    
    END LOOP;

END;