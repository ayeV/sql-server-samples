--Trabajar con varias tablas
--INNER JOIN
 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key(codigo)
 );
 
 drop table if exists editoriales;
 

  create table editoriales(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('El aleph','Borges',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Aprenda PHP','Mario Molina',3,50);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Java en 10 minutos',default,3,45);

 -- Recuperamos los datos de libros:
 select* from libros;

 -- Vemos que en el campo "editorial" aparece el código,
 -- pero no sabemos el nombre de la editorial.

 -- Realizamos un join para obtener datos de ambas tablas 
 -- (titulo, autor y nombre de la editorial):
 select titulo, autor, nombre
  from libros
  join editoriales
  on codigoeditorial=editoriales.codigo;

 -- Mostramos el código del libro, título, autor, nombre
 -- de la editorial y el precio realizando un join y empleando alias:
 select l.codigo,titulo,autor,nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;


 -- Realizamos la misma consulta anterior agregando un "where" 
 -- para obtener solamente los libros de la editorial "Siglo XXI":
 select l.codigo,titulo,autor,nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo
  where e.nombre='Siglo XXI';

 -- Obtenemos título, autor y nombre de la editorial, esta vez ordenados por título:
 select titulo,autor,nombre
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo
  order by titulo;


  --Ejercicios
 drop table if exists clientes

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
   values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Torres Fabiola','Alem 777','Ibera',3);

-- Obtenga los datos de ambas tablas, usando alias
 select client.nombre, client.domicilio,client.ciudad,prov.nombre
  from clientes as client
  join provincias as prov
  on client.codigo = prov.codigo

-- Obtenga la misma información anterior pero ordenada por nombre de provincia.
 select client.nombre, client.domicilio,client.ciudad,prov.nombre
  from clientes as client
  join provincias as prov
  on client.codigo = prov.codigo
  order by prov.nombre

-- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)
select clientes.nombre
from clientes
inner join provincias
on clientes.codigoprovincia = provincias.codigo
where provincias.nombre = 'Santa Fe'

------------------------------
create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
 );


 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

-- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.
--Note que la condición es compuesta porque para identificar los registros de la tabla "inasistencias"necesitamos ambos campos.
select inscript.nombre, inscript.deporte, inasis.fecha
from inscriptos as inscript
inner join inasistencias as inasis

on inscript.documento = inasis.documento and
inscript.deporte = inasis.deporte
order by inscript.nombre,inscript.deporte
 

-- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado inscripto en un 
--determinado deporte (3 registros)
select inscript.nombre, inscript.deporte, inasis.fecha
from inscriptos as inscript
inner join inasistencias as inasis

on inscript.documento = inasis.documento and
inscript.deporte = inasis.deporte
where inasis.documento = '22222222'

-- Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la 
--matrícula(4 registros)
select inscript.nombre, inscript.deporte, inasis.fecha
from inscriptos as inscript
inner join inasistencias as inasis

on inscript.documento = inasis.documento and
inscript.deporte = inasis.deporte
where inscript.matricula = 's'