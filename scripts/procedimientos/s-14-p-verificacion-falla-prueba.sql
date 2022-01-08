--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Prueba del procedimiento para validar la falla
set serveroutput on
declare
  -- Se tiene prevista la falla
  v_falla_id falla.falla_id%type := 44;
  v_scooter_id number;
  v_usuario_id number;

  v_puntos_antes number;
  v_puntos_despues number;

  v_estado_esperado number;
  v_estado_actual number;
begin
  -- Se selecciona la falla
  select usuario_id, scooter_id into v_usuario_id, v_scooter_id
    from falla where falla_id=v_falla_id;
  
  select puntos into v_puntos_antes from usuario where usuario_id=v_usuario_id;
  
  verificar_falla(v_falla_id);

  -- Despues de ejecutar el procedimiento

  -- Validar el nuevo estado del scooter
  select status_scooter_id into v_estado_actual 
    from scooter where scooter_id=v_scooter_id;

  select status_scooter_id INTO v_estado_esperado
    from status_scooter where descripcion='CON FALLAS';

  if v_estado_actual <> v_estado_esperado then
    raise_application_error(-20001,'EL estado no coincide. El esperado: ' ||
      v_estado_actual || ' estado actual: ' || v_estado_actual);
  end if;

  -- Verificando los puntos

  select puntos into v_puntos_despues from usuario 
    where usuario_id=v_usuario_id;

  dbms_output.put_line('Los puntos antes de la verifiacion eran: '
    || v_puntos_antes || ', ahora los puntos del usuario son: '
    || v_puntos_despues || '
    ');
  
  dbms_output.put_line('Prueba exitosa');
  commit;

  exception
  when others then
    dbms_output.put_line('Se lanzo excepcion: ' || sqlerrm);
    dbms_output.put_line('Prueba fallida');
    rollback;
end;
/
