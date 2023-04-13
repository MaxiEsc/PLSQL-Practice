/*

Codicionales IF-ELSE-ELSIF

SOn estructuras detoma de deciciones en donde el progrmador necesita especificar su evaluacion en el mismo programa
estas declaraciones se ejecutaran si se determina la condicion es verdadera y ocasionalmente y si no

*/

DECLARE 

--a NUMBER(2) := 40;
--b NUMBER(2) := 20;
numero NUMBER(3) := 130;


BEGIN

--IF a > b THEN
-- DBMS_OUTPUT.put_line(a || ' Es mayor que ' || b);
-- ELSE
-- DBMS_OUTPUT.put_line(b || ' Es mayor que ' || a);
-- END IF;
    
    IF(numero = 10) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 20) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 30) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 40) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 50) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 60) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 80) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 90) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSIF(numero = 100) THEN
    DBMS_OUTPUT.put_line('El valore del numero es ' || numero);
    ELSE 
    DBMS_OUTPUT.put_line('Ninguno de estos valores se ha encontrado');
    DBMS_OUTPUT.put_line('El valor en contrado es ' || numero);
    
END IF;

    
 
END;
 