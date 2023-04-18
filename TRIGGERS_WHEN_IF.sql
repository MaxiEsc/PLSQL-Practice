/*
TRIGGERS /WHEN/IF

Codigo para la practica de conceptos

drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
   drop table control;
 create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
 ); 
  insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
 
 TRIGGERS_WHEN_IF
*/

--Ejercicio 1: Crear un trigger que se actualice cuando se actualice el sueldo en emleados
CREATE OR REPLACE TRIGGER tr_aumentasueldo
BEFORE UPDATE OF sueldo
ON empleados
FOR EACH ROW WHEN(NEW.sueldo > OLD.sueldo)
    BEGIN 
        INSERT INTO control VALUES(USER, SYSDATE, :OLD.documento, :OLD.sueldo, :NEW.sueldo);
    END tr_aumentasueldo;

--Ejecuciones de prueba
UPDATE empleados e SET e.sueldo = 600
WHERE e.documento = '22333444'; -- Este caso si se ejecuta por ser una consulta sde actualizacion simple
UPDATE empleados e SET e.sueldo = 600
WHERE e.seccion = 'Secretaria'; -- En este caso solo se aplica a una sola fila pues la otra no recibio un aumento pero se actualizo igual

--------------------------------------------------------------------------------------------------------------------------------

--Ejercicio 2 : Trigger que coloque apellido en mayuscula y si se coloca el sueldo en null que lo traiga en 0
CREATE OR REPLACE TRIGGER tr_actualiza_datos
BEFORE INSERT 
ON empleados
FOR EACH ROW
    BEGIN 
        :NEW.apellido := UPPER(:NEW.apellido);
        IF :NEW.sueldo IS NULL THEN
            :NEW.sueldo := 0;
        END IF;
    END tr_actualiza_datos;

--Ingreso de valor de prueba
INSERT INTO empleados VALUES (12009090, 'sonIDO', 'Satanas', 'Contaduria', null);

--Leer la tabla
SELECT * FROM control;
SELECT * FROM empleados;