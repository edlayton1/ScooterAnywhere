--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Script del trigger para verficar que solo exista 3 telefonos por compañia.

set serveroutput on
create or replace trigger tr_telefonos_permitidos
before insert or update on telefono
for each row
declare
  v_marca_id telefono.marca_id%type;
  v_count number(1);
begin
  v_marca_id := :new.marca_id;

  select count(*) into v_count from telefono t where marca_id = v_marca_id;

  if v_count >= 3 then
    raise_application_error(20001,'La marca con id: '
      || v_marca_id
      ||' ya tiene hasta 3 telefonos');
  end if;
end;
/
show errors

