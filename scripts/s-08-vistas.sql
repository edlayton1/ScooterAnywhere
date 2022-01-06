--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de 3 o mas vistas

connect dpmp_proy_admin/pass

create or replace view v_recarga(
  servicio_id, tipo, scooter_id, usuario_id, clabe, banco
) as select s.servicio_id, tipo, scooter_id, usuario_id, clabe, nombre_banco
from servicio s, servicio_recarga sr
where s.servicio_id = sr.servicio_id;

create or replace view v_viaje(
  servicio_id, tipo, scooter_id, usuario_id, fecha_inicio, fecha_fin, folio
) as 
  select s.servicio_id, tipo, scooter_id, usuario_id, fecha_inicio, fecha_fin,
    folio
  from servicio s, servicio_viaje sv
  where s.servicio_id = sv.servicio_id;

create or replace view v_venta(
  servicio_id, tipo, scooter_id, usuario_id, fecha_inicio, dias, direccion
) as 
  select s.servicio_id, tipo, scooter_id, usuario_id, fecha_inicio, dias,
    direccion
  from servicio s, servicio_renta sr
  where s.servicio_id = sr.servicio_id;


