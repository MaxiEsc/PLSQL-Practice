--Acceder a la vista users_dependecy
SELECT * FROM user_dependencies;

--Acceder a la vista users_dependecy con el nombre 'employees'
SELECT * FROM user_dependencies WHERE name = 'employees';

--Acceder a la vista users_dependecy con el nombre 'EMP_DETAILS_VIEW'
SELECT * FROM user_dependencies WHERE name = 'EMP_DETAILS_VIEW';

--Acceder a la vista users_dependecy donde el nombre de referencia se 'EMPLOYEES'
SELECT * FROM user_dependencies WHERE referenced_name = 'EMPLOYEES';

--Permite ver la informacion de los objetos que estan en el sistema
SELECT * FROM user_objects; --  indica mayormente los objetos sean validos si los objetos son invalidos lo intenta resolver oracle

--Ver el estado de los objetos sean invalidos  del sistemas
SELECT STATUS, COUNT(*) FROM user_objects 
GROUP BY status;

-- Probemos objetos invalidos!!!

CREATE TABLE prueba123(
campo1 NUMBER,
campo2 NUMBER
);

--Miramos los objetos validos del usuario cuyo nombre sea prueba
SELECT * FROM user_objects WHERE object_name like '%PRUEBA%';

--Se aclara que esta modificacion de campos olo se permite oracle a partir de la version 11g de oracla database
CREATE OR REPLACE VIEW v_prueba
as    
SELECT campo1 FROM prueba123;

--revisamoss y ahora hay 2
SELECT * FROM user_objects WHERE object_name like '%PRUEBA%';

ALTER TABLE prueba123 DROP COLUMN campo1;

--Creamos un procedimiento
CREATE OR REPLACE PROCEDURE proc_01
IS BEGIN null;
end;

--Vemos el estado del procedimiento
SELECT * FROM user_objects WHERE object_name LIKE '%PROC%'; 

--Un procedimiento que utiliza el procedimiento previo
CREATE OR REPLACE PROCEDURE proc_02
is 
begin
proc_01;
end;

--NUeva instruccion recompila sin darle la opcion del reescribir el codigo nuevo... en fin es recompilar simplemente funciona para funciones, vistas PERO no para PAQUETES
ALTER PROCEDURE proc_02 COMPILE;

    
