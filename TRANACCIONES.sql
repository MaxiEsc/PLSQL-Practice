/*
TRANACCIONES

unidad atomica de trabajo que puede contar con una o mas sentencias sql  relacionadas entre si, se le dice atomica debido a que 
modificaciones de BD SQL provocadas por las sentencias SQL de transacciones pueden confirmrse de manera colectiva, lo que 
puede hacerse o deshacerse permante en la base de datos

Codigo necesario para la practica

drop table clientes;
create table clientes(
id_cliente int not null,
nombre varchar2(30),
edad numeric(2),
direccion varchar(60),
salario number(6,2));

--SOLO HACER ESTOS INSERTS PRIMERO
insert into clientes values (1,'Ramon Rodriguez',32,'Calle primera numero 001',2000.00); 
insert into clientes values (2,'Jose Tomas',25,'Calle segunda numero 002',1500.00); 
insert into clientes values (3,'Ana Jimenez',23,'Calle tercera numero 003',2000.00); 
insert into clientes values (4,'Emilio Contreras',25,'Calle cuarta numero 004',6500.00); 
insert into clientes values (6,'Pedro Sandoval',22,'Calle quinta numero 005',4500.00); 
--------------------------------------------------------------------------------------------

--INSERTS 2
insert into  clientes values (7,'Esther Sanchez',27,'Calle sexta numero 006',5500.00 ); 
insert into  clientes values (8,'Antonio Peralta',21,'Calle septima numero 007',4500.00 ); 

TRANSACCIONES

*/

--Permite volver los datos de la base de datos de manera permanente en ese momento anula los savepoints
COMMIT;

--Regresa al estado anterior de la consulta previa, siempre y cuando no sea un commit
ROLLBACK;

--Punto de restauracion para su posible restauracion no funciona tras haber hecho un commit
SAVEPOINT punto1;

--Restauracion a un punto No funciona tras un commit de datos
ROLLBACK TO punto1;

UPDATE clientes c SET c.salario = c.salario + 100;
COMMIT;

--INSERTS 
insert into  clientes values (7,'Esther Sanchez',27,'Calle sexta numero 006',5500.00 ); 
insert into  clientes values (8,'Antonio Peralta',21,'Calle septima numero 007',4500.00 ); 

--leer tabla
SELECT * FROM clientes;