--66 - Subconsulta (update - delete)

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

 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Ilusiones','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('El aleph','Borges',3,10);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Poemas','Juan Perez',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Cuentos','Juan Perez',3,25);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Java en 10 minutos','Marcelo Perez',2,30);

 -- Actualizamos el precio de todos los libros de editorial "Emece" incrementándolos en un 10%:
 update libros set precio=precio+(precio*0.1)
  where codigoeditorial=
   (select codigo
     from editoriales
     where nombre='Emece');

 -- Eliminamos todos los libros de las editoriales que tiene publicados libros de "Juan Perez":
 delete from libros
  where codigoeditorial in
   (select e.codigo
    from editoriales as e
    join libros
    on codigoeditorial=e.codigo
    where autor='Juan Perez');


--Ejercicios
 drop table if exists socios;
 drop table if exists inscriptos;

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
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte)
 );

 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis','s');
 insert into inscriptos values(1,'basquet','s');
 insert into inscriptos values(1,'natacion','s');
 insert into inscriptos values(2,'tenis','s');
 insert into inscriptos values(2,'natacion','s');
 insert into inscriptos values(2,'basquet','n');
 insert into inscriptos values(2,'futbol','n');
 insert into inscriptos values(3,'tenis','s');
 insert into inscriptos values(3,'basquet','s');
 insert into inscriptos values(3,'natacion','n');
 insert into inscriptos values(4,'basquet','n');

--3- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) 
--empleando subconsulta.
update inscriptos set matricula = 's'
where numerosocio =
(select numero from socios where documento = 25555555)
--4- Elimine todas las inscripciones de los socios que deben alguna matrícula.
--5 registros eliminados.
delete from inscriptos 
where numerosocio in 
(select numero from socios as s
join inscriptos as i 
on s.numero = i.numerosocio 
where matricula = 'n')