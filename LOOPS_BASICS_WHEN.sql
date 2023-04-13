/*

Bucles(LOOPS)

Como en los lenguaje de programacion

CLAUSULAS

LOOP:
loop
    *algo*
end loop;

WHILE:
while condicion loop
    *algo*
end loop;

FOR:
for contador in valor1,valor2...,valorn loop
    *algo*
end loop;

LOOPS ANIDADOS

loop principal
    *algo*
    loop anidado
        *algo*
    end loop anidado;
end loop principal;


EXIT: cortar el loop principal es como un break


*/

SET SERVEROUTPUT ON;

DECLARE

valor number :=10;

BEGIN

DBMS_OUTPUT.PUT_LINE (valor);

LOOP 
valor := valor + 1;
--    IF valor > 50 THEN
--    EXIT;
--    END IF;
    EXIT WHEN valor > 50;
    DBMS_OUTPUT.PUT_LINE('Valor = ' || valor);
END LOOP;
 DBMS_OUTPUT.PUT_LINE('Valor Final = ' || valor);
END;