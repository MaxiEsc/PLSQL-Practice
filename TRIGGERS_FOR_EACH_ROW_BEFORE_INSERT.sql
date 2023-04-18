/*
TRIGGERS FOR EACH ROW

estos son a diferencia  de los otros este si se ingresa a una tabla relacionada este se activaria una vez por cada vez que se haga

Codigo para el estudio

drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
 );

--INSERTS
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
 insert into empleados values('22999000','FUENTES','Federico','Sistemas');
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria');
 
 TRIGGERS_FOR_EACH_ROW_BEFORE_INSERT
*/

--Limpiar tabla control
--TRUNCATE TABLE control;
--TRUNCATE TABLE empleados;

--Crea un disparador con la condicion que por cada fila que se ingrese en la tabla empleados se va a
--registrar e la tabla control el registro del mismo
--CREATE OR REPLACE TRIGGER tr_ingresaempleados
--BEFORE INSERT
--ON empleados
--    FOR EACH ROW
--     BEGIN
--     INSERT INTO control VALUES (USER, SYSDATE);
--END tr_ingresaempleados;

----INSERTS de prueba
-- insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
-- insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
-- insert into empleados values('22999000','FUENTES','Federico','Sistemas');
-- insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
-- insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
-- insert into empleados values('23666777','JUAREZ','Juan','Contaduria');
 
 
--Leer la tabla
SELECT * FROM empleados;
SELECT * FROM control;

--Borrar TRIGGERS
DROP TRIGGER ingresaempleados;