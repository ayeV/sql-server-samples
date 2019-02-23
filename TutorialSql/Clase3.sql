-- Eliminamos la tabla usuarios si existe
 drop table if exists usuarios;

 -- Creamos la tabla
 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 -- Agregamos varios registros a la tabla:
 insert into usuarios (nombre, clave) values ('Mariano','payaso');
 insert into usuarios (nombre, clave) values ('Pablo','jfx344');
 insert into usuarios (nombre, clave) values ('Ana','tru3fal');
 
 --Veamos cómo se almacenó los datos:
 select * from usuarios;

 --Ejercicios
 create table agenda(
 apellido varchar(30),
 nombre   varchar(20),
 domicilio varchar(30),
 telefono varchar(11),
 );

 select table_name,column_name,data_type,character_maximum_length
 from INFORMATION_SCHEMA.COLUMNS
 where TABLE_NAME = 'agenda'

  insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');

  select * from agenda
  drop table agenda

  create table libros(
  titulo varchar(20),
   autor varchar(30),
   editorial varchar(15)
   );

select table_name,column_name,data_type,character_maximum_length
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'libros'

insert into libros (titulo,autor,editorial) 
values ('El Aleph', 'Borger','Planeta');
insert into libros (titulo,autor,editorial)
values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial)
values ('Aprenda PHP','Mario Molina','Emece');

select * from libros
