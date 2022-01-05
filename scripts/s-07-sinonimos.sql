--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de sinonimos del usuario admin

connect dpmp_proy_admin/pass

-- 3 sinonimos publicos
create or replace public synonym historico for dpmp_proy_admin.historico_scooter_status;

create or replace public synonym zoscoo for dpmp_proy_admin.zona_scooter;

create or replace public synonym tarjeta for dpmp_proy_admin.tarjeta_usuario;

-- otorgar permisos de lectura 3 entidades al usuario invitado

grant select on usuario to dpmp_proy_invitado;
grant insert on usuario to dpmp_proy_invitado;

grant select on falla to dpmp_proy_invitado;
grant insert on falla to dpmp_proy_invitado;

grant select on foto to dpmp_proy_invitado;
grant insert on foto to dpmp_proy_invitado;

-- 3 sinonimos del usuario invitado

connect dpmp_proy_invitado/pass

create or replace synonym usuario for dpmp_proy_admin.usuario;
create or replace synonym usuario for dpmp_proy_admin.falla;
create or replace synonym usuario for dpmp_proy_admin.foto;

-- sinonimos privados 
--xx_<nombre tabla>