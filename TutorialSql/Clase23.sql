if object_id ('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
);

go

set dateformat ymd;

insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

-- Mostramos el título del libro y el año de edición:
select titulo, datepart (year,edicion) as añoEdicion from libros;

-- Mostramos el título del libro y el nombre del mes de edición:
select titulo, datename (month,edicion) from libros;

-- Mostramos el título del libro y los años que tienen de editados:
select titulo, datediff(year,edicion,getdate()) from libros;

-- Muestre los títulos de los libros que se editaron el día 9, de cualquier mes de cualquier año:
 select titulo from libros
  where datepart(day,edicion)=9;



  --Ejercicios
  if object_id ('empleados') is not null
  drop table empleados;

  create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 );

 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

 select * from empleados


  select nombre+space(1)+upper(apellido) as nombre,
  stuff(documento,1,0,'DNI Nº ') as documento,
  stuff(sueldo,1,0,'$ ') as sueldo from empleados;

   select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

select nombre, apellido from empleados where DATENAME(MONTH,fechanacimiento) = 'October'
select nombre, apellido from empleados where DATEPART(YEAR, fechaingreso) = 2000