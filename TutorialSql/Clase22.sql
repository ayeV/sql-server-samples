 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(9,2),
  primary key (codigo)
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
 insert into libros (titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);

 -- Vamos a mostrar los precios de los libros redondeando
 -- el valor hacia abajo y hacia arriba:
 select titulo,autor,precio,
  floor(precio) as abajo,
  ceiling(precio) as arriba
  from libros;

  --Ejercicios
  drop table if exists clientes

   create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  credito decimal(9,2),
  primary key(codigo)
);

 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba',1900.56);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba',450.33);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba',190);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Olmos Luis','Sarmiento 444','Rosario','Santa Fe',670.22);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba',500.55);

  select * from clientes

 select codigo,nombre,domicilio,ciudad,provincia,ceiling(credito) from clientes;
