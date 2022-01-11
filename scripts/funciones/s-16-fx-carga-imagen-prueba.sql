--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: Prueba de insercion foto
set serveroutput on
!mkdir -p /tmp/bases/fotos_fallo
-- Copia de la foto
!cp ../falla1_1.jpg /tmp/bases/fotos_fallo
-- Cambiando permisos
!chmod 777 /tmp/bases/fotos_fallo

declare
  v_foto_id number;
  v_falla_id number := 1;
begin
  select foto_seq.nextval into v_foto_id from dual;
  dbms_output.put_line('Por insertar');
  insert into foto values(v_foto_id, cargaImagen('falla1_1.jpg'), v_falla_id);
  dbms_output.put_line('Prueba exitosa');
  commit;
exception
  when others then
    dbms_output.put_line('Error: ' || sqlerrm);
end;
/