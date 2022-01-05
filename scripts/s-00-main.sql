--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script principal del proyecto

connect sys/system as sysdba

Prompt Creando Usuarios

@@s-01-usuarios.sql

Prompt Creando modelo

connect dpmp_proy_admin/pass

@@s-02-entidades.sql


