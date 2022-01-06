--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de llevar a cabo la carga inicial de datos en la base de datos

whenever sqlerror exit rollback

connect dpmp_proy_admin/pass

prompt Marca

@Carga/marca.sql

prompt Tel

@Carga/telefono.sql

prompt zona

@Carga/zona.sql

prompt status

@Carga/status_scooter.sql

prompt scooter

@Carga/scooter.sql

prompt zona_scooter

@Carga/zona_scooter.sql

prompt historico

@Carga/historico_scooter_status.sql

prompt usuario

@Carga/usuario.sql

prompt tarjeta_usuario

@Carga/tarjeta_usuario.sql

prompt falla

@Carga/falla.sql

prompt servicio

@Carga/servicio_c.sql

@Carga/servicio_rent.sql

@Carga/servicio_v.sql

prompt servicio hijos

@Carga/servicio_viaje.sql

@Carga/servicio_renta.sql

@Carga/servicio_recarga.sql

prompt recarga_scooter

@Carga/recarga_scooter.sql

prompt tarjeta_prepago

@Carga/tarjeta_prepago.sql

@Carga/ubicacion.sql

commit;