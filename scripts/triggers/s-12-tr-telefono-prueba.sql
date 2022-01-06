--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Prueba del trigger telefonos maximos
set serveroutput on
declare
  v_marca_id number := 7;
  v_telefono varchar2(10):= '9388010313';
  v_telefono_id telefono.telefono_id%type;
begin
  select telefono_seq.nextval into v_telefono_id from dual;
  dbms_output.put_line('Se va hacer una prueba para garantizar que el numero maximo de telefonos por marca sea de 3, los datos a insertar son '
    || v_telefono_id || ','
    || v_telefono || ','
    || v_marca_id  || '.
    ');

  insert into telefono values(v_telefono_id,v_telefono,v_marca_id);

  exception
    when others then
    dbms_output.put_line('Como se ha lanzado la excepcion se muestra el correcto funcionamiento del trigger');
end;
/
