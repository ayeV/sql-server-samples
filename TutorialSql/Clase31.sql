--34 - Registros duplicados (distinct)

drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );

 insert into libros(titulo,autor,editorial)
  values('El aleph','Borges','Planeta');
 insert into libros(titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Emece');
 insert into libros(titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros(titulo,autor,editorial)
  values('Antologia poetica','Borges','Planeta');
 insert into libros(titulo,autor,editorial)
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros(titulo,autor,editorial)
  values('Aprenda PHP','Lopez','Emece');
 insert into libros(titulo,autor,editorial)
  values('Manual de PHP', 'J. Paez', null);
 insert into libros(titulo,autor,editorial)
  values('Cervantes y el quijote',null,'Paidos');
 insert into libros(titulo,autor,editorial)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
 insert into libros(titulo,autor,editorial)
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
 insert into libros(titulo,autor,editorial)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
 insert into libros(titulo,autor,editorial)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 insert into libros(titulo,autor,editorial)
  values('PHP de la A a la Z',null,null);
 insert into libros(titulo,autor,editorial)
  values('Uno','Richard Bach','Planeta');

 --Para obtener la lista de autores sin repetición tipeamos:
 select distinct autor from libros;

 -- Note que aparece "null" como un valor para "autor"· 
 -- Para obtener la lista de autores conocidos, es decir, no incluyendo
 -- "null" en la lista:
 select distinct autor from libros
  where autor is not null;

 -- Contamos los distintos autores:
 select count(distinct autor)
  from libros;

 -- Queremos los nombres de las editoriales sin repetir:
 select distinct editorial from libros;

 -- Queremos saber la cantidad de editoriales distintas:
 select count(distinct editorial) from libros;

 -- La combinamos con "where" para obtener los distintos
 -- autores de la editorial "Planeta":
 select distinct autor from libros
  where editorial='Planeta';

 -- Contamos los distintos autores que tiene cada editorial
 -- empleando "group by":
 select editorial,count(distinct autor)
  from libros
  group by editorial;

  -- Mostramos los títulos y editoriales de los libros sin 
  -- repetir títulos ni editoriales:
 select distinct titulo,editorial
  from libros
  order by titulo;

  -------------------Ejercicios------------------
  drop table if exists clientes
  create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

-- Obtenga las provincias sin repetir (3 registros)
select distinct provincia from clientes

-- Cuente las distintas provincias.
select COUNT(distinct provincia) from clientes

-- Se necesitan los nombres de las ciudades sin repetir (6 registros)
select distinct ciudad from clientes

-- Obtenga la cantidad de ciudades distintas.
select COUNT(distinct ciudad) from clientes

-- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
select distinct ciudad from clientes
where provincia = 'Cordoba'

-- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
select COUNT(distinct ciudad) 
from clientes
group by provincia