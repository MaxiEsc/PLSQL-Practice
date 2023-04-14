/*
Matrices en PLSQL

Las colecciones son objetos que contienen múltiples elementos del mismo tipo de datos, y se pueden declarar como tablas indexadas
o tablas asociativas. se almacenan de manera contigua. el primer indice siempre es 1
solo son unidimensionales, y sus valores siempre se declaran NULL

varray es una variable de array
*/

----Ejercicio 1: Mostrar un arreglo basico
---- Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON;
--
--DECLARE
--    TYPE a_paises IS VARRAY(6) OF VARCHAR2(20);
--    nombre a_paises;
--BEGIN
--    nombre := a_paises('Argentina','Brasil','Peru','Mexico','Rep Dominicana','Uruguay');
--    FOR f IN 1..6 LOOP
--        DBMS_OUTPUT.PUT_LINE('Nombre : ' || nombre(f));
--    END LOOP;        
--END;

----------------------------------------------------------------------------------------------

--Ejercicio 2: Mostrar dos arreglos siendo uno entero y otro de cadenas
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    --Objetos de tipo
    TYPE arreglo_nombres IS VARRAY(6) OF VARCHAR2(20);
    TYPE arreglo_edad IS VARRAY(6) OF INTEGER;
    
    --Creamos una variable nombre del tipo de arreglo_nombres
    nombre arreglo_nombres;
    --Creamos una variable nombre del tipo de arreglo_nombres
    edad arreglo_edad;
    total INTEGER;
BEGIN
    nombre := arreglo_nombres('Federeico','Verde','Soldado','Cocinero','Amarillo','Antonio');
    edad := arreglo_edad(18,19,20,25,30,40);
    total := nombre.COUNT;
    
    FOR f IN 1..total LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre : ' || nombre(f) || ' Edad ' || edad(f));
    END LOOP;      
END;