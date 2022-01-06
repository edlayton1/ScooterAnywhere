--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de hacer uso de tablas externas.

connect sys as sysdba 
--  Creacion del directorio tmp
prompt creando directorio tmp_dir
create or replace directory tmp_dir as '/tmp/bases';

grant read, write on directory tmp_dir to DPMP_PROY_ADMIN;
connect DPMP_PROY_ADMIN
-- Tabla externa que muestra las zonas mas peligrosas
create table zonas_peligro(
  zona_peligro_id number(10,0),
  nombre varchar2(40),
  accidentes number(10,0),
  peligrosidad number(10,0),

) organization external (
  type oracle_loader
  default directory tmp_dir
  access parameters(
      records delimited by newline
      badfile tmp_dir:'zonas_peligro_ext_bad.log'
      logfile tmp_dir:'zonas_peligro_ext.log'
      fields terminated by ','
      lrtrim
      missing field values are null
      (
        zona_id,nombre,accidentes,peligrosidad
      )
  )
  location('resumen_zonas.csv')
) reject limit unlimited;

!mkdir -p /tmp/bases
-- Copia del archivo csv
!cp ../resumen_zonas.csv /tmp/bases
-- Cambiando permisos
!chmod 777 /tmp/bases