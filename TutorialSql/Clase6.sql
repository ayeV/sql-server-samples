--Where
drop table if exists usuarios;
 
 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 -- Vemos la estructura de la tabla:
 select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';

  -- Ingresamos algunos registros:
 insert into usuarios (nombre, clave)
  values ('Marcelo','Boca');
 insert into usuarios (nombre, clave)
  values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave)
  values ('Susana','River');
 insert into usuarios (nombre, clave)
  values ('Luis','River');

 -- Realizamos una consulta especificando una condición, queremos 
 -- ver el usuario cuyo nombre es "Leonardo":
 select * from usuarios
  where nombre='Leonardo';

  -- Realizamos un "select" de los nombres de los usuarios cuya clave es "Santi":
 select nombre from usuarios
  where clave='Santi';

-- Queremos ver el nombre de los usuarios cuya clave es "River":
 select nombre from usuarios
  where clave='River';

  --Ejercicios
  drop table if exists agenda

   create table agenda(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(50),
  telefono integer
 );

  select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'agenda';

  insert into agenda (apellido,nombre,domicilio,telefono) 
  values ('Acosta','Ana','Colon 123', 4234567);
  insert into agenda (apellido,nombre,domicilio,telefono) 
  values ('Bustamante','Betina','Avellaneda 135', 445878);
  insert into agenda (apellido,nombre,domicilio,telefono) 
  values ('Lopez','Hector','Salta 123', 4245567);
  insert into agenda (apellido,nombre,domicilio,telefono) 
  values ('Lopez','Luis','Urquiza 123', 1234567);
  insert into agenda (apellido,nombre,domicilio,telefono) 
  values ('Lopez','Maria','Urquiza 123', 1234567)


select * from agenda

select * from agenda
where nombre = 'Maria';

select nombre,domicilio from agenda
where apellido = 'Lopez';

select nombre from agenda where telefono = 1234567;

----------
drop table if exists libros

 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

insert into libros(titulo,autor,editorial)
values ('El aleph','Borges','Emece');
insert into libros (titulo,autor,editorial)
values (' Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial)
values ( 'Aprenda PHP','Mario Molina','Siglo XXI');

select * from libros

select * from libros
where autor = 'Borges'

select titulo from libros
where editorial = 'Emece'


 