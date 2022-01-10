--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de tablas temporales.
set serveroutput on
create private temporary table ora$ptt_scooter_marca(
  scooter_id number(10,0),
  num_matricula varchar2(40),
  marca_nombre varchar2(40),
  capacidad number (5,2),
  status_actual varchar(2000)
) on commit drop definition;


create or replace procedure consulta_scooter_marca(
  p_scooter_marca in varchar2
) is


cursor cur_scooters is
  select s.scooter_id,s.num_matricula, m.nombre,
    s.capacidad,sc.descripcion
  from scooter s
  join marca m on s.marca_id = m.marca_id
  join status_scooter sc on s.status_scooter_id = sc.status_scooter_id
  where m.nombre = p_scooter_marca; 

begin
  for i in cur_scooters loop
    insert into scooter_actual values(i.scooter_id,i.num_matricula,i.nombre,
      i.capacidad,i.descripcion);
  end loop;
end;
/
show errors

-- llenando la table
declare
  v_scooter varchar2(40) := 'Eire';
begin
  consulta_scooter_actual(v_scooter);
end;
/