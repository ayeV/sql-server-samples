if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);

-- Recuperamos los registros ordenados por el título:
select * from libros
 order by titulo;

-- Ordenamos los registros por el campo "precio", referenciando el campo
-- por su posición en la lista de selección:
select titulo,autor,precio
  from libros order by 3;

-- Los ordenamos por "editorial", de mayor a menor empleando "desc":
select * from libros
  order by editorial desc;

-- Ordenamos por dos campos:
 select * from libros
  order by titulo,editorial;

-- Ordenamos en distintos sentidos:
 select * from libros
  order by titulo asc, editorial desc;

-- Ordenamos por un campo que no se lista en la selección:
 select titulo, autor
  from libros
  order by precio;

-- Ordenamos por un valor calculado:
 select titulo, autor, editorial,
        precio+(precio*0.1) as 'precio con descuento'
   from libros
   order by 4;	

   --Ejercicios
   drop table if exists visitas

   create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);

insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

select *from visitas
order by fecha desc

select nombre,pais, DATENAME(MONTH,fecha) from visitas
order by pais, DATENAME(MONTH, fecha) desc

select mail,pais from visitas
where DATENAME(MONTH, fecha) = 'October'
order by pais
