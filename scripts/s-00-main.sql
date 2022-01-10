--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script principal del proyecto

connect sys/system as sysdba

Prompt Creando Usuarios

@@s-01-usuarios.sql

Prompt Creando modelo

connect dpmp_proy_admin/pass

@@s-02-entidades.sql

@@s-03-tablas-temporales.sql

@@s-04-tablas-externas.sql

@@s-05-secuencias.sql

@@s-06-indices.sql

@@s-07-sinonimos.sql

@@s-08-vistas.sql

@@s-09-carga-inicial.sql

-- TRIGGERS
prompt Creacion Trigger telefono
@@triggers/s-11-tr-telefono.sql
--@@triggers/s-12-tr-telefono-prueba.sql
prompt Creacion trigger servicio
@@triggers/s-11-tr-servicio.sql
--@@triggers/s-12-tr-servicio-prueba.sql
prompt creacion trigger historico
@@triggers/s-11-tr-historico_actualizacion.sql
--@@triggers/s-12-tr-historico_actualizacion-prueba.sql


-- PROCEDURE
prompt Creacion procedimientos
@@procedimientos/s-13-p-nuevo-servicio.sql
--@@procedimientos/s-14-p-nuevo-servicio-prueba.sql


@@procedimientos/s-13-p-verificacion-falla.sql
--@@procedimientos/s-14-p-verificacion-falla-prueba.sql

-- FUNCIONES

@@funciones/s-15-fx-calculo-pago.sql
--@@funciones/s-16-fx-calculo-pago-prueba.sql

@@funciones/s-15-fx-creacion-folio.sql
