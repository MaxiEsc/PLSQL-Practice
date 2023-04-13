/*
String En PlSQL 

Un string es un tipo de dato que se utiliza para representar una cadena de caracteres. Un string puede contener cualquier combinación de letras, números y caracteres especiales, y su longitud puede ser variable.
En PL/SQL, los strings se declaran utilizando la palabra clave "VARCHAR2". Por ejemplo, la siguiente declaración crea una variable llamada "mi_string" de tipo VARCHAR2 con una longitud máxima de 100 caracteres:

PL/SQL
mi_string VARCHAR2(100);
Los strings en PL/SQL se pueden asignar a variables, pasar como argumentos a procedimientos y funciones, y se pueden concatenar utilizando el operador "||". Por ejemplo:

PL/SQL

mi_string := 'Hola ' || 'mundo'; Ejemplo

CLOB es un tipo de dato que permite manejar una gran cantidada de texto
*/

--SET SERVEROUTPUT ON;
--
--DECLARE
--nombre VARCHAR2(20);
--direccion VARCHAR2(30);
--detalles CLOB;
--eleccion CHAR(1);
--
--BEGIN
--
--nombre := 'Sonic FEO';
--direccion := 'La paz 679';
--detalles := 'Este es el detalle de la variable clob que iniciamos en la 
--seccion declarativa, es una variable de gran almacena';
--eleccion := 'y';
--IF eleccion = 'y' THEN
--DBMS_OUTPUT.PUT_LINE(nombre);
--DBMS_OUTPUT.PUT_LINE(direccion);
--DBMS_OUTPUT.PUT_LINE(detalles);
--END IF;
--
--END;

--SET SERVEROUTPUT ON;
--
--DECLARE
--    saludo VARCHAR2(12) := 'Hola A TODOS';    
--BEGIN
--    DBMS_OUTPUT.PUT_LINE(UPPER(saludo)); -- Convierte a mayuscula
--    DBMS_OUTPUT.PUT_LINE(LOWER(saludo)); -- Convierte a minusculas
--    DBMS_OUTPUT.PUT_LINE(INITCAP(saludo)); -- Convierte a enmayuscula las primeras letras el resto no
--    DBMS_OUTPUT.PUT_LINE(SUBSTR(saludo,1,8)); -- busca una cantidad de caracter especifica los argumentos es desde y el ssegundo argumentos es cuantos caracteres
--    DBMS_OUTPUT.PUT_LINE(SUBSTR(saludo,3)); -- busca una cantidad de caracter especifica los argumentos es desde y el ssegundo argumentos es cuantos caracteres apartir del caracter 3 
--    DBMS_OUTPUT.PUT_LINE(INSTR(saludo,'t')); -- busca una la primera posicion en coincidencia con el argumento.
--    
--END;

SET SERVEROUTPUT ON;

DECLARE
    saludo2 VARCHAR2(30) := '####HOLA A todos####';    
BEGIN

    DBMS_OUTPUT.PUT_LINE(RTRIM(saludo2, '#')); -- Corta los caracteres del argumento del lado derecho
    DBMS_OUTPUT.PUT_LINE(LTRIM(saludo2, '#')); -- Corta los caracteres del argumento del lado izquierdo
    DBMS_OUTPUT.PUT_LINE(TRIM('#' FROM saludo2)); -- Corta los caracteres del argumento de la variable
    
END;




