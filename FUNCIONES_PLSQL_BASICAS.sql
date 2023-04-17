/*
Funciones PLSQL

Son bloques de codigos como bloques de codigos de los procedure... pero con la diferencia de la clausula Return

LA clausula return es OBLIGATORIA
*/

----Crea una funcion
--CREATE OR REPLACE FUNCTION f_prueba(valor NUMBER)
--RETURN NUMBER 
--    IS 
--        BEGIN 
--        RETURN valor * 2;
--END;

----Ejecutar funcion
--SELECT f_prueba(78) AS Total FROM DUAL;

--Ejemplo segunda funcion
--CREATE OR REPLACE FUNCTION f_costo(valor NUMBER)
--RETURN VARCHAR
--IS
--    costo VARCHAR(20);
--    BEGIN
--        costo := '';
--        IF valor <= 500 THEN
--        costo :=  'Economico';
--        ELSE costo := 'Costoso';
--        END IF;
--    RETURN costo;
--    END;
    
--Leer la tabla libro
SELECT * FROM libros;

--Consulta con la funcion
SELECT titulo,autor,precio, f_costo(precio) AS Estado FROM libros;

