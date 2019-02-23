--Delete
 drop table if exists usuarios;
 
 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');

 select * from usuarios;

 -- Vamos a eliminar el registro cuyo nombre de usuario es "Marcelo":
 delete from usuarios
  where nombre='Marcelo';

 -- Veamos el contenido de la tabla:
 select * from usuarios;

-- Intentamos eliminarlo nuevamente:
 delete from usuarios
  where nombre='Marcelo';

 select * from usuarios;
 
 -- Eliminamos todos los registros cuya clave es 'Boca':
 delete from usuarios
  where clave='Boca';

-- Veamos el contenido de la tabla:
 select * from usuarios;

-- Eliminemos todos los registros:
 delete from usuarios;

-- Veamos el contenido de la tabla:
 select * from usuarios;

 --Ejercicios

 drop table if exists agenda
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda(apellido,nombre,domicilio,telefono)
 values ( 'Alvarez','Alberto','Colon 123',4234567);
  insert into agenda(apellido,nombre,domicilio,telefono)
 values (  'Juarez','Juan','Avellaneda 135',4458787);
   insert into agenda(apellido,nombre,domicilio,telefono)
 values (  'Lopez','Maria','Urquiza 333',4545454);
	insert into agenda(apellido,nombre,domicilio,telefono)
 values (  'Lopez','Jose','Urquiza 333',4545454);
	 insert into agenda(apellido,nombre,domicilio,telefono)
 values (  'Salas','Susana','Gral. Paz 1234',4123456);

 select * from agenda

 delete from agenda 
 where nombre = 'Juan'
  select * from agenda

  delete from agenda where telefono = 4545454

  select * from agenda

  delete from agenda


  ----------
  drop table if exists articulos

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

  delete from articulos where precio >= 500
  select *from articulos

  delete from articulos where nombre = 'impresora'
  delete from articulos where codigo <> 4