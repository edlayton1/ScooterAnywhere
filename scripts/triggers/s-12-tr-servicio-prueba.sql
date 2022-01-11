--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Prueba del trigger para asegurar integridad en la tabla servicio

set serveroutput on
declare
  v_servicio_id servicio.servicio_id%type;
  v_tipo servicio.tipo%type := 'R';
  v_usuario_id servicio.usuario_id%type := 1;
begin
  select servicio_seq.nextval into v_servicio_id from dual;

  begin
    dbms_output.put_line('Se va a intentar agregar un servicio de renta con el scooter_id como nulo');
    insert into servicio values(v_servicio_id,v_tipo,null,v_usuario_id);
    exception
      when others then
      dbms_output.put_line('Se lanzo la excepcion: ' || sqlerrm || '
      Funciona bien en este escenario.
      ');
  end;

  begin
    dbms_output.put_line('Se va a intentar actualizar un registro');
    update servicio set tipo = 'A' where servicio_id=1;
    exception
      when others then
      dbms_output.put_line('Se lanzo la excepcion: ' || sqlerrm || '
      Funciona bien en este escenario.');
  end;

  begin
    dbms_output.put_line('Se va a intentar eliminar un registro para robar el scooter');
    delete from servicio where servicio_id=1;
    exception
      when others then
      dbms_output.put_line('Se lanzo la excepcion: ' || sqlerrm || '
      Funciona bien en este escenario.');
  end;

  dbms_output.put_line('
  EL trigger valida correctamente e impide actualizaciones.');
end;
/