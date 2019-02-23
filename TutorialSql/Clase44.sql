--51 - Combinación de más de dos tablas

 drop table if exists libros;
 drop table if exists autores;
 drop table if exists editoriales;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key(codigo)
 );

 create table autores(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table editoriales(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');
 insert into editoriales(nombre) values('Plaza');
 
 insert into autores(nombre) values ('Richard Bach');
 insert into autores(nombre) values ('Borges');
 insert into autores(nombre) values ('Jose Hernandez');
 insert into autores(nombre) values ('Mario Molina');
 insert into autores(nombre) values ('Paenza');
 
 insert into libros(titulo,codigoautor,codigoeditorial,precio) 
   values('El aleph',2,2,20);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Martin Fierro',3,1,30);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Aprenda PHP',4,3,50);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Uno',1,1,15);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Java en 10 minutos',0,3,45);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Matematica estas ahi',0,0,15);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Java de la A a la Z',4,0,50);

 -- Recuperamos todos los datos de los libros consultando las tres tablas:
 select titulo,a.nombre,e.nombre,precio
  from autores as a
  join libros as l
  on codigoautor=a.codigo
  join editoriales as e
  on codigoeditorial=e.codigo;
 -- Los libros cuyo código de autor no se encuentra en "autores" 
 -- (caso de "Java en 10 minutos" y "Matematica estas ahi") y 
 -- cuya editorial no existe en "editoriales" 
 -- (caso de "Matematica estas ahi" y "Java de la A a la Z"),
 -- no aparecen porque realizamos una combinación interna.

 -- Podemos combinar varios tipos de join en una misma sentencia:
 select titulo,a.nombre,e.nombre,precio
  from autores as a
  right join libros as l
  on codigoautor=a.codigo
  left join editoriales as e
  on codigoeditorial=e.codigo;
  ----Ejercicios


  ---1- Cree las tablas con las siguientes estructuras:
  drop table if exists socios
  drop table if exists deportes
  drop table if exists inscriptos




 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo int identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');


 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

-- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
--exista en "socios":
 insert into inscriptos values ('26666666',0,'2006','s');

-- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
--diferentes tipos de join.
select s.nombre,d.nombre, i.anio
from deportes as d
join inscriptos as i
on d.codigo = i.codigodeporte
join socios as s
on s.documento= i.documento




-- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
--inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
--encuentra en "socios".
select i.anio,i.documento,i.matricula
from inscriptos as i
 full join deportes as d
on i.codigodeporte = d.codigo
full join socios as s
on s.documento = i.documento


--- Muestre todas las inscripciones del socio con documento "22222222".
select i.anio,i.documento,i.matricula,s.nombre
from inscriptos as i
 full join deportes as d
on i.codigodeporte = d.codigo
full join socios as s
on s.documento = i.documento
where s.documento = 22222222