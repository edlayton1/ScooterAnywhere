--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script principal del proyecto

connect sys/system as sysdba

Prompt Creando Usuarios

@@s-01-usuarios.sql

Prompt Creando modelo

connect dpmp_proy_admin/pass

@@s-02-entidades.sql


-- TRIGGERS

@@trigger/triggers/s-11-tr-telefono.sql
@@trigger/triggers/s-12-tr-telefono-prueba.sql

@@triggers/s-11-tr-servicio.sql
@@triggers/s-11-tr-servicio-prueba.sql

-- PROCEDURE

@@procedimientos/s-13-p-nuevo-servicio.sql
@@procedimientos/s-14-p-nuevo-servicio-prueba.sql

@@procedimientos/s-13-p-verificacion-falla.sql
@@procedimientos/s-14-p-verificacion-falla-prueba.sql

-- FUNCIONES

@@funciones/s-15-fx-calculo-pago.sql
@@funciones/s-16-fx-calculo-pago-prueba.sql

