--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de 3 o mas vistas

create or replace view v_empleado(
nombre,apellido_paterno,apellido_materno,clave_puesto
) as select nombre,apellido_paterno,apellido_materno,clave_puesto
from empleado e, puesto p
where e.puesto_id=p.puesto_id;