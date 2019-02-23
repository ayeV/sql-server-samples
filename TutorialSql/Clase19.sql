drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad smallint default 0,
  primary key (codigo)
 );

 -- Ingresamos algunos registros:
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

 -- Queremos saber el monto total en dinero de cada libro:
 select titulo, precio,cantidad,
  precio*cantidad
  from libros;

 --Queremos saber el precio de cada libro con un 10% de descuento:
 select titulo,precio,
  precio-(precio*0.1)
  from libros;

 -- Actualizamos los precios con un 10% de descuento y vemos el resultado:
 update libros set precio=precio-(precio*0.1);
 select * from libros;

-- Queremos una columna con el título, el autor y la editorial de cada libro:
 select titulo + '-' + autor + '-' + editorial
  from libros;

  --Ejercicio

  drop table if exists articulos
  create table articulos(
  codigo int not null identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio decimal(9,2),
  cantidad smallint default 0,
  primary key (codigo)
 );

  insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

  update articulos set precio = precio+(precio*0.15)
  select * from articulos

  select nombre + ',' + descripcion 
  from articulos

  update articulos set cantidad = cantidad-5
  where nombre = 'teclado'
  --------------------------------------------------
  --20.Alias
  drop table if exists agenda;

 create table agenda(
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda
  values('Juan Perez','Avellaneda 908','4252525');
 insert into agenda
  values('Marta Lopez','Sucre 34','4556688');
 insert into agenda
  values('Carlos Garcia','Sarmiento 1258',null);

 -- Mostramos la información con el encabezado "nombreyapellido" para el campo "nombre":
 select nombre as nombreyapellido,
  domicilio,telefono
  from agenda;

  select * from agenda

-- Si tiene espacios en blanco el encabezado debe ir entre comillas dobles:
 select nombre as "nombre y apellido",
  domicilio,telefono
  from agenda;