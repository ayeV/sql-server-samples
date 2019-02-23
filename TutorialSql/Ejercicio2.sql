----Ejercicio 2 de tutorial SQL
--create table agenda(
--apellido varchar(30),
--nombre varchar(20),
--domicilio varchar(30),
--telefono varchar(11)
-- );

--select table_name,column_name,DATA_TYPE,character_maximum_length 
--  from information_schema.columns 
--  where table_name = 'agenda';

--drop table agenda

create table libros(
titulo varchar(20), 
autor varchar(30),
editorial varchar(15),
);

select table_name,column_name,data_type,character_maximum_length
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME =  'libros'

drop table libros