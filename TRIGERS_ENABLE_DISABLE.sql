/*
Habilitar y Desactivar triggers

TRIGERS_ENABLE_DISABLE
*/

TRUNCATE TABLE control;

--Mirar los triggers 
SELECT Trigger_type, Triggering_event, Table_name
FROM USER_TRIGGERS
WHERE table_name = 'EMPLEADOS';

--Prueba de deactivacion
UPDATE empleados e SET e.sueldo = 710
WHERE e.nombre = 'Ana';

--Desahbilitar trigger
ALTER TRIGGER tr_aumentasueldo DISABLE;

--Habilitar Trigger
ALTER TRIGGER tr_aumentasueldo ENABLE;

--Leer tabla
SELECT * FROM empleados;
SELECT * FROM control;

