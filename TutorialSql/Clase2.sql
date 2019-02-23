--Elimino la tabla si existe
drop table if exists  usuarios;

--Creo la tabla usuarios
create table usuarios (	
nombre varchar(30),
clave varchar(10)
);

--Veamos la estructura de la tabla "usuarios":
select table_name,column_name,DATA_TYPE,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';

  --Elimino la tabla
  drop table usuarios

  --Verifico si se ha eliminado
  select table_name,column_name,DATA_TYPE,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';
