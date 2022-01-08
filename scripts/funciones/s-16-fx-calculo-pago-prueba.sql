--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: Prueba para el uso de la funcion de pagos de las recargas
declare
  v_importe number(8,2);
  v_usuario_id number;
  v_servicio_id number := 492;
begin
  select usuario_id into v_usuario_id
    from servicio where servicio_id = v_servicio_id;

  select calculoPago(492) into v_importe from dual;
  dbms_output.put_line('Se debe pagar $'
    || v_importe || ' al usuario con id ' || v_usuario_id
    || ' por el servicio de recarga: ' || v_servicio_id);
end;
/
