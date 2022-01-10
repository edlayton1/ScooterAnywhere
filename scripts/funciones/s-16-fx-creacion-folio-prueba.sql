--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: Script de prueba para creacion folio
declare
  v_folio varchar2(13);
  c_usuario_id number := 7;
  c_servicio_id number := 2;
  c_scooter_id number := 5;
  v_longitud_folio number;
  v_folio_inicio varchar2(3);
  v_folio_conocido varchar2(3);
begin

  select creacion_folio(c_servicio_id,c_scooter_id,c_usuario_id) into v_folio from dual;

  v_folio_inicio := to_char(c_servicio_id)||to_char(c_scooter_id)||to_char(c_usuario_id);

  select substr(v_folio,1,3) into v_folio_conocido from dual;

  dbms_output.put_line('Para el ejemplo de prueba se tiene los siguientes valores'
    ||' Usuario_id: '|| c_usuario_id || ' Servicio_id: ' || c_servicio_id 
    ||' Scooter_id: '|| c_scooter_id);
  select length(v_folio) into v_longitud_folio from dual;
  if v_longitud_folio = 13 then
    dbms_output.put_line('La longitud del folio es correcto, debe tener 13 y cuenta con '
      || v_longitud_folio);

    if v_folio_inicio = v_folio_conocido then
      dbms_output.put_line('El inicio del folio es correcto, requisitado '|| v_folio_inicio
        ||' Obtenido '|| v_folio_conocido);
    else
      dbms_output.put_line('El inicio del folio es incorrecto, requisitado ' || v_folio_inicio
        ||' Obtenido '|| v_folio_conocido);
    end if;
  else
    dbms_output.put_line('La longitud es incorrecta se necesitan 13 y tienen '|| v_longitud_folio);
  end if;

end;
/
