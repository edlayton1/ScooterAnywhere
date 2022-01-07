
set serveroutput on
declare
  v_servicio_id servicio.servicio_id%type;
  v_scooter_id scooter.scooter_id%type;

  v_count_servicio number;
  v_count_servicio_renta number;
  v_fecha_inicio date;
  v_dias number; 

  v_nuevo_status_scooter_id scooter.status_scooter_id%type;
  v_nuevo_fecha_status date;
  v_nuevo_status_descripcion varchar(20);

begin

  begin
    dbms_output.put_line('Se esta por intentar crear un servicio sin decir el tiṕo');
    nuevo_servicio(v_servicio_id,null, 1,'Direccion prueba',null, v_scooter_id);

  exception
  when others then
    dbms_output.put_line('Excepcion: '|| sqlerrm);
    rollback;
  end;

  begin
    dbms_output.put_line('Se esta por intentar crear un servicio de renta sin enviar el numero de dias');
    nuevo_servicio(v_servicio_id,'R', 1, 'Direccion prueba',null, v_scooter_id);
  exception
  when others then
    dbms_output.put_line('Excepcion: '|| sqlerrm);
    rollback;
  end;

  dbms_output.put_line('
  Se va a crear un servicio de renta');

  nuevo_servicio(v_servicio_id,'R', 1, 'Direccion prueba',6, v_scooter_id);

  select count(*) into v_count_servicio from servicio where servicio_id = v_servicio_id;

  select fecha_inicio, dias, count(*) into v_fecha_inicio, v_dias, 
    v_count_servicio_renta from servicio_renta 
    where servicio_id = v_servicio_id
    group by (fecha_inicio, dias);

  select fecha_status, status_scooter_id into v_nuevo_fecha_status, 
    v_nuevo_status_scooter_id from scooter
    where scooter_id = v_scooter_id;
  select descripcion into v_nuevo_status_descripcion from status_scooter
    where status_scooter_id=v_nuevo_status_scooter_id;

  if v_count_servicio = 1 and v_count_servicio_renta = 1 then
    dbms_output.put_line('
    Se encontro el registro nuevo en la tabla servicio y servicio_renta');
    dbms_output.put_line('Los datos del servicio_renta son: '
      || 'fecha inicio: ' || v_fecha_inicio
      || ' y con ' || v_dias || ' de renta.
      '); 
  end if;

  dbms_output.put_line('Los datos actualizados del scooter son: '
   ||' status: ' || v_nuevo_status_descripcion 
    || ' con fecha: ' || v_nuevo_fecha_status);
end;
/
