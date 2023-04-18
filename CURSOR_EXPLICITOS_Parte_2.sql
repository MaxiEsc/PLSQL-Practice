/*
Cursor explicito

empleados%rowtype: Esto significa que la variable va a tener todos los tipos de datos de los campos de la tabla empleado, 
entonces al tener todos los tipos de datos de los campos de la tabla empleados le permite recibir todos los tipos de datos 
de la consulta en la variable v_empleados

dentro de un bucle for se haga un recorrido(select * from empleados que previamente son los valores que tomo el %rowtype) de 
todos los registros de la tabla de en la variable y que por cada iteraccion vaya imprimiendo un valor
*/

--Ejercicio 1: Crea un cursor que muestra a traves de una variable los datos de una consulta
-- Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON;
--
--DECLARE
--    v_empleados empleados%rowtype;
--BEGIN
--    FOR v_empleados IN ( SELECT * FROM empleados ) LOOP
--        DBMS_OUTPUT.PUT_LINE(v_empleados.documento || ' ' || v_empleados.sueldo);
--        DBMS_OUTPUT.PUT_LINE(v_empleados.apellido || ' ' || v_empleados.nombre);
--    END LOOP;
--
--END;

--Ejercicio 2 : Actiualiza aquellos registros que cumplan la condicion (si hay un documento 2333333) que tengan un sueldo de
--10000 por lo que no se necesita declara nada ya que no hay variables de por medio en este procedimiento
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

BEGIN
    UPDATE empleados SET sueldo = 12000
    WHERE documento = '0000000';
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EXISTE REGISTRO PARA MODIFICAR');
    END IF;
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
END;

--Leer la tabla
--SELECT * FROM empleados;