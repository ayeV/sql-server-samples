--Operadores relacionales <> distinto
drop table if exists libros;

 create table libros(
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio float
 );

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',24.50);
 insert into libros (titulo,autor,editorial,precio)
  values ('Martin Fierro','Jose Hernandez','Emece',16.00);
 insert into libros (titulo,autor,editorial,precio)
  values ('Aprenda PHP','Mario Molina','Emece',35.40);
 insert into libros (titulo,autor,editorial,precio)
  values ('Cervantes y el quijote','Borges','Paidos',50.90);

 -- Seleccionamos los registros cuyo autor sea diferente de 'Borges':
 select * from libros
  where autor<>'Borges';

 -- Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y precio:
 select titulo,precio
  from libros
  where precio>20;

 -- Recuperamos aquellos libros cuyo precio es menor o igual a 30:
 select * from libros
  where precio<=30;

  --Ejercicios
  create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

  insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

  select * from articulos

  select * from articulos
  where nombre  = 'impresora'

  select * from articulos
  where precio >= 400

  select codigo, nombre from articulos
  where cantidad < 30

  select nombre,descripcion from articulos
  where precio <> 100

  ---------------
  drop table if exists peliculas

   create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,4);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,1);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',80,2);

  select * from peliculas

  select * from peliculas
  where duracion <= 90

  select titulo from peliculas where actor <> 'Tom Cruise'

  select titulo, actor, cantidad from peliculas
  where cantidad>2

