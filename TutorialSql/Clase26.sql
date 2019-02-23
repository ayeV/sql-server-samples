--Busqueda de patrones, like, not like
if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);

-- Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":
select * from libros
  where autor like '%Borges%';

-- Seleccionamos los libros cuyos títulos comienzan con la letra "M":
select * from libros
  where titulo like 'M%';

-- Seleccionamos todos los títulos que NO comienzan con "M":
select * from libros
  where titulo not like 'M%';

-- Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe 
-- "Carroll" o "Carrolt", podemos emplear el comodín "_" (guión bajo) y establecer
-- la siguiente condición:
select * from libros
  where autor like '%Carrol_';

-- Buscamos los libros cuya editorial comienza con las letras entre la "P" y la "S":
select titulo,autor,editorial
  from libros
  where editorial like '[P-S]%';

-- Seleccionamos los libros cuya editorial NO comienza con las letras "P" ni "N":
select titulo,autor,editorial
  from libros
  where editorial like '[^PN]%';

-- Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:
select titulo,precio from libros
  where precio like '1_.%';

-- Recuperamos los libros que NO incluyen centavos en sus precios:
select titulo,precio from libros
  where precio like '%.00';
  

  --Ejercicios
  if object_id('empleados') is not null
  drop table empleados;


 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );


 insert into empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);
  
  --Muestre todos los empleados con apellido "Perez"
  select *  from empleados where nombre like '%Perez%'

  --Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8"
  select *from empleados where domicilio like 'Co%8%'

  --Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 
  select * from empleados where documento like '%[02468]'

 -- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y cuyo nombre finalice en "ez"
  select * from empleados where documento  like '[^13]%' and nombre like '%ez'

  --Recupere todos los nombres que tengan una "y" o una "j" en su nombre o apellido
  select nombre from empleados where nombre like '%[yj]%'

  --Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o "G" y tengan 8 caracteres
  select nombre,seccion from empleados where seccion like '[SG]________'


--- Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con "S" o "G" (2 registros)
select nombre, seccion from empleados where seccion  not like '[SG]%'

-- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos 
select nombre, sueldo from empleados where sueldo like '%.00'

-- Muestre los empleados que hayan ingresado en "1990" (3 registros)
select  * from empleados where fechaingreso like '%1990%'

