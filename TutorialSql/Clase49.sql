--61 - Subconsultas any - some - all
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
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Ilusiones','Richard Bach',4,18);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Puente al infinito','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio) values('El aleph','Borges',2,10);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Antología','Borges',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Cervantes y el quijote','Borges',3,25);

 -- Mostramos los títulos de los libros de "Borges" de editoriales que han publicado
 -- también libros de "Richard Bach":
 select titulo
  from libros
  where autor like '%Borges%' and
  codigoeditorial = any
   (select e.codigo
    from editoriales as e
    join libros as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');

  -- Realizamos la misma consulta pero empleando "all" en lugar de "any":
 select titulo
  from libros
  where autor like '%Borges%' and
  codigoeditorial = all
   (select e.codigo
    from editoriales as e
    join libros as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');

 -- Mostramos los títulos y precios de los libros "Borges" cuyo precio supera
 -- a ALGUN precio de los libros de "Richard Bach":
 select titulo,precio
  from libros
  where autor like '%Borges%' and
  precio > any
   (select precio
    from libros
    where autor like '%Bach%');

 -- Veamos la diferencia si empleamos "all" en lugar de "any":
 select titulo,precio
  from libros
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros
    where autor like '%Bach%');

 -- Empleamos la misma subconsulta para eliminación:
 delete from libros
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros
    where autor like '%Bach%');


	--Ejercicios

	drop table if exists socios
		drop table if exists inscriptos

	 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
 );

 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

--3- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
--ambas tablas.
select s.numero, s.nombre, i.deporte
from socios as s
join inscriptos as i
on s.numero = i.numerosocio


--4- Muestre los socios que serán compañeros en tenis y también en natación (empleando 
--subconsulta)
--3 filas devueltas.
select s.nombre, i.deporte
from socios as s
join inscriptos as i
on s.numero = i.numerosocio
where deporte = 'tenis' and numero = any
(select numerosocio from inscriptos where deporte = 'natacion') 


--5- Vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.
--3 filas.
select deporte, numerosocio
from inscriptos 
where  inscriptos.numerosocio = 1
and inscriptos.deporte = any (select deporte from inscriptos where inscriptos.numerosocio= 2)

--6- Obtenga el mismo resultado anterior pero empleando join.
select i1.deporte
from inscriptos as i1
join inscriptos as i2
on i1.deporte = i2.deporte
where i1.numerosocio = 1 and i2.numerosocio =2

--7- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
--inscribió el socio 1.
--2 registros.
select deporte
from inscriptos as i
where i.numerosocio = 2
and cuotas > any(select cuotas from inscriptos where inscriptos.numerosocio = 1)


--8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
--inscribió el socio 1.
--1 registro.
select deporte
from inscriptos as i
where i.numerosocio = 2
and cuotas > all(select cuotas from inscriptos where inscriptos.numerosocio = 1)

--9- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
--lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
--cuota en algún deporte.
--7 registros.
delete from inscriptos
where inscriptos.numerosocio = any(select numerosocio from inscriptos where cuotas = 0)
