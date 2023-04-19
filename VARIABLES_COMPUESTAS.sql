/*
Variables compuestas

Son variables que nos permiten guardar distintos valores de registros con distintos tipos de datos, en una misma variable

codigo necesario para la practica:

drop table productos;

create table productos (
codigo int not null primery key,
nombre varchar2(100) not null,
precio number(6,2) not null,
codigo_fabricante int not null
);

insert into productos values(1, 'Disco duro SATA· 1TB', 86.99, 5);
insert into productos values(2 , 'Memoria RAM DDR4 8GB', 120, 6);
insert into productos values(3, 'DISCO SSD 1 TB', 150.99, 4);
insert into productos values(4, 'GEFORCE GTX 1050Ti', 185, 7);
insert into productos values(5, 'GEFORCE GTX 1080TI', 755, 6);
insert into productos values(6, 'Monitor 24 LED Full HD', 202, 1);
insert into productos values(7, 'Monitor 27 LED Full HD', 245.99, 1);
insert into productos values(8, 'Portátil Yoga 520', 559, 2);
insert into productos values(9, 'Portátil Ideapd 320', 444, 2);
insert into productos values(10, 'Impresora HP Deskjet 3720', 59.99, 3);
insert into productos values(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

Interezante: A pesar de ya haberlo visto "reg_productos" es una variable compuesta basada en una tabla
si quiero una variable compuesta siempre se de tipo ROWTYPE

VARIABLES_COMPUESTAS

*/

--Ejercicio 1: Variable compuesta basada en una tabla
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    reg_productos productos%ROWTYPE;
BEGIN
    SELECT * INTO reg_productos FROM productos
    WHERE codigo = 3;
        DBMS_OUTPUT.PUT_LINE('CARACTERISTICAS DEL PRODUCTO');
        DBMS_OUTPUT.PUT_LINE('Codigo del producto: ' || ' ' || reg_productos.codigo) ;
        DBMS_OUTPUT.PUT_LINE('Articulo: ' || ' ' || reg_productos.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || ' ' || reg_productos.precio);
        DBMS_OUTPUT.PUT_LINE('Serial: ' || ' ' || reg_productos.codigo_fabricante);
END;

---------------------------------------------------------------------------------------------------------------------
--Ejercicio 2: Variable compuesta a nivel de cursor

DECLARE
    CURSOR cr_productos IS
    SELECT * FROM productos;
    var_productos cr_productos%ROWTYPE;
BEGIN
    OPEN cr_productos;
    LOOP
        FETCH cr_productos INTO var_productos;
        EXIT WHEN cr_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(var_productos.codigo || ' - ' || var_productos.nombre || ' || Precio -> ' || var_productos.precio);
    END LOOP;
END;

--Leer tabla
SELECT * FROM productos; 