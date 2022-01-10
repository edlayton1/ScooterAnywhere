--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Crear roles con los privilegios

-- ELiminando datos previos



set serveroutput on

declare
  v_count_admin number(1,0);
  v_count_invitado number(1,0);
begin
  select count(*) into v_count_admin 
  from all_users 
  where username = 'DPMP_PROY_ADMIN';

  select count(*) into v_count_invitado 
  from all_users 
  where username = 'DPMP_PROY_INVITADO';

  if v_count_admin > 0 then
    dbms_output.put_line('Eliminando usuario admin');
    execute immediate 'drop user dpmp_proy_admin cascade';
    execute immediate 'drop role rol_admin';
  end if;

  if v_count_invitado > 0 then
    dbms_output.put_line('Eliminando usuario invitado');
    execute immediate 'drop user dpmp_proy_invitado cascade';
    execute immediate 'drop role rol_invitado';
  end if;
end;
/
show errors

-- Creando usuarios

create user dpmp_proy_admin identified by pass quota unlimited on users;
create user dpmp_proy_invitado identified by pass quota unlimited on users;

-- Creando roles

create role rol_admin;
create role rol_invitado;

-- Asignando privilegios

grant create table, create sequence, create session, create synonym, create procedure, create trigger, create view, create public synonym to rol_admin;

-- Crea un directorio en tmp
-- mkdir /tmp/blob
-- chmod 777 /tmp/blob
-- chown root /tmp/blob

create or replace directory blob_dir as '/tmp/blob';

grant read, write on directory blob_dir to rol_admin;
--grant read, write on directory blob_dir to dpmp_proy_admin;

grant create session, create synonym to rol_invitado;

-- Asignando roles a usuarios

grant rol_admin to dpmp_proy_admin;
grant rol_invitado to dpmp_proy_invitado;


