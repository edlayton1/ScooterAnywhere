--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: Script para crear folio

create or replace function creacion_folio(
  p_servicio_id number, p_scooter_id number, p_usuario_id number
) return varchar2 is
  v_cadena_aleatoria varchar2(20) := '4';
  v_folio varchar2(13);
begin
  for i in 1..9 loop
    v_cadena_aleatoria := v_cadena_aleatoria || (1+abs(mod(dbms_random.random,9)));
  end loop;
  dbms_random.terminate;

  v_folio:= to_char(p_servicio_id) || to_char(p_scooter_id) || to_char(p_usuario_id) || v_cadena_aleatoria;
  return v_folio;

end;
/
show errors