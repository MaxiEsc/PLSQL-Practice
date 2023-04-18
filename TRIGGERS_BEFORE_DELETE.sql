/*
TRIGGERS BEFORE DELETE

de control de borrado de registros

TRIGGERS_BEFORE_DELETE
*/

----Es un disparador que lanza un nuevo registro por cada vez que se borra un alumno    
--CREATE OR REPLACE TRIGGER tr_borradoalumno
--BEFORE DELETE 
--ON alumnos
--FOR EACH ROW
--BEGIN
--INSERT INTO control VALUES(USER, SYSDATE);
--END borradoalumnos;

--Limpiar tabla control
--TRUNCATE TABLE control;

--Borrar datos de la tabla alumno y se agrega un registro en control.
DELETE FROM alumnos a WHERE a.nombre LIKE 'Ana Algarbe';
DELETE FROM alumnos a WHERE a.nombre LIKE 'Bernardo Bustamante';
DELETE FROM alumnos a WHERE a.nombre LIKE 'Carolina Conte';

--Leer datos
SELECT * FROM alumnos; 
SELECT * FROM control;