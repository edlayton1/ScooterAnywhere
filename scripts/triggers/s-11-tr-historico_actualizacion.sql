--@Autor(es): Diaz Pacheco Jose Juan y Moreno Peralta Angel Eduardo
--@Fecha creación: 06/01/2022
--@Descripción: Script que crea un trigger para actualizar estados en historico

create or replace trigger trg_historico_actualizacion
  for update of status_scooter_id on scooter
  compound trigger

-- declaracion objeto type
  type historico_scooter_status_type is record (
    historico_scooter_status_id historico_scooter_status.historico_scooter_status_id%type,
    fecha_status historico_scooter_status.fecha_status%type,
    status_scooter_id historico_scooter_status.status_scooter_id%type,
    scooter_id historico_scooter_status.scooter_id%type
  );

  type status_list_type is table of historico_scooter_status_type;

  status_list status_list_type := status_list_type();

  before each row is

    v_fecha date := sysdate;
    v_index number;
  begin
    status_list.extend;
    v_index := status_list.last;

    status_list(v_index).historico_scooter_status_id := historico_ss_seq.nextval;
    status_list(v_index).fecha_status := v_fecha;
    status_list(v_index).status_scooter_id := :new.status_scooter_id;
    status_list(v_index).scooter_id := :new.scooter_id;

  end before each row;

  after statement is
  begin
    for i in status_list.first .. status_list.last loop
      insert into historico_scooter_status(historico_scooter_status_id,
        fecha_status,status_scooter_id,scooter_id)
      values(status_list(i).historico_scooter_status_id,
        status_list(i).fecha_status,status_list(i).status_scooter_id,
        status_list(i).scooter_id
      );
      update scooter set fecha_status = sysdate 
        where scooter_id = status_list(i).scooter_id;
    end loop;

  end after statement;
end;
/
show errors;