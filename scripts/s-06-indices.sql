--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de llevar a cabo la insercion de Indices
--compuesto de tipo unique
create unique index ubicacion_latitud_longitud_iuk on ubicacion(longitud,latitud); 

-- de tipo unique

create unique index scooter_num_serie_iuk on scooter(num_serie);

-- de tipo non unique
create index servicio_recarga_clabe_ix on servicio_recarga(clabe);

--usando funciones

create index idx_scooter_num_matricula_ix on scooter(upper(num_matricula));
create unique index idx_status_scooter_descripcion_iuk 
	on status_scooter(lower(descripcion));