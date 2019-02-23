--Count

drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
 );

 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',15.90);
 insert into libros(titulo,autor,editorial,precio)
  values('Antología poética','J. L. Borges','Planeta',null);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros(titulo,autor,editorial,precio)
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez',default,40);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',20);

 -- Averiguemos la cantidad de libros usando la función "count()":
 select count(*)
  from libros;
 -- Note que incluye todos los libros aunque tengan valor nulo en algún campo.

 -- Contamos los libros de editorial "Planeta":
 select count(*)
  from libros
  where editorial='Planeta';
 
 -- Contamos los registros que tienen precio (sin tener en cuenta los que 
 -- tienen valor nulo), usando la función "count(precio)":
 select count(precio)
  from libros;

  --Ejercicios
  drop table if exists medicamentos;

  create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  numerolote int default null,
  primary key(codigo)
 );

 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

  select * from medicamentos

-- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)
select COUNT(*) from medicamentos
--Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)
select COUNT(laboratorio) from medicamentos

-- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
--distinto a "null", disponer alias para las columnas.
select COUNT(precio) as precio,
 count(cantidad) as cantidad from medicamentos

-- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" 
select COUNT(precio) from medicamentos where laboratorio like 'B%'

-- Cuente la cantidad de medicamentos con número de lote distinto de "null" (0 registros)
select COUNT(numerolote) from medicamentos