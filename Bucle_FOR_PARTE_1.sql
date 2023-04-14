/*
Bucle FOR
*/

----Ejemplo 1: Bucle basico con for
---- Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON;
--
--DECLARE
--    numero NUMBER(2);
--
--BEGIN 
--
--    FOR numero IN 10..20 LOOP
--    DBMS_OUTPUT.PUT_LINE('Valor de numero = ' || numero);
--    END LOOP;
--
--END;

-----------------------------------------------------------
--
----Ejemplo 2: Bucle basico con for en reversa sin declaracion
---- Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON;
--
--BEGIN 
--
--    FOR f IN REVERSE 0..20 LOOP
--    DBMS_OUTPUT.PUT_LINE('Valor de f = ' || f);
--    END LOOP;
--
--END;

-----------------------------------------------------------

--Ejemplo 3: Tabla del 6
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

BEGIN 

    FOR f IN 0..10 LOOP
    DBMS_OUTPUT.PUT_LINE('6 x '|| f || ' = ' || ( 6 * f ));
    END LOOP;

END;