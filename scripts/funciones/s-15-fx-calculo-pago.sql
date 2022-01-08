--@Autor(es): Jose Juan y Angel Eduardo
--@Fecha creación: 07/01/2022
--@Descripción: FUncion para el calculo de pago del servicio de recarga
create or replace function calculoPago(
  p_servicio_id number
) return number is
-- Declaracion variables
  cursor cur_recarga_scooter is
  select * from recarga_scooter 
  where servicio_id = p_servicio_id;

  v_carga_avg number(5,2);
  v_pago_total number(8,2);
  v_pago_parcial number(8,2);

begin
  

  select avg(carga) into v_carga_avg from recarga_scooter;

  -- Se propone el siguiente calculo por cada 1% de carga se paga 10 peso
  -- Si la carga fue mayor que el avg se da un 5 adicional por cada 5% arriba del avg
  for c in cur_recarga_scooter loop
    v_pago_parcial := 0;
    if c.carga > v_carga_avg then
      v_pago_parcial := v_pago_parcial + (v_carga_avg-c.carga)/5*5;
    end if;
    v_pago_total := v_pago_parcial + c.carga * 10; 
  end loop;

  return v_pago_total;

end;
/
show errors