/*
    TRIGGERS de Multiples eventos
    
    Son triggers que puedan corroora basicamente cualquier modificacion de datos 
    
    
    Palabras reservadas del sistema:
    INSERTING ,DELETEING, UPDATING 
*/

--Otra tabla de control para controla multiples acciones
--CREATE TABLE control_empleados(
--usuario VARCHAR2(20),
--fecha DATE,
--accion VARCHAR2(20));

--Creeamo un trigger multiproposito que registra todas las acciones de insercion,actualizacion y borrado de registros en la tabla
--CREATE OR REPLACE TRIGGER tr_control_empleados
--BEFORE INSERT OR UPDATE OR DELETE
--ON empleados
--    BEGIN 
--    IF INSERTING THEN
--        INSERT INTO control_empleados VALUES (USER, SYSDATE, 'Ingreso datos');
--    END IF;
--    IF DELETING THEN 
--        INSERT INTO control_empleados VALUES (USER, SYSDATE, 'Borrado datos');
--    END IF;
--    IF UPDATING THEN 
--        INSERT INTO control_empleados VALUES (USER, SYSDATE, 'Actualiza datos');
--    END IF;
--END;

--Probar update agregado y eliminacion
INSERT INTO empleados VALUES (1234545, 'GOMERO' , 'TOMAS', 'Supervisor', 555.60);
UPDATE empleados e SET e.sueldo = 600 
WHERE e.apellido LIKE '%GOMERO%';
DELETE FROM empleados e 
WHERE e.apellido LIKE '%GOMERO%';

--Leer tabla
SELECT * FROM control_empleados;
SELECT * FROM control;
SELECT * FROM empleados;



