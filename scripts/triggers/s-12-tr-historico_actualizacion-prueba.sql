--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Prueba del trigger historico actualizacion

set serveroutput on
declare
  v_status_nuevo scooter.status_scooter_id%type := 2 ;
  v_count_inicial number;
  v_count_final number;
  v_historico_status_inicial historico_scooter_status.historico_scooter_status_id%type;
  v_historico_status_final historico_scooter_status.historico_scooter_status_id%type;
begin
  select count(*) into v_count_inicial from scooter
    where status_scooter_id = 5;
  select historico_ss_seq.curval into v_historico_status_inicial;

  update scooter set status_scooter_id = v_status_nuevo 
    where status_scooter_id = 5;

  select historico_ss_seq.curval into v_historico_status_final;
  
  select count(*) into v_count_final from scooter 
    where status_scooter_id = 5;

  if v_historico_status_final = (v_count_inicial + v_historico_status_inicial) then
    dbms_output.put_line('Historicos insertados');
    if v_count_final = 0 then
      dbms_output.put_line('Scooters con fallas reparados y actualizados');
    else
      raise_application_error(-20001,'Aun no se ha cambiado el status de los scooters reparados')
    end if;
  else
    raise_application_error(-20001,'No se han registrado todos los historicos');
  end if;
end;
/