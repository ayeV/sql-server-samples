--Campo autoincremental

drop table if exists libros;
 
 create table libros(
  codigo int not null identity,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );

 -- Al visualizar la estructura de la tabla:
 select table_name,column_name,DATA_TYPE,character_maximum_length,is_nullable 
  from information_schema.columns 
  where table_name = 'libros';

 -- Ingresamos algunos registros:
 insert into libros (titulo,autor,editorial)
  values('El aleph','Borges','Planeta');
 -- Note que al detallar los campos para los cuales ingresaremos valores hemos
 -- omitido "codigo"; cuando un campo es serial no es necesario ingresar valor
 -- para él, porque se genera automáticamente.Recuerde que si es obligatorio 
 -- ingresar los datos de todos los campos que se detallan y en el mismo orden.

 -- Si mostramos los registros:
 select * from libros;
 -- vemos que este primer registro ingresado guardó el valor 1 en el campo 
 -- correspondiente al código, comenzó la secuencia en 1.

 -- Ingresamos más registros:
 insert into libros (titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros (titulo,autor,editorial)
  values('Cervantes y el quijote','Borges','Paidos');
 insert into libros (titulo,autor,editorial)
  values('Matematica estas ahi', 'Paenza', 'Paidos');

 -- Seleccionamos todos los registros:
 select codigo,titulo,autor,editorial from libros;
 -- Vemos que el código, dato que no ingresamos, 
 -- se cargó automáticamente siguiendo la secuencia de autoincremento.

 -- Ahora borramos el libro con código 1:
 delete from libros where codigo=1;

 -- Mostramos todos los registros:
 select * from libros; 

 -- Insertamos un nuevo libro e indicamos el valor que debe tomar el campo serial:
insert into libros (codigo,titulo,autor,editorial) 
  values(1,'Aprender Python', 'Rodriguez Luis', 'Paidos'); select * from libros;

 -- Luego si insertamos otro registro sin indicar el valor del campo serial el valor
 -- generado es el siguiente del último generado:
 insert into libros (titulo,autor,editorial)
  values('Java Ya', 'Nelson', 'Paidos');

 select * from libros; 

 --Ejercicios
 drop table if exists peliculas
 create table peliculas(
 codigo int not null identity,
 titulo varchar(50),
 actor varchar(20),
 duracion int,
 primary key(codigo)
 );

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','xxx',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','xxx',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

  select * from peliculas

  update peliculas set actor = 'Daniel R'
  where codigo = 3

  delete from peliculas where titulo = 'La vida es bella'

  delete from peliculas where duracion = 120

   insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);