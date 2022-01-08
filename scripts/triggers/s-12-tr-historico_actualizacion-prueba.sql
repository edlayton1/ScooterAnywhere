--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Prueba del trigger historico actualizacion

set serveroutput on

select * from historico_Scooter_status where historico_scooter_status_id > 500;
  
select * from scooter where scooter_id = 1;

declare
  v_status_nuevo scooter.status_scooter_id%type := 2 ;
  v_count_inicial number;
  v_count_final number;
  v_historico_status_inicial historico_scooter_status.historico_scooter_status_id%type;
  v_historico_status_final historico_scooter_status.historico_scooter_status_id%type;
begin
  
  

  select count(*) into v_count_inicial from scooter
    where status_scooter_id = 5;

  update scooter set status_scooter_id = v_status_nuevo 
    where status_scooter_id = 5;

  select historico_ss_seq.currval into v_historico_status_final from dual;
  
  select count(*) into v_count_final from scooter 
    where status_scooter_id = 5;

  if v_count_final = 0 then
    dbms_output.put_line('Historicos insertados');
  else
    raise_application_error(-20001,'No se han registrado todos los historicos');
  end if;

end;

/

select * from historico_Scooter_status where historico_scooter_status_id > 500;
  
select * from scooter where scooter_id = 1;

