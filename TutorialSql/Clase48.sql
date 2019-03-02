--60 - Subconsultas con in
drop table if exists editoriales;
 drop table if exists libros;
  
 create table editoriales(
  codigo int identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
 insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);

 -- Queremos conocer el nombre de las editoriales que han publicado libros del autor "Richard Bach":
 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');

 -- Probamos la subconsulta separada de la consulta exterior para verificar que retorna una lista
 -- de valores de un solo campo:
 select codigoeditorial
  from libros
  where autor='Richard Bach';

 -- Podemos reemplazar por un "join" la primera consulta:
 select distinct nombre
  from editoriales as e
  join libros
  on codigoeditorial=e.codigo
  where autor='Richard Bach';

 -- También podemos buscar las editoriales que no han publicado libros de "Richard Bach":
 select nombre
  from editoriales
  where codigo not in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');


	 --Ejercicios
	 drop table if exists ciudades;
	 drop table if exists clientes;

create table ciudades(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad smallint not null,
  primary key(codigo)
 );

 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');

 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
 insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);

--3- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
--"San Martin", empleando subconsulta.
--3 registros.
select nombre
from ciudades
where codigo in
(select codigociudad from clientes where domicilio like 'San Martin %')



--4- Obtenga la misma salida anterior pero empleando join.
select c.nombre
from ciudades as c
join clientes as cl
on c.codigo = cl.codigociudad
where cl.domicilio like 'San Martin %'

--5- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 
--específica, empleando subconsulta.
--2 registros.
select nombre
from ciudades
where codigo not in
(select codigociudad from clientes where clientes.nombre like 'G%');


--6- Pruebe la subconsulta del punto 5 separada de la consulta exterior para verificar que retorna 
--una lista de valores de un solo campo.
select codigociudad from clientes
where nombre like 'G%'
