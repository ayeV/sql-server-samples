--Select
 drop table if exists libros;

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
 );

 select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'libros';

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);

  --El * indica que se mostrara todo
 select * from libros;

 select titulo,autor,editorial from libros; 

 select titulo,precio from libros;

 select editorial,cantidad from libros; 

 --Ejercicios

 drop table if exists peliculas

  create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

  select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'peliculas';

  insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

  select peliculas.titulo, peliculas.actor from peliculas

  select peliculas.titulo,peliculas.duracion from peliculas

  select peliculas.titulo,peliculas.cantidad from peliculas