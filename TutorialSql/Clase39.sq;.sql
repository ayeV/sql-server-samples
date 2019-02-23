--46 - Combinación externa derecha (right join)

drop table if exists libros;
 drop table if exists editoriales;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key(codigo)
 );
 create table editoriales(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('El aleph','Borges',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('Aprenda PHP','Mario Molina',2,50);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Java en 10 minutos',default,4,45);

 -- Solicitamos el título y nombre de la editorial de los libros empleando
 -- un "right join":
 select titulo,nombre
  from libros as l
  right join editoriales as e
  on codigoeditorial = e.codigo;
 -- Las editoriales de las cuales no hay libros, es decir, cuyo código de editorial
 -- no está presente en "libros" aparece en el resultado, pero con el valor
 -- "null" en el campo "titulo".

 -- Realizamos la misma consulta anterior agregando un "where" que restringa el
 -- resultado considerando solamente los registros que encuentran coincidencia
 -- en la tabla izquierda:
 select titulo,nombre
  from libros as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;

 -- Mostramos las editoriales que NO están presentes en "libros" 
 -- (que NO encuentran coincidencia en "editoriales"):
 select titulo,nombre
  from libros as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is null;



  --Ejercicios
  drop table if exists clientes
  drop table if exists provincias

  create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Luis','Sucre 475','Santa Rosa',5);

-- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right 
--join".
select c.nombre, domicilio,ciudad,p.nombre
from provincias as p
right join clientes as c
on c.codigoprovincia = p.codigo

-- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
select c.nombre, domicilio,ciudad,p.nombre
from clientes as c
left join provincias as p
on p.codigo = c.codigoprovincia

-- Empleando un "right join", muestre solamente los clientes de las provincias que existen en 
--"provincias" (5 registros)
select c.nombre, domicilio, ciudad, p.nombre
from provincias as p
right join clientes as c
on c.codigoprovincia = p.codigo
where p.codigo is not null


-- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
--ciudad (2 registros)
select c.nombre, domicilio, ciudad, p.nombre
from provincias as p
right join clientes as c
on c.codigoprovincia = p.codigo
where p.codigo is null 
order by c.ciudad