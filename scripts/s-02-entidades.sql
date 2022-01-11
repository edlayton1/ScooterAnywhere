--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: dd/mm/aaaa
--@Descripción: Creacion del modelo

-- TABLA MARCA

create table marca(
  marca_id number(3,0) constraint marca_pk primary key,
  nombre varchar2(40) not null
);

-- TABLA TELEFONO

create table telefono(
  telefono_id number(6,0) constraint telefono_pk primary key,
  telefono varchar(11) not null,
  marca_id not null constraint telefono_marca_id_fk references marca(marca_id)
);

-- TABLA ZONA

create table zona(
  zona_id number(6,0) constraint zona_pk primary key,
  nombre varchar(40) not null,
  cadena varchar(2000) not null
);


-- TABLA STATUS_SCOOTER

create table status_scooter(
  status_scooter_id number(2,0) not null,
  clave varchar2(3) not null,
  descripcion varchar2(40) not null, 
  constraint status_scooter_pk primary key(status_scooter_id)
);

-- TABLA SCOOTER

create table scooter(
  scooter_id number(10,0) constraint scooter_pk primary key,
  num_serie varchar2(10) not null,
  num_matricula varchar2(10) not null,
  codigo_acceso varchar2(10) not null,
  capacidad number(5,2) default 100 not null ,
  scooter_reemplazo_id number(10,0) constraint scooter_scooter_id_fk
    references scooter(scooter_id),
  fecha_status date not null,
  status_scooter_id not null constraint scooter_status_scooter_id 
    references status_scooter(status_scooter_id),
  marca_id not null constraint scooter_marca_id references marca(marca_id)
);

-- TABLA ZONA_SCOOTER

create table zona_scooter(
  zona_scooter_id number(10,0) 
  constraint zona_scooter_pk primary key,
  scooter_id not null constraint zona_scooter_scooter_id_fk 
    references scooter(scooter_id),
  zona_id not null constraint zona_scooter_zona_id_fk 
    references zona(zona_id)
);

-- TABLA HISTORICO_SCOOTER_STATUS

create table historico_scooter_status(
  historico_scooter_status_id number(10,0) constraint historico_scooter_status_pk primary key,
  fecha_status date not null,
  status_scooter_id not null constraint historico_status_scooter__id_fk
    references status_scooter(status_scooter_id),
  scooter_id not null constraint historico_scooter_id_fk 
    references scooter(scooter_id)
);

-- TABLA USUARIO
-- USAR COLUMNAS VIRTUALES

create table usuario(
  usuario_id number(10,0) constraint usuario_pk primary key,
  nombre varchar2(20) not null,
  apellidos varchar2(40) not null,
  contrasenia varchar2(20) not null,
  puntos number(10) default 0 not null
);

-- TABLA TARJETA_USUARIO

create table tarjeta_usuario(
  tarjeta_usuario_id number(10,0) constraint tarjeta_usuario_pk
  primary key,
  anio_expiracion number(2,0) not null,
  mes_expiracion number(2,0) not null,
  numero varchar2(16) not null,
  usuario_id not null constraint tarjeta_usuario_usuario_id_fk
    references usuario(usuario_id)
);

-- TABLA TARJETA_PREPAGO

create table tarjeta_prepago(
  tarjeta_prepago_id number(12,0) constraint tarjeta_prepago_pk primary key,
  codigo varchar2(21) not null,
  fecha_registro date not null,
  fecha_expiracion date not null,
  importe number(6,2) not null,
  usuario_id not null constraint tarjeta_prepago_usuario_id_fk
    references usuario(usuario_id)
);

-- TABLA FALLA

create table falla(
  falla_id number(10,0) constraint falla_pk primary key,
  ubicacion varchar2(12),
  fecha date not null,
  texto varchar2(2000) not null,
  scooter_id not null constraint falla_scooter_id_fk 
    references scooter(scooter_id),
  usuario_id not null constraint falla_usuario_id_fk 
    references usuario(usuario_id)
);

-- TABLA FOTO

create table foto(
  foto_id number(10,0) constraint foto_pk primary key,
  foto blob not null,
  falla_id not null constraint foto_falla_id_fk references falla(falla_id)
);

-- TABLA SERVICIO

create table servicio(
  servicio_id number(12,0) constraint servicio_pk primary key,
  tipo char(1) not null,
  scooter_id constraint servicio_scooter_id_fk 
    references scooter(scooter_id),
  usuario_id not null constraint servicio_usuario_id_fk
    references usuario(usuario_id),
  constraint servicio_tipo_chk check(tipo in ('C','V','R'))
);

-- TABLA SERVICIO_VIAJE

create table servicio_viaje(
  servicio_id constraint sv_servicio_id_fk 
    references servicio(servicio_id),
  fecha_inicio date default sysdate not null,
  fecha_fin generated always as (fecha_inicio + 8/24 ) virtual,
  folio varchar2(13) not null constraint sv_folio_uk unique,
  constraint servicio_viaje_pk primary key(servicio_id)
);

-- TABLA SERVICIO_RENTA

create table servicio_renta(
  servicio_id constraint sren_servicio_id_fk 
    references servicio(servicio_id),
  fecha_inicio date default sysdate not null,
  dias number(2,0) not null,
  direccion varchar2(100) not null,
  constraint sren_pk primary key(servicio_id)
);

-- TABLA SERVICIO_RECARGA

create table servicio_recarga(
  servicio_id constraint sc_servicio_id_fk 
    references servicio(servicio_id),
  clabe varchar2(18) not null,
  nombre_banco varchar(40) not null,
  constraint sc_pk primary key(servicio_id)
);

-- TABLA RECARGA_SCOOTER

create table recarga_scooter(
  recarga_scooter_id number(12,0) constraint recarga_scooter_pk primary key,
  carga number(5,2) not null,
  scooter_id not null constraint rs_scooter_id_fk 
    references scooter(scooter_id),
  servicio_id not null constraint rs_servicio_id_fk
    references servicio_recarga(servicio_id),
  constraint rs_carga_chk check(carga > 0 and carga <= 100)
);

-- TABLA UBICACION

create table ubicacion(
  ubicacion_id number(12,0) constraint ubicacion_pk primary key,
  fecha date default sysdate not null,
  longitud number(5,2) not null,
  latitud number(5,2) not null,
  hora date not null,
  scooter_id constraint ubicacion_scooter_id_fk 
    references scooter(scooter_id)
);

-- TABLA PAGOS_RECARGA
create table pagos_recarga(
  pagos_recarga_id number (10,0) constraint pagos_recarga_pk primary key,
  importe number(8,2) not null,
  estado char(1) not null,
  servicio_id not null constraint pagos_recarga_servicio_id_fk 
    references servicio_recarga(servicio_id),
  constraint pagos_recarga_estado_chk check(estado in('P','L'))
);


