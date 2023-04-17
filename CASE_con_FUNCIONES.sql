/*
Condicional CASE 
SE puede establacer condiciones a cumplir

*/

--Ejercicio 1
--Funcion que devuelve entero de los dias de la semana
CREATE OR REPLACE FUNCTION f_diasemana(numero INT)
RETURN VARCHAR2
IS 
    dia VARCHAR2(25);
    BEGIN
    dia := '';
    CASE numero
    WHEN 1 THEN dia := 'Lunes';
    WHEN 2 THEN dia := 'Martes';
    WHEN 3 THEN dia := 'Miercoles';
    WHEN 4 THEN dia := 'Jueves';
    WHEN 5 THEN dia := 'Viernes';
    WHEN 6 THEN dia := 'Sabado';
    WHEN 7 THEN dia := 'Domingo';
    ELSE dia := 'Numero Incorrecto';
      END CASE;
    RETURN dia;
END;

--Ver dia de la semana
--SELECT f_diasemana(3) AS "Dia de la semana es: " FROM dual;   

--Ejercicio 2: Funcion que devuelve el numero del trimestre en base a la fecha ingresada
CREATE OR REPLACE FUNCTION f_trimestre(fecha DATE)
RETURN VARCHAR2
IS 
    mes VARCHAR2(20);
    trimestre NUMBER;
    BEGIN 
    mes := EXTRACT(MONTH FROM fecha);
    trimestre := 0;
    CASE mes
        WHEN 1 THEN trimestre := 1;
        WHEN 2 THEN trimestre := 1;
        WHEN 3 THEN trimestre := 1;
        WHEN 4 THEN trimestre := 2;
        WHEN 5 THEN trimestre := 2;
        WHEN 6 THEN trimestre := 2;
        WHEN 7 THEN trimestre := 3;
        WHEN 8 THEN trimestre := 3;
        WHEN 9 THEN trimestre := 3;
        WHEN 10 THEN trimestre := 4;
        WHEN 11 THEN trimestre := 4;
        WHEN 12 THEN trimestre := 4;
        ELSE mes := 'Mes NO VALIDO, Ingrese de vuelta';
    END CASE;
    RETURN trimestre;
END;

--Ver la funcion
SELECT f_trimestre(TO_DATE('07/2/2021','dd/mm/yyyy')) AS Trimestre FROM dual;

--Eliminar funcion
DROP FUNCTION f_diasasemana;
