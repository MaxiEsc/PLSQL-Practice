/*
JOBS

Son procesos de negocios que realizan grandes tareas de negocio en la basse de datos

herramientas que permiten crear JOBS
DBMS_SCHEDULER_JOB

INTEREZANTE: 
SYS.DBMS_SCHEDULER.CREATE_JOB: esquema de creador de jobs dao por oracle
JOB_NAME: nombre del Jobs 
=> : asignacion en un job
job_type: tipo de Job con el que se va a trabajar en este caso elegimos a PLSQL_BLOCK
job_action: nos dice que hatra nuestro jobs

nuestro job se le ha impuesto esta tarea:

DECLARE
    v_conteo NUMBER := 0;
BEGIN 
    SELECT COUNT(*) INTO v_conteo
    FROM log_actividades;
    INSERT INTO log_actividades VALUES(v_conteo + 1 , SYSDATE);
    COMMIT;
END;

START_DATE: Le decimos cuando comienza con SYSTIMESTAMP le decimos que comience al momento de su creaccion
REPEAT_INTERVAL: aque se le asigna la frecuencia en segundos en este caso se le ha asginado 
'freq=secondly'; INTERVAL=5 lo que significa que tenga una frecuencia en segundos con el intervalo de 5 segungundos por tarea

END_DATE: se define cuando finaliza el job

ENABLE: Se le dice que esta habilitado. en este caso es true

COMMENTS: se le asigna un mensaje en este caso se le ha asignado 'Log de actividades'

 */

--Tabla para registrar los jobs
CREATE TABLE log_actividades(
id_log INT NOT NULL,
fecha DATE
);

--Ejercicio: crea un jobs
BEGIN
    SYS.dbms_scheduler.CREATE_JOB(
    JOB_NAME => 'job_uno',
    JOB_TYPE => 'PLSQL_BLOCK',
    JOB_ACTION => 'DECLARE
        v_conteo NUMBER :=0;
        BEGIN 
            SELECT COUNT(*) INTO v_conteo
            FROM log_actividades;
            INSERT INTO log_actividades VALUES(v_conteo + 1 , SYSDATE);
            COMMIT;
            END;',
    START_DATE => SYSTIMESTAMP,
    REPEAT_INTERVAL => 'freq=secondly; INTERVAL=5',
    END_DATE => NULL,
    ENABLED => TRUE, 
    COMMENTS => 'Log de actividades');
END;

--Para borrar los jobs
BEGIN
  sys.dbms_scheduler.drop_job(job_name => 'job_uno');
END;

--Leer tabla
SELECT * FROM log_actividades;