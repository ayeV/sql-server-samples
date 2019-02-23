--4.Tipos de datos
drop table if exists libros;
 
 create table libros(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float,
  cantidad integer
 );

 select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'libros';

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);

 select * from libros;

 --Ejercicios

 create table peliculas(
 nombre varchar(50),
 actor  varchar(30),
 duracion integer,
 cantidad integer
 );

 
 select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'peliculas';

   insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

  select *from peliculas


  create table empleados(
  nombre varchar(50),
  documento integer,
  sexo char,
  domicilio varchar(50),
  sueldobasico float
  );

   select table_name,column_name,data_type,character_maximum_length 
  from information_schema.columns 
  where table_name = 'empleados';

   insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

  select * from empleados