--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Procedimiento para verificar la falla

create or replace procedure verificar_falla(
  p_falla_id in number
) is
  v_usuario_id number;
  v_scooter_id number;
  v_status_id number;
  v_puntos usuario.puntos%type;
begin
  -- Se van a recoger los datos de dicha falla
  select usuario_id, scooter_id into v_usuario_id, v_scooter_id
    from falla where falla_id = p_falla_id;

  select status_scooter_id into v_status_id
    from status_scooter where descripcion = 'CON FALLAS';

  -- Actualizar el estado del scooter

  update scooter set status_scooter_id = v_status_id
    where scooter_id = v_scooter_id;

  -- Nota no se actualiza la fecha ya que esto lo realiza el trigger

  -- Asignar los puntos al usuario
  select puntos from usuario where usuario_id = v_usuario_id;

  v_puntos := v_puntos + 1000;

  update usuario set puntos = v_puntos where usuario_id = v_usuario_id;

end;
/
show errors