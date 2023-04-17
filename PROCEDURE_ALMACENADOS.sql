/*
Procedimientos almacenados 

Parametros de entreda: instrucciones que posibilitan la entreada de datos en el mismo


Datos necesarios para el ejercicio

 --borrar tabla empelados anterior
 drop table empleados;
 
 --crear nueva tabla empleados
 create table empleados(
  documento char(8),
  nombre varchar2(20),
  apellido varchar2(20),
  sueldo number(6,2),
  fechaingreso date
 );

 --ingreso de datos
 insert into empleados values('22222222','Juan','Perez',300,to_date('10/10/1980','dd/mm/yyyy'));
 insert into empleados values('22333333','Luis','Lopez',300,to_date('12/05/1998','dd/mm/yyyy'));
 insert into empleados values('22444444','Marta','Perez',500,to_date('25/08/1990','dd/mm/yyyy'));
 insert into empleados values('22555555','Susana','Garcia',400,to_date('05/05/2000','dd/mm/yyyy'));
 insert into empleados values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));
 
 
 --procedimiento que aumenta sueldo a empleados
 create or replace procedure aumentasueldo(anio in number, porcentaje in number)
as
 begin
 update empleados set sueldo=sueldo+(sueldo*porcentaje/100)
 where (extract(year from current_date)-extract(year from fechaingreso))>anio;
 end aumentasueldo;
 
 --ejecucion
 execute aumentasueldo(10,20);
 
 --procedimiento que ingresa empleados
 create or replace procedure ingresoemple(docu in char, nom in varchar2, ape in varchar2)
as
 begin
   insert into empleados values(docu, nom, ape, null, null);
   end ingresoemple;
   
    --ejecucion
execute ingresoemple('25656589','Emilio', 'Perez');
*/

-- --Borrar tabla empelados anterior
-- drop table empleados;
-- 
-- --Crear nueva tabla empleados
-- create table empleados(
--  documento char(8),
--  nombre varchar2(20),
--  apellido varchar2(20),
--  sueldo number(6,2),
--  fechaingreso date
-- );
--
-- --Ingreso de datos
-- insert into empleados values('22222222','Juan','Perez',300,to_date('10/10/1980','dd/mm/yyyy'));
-- insert into empleados values('22333333','Luis','Lopez',300,to_date('12/05/1998','dd/mm/yyyy'));
-- insert into empleados values('22444444','Marta','Perez',500,to_date('25/08/1990','dd/mm/yyyy'));
-- insert into empleados values('22555555','Susana','Garcia',400,to_date('05/05/2000','dd/mm/yyyy'));
-- insert into empleados values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));
-- 
-- 

-- 
-- --Procedimiento que aumenta sueldo a empleados
-- --aumentasueldo(anio IN NUMBER, porcentaje IN NUMBER) Es un procedimiento de entreda donde anio es de tipo number y procentaje igual
--CREATE OR REPLACE PROCEDURE aumentasueldo(anio IN NUMBER, porcentaje IN NUMBER)
--AS
-- BEGIN
-- UPDATE empleados SET sueldo = sueldo + ( sueldo * porcentaje / 100)
-- WHERE (EXTRACT ( YEAR FROM current_date ) - EXTRACT ( YEAR FROM fechaingreso) ) > anio;
-- END aumentasueldo;
-- 
-- --Ejecucion
-- execute aumentasueldo(10,5);
-- 
--Procedimiento que ingresa empleados
-- CREATE OR REPLACE PROCEDURE ingresoemple(documento IN CHAR, nombre IN VARCHAR2, apellido IN VARCHAR2)
--AS
-- BEGIN
--   INSERT INTO empleados VALUES(documento, nombre, apellido, NULL, NULL);
--   END ingresoemple;
   
--Ejecucion
--EXECUTE ingresoemple('25656589','Emilio', 'Perez');
--EXECUTE ingresoemple('2565694','Miliano', 'Gomez');
--EXECUTE ingresoemple('269559','Santiago', 'Verde');
--EXECUTE ingresoemple('2579189','Vecino', 'Surzo');
--EXECUTE ingresoemple('2565111','Cocinio', 'Concha');

--Leer datos
SELECT * FROM empleados;

--Eliminar procedure como siempre
DROP PROCEDURE ingresoemple;