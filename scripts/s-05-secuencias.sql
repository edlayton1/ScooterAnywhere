--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 01/01/2022
--@Descripción: Script encargado de la creacion de todas las secuencias temporales.

-- Historico

create sequence historico_ss_seq
start with 501
increment by 1
minvalue 501
nocycle;

-- Marca

create sequence marca_seq
start with 11
increment by 1
minvalue 11
nocycle;

-- Zona

create sequence zona_seq
start with 51
increment by 1
minvalue 51
nocycle;

create sequence zona_scooter_seq
start with 501
increment by 1
minvalue 501
nocycle;

-- Scooter

create sequence scooter_seq
start with 101
increment by 1
minvalue 101
nocycle;

-- Tarjeta

create sequence tarjeta_usuario_seq
start with 1001
increment by 1
minvalue 1001
nocycle;

create sequence tarjeta_prepago_seq
start with 1001
increment by 1
minvalue 1001
nocycle;

-- Usuario

create sequence usuario_seq
start with 501
increment by 1
minvalue 501
nocycle;

-- Falla

create sequence falla_seq
start with 201
increment by 1
minvalue 201
nocycle;

-- Foto

-- Servicio

create sequence servicio_seq
start with 501
increment by 1
minvalue 501
nocycle;

-- Recarga Scooter

create sequence recarga_seq
start with 201
increment by 1
minvalue 201
nocycle;

-- Ubicacion

create sequence ubicacion_seq
start with 701
increment by 1
minvalue 701
nocycle;

-- Telefono 

create sequence telefono_seq
start with 21
increment by 1
minvalue 21
nocycle;
