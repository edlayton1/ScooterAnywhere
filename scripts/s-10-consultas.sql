--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de llevar a cabo 5 o mas consultas.

--Consulta de tabla para observar zonas peligrosas por reportes externos

select zp.zona_peligro_id as Zona de peligro,z.nombre as Nombre de zona,
  zp.num_accidentes as Numero de accidentes, zp.peligrosidad as Nivel de peligro,
  zp.notas as Notas
from zona_peligro zp
join zona z on z.zona_id = zp.zona_id
where zp.peligrosidad > 4;

