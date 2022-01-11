--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: Funcion para cargar imagenes
connect sys as sysdba
create or replace directory fotos_dir as '/tmp/bases/fotos_fallo';
grant read on directory fotos_dir to dpmp_proy_admin;

connect dpmp_proy_admin/pass


set serveroutput on
create or replace function cargaImagen(
  p_nombre_imagen varchar2
) return blob is
  v_bfile bfile;
  v_src_offset number;
  v_dest_offset number;
  v_blob blob ;
  v_src_len number;
  v_dest_len number;
begin
  v_bfile := bfilename('FOTOS_DIR', p_nombre_imagen);
  dbms_lob.createTemporary(v_blob, TRUE, dbms_lob.session) ;

  if dbms_lob.fileexists(v_bfile) = 0 then
      raise_application_error(-20001,'El archivo ' || p_nombre_imagen || ' no existe');
  end if; 

    -- Abriendo archivo
  if dbms_lob.isopen(v_bfile) = 1  then
      raise_application_error(-20001,'El archivo ' || p_nombre_imagen || ' esta abierto, no se puede usar');
  end if;

  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);

  v_src_offset:=1;
  v_dest_offset:=1;

  dbms_lob.loadblobfromfile(
    dest_lob => v_blob,
    src_bfile => v_bfile,
    amount => dbms_lob.getlength(v_bfile),
    dest_offset => v_dest_offset,
    src_offset => v_src_offset );

  dbms_lob.close(v_bfile);

  v_src_len := dbms_lob.getlength(v_bfile);
  v_dest_len := dbms_lob.getlength(v_blob);

  if v_dest_len<>v_src_len then 
        raise_application_error(-20001,'El archivo '||p_nombre_imagen||' no se cargó correctamente');
    end if;

  return v_blob;
end;
/
show errors
  