--Operadores logicos

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','Borges','Planeta',39.50);
insert into libros
  values('Java en 10 minutos','Mario Molina','Planeta',50.50);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Paidos',16.80);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',19.50);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',18.40);

-- Recuperamos los libros cuyo autor sea igual a "Borges" y 
-- cuyo precio no supere los 20 pesos:
select * from libros
  where (autor='Borges') and
  (precio<=20);

-- Seleccionamos los libros cuyo autor es "Borges" y/o cuya editorial es "Planeta":
select * from libros
  where autor='Borges' or
  editorial='Planeta';

-- Recuperamos los libros cuya editorial NO es "Planeta":
 select * from libros
  where not editorial='Planeta';

-- Veamos cómo el uso de paréntesis hace que SQL Server evalúe en forma diferente
-- ciertas consultas aparentemente iguales:
 select * from libros
  where (autor='Borges') or
  (editorial='Paidos' and precio<20);

 select * from libros
  where (autor='Borges' or editorial='Paidos') and
  (precio<20);

  --Ejercicios

   if object_id('medicamentos') is not null
  drop table medicamentos;

   create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );

  insert into medicamentos
  values('Sertal','Roche',5.2,100);
 insert into medicamentos
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos
  values('Amoxidal jarabe','Bayer',5.10,250); 

  select codigo, nombre from medicamentos
  where(laboratorio = 'Roche' and precio <5)

 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;

  select * from medicamentos
  where (not laboratorio = 'Bayer' and cantidad =100)

   select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;

  delete from medicamentos where (laboratorio = 'Bayer' and precio >10)

  update medicamentos set cantidad  = 200 where (laboratorio = 'Roche' and precio >5)

   delete from medicamentos where (laboratorio = 'Bayer' or precio <3)

   --------------------------------

   if object_id('peliculas') is not null
  drop table peliculas;

   create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

  insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas
  values('Elsa y Fred','China Zorrilla',110);

select * from peliculas where (actor =  'Tom Cruise' or actor = 'Richard Gere')
select * from peliculas where (actor = 'Tom Cruise' and duracion <100)

update peliculas  set duracion = 200 where (actor = 'Daniel R.' and duracion = 180)

delete from peliculas where (not actor = 'Tom Cruise' and duracion >=100)



---Operadores relacionales
---------IS NULL
if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros (titulo,autor,precio)
  values('Antología poética','Borges',25.50);
insert into libros (titulo,autor,precio)
  values('Java en 10 minutos','Mario Molina',45.80);
insert into libros (titulo,autor)
  values('Martin Fierro','Jose Hernandez');
insert into libros (titulo,autor)
  values('Aprenda PHP','Mario Molina');

select * from libros
  where editorial is null;

select * from libros
  where editorial is not null;

  ---Between----
  if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros (titulo,autor,precio)
  values('Antología poética','Borges',32);
insert into libros (titulo,autor,precio)
  values('Java en 10 minutos','Mario Molina',45.80);
insert into libros (titulo,autor,precio)
  values('Martin Fierro','Jose Hernandez',40);
insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',56.50);

-- Recuperamos los registros cuyo precio esté entre 20 y 40 empleando "between":
select * from libros
  where precio between 20 and 40;

-- Para seleccionar los libros cuyo precio NO esté entre un intervalo de valores
-- antecedemos "not" al "between":
select * from libros
  where precio not between 20 and 35;

  --In
  select * from libros
  where autor in('Borges','Paenza');

select * from libros
  where autor not in ('Borges','Paenza');