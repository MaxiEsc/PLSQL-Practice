/*

Constantes en PLSQL

Su funcion es similiar en otros lenguajes.

*/

DECLARE
mensaje CONSTANT VARCHAR2(30) := 'Buenos dias para todos';
numero CONSTANT NUMBER (6) := 40009;

BEGIN

--Asignacion es imposible porque es constante
--mensaje := 'Verde';

DBMS_OUTPUT.PUT_LINE(mensaje);
DBMS_OUTPUT.PUT_LINE(numero);


END;