/*
Consultas jerarquicas 

Es una consulta que se realiza en una tabla en donde datos dse encuetran determinados de una manera jerarquicas, osea los datos 
se encadenan siguiendo una estructura jerarquica, por lo que por ejemplo exixten padres e hijos y puede llegar a realizarse 
consultas recursivas

codigo para la practica

drop table empleados;
create table empleados (
id_empleado int not null primary key,
nombre varchar(20) not null,
id_puesto char(20),
id_supervisor int null
);
insert into empleados values(100,'Miguel Gonzales','PRESIDENTE',null);           
insert into empleados values(101,'Federico Antillana','VICE_PRESIDENTE',100);
insert into empleados values(102,'MIguel Montero','GERENTE_GRAL',100);
insert into empleados values(103,'Manuel Saldaños','IT_GERENTE',102);
insert into empleados values(104,'Ana Montesinos','SOPORTE_IT',103);
insert into empleados values(105,'Manuel Figueroa','SOPORTE_IT',103);
insert into empleados values(106,'Eliana Sandoval','SOPORTE_IT',103);
insert into empleados values(107,'Iluminada Contreras','SOPORTE_IT',103);
insert into empleados values(108,'Manuela Condado','SECRETARIA',101);
insert into empleados values(109,'Emilia Cortinez','SECRETARIA',102);
insert into empleados values(110,'Denia Soler','SECRETARIA',103);
insert into empleados values(111,'Barbara Eleonor','SECRETARIA',101);
insert into empleados values(112,'Fausto Melaneo','VENDEDOR',102);
insert into empleados values(113,'Adalberto Mirabal','VENDEDOR',102);
insert into empleados values(114,'Estelvina Zorrilla','VENDEDORA',102);
insert into empleados values(115,'Mireya Matos','ASISTENTE_SECRETARIO',108);
insert into empleados values(116,'Elena Martinez','ASISTENTE_SECRETARIO',109);

Interezante 

LEVEL: palabra reservada de la base de datos oracle sql, que nos permite traer un orden jerarquico se gun la jerarquia
START WITH: Con esto le decimos tiene que comenzar con la primer dato en esa jerarquia en este caso ha sido el nombre y es el 
presidente de la empresa
CONNECT BY PRIOR: identifica la relacion entre dos campos en este caso ha sido el campos de id_empleado = id_supervisor; y 
eso hace que organiza la jerarquia

-------------------------------
Otra forma de hacerlo esta:
SELECT nombre, id_puesto, SYS_CONNECT_BY_PATH( campo , '/') 
en este caso nos basaremos, en el campo o lo que se introduzca y lo separaremos con el caracter que se introduzca en el 
segundo argumento.

*/

--Ejercicio 1: ordenar con esta consulta los niveles
--Comenzado con la clausula level
SELECT nombre, id_puesto, LEVEL FROM empleados
START WITH nombre = 'Miguel Gonzales'
CONNECT BY PRIOR id_empleado = id_supervisor;

--Leer tabla
SELECT * FROM empleados;

--------------------------------------------------------------------------------------------------------------------------------
--Ejercicio 2: Otra forma de organizar la jerarquia es 
--Comenzado con la clausula level
SELECT nombre, id_puesto, SYS_CONNECT_BY_PATH( nombre , ' -> ') JERARQUIA
FROM empleados
START WITH id_supervisor IS NULL
CONNECT BY PRIOR id_empleado = id_supervisor;
