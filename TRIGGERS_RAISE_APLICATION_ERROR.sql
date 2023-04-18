/*
TRIGGERS RAISE_APLICATION_ERROR

nos permite definir errores configurados en caso que el usuario cometa un error entonces digamos son como los bloques "try/catch"

codigo para la para la activad

drop table empleados;
 drop table control;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  operacion varchar2(30)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contaduria',3000);

TRIGGERS_RAISE_APLICATION_ERROR
*/

--Trigger de control bajo ciertas condiciones en caso del que el usuario o quien modifique la tabla empleados
--controlara el sueldo que no sea mayor a 5000 tambien controla que no se pueda cambiar el DNI
--controla que no se puede eliminar puesto gerencia
CREATE OR REPLACE TRIGGER tr_control_empleados
BEFORE INSERT OR UPDATE OR DELETE
ON empleados
FOR EACH ROW
    BEGIN 
        IF ( :NEW.sueldo > 5000 ) THEN 
            RAISE_APPLICATION_ERROR( -20000, 'SUELDO NO PUEDE SUPERAR LOS $5000.00');
        END IF;
        INSERT INTO control VALUES (USER, SYSDATE, 'INSERCION DATOS');
        IF ( :OLD.seccion = 'Gerencia') THEN
            RAISE_APPLICATION_ERROR(-20000, 'NO SE PUEDE ELIMINAR EL PUESTO DE GERENCIA' );
        END IF;
        INSERT INTO control VALUES(USER, SYSDATE , 'BORRADO');
        IF UPDATING('documento') THEN
            RAISE_APPLICATION_ERROR(-20000, 'NO SE PUEDE ACTUALIZAR EL DOCUMENTO');
        END IF;
END tr_control_empleados;

--Probar el trigger
INSERT INTO empleados VALUES ('2356674', 'Sores', 'Manuel', 'calle 12', 'Informatica', '6000'); --Levanta un raise que evita la insercion y muestra mensaje error

DELETE FROM empleados e WHERE e.documento = '2356674'; --Levanta un raise que evita la eliminacion de un puesto de gerencia y muestra mensaje error

UPDATE empleados e SET e.documento = '11111111'
WHERE e.documento = '2356674'; --Levanta un raise que evita la edicion de un documento y muestra mensaje error

--Leer las tablas
SELECT * FROM empleados;
SELECT * FROM control;