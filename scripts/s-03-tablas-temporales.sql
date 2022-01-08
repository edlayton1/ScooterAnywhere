--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de tablas temporales.

create global temporary table scooter_actual(
  scooter_id number(10,0),
  num_matricula varchar2(40),
  marca_nombre varchar2(40),
  capacidad number (5,2),
  status_actual varchar(2000),
) on commit preserve rows;


create or replace procedure consulta_scooter_actual(
  act_scooter_id in number) is


cursor cur_scooters is
  select s.scooter_id,s.num_matricula, m.nombre,
    s.capacidad,sc.descripcion
  from scooter s
  join marca m on s.marca_id = m.marca_id
  join status_scooter sc on s.status_scooter_id = sc.status_scooter_id
  where s.scooter_id = act_scooter_id; 

begin
  for i in cur_scooters loop
    insert into scooter_actual(scooter_id,num_matricula,marca_nombre,
      capacidad,status_actual)
    values(i.scooter_id,i.num_matricula,i.marca_nombre
      i.capacidad,i.status_actual);
  end loop;
end;
/
show errors