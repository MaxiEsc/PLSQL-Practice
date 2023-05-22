--Validacion de paquetes 

--'Trabajar sobre HR'

--Creamos un paquete con todo lo que conlleva
CREATE OR REPLACE PACKAGE paq01 IS 
FUNCTION fun01 RETURN NUMBER;
PROCEDURE proc01;
PROCEDURE proc02;
END;

--Vemos el estado del paquete todo bien hasta ahora
SELECT * FROM user_objects WHERE object_name = 'PAQ01';

--Ahora a crear el body del paquete con procedimiento incluido
CREATE OR REPLACE PACKAGE BODY paq01
IS
FUNCTION fun01 RETURN NUMBER IS
BEGIN
    RETURN 0;
    END;
    
--ahora el proc que tiene integrado el paquete
PROCEDURE proc01 IS 
    BEGIN
    NULL;
    END;
--Ahora segundo paquete
PROCEDURE proc02 IS 
    BEGIN
    NULL;
    END;
END;

