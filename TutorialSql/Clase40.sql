--47 - Combinación externa completa (full join)
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

 -- Realizamos una combinación externa completa para obtener todos los
 -- registros de ambas tablas, incluyendo los libros cuyo código de 
 -- editorial no existe en la tabla "editoriales"
 -- y las editoriales de las cuales no hay correspondencia en "libros":
 select titulo,nombre
  from editoriales as e
  full join libros as l
  on codigoeditorial = e.codigo;

  --Ejercicios

  drop table if exists deportes
  drop table if exists inscriptos

  create table deportes(
  codigo int identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte smallint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

 insert into deportes(nombre,profesor) values('tenis','Marcelo Roca');
 insert into deportes(nombre,profesor) values('natacion','Marta Torres');
 insert into deportes(nombre,profesor) values('basquet','Luis Garcia');
 insert into deportes(nombre,profesor) values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

-- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
--obtener el nombre de cada deporte (6 registros)
select i.documento, matricula, d.nombre
from inscriptos as i
 join deportes as d
on i.codigodeporte=d.codigo


-- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
select i.documento, i.matricula, d.nombre
from deportes as d
left join inscriptos as i
on d.codigo = i.codigodeporte

-- Obtenga la misma salida anterior empleando un "rigth join".
select i.matricula, i.documento, d.nombre
from inscriptos as i
right join deportes as d
on i.codigodeporte = d.codigo

-- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)
select i.documento, i.matricula, d.nombre
from deportes as d
left join inscriptos as i
on d.codigo = i.codigodeporte 
where i.codigodeporte is null

-- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 
--registro)
select i.documento
from inscriptos as i
right join deportes as d
on i.codigodeporte = d.codigo
where i.codigodeporte is null
-- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
--a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)
select d.nombre, d.profesor, i.documento, i.matricula
from deportes as d
full join inscriptos as i
on d.codigo= i.codigodeporte