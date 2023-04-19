/*
Paquetes en PLSQL
Un grupo logico de objetos de la BD como lo son:
Registros PLSQL
Variables
Estructuras de datos
etc.

compuesto por escificacion y cuerpo siendo la primera obligatoria

PAQUETES
*/

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

--Ejercicio 1 : Creacion basica de un paquete
--Especificacion de producto
CREATE OR REPLACE PACKAGE pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE);
END pck_productos;

--CREACION DEL CUERPO(BODY) DEL PAQUETE
CREATE OR REPLACE PACKAGE BODY pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE) IS
v_nombre_producto productos.nombre%TYPE;
v_precio productos.precio%TYPE;
BEGIN
    SELECT nombre,precio INTO v_nombre_producto,v_precio 
    FROM productos 
    WHERE codigo = v_codigo;
    DBMS_OUTPUT.PUT_LINE('Articulo : ' || v_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio -> ' || v_precio);
    END proc_caracteristicas;
END pck_productos;

--EJECUCION DE PAQUETE
BEGIN
    pck_productos.proc_caracteristicas(5);
END;

-------------------------------------------------------------------------------------------------------------------------
--Ejercicio 2 : Agregar un nuevo objeto
--Trabajar sobre el explorador de paquetes

--EN PCK_PRODUCTO colocar la nueva funcion
create or replace PACKAGE pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE);

FUNCTION f_precio (v_codigo int)
RETURN NUMBER;

END pck_productos;

--EN PCK_PRODUCTOS Body Colocar la actualizacion del nuevo objeto
create or replace PACKAGE BODY pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE) IS
v_nombre_producto productos.nombre%TYPE;
v_precio productos.precio%TYPE;
BEGIN
    SELECT nombre,precio INTO v_nombre_producto,v_precio 
    FROM productos 
    WHERE codigo = v_codigo;
    DBMS_OUTPUT.PUT_LINE('Articulo : ' || v_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio -> ' || v_precio);
    END proc_caracteristicas;
    
    ------------------------------------------------------------------------------------
    --Agregar funcion para el explorador
    FUNCTION f_precio (v_codigo int)
    RETURN NUMBER
    AS
    v_precio NUMBER;
        BEGIN
        SELECT precio INTO v_precio
        FROM productos WHERE codigo = v_codigo;
        RETURN v_precio;
    END f_precio;
    
    -------------------------------------------------------------------------------------
    
END pck_productos;

--luego compilar en ambas secciones

---------------------------------Nueva seccion-------------------------------------------
--Ejercicio 3: Paquetes con doble argumentos y funcion de calculo de ventas por mayor y aumento de precio 


----------------------------------------------------------------------------------------------------------------------------

--Como en el ejercicio 2 Reeditar las funciones
--PCK_PRODUCTOS

create or replace PACKAGE pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE);

FUNCTION f_precio (v_codigo int)
RETURN NUMBER;

FUNCTION f_proximo_aumento (v_codigo int)
RETURN NUMBER;

PROCEDURE proc_unidades(v_codigo productos.codigo%TYPE, v_unidades productos.codigo%TYPE);

FUNCTION f_total_por_unidades (v_codigo int, v_unidades INT)
RETURN NUMBER;

END pck_productos;

--PCK_PRODUCTOS Body

create or replace PACKAGE BODY pck_productos AS
PROCEDURE proc_caracteristicas(v_codigo productos.codigo%TYPE) IS
v_nombre_producto productos.nombre%TYPE;
v_precio productos.precio%TYPE;
BEGIN
    SELECT nombre,precio INTO v_nombre_producto,v_precio 
    FROM productos 
    WHERE codigo = v_codigo;
    DBMS_OUTPUT.PUT_LINE('Articulo : ' || v_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio -> ' || v_precio);
    END proc_caracteristicas;
        -------------------------------------------------------------------------------------
--Nuevo procedimiento
PROCEDURE proc_unidades(v_codigo productos.codigo%TYPE, v_unidades productos.codigo%TYPE) IS
v_nombre_producto productos.nombre%TYPE;
v_precio productos.precio%TYPE;
v_cod_fabricante  productos.codigo_fabricante%TYPE; 
BEGIN
    SELECT nombre,precio,codigo_fabricante INTO v_nombre_producto,v_precio,v_cod_fabricante
    FROM productos 
    WHERE codigo = v_codigo;
    DBMS_OUTPUT.PUT_LINE('Articulo : ' || v_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio -> ' || v_precio);
    DBMS_OUTPUT.PUT_LINE('Cod. Fabricante [' || v_cod_fabricante || ']');
END proc_unidades;
    
------------------------------------------------------------------------------------
--Agregar funcion para el explorador
FUNCTION f_precio (v_codigo INT)
RETURN NUMBER
    AS
    v_precio NUMBER;
        BEGIN
        SELECT precio INTO v_precio
        FROM productos WHERE codigo = v_codigo;
        RETURN v_precio;
    END f_precio;
    
----------------------------------------------------------------------------------------
--Nuevo - aumento de precio
FUNCTION f_proximo_aumento (v_codigo INT)
RETURN NUMBER
    AS
    v_precio NUMBER;
        BEGIN
        SELECT precio + (precio * 0.15) INTO v_precio
        FROM productos WHERE codigo = v_codigo;
        RETURN v_precio;
    END f_proximo_aumento;

-----------------------------------------------------------------------------------------

--Nuevo - Total por unidades
FUNCTION f_total_por_unidades (v_codigo int, v_unidades int)
RETURN NUMBER
    AS
    v_precio NUMBER;
        BEGIN
        SELECT precio * v_unidades INTO v_precio
        FROM productos WHERE codigo = v_codigo;
        RETURN v_precio;
    END f_total_por_unidades;
    
END pck_productos;

----------------------------------------------------------------------------------------------




