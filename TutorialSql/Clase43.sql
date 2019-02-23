--50 - Combinaciones y funciones de agrupamiento
 drop table if exists libros;
 drop table if exists editoriales;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
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
  values('Aprenda PHP','Mario Molina',3,50);
 insert into libros(titulo,autor,codigoeditorial,precio)
  values('Uno','Richard Bach',3,15);
 insert into libros(titulo,autor,codigoeditorial,precio)
  values('Java en 10 minutos',default,4,45);

 -- Contamos la cantidad de libros de cada editorial consultando ambas tablas:
 select nombre as editorial,
  count(*) as cantidad
  from editoriales as e
  join libros as l
  on codigoeditorial=e.codigo
  group by e.nombre;

 -- Buscamos el libro más costoso de cada editorial con un "left join":
 select nombre as editorial,
  max(precio) as mayorprecio
  from editoriales as e
  left join libros as l
  on codigoeditorial=e.codigo
  group by nombre;

  --Ejercicios
  drop table if exists visitantes

  create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad smallint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo int identity,
  nombre varchar(20),
  primary key(codigo)
 );
 
 insert into ciudades(nombre) values('Cordoba');
 insert into ciudades(nombre) values('Carlos Paz');
 insert into ciudades(nombre) values('La Falda');
 insert into ciudades(nombre) values('Cruz del Eje');

 insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);

-- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)
select c.nombre,
COUNT(*) as cantvisitas
from ciudades as c
join visitantes as v
on v.codigociudad = c.codigo
group by c.nombre




-- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)
select c.nombre, v.sexo,
avg(montocompra) as promedio
from visitantes as v
join ciudades as c
on v.codigociudad = c.codigo
group by c.nombre,v.sexo

-- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)
select c.nombre, 
COUNT(mail) as cantvisitantes
from visitantes as v
join ciudades as c
on v.codigociudad= c.codigo
group by c.nombre

-- Obtenga el monto de compra más alto de cada ciudad (3 filas)
select c.nombre,
max(montocompra) as maxcompra
from visitantes as v
join ciudades as c
on v.codigociudad = c.codigo
group by c.nombre
