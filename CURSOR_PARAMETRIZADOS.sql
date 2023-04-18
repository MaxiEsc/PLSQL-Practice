/*
Cursores con parametros


Codigo necesario para la practica:

drop table productos;

create table productos(
id_producto int not null,
nombre_producto VARCHAR2(25),
precio NUMBER(6,2),
descripcion VARCHAR2(50));

insert into productos values(1,'Abrazadera',560,'Abrazadera de media pulgada');
insert into productos values(2,'Destornillador',120,'destornillador cabeza plana');
insert into productos values(3,'Martillo',300,'Martillo con ganzua'); 
insert into productos values(4,'Llave inglesa',200,'Llave inglesa de plomeria');
insert into productos values(5,'Pasadores RTR',935,'Tuerca exagonal de Almenada');
insert into productos values(6,'Tornillo exagonal',90,'Tornillo exagonal de baja o tuerca');

conceptos interezantes en este ejercicio

CURSOR c_productos (idproductos productos.id_producto%TYPE ): Declaracion de un Cursor con parametro este lleva el tipo de dato 
de productos.id_producto%TYPE en donde este se le pasara a la hora de abrir el cursor 

c_productos(2): el 2 es el parametro del cursor

LOOP --Este se utilizara para extraer en el fetch lo que sea necesario
FETCH c_productos INTO v_nombre, v_precio; --Con esto extrae dentro del loop los valores del cursos dentro de las variables declaradas
EXIT WHEN c_productos%NOTFOUND; -- Con esto sale del loop cuando ya no encuetre mas datos en el regisstro
END LOOP; -- Finaliza la sentencia del loop

con la consulta de ariba lo que va ha hacer el
CURSORES_PARAMETROS
*/

--Ejercicio 1: trae los datos de un registro productos mediante el id de producto mediante cursores con argumento
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE 
    v_nombre productos.nombre_producto%TYPE;
    v_precio productos.precio%TYPE;
    
    CURSOR c_productos (idproductos productos.id_producto%TYPE )
    IS 
        SELECT nombre_producto, precio FROM productos
        WHERE id_producto = idproductos;
BEGIN
    OPEN c_productos(7);
    LOOP 
    FETCH c_productos INTO v_nombre, v_precio;
    EXIT WHEN c_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Articulo: ' ||  v_nombre || ' Precio: ' || v_precio );
    END LOOP;
    CLOSE C_productos;
END;

--DBMS_OUTPUT.PUT_LINE('ALGO');


--Leer tabla
--SELECT * FROM productos;