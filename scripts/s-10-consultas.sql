--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de llevar a cabo 5 o mas consultas.


-- Consulta para obtener a los usuarios que han canjeado tarjetas de prepago con un total mayor a 3500

-- Utiliza subconsulta, group by sum, having y join
select nombre, apellidos, importe_total
from usuario u
join (select usuario_id,sum(importe) as importe_total
  from tarjeta_prepago
  group by usuario_id
  having sum(importe) > 3500) q1
on q1.usuario_id = u.usuario_id;

-- Consulta de una vista
-- MOstrar la carga promedio

select usuario_id, carga,(
  select avg(carga) from v_recarga vr
  join recarga_scooter rs using (servicio_id)) as carga_avg
from v_recarga v, recarga_scooter r
where v.servicio_id = r.servicio_id;

-- COnsulta usando sinonimo y consulta con set operators
-- Consulta para obtener todos los registros que no sean del 2020 o 2021

(select * from historico where status_scooter_id=1)
minus
(select * from historico
where to_char(fecha_status,'yyyy') in ('2020','2021'));

-- Consulta de tabla temporal donde matricula en scooter inicie con 7
select sa.scooter.id,sa.num_matricula, sa.status_actual from scooter_actual sa 
where sa.num_matricula like '7%'

--Consulta de tabla para observar zonas peligrosas por reportes externos

select zp.zona_peligro_id as Zona_de_peligro,z.nombre as Nombre_de_zona,
  zp.num_accidentes as Numero_de_accidentes, zp.peligrosidad as Nivel_de_peligro,
  zp.notas as Notas
from zonas_peligro zp
join zona z on z.zona_id = zp.zona_id
where zp.peligrosidad > 4;
-- Extra

select marca_id,count(*) from telefono group by (marca_id) having count(*)>3;

