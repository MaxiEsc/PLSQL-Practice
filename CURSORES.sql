/*
Cursores

Es un puntero que se maneja por sentencia selects y esta formado por un conjunto de registros que se devuelven

cursores explicitos e cursores implicitos

cursores implicitos: estos devuelven un solo registro, cuando se jecutan un select, update odelete se le asocia un registro y permite la devolucion del mismo
cursores explicitos: Permite la devolucion de la sentencia select cuando esta devuleve varios registros, tambien se pueden utilizar en consultas donde se devuelven un solo registro

Estos cursores tiene atributos siendo estos:
- %ISOPEN: devuelve true si el cursor esta abierto
- %FOUND: devuelve true si el registro fue satisfactoriamente procesado
- %NOTFOUND: devuelve true si el registro no se pudo procesar
- %ROWCOUNT: devuelve el numero de registros que fueron procesadoshasta ese entonces.


Codigo para ejercitarse

drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );
 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
 insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
 insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500);
*/

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

--Ejercicio 1: se crea un programa que permite la actualizacion de sueldoa epmleados que tienen un sueldo menor a 9000 por lo que
--si encuentran un empleado con sueldo menor a dice empleados actualizados y si no... no hay empleados disponibles

DECLARE 
    filas number(2);
BEGIN
    UPDATE empleados e SET e.sueldo = sueldo + 500
    WHERE e.sueldo > 300;
    IF SQL%NOTFOUND THEN
    dbms_output.put_line('==NO HAY EMPLEADOS DISPONIBLES==');
    ELSIF SQL%FOUND THEN
    filas := SQL%ROWCOUNT;
    dbms_output.put_line( filas || ': EMPLEADOS ACTUALIZADOS ');
    END IF;
END;

--LEER LA BASE DE DATOS
SELECT * FROM empleados;