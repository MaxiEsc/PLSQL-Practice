/*
Variables

Como en los demas lenguajes un espacio en la memoria en el cual se el asigna a un nombre

Codigo para estudio:

set serveroutput on

DECLARE 
identificador integer := 50;
nombre varchar2(25):= 'Jose Feliciano';
apodo char(10):= 'joselo';
sueldo number(5):=30000;
comision decimal(4,2):=50.20;
fecha_actual date :=(sysdate);
fecha date:=to_date('2020/07/09','yyyy/mm/dd');
saludo varchar2(50) default 'Buenos dias a todos';

BEGIN 
dbms_output.put_line('El valor de la variable es: ' || identificador);
dbms_output.put_line('El nombre del usuario es: ' || nombre);
dbms_output.put_line('El apodo del usuario es: ' || apodo);
dbms_output.put_line('El sueldo del usuario es: ' || sueldo);
dbms_output.put_line('La comision a cobrar del usaurio es de :' || comision);
dbms_output.put_line('La fecha actual es: ' || fecha_actual);
dbms_output.put_line('La fecha de contratación es : ' || fecha);
dbms_output.put_line(saludo);

END;

ejemplo de nombre


varchar2 vs char
varchar2 : el sistema los acorte a los que no se usan
char: los espacios se utilizan todo aun asi esten vacios
decimar(4,2): permite solo 4 decimales numeros y 2 decimales 

dbms_output.put_line : Paquete de plsql que permite la salida de los datos, 
*/

--Sirve para habilitar la salida de codigo en la pantalla de script
SET SERVEROUTPU ON

DECLARE
identificador integer := 50;
nombre varchar2(25):= 'Martin Gil';
apodo char(10):= 'MAgil';
sueldo number(5):=30000;
comision decimal(4,2):=50.20;
fecha_actual date :=(sysdate);
fecha date:=to_date('2020/07/09','yyyy/mm/dd');
saludo varchar2(50) default 'Buenos dias a todos';
BEGIN

dbms_output.put_line('El valor de la variable es: ' || identificador);
dbms_output.put_line('El nombre del usuario es: ' || nombre);
dbms_output.put_line('El apodo del usuario es: ' || apodo);
dbms_output.put_line('El sueldo del usuario es: ' || sueldo);
dbms_output.put_line('La comision a cobrar del usaurio es de :' || comision);
dbms_output.put_line('La fecha actual es: ' || fecha_actual);
dbms_output.put_line('La fecha de contratación es : ' || fecha);
dbms_output.put_line(saludo);

END;













