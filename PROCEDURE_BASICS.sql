/*
Procedimientos Almacenados : STORED PROCEDURE

-Nivel de esquema
-Dentro de un paquete
-Dentro de un bloque PL/SQL

Entonces son bloques de código compilados que se almacenan en la base de datos de Oracle y se pueden invocar desde cualquier 
aplicación que tenga acceso a la base de datos. Estos procedimientos ofrecen una serie de beneficios en términos de rendimiento, 
modularidad, reutilización y seguridad.

Partes de un procedimiento almacenado

-Parte declarativa
-Parte ejecutable
-Excepciones

*/

--Ejercicio 1:  Crear un procedimiento
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

--CREATE OR REPLACE PROCEDURE saludo
--AS 
--    BEGIN 
--        DBMS_OUTPUT.PUT_LINE('Hola La vida es una mierda');
--    END;
----Ejecutar procedimiento 1ra forma (Tiene sus propios criterios mas adelante se sabra)
--BEGIN 
--saludo;
--END;
--Ejecutar procedimiento 2da forma (Tiene sus propios criterios mas adelante se sabra)
--EXECUTE saludo;

SELECT * FROM libros;
--
----Crear Procedimiento para aumentar los precios
--CREATE OR REPLACE PROCEDURE aumenta_precio
--AS 
--    BEGIN
--        UPDATE libros SET precio = precio + (precio * 0.10);
--END aumenta_precio;

EXECUTE aumenta_precio;

----Ver los precesos almacenados
--SELECT * FROM user_objects WHERE object_type = 'PROCEDURE';
----Ver de otra forma
--SELECT * FROM user_procedures WHERE object_name LIKE '%SALUDO%';

--Eliminar un PROCEDURE
--DROP PROCEDURE saludo;
