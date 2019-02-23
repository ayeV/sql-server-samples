--Update
drop table if exists usuarios;
 
 create table usuarios(
  nombre varchar(20),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');

 -- Cambiaremos los valores de todas las claves, por la cadena "RealMadrid":
 update usuarios set clave='RealMadrid';

 -- El cambio afectó a todos los registros, veámoslo:
 select * from usuarios;

 -- Necesitamos cambiar el valor de la clave del usuario llamado "Federicolopez" por "Boca":
 update usuarios set clave='Boca'
  where nombre='Federicolopez';

 -- Verifiquemos que la actualización se realizó:
 select * from usuarios;

 -- Vimos que si PostgreSQL no encuentra registros que cumplan con la condición no se 
 -- modifican registros:
 update usuarios set clave='payaso'
  where nombre='JuanaJuarez';

 select * from usuarios;

 -- Para actualizar varios campos en una sola instrucción empleamos:
 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';

 -- Si vemos la tabla:
 select * from usuarios;

 --Ejercicios
 drop table if exists agenda;
  create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

  insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

  update agenda set nombre = 'Juan José'
  where nombre = 'Juan'

  select * from agenda

  update agenda set telefono = 4445566
  where telefono = 4545454

  ---------
 drop table if exists libros

 create table libros(
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio float
 );

  insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);

  select * from libros

  update  libros set autor = 'Adrian Paenza' where autor = 'Paenza'

   update libros set precio=27
 where autor='Mario Molina';

  update libros set editorial= 'Emece SA'
 where editorial ='Emece';

