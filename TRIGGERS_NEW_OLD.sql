/*
TRIGGERS :NEW :OLD

Los valores se almacenan en tablas temporales
los nuevos valores se consideran :NEW y los viejos como :OLD

Codigo para practicar:

CODIGO:
drop table libros;
drop table ofertas;

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
 );
 create table ofertas(
  codigo number(6),
  precio number(6,2),
  usuario varchar2(20),
  fecha date
 );
 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
 TRIGGERS_NEW_OLD
 
*/
--Ejercicio 1 : Nuevo datos en el trigger de la tabla temporal
--se crea un trigger que ingresa en la tabla ofertas cuando el precio es menor a 30 se agrega automaaticamente en ofertas
CREATE OR REPLACE TRIGGER tr_ingresalibros
BEFORE INSERT
ON libros
FOR EACH ROW
BEGIN
    IF (:NEW.precio <= 30) THEN
        INSERT INTO ofertas VALUES(:NEW.codigo, :NEW.precio, USER, SYSDATE);
    END IF;
END TR_ingresalibros;

--valores de prueba de
--INSERT INTO LIBROS VALUES(213, 'VERDE VERDODO VERDIN','JESUS Y LA BIBLIA', 'Judios INC.', 12); --Si se agrega gracias al precio
--INSERT INTO LIBROS VALUES(213, 'NAVIDAD','JESUS Y LA BIBLIA', 'Judios INC.', 43); --No se agrega gracias al precio 

---------------------------------------------------------------------------------------------------------------------------------

--Ejercicio 2 : Nuevo y vijeos datos en el trigger de la tabla temporal
--se crea un trigger que ingresa en la tabla ofertas cuando el precio es menor a 30 se agrega automaaticamente en ofertas
CREATE OR REPLACE TRIGGER TR_ACTUALIZALIBRO
BEFORE UPDATE OF precio
ON libros 
FOR EACH ROW
    BEGIN
    IF(:OLD.PRECIO <= 30 ) AND (:NEW.PRECIO > 30) THEN
        DELETE FROM ofertas WHERE codigo = :OLD.codigo;
    END IF;
     IF(:OLD.PRECIO >= 30 ) AND (:NEW.PRECIO < 30) THEN
        INSERT INTO ofertas VALUES(:NEW.codigo, :NEW.precio, USER, SYSDATE, :NEW.titulo);
    END IF;
END TR_ACTUALIZALIBRO; 

--Valores de prueba
UPDATE libros l SET l.precio = 9
WHERE l.titulo = 'Uno'; --Funciona por la reduccion de precio
UPDATE libros l SET l.precio = 15
WHERE l.titulo = 'Aprenda PHP'; --Funciona por la reduccion de precio

--Leer la tablas:
SELECT * FROM libros;
SELECT * FROM ofertas;