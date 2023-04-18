/*
Triggers Disparadores

bloque de codigo que se ejecute automaticamente debido a alguna accion

mantien la coherencia ente tablas 
registra los cambios
sirve como disparadores sobre una modificacion en una tabla
inserta actualiza o elimina datos de una tabla.

--Reglas
no se pueden invocar
se ejecuta automaticamente, al modificar una tabla
no reciben ni retiornan parametros
no generan conultan

tipos de Triggers 
Los que se ejecutan antes(before) o despues(after) luego de una sentencia
Aquellos que se disparan por realizar un insert, update o delete en una tabla
triggers por nivel se ejecutan para cada fila 

Codigo para la practica

 --borrar tablas (si existen)
 drop table libros;
 drop table control;

 --crear tablas
 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );
 create table control(
  usuario varchar2(30),
  fecha date
 );
 
 --Before insert : Control antes de insertar datos en la tabla libros
 Formato de fecha recomendado
 DD/MM/RRRR HH24:MI:SS
 
*/

--Crear Trigger o disparador 
--CREATE OR REPLACE TRIGGER tr_ingresolibros
--BEFORE INSERT
--ON libros
--BEGIN 
--INSERT INTO control VALUES (USER, sysdate);
--END tr_ingresolibros;

--Ingresamos algo en la tabla libro para en control si inserten datos
INSERT INTO libros VALUES (100, 'DOS', 'Santillana', 'Tierra' , 25);

INSERT INTO libros VALUES (110, 'TRES', 'Stewart', 'Analisis' , 69);

--Localizar el trigger
SELECT * FROM USER_TRIGGERS WHERE TRIGGER_NAME = 'tr_ingresolibros';

--Leer tablas
SELECT * FROM libros;
SELECT * FROM control;