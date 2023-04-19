/*
REF CURSORS

Es una variable definida como un tipo de cursor, en la cual puede apintar y hacer referencia a un cursor normal (Si bien sabemos
que un cursor es un puntero que apunta a una direccion privada de sql que contiene una sentencia sql ya sea select u otra)

Interezante: EXEC :rc1 := f_datoempleado(22222222);
Esta linesa debe ser ejecutada tal cual esta escrita pues con los dos puntoss es muy estricto este sistema

REF_CURSORS
*/
--Ejercicio 1 : ES una funcion con argumento que devuelve un ref_cursor como dato que se utilizara para traer un empleado de la base de datos por DNI
--Funcion que se utiliza para para traer el los datos del empleado con el dni ingresado
--CREATE OR REPLACE FUNCTION f_datoempleado(v_documento IN NUMBER)
--RETURN SYS_REFCURSOR
--IS
--    v_ref SYS_REFCURSOR;
--    BEGIN 
--        OPEN v_ref FOR SELECT * FROM empleados
--        WHERE documento = v_documento;
--        RETURN v_ref;
--    END;
--
----Leer la tabla empleados
--SELECT * FROM empleados;
--
----Leer la funcion
--SELECT f_datoempleado(22222222) FROM dual;
--
----Crear variable
--VAR rc1 REFCURSOR
--EXEC :rc1 := f_datoempleado(22222222);
--PRINT rc1;
--
--DESCRIBE empleados;

-----------------------------------------------------------------------------------------

--Ejercicio 2 : ES una funcion con argumento que devuelve un ref_cursor como dato que se utilizara para traer un empleado de la base de datos por valor1 y por valor2
--Funcion que se utiliza para para traer el los datos del empleado con2 argumentos en la funcion
CREATE OR REPLACE FUNCTION f_datoempleado(v_valor1 IN NUMBER, v_valor2 IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_ref SYS_REFCURSOR;
    BEGIN 
        OPEN v_ref FOR SELECT * FROM empleados
        WHERE documento IN (v_valor1, v_valor2);
        RETURN v_ref;
    END;

--Leer la tabla empleados
SELECT * FROM empleados;

--Leer la funcion
SELECT f_datoempleado(22222222,23333333) FROM dual;

--Crear variable
VAR rc1 REFCURSOR
EXEC :rc1 := f_datoempleado(22222222,23333333);
PRINT rc1;

DESCRIBE empleados;