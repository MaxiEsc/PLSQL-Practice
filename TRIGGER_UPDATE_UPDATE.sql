/*
Triggers Before Update

Se utilizan para controlar cambios en las tablas 

--Eliminar tablas
DROP TABLE empleados;
DROP TABLE control;

codigo para practicar
--creacion tabla empleados
   create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
--creacion tabla control
 create table control(
  usuario varchar2(30),
  fecha date
 );

--ingreso de datos
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
 
 TRIGGER_UPDATE_UPDATE
 
*/

--Crea un trigger que actualiza los datos con registros en la tabla control, ante cualquier actualizacion registra usuario y tiempo en tabla control
--CREATE OR REPLACE TRIGGER tr_actualiza
--BEFORE UPDATE
--ON empleados
--FOR EACH ROW
--BEGIN
--    INSERT INTO control VALUES(USER, SYSDATE);
--    END tr_actualiza;

--Update para corroborar la funcion de trigger
UPDATE empleados SET sueldo = sueldo + (sueldo * +.025) 
WHERE seccion LIKE '%Secretaria%';

--Leer datos de la tabla
SELECT * FROM empleados;
SELECT * FROM control;
