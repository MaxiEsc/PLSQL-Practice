/*
Procedimientos almacenados - VARIABLES

espacion de memoria en la base de datos
 
 
 Codigo necesario para la practica
 
 create table tabla1( 
   titulo varchar2(40),
   precio number(6,2)
  );
  
 creacion del procedimiento

   create or replace procedure autorlibro(atitulo in varchar2)
 as
   v_autor varchar2(20);
 begin
  select autor into v_autor from libros where titulo=atitulo;
  insert into tabla1
   select titulo,precio
   from libros
   where autor=v_autor;
 end autorlibro;
 
 execute autorlibro('El quijote');
*/
  
/* creacion del procedimiento*/
--  El into funciona como un introductor del autoren v_autor que mas tarde se usara para comparar el autor de la tabla de libros
-- entonces en tabla1 se elegiran el titulo y precio de libros
--   CREATE OR REPLACE PROCEDURE autorlibro(atitulo IN VARCHAR2)
-- AS
--   v_autor VARCHAR2(20);
-- BEGIN
--  SELECT autor INTO v_autor FROM libros WHERE titulo = atitulo;
--  INSERT INTO tabla1
--   SELECT titulo,precio
--   FROM libros
--   WHERE autor = v_autor;
-- END autorlibro;

--SELECT * FROM libros;
 
 execute autorlibro('Gueerra');
 
 --leer libro
 SELECT * FROM libros;
 SELECT * FROM tabla1;