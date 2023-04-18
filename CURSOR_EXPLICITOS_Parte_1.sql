/*
CURSOR EXPLICITOS

ciclo del cursor

Se lo declara: se crea en un area de declaracion de SQL
Se lo abre: identifica el set de registros
Fetch: carga el contendio del registro en variables
esta vacio? : Prueba para las filas existentes si si se cierra si no vueleve al fecth

*/

/*Ejercicio 1 : Crear un cursor explicito que 
v_documento empleados.documento%TYPE : Crea una variable v_documento del tipoempleados.documento%TYPE esto se significa 
que localiza la tabla empleado y copia el tipo de datos del campo documento y lo asigna en la variable v_documento

CURSOR c_cursor2 IS : Este cursor explicito toma los datos del select (Estos datos :documento, nombre, apellido, sueldo en ese orden)
donde el documento = 22222222; toma esos datos y se guardan en ese cursor
OPEN c_cursor2: Con esto se habre el cursor es necesario para poder hacer algo con el 
FETCH c_cursor2 INTO v_documento, v_nombre, v_apellido, v_sueldo: Se extraen todos los registros del cursor2 y con el in
se los coloca dentro de las variables que se declararon anteriormente.
*/

-- Habilitar la consola de la base de datos

SET SERVEROUTPUT ON;

DECLARE 
    v_documento empleados.documento%TYPE;
    v_nombre empleados.nombre%TYPE;
    v_apellido empleados.apellido%TYPE;
    v_sueldo empleados.sueldo%TYPE;

    CURSOR c_cursor2 IS
        SELECT documento, nombre, apellido, sueldo
        FROM empleados
        WHERE documento = 22222222;
BEGIN
    
    OPEN c_cursor2 ;
    
    FETCH c_cursor2 INTO v_documento, v_nombre, v_apellido, v_sueldo;
    CLOSE c_cursor2;
    DBMS_OUTPUT.PUT_LINE('Documento: ' || v_documento);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || v_apellido);
    DBMS_OUTPUT.PUT_LINE('Sueldo: ' || v_sueldo);

END;