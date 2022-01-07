--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Trigger que da mayor seguridad a la integridad del servicio

set serveroutput on

create or replace trigger tr_servicio_verificacion
before insert or update on servicio
for each row
declare
  v_tipo servicio.tipo%type;
begin
  case
    when inserting then
      v_tipo := :new.tipo;
      if v_tipo <> 'C' and :new.scooter_id is null then
        raise_application_error(-20001,'El scooter_id de un servicio de renta o viaje no puede ser nulo');
      end if;
    when updating then
      raise_application_error(-20002,'No se puede realizar operaciones de update'); 
    when deleting then
      raise_application_error(-20002,'No se pueden eliminar registros de los servicios'); 
  end case;
end;
/
show errors
