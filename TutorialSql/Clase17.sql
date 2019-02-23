--Tipos de dato fecha y hora
drop table if exists asistencia;
 
 create table asistencia(
  dni char(8),
  fecha date,
  hora time,
  primary key (dni)
 );

 -- Ingresamos un registro:
 insert into asistencia(dni,fecha,hora) values ('11111111','2008/12/31','13:00:59');

 -- Mostramos el registro:
 select * from asistencia;

 -- Borramos la tabla:

 drop table asistencia;

 -- Creamos nuevamente la tabla pero definimos un solo campo para almacenar
 -- la fecha y hora de ingreso del empleado:
 create table asistencia(
  dni char(8),
  fechahora timestamp,
  primary key (dni)
 );

 -- Ingresamos un registro:
 insert into asistencia (dni,fechahora) values ('11111111','2008/12/31 13:00:00.59');

 -- Mostramos el registro:
 select * from asistencia;

 -- Cambiamos el seteo de fecha para ingresar con el formato dia/mes/a�o:
 -- set datestyle to 'European'
 -- Ingresamos un nuevo registro con el nuevo formato:
 --insert into asistencia (dni,fechahora) values ('22222222','21/12/2018 13:00:00.59');

-- Mostramos el registro:
 select * from asistencia;