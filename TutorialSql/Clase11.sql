--Valores null
 drop table if exists libros;
 
 create table libros(
  titulo varchar(30) not null,
  autor varchar(30) not null,
  editorial varchar(15) null,
  precio float
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais','Lewis Carroll',null,0);

 --Para ver cuáles campos admiten valores nulos y cuáles no, empleamos:
 select table_name,column_name,DATA_TYPE,character_maximum_length,is_nullable 
  from information_schema.columns 
  where table_name = 'libros';

  -- Dijimos que el valor "null" no es lo mismo que una cadena vacía. 
  -- Vamos a ingresar un registro con cadena vacía para el campo "editorial":
 insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','',18.50);

 -- Ingresamos otro registro, ahora cargamos una cadena vacía en el campo "titulo":
 insert into libros (titulo,autor,editorial,precio)
  values('','Richard Bach','Planeta',22);

 -- Veamos todos los registros ingresados:
 select * from libros;

 -- Recuperemos los registros que contengan el valor "null" en el campo "precio":
 select * from libros
  where precio is null;

 select * from libros
  where precio=0;

 -- Recuperemos los libros cuyo nombre de editorial es "null":
 select * from libros
  where editorial is null;

 -- Ahora veamos los libros cuya editorial almacena una cadena vacía:
 select * from libros
  where editorial=''; 

 -- Para recuperar los libros cuyo precio no sea nulo tipeamos:
 select * from libros
  where precio is not null;

  --Ejercicios
   create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
 );

 select table_name, column_name, data_type, character_maximum_length, is_nullable
 from INFORMATION_SCHEMA.COLUMNS
 where table_name = 'medicamentos'

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(3,'Buscapina','Roche',null,200);

select * from medicamentos

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values (4,'Palatrobil','',0,200)

select * from medicamentos where laboratorio is null
select * from medicamentos where laboratorio = ''
select * from medicamentos where precio is null
select * from medicamentos where precio = 0

select * from medicamentos where laboratorio <> ''
select * from medicamentos where laboratorio is not null;
select * from medicamentos where precio<>0;

select * from medicamentos where precio is not null;

-----------
drop table if exists peliculas

 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

insert into peliculas (codigo,titulo,actor,duracion)
values(1,'Mision imposible','Tom Cruise',120);
insert into peliculas (codigo,titulo,actor,duracion)
values(2,'Harry Potter y la piedra filosofal',null,180);
insert into peliculas (codigo,titulo,actor,duracion)
values(3,'Harry Potter y la camara secreta','Daniel R.',null);
insert into peliculas (codigo,titulo,actor,duracion)
values(0,'Mision imposible 2','',150);
insert into peliculas (codigo,titulo,actor,duracion)
values(4,'','L. Di Caprio',220);
insert into peliculas (codigo,titulo,actor,duracion)
values(5,'Mujer bonita','R. Gere-J. Roberts',0);

select * from peliculas;

select * from peliculas where actor is null
select * from peliculas where actor = ''

update peliculas set duracion = 120 where duracion is null
update peliculas set actor = 'desconocido' where actor = ''

delete  from peliculas where titulo = ''