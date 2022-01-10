--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Procedimiento para crear un nuevo servicio renta/carga

create or replace procedure nuevo_servicio( 
  p_servicio_id in out number, p_tipo in char, p_usuario_id in number,
  p_direccion in varchar, p_dias in number,
  p_scooter_id out number
) is
  v_fecha_inicio  date;
  v_fecha_fin  date;
  v_nuevo_status_scooter_id number;
  v_folio varchar2(13);
  
  cursor cur_scooters_disponibles is 
    select scooter_id from scooter 
    where status_scooter_id = (select status_scooter_id 
      from status_scooter where descripcion='EN ESPERA');
begin
  -- Verificando que si esten los datos necesarios
  if p_tipo is null or p_usuario_id is null then
    raise_application_error(-20001,'Los datos tipo y usuario_id no pueden ser nulos.');
  end if;

  if p_tipo = 'R' and (p_direccion is null or p_dias is null) then
    raise_application_error(-20001,'Los servicio de renta deben enviar los datos direccion y los dias para el registro.');
  end if;

  -- Si hay datos correctos

  if p_tipo <> 'C' then

    select servicio_seq.nextval into p_servicio_id from dual;

    open cur_scooters_disponibles;
      fetch cur_scooters_disponibles into p_scooter_id;
    close cur_scooters_disponibles;

    insert into servicio values(p_servicio_id, p_tipo, p_scooter_id, p_usuario_id);
    
    case p_tipo
      when 'R' then
        dbms_output.put_line('El tipo de servicio es de recarga, el scooter asignado es: ' || p_scooter_id);

        insert into servicio_renta 
          values(p_servicio_id,sysdate,p_dias,p_direccion);

        select status_scooter_id into v_nuevo_status_scooter_id 
          from status_scooter where descripcion='EN SERVICIO RENTA';
      when 'V' then
        dbms_output.put_line('El tipo de servicio es de viaje, el scooter asignado es: ' || p_scooter_id);

        -- Falta, crea la funcion folio
        select creacion_folio(p_servicio_id,p_scooter_id,p_usuario_id) into v_folio from dual;

        insert into servicio_viaje 
          values(p_servicio_id,sysdate,sysdate+8/24, 
            v_folio
          );

        select status_scooter_id into v_nuevo_status_scooter_id 
          from status_scooter where descripcion='EN SERVICIO VIAJE';
    end case;

  end if;
end;
/
show errors
