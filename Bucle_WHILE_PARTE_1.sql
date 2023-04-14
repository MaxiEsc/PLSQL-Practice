/*
Bucle WHILE
*/

----Ejemplo 1 : Ejemplo Basico
----Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON; 
--
--DECLARE
--    valor NUMBER(2) := 1;
--BEGIN
--    WHILE valor < 20 LOOP
--        DBMS_OUTPUT.PUT_LINE('El valor es: ' || valor);
--        valor := valor + 1 ;
--    END LOOP;
--END;

---------------------------------------------------------------

--Ejemplo 2 : Ejemplo Tabla de multiplicar de 3
--Habilitar la consola de la base de datos
SET SERVEROUTPUT ON; 

DECLARE
    numero NUMBER(2) := 0;
    resultado NUMBER(2);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tabla del 3');
    WHILE numero <= 10 LOOP
        resultado := 3 * numero;
        DBMS_OUTPUT.PUT_LINE('3 x ' || numero || ' = ' || resultado);
        numero := numero + 1 ;
    END LOOP;
END;