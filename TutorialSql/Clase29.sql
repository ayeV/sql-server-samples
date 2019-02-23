--Group by
 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
 );

 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',15,null);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece',45.00,90);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('PHP de la A a la Z',null,null,null,0);

 -- Queremos saber la cantidad de libros de cada editorial, utilizando la cláusula "group by":
 select editorial, count(*)
  from libros
  group by editorial;

 -- Obtenemos la cantidad libros con precio no nulo de cada editorial:
 select editorial, count(precio)
  from libros
  group by editorial;

 --Para conocer el total en dinero de los libros agrupados por editorial, tipeamos:
 select editorial, sum(precio)
  from libros
  group by editorial;

 -- Obtenemos el máximo y mínimo valor de los libros agrupados por editorial,
 -- en una sola sentencia:
 select editorial,
  max(precio) as mayor,
  min(precio) as menor
  from libros
  group by editorial;

 -- Calculamos el promedio del valor de los libros agrupados por editorial:
 select editorial, avg(precio)
  from libros
  group by editorial;

 -- Es posible limitar la consulta con "where". Vamos a contar y agrupar por editorial
 -- considerando solamente los libros cuyo precio es menor a 30 pesos:
 select editorial, count(*)
  from libros
  where precio<30
  group by editorial;




  --Ejercicios

   create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );


 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

-- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
select COUNT(*) from visitantes
group by ciudad

-- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
select COUNT(telefono) from visitantes group by ciudad

-- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
select sum(montocompra) from visitantes group by sexo

-- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)
select max(montocompra), min(montocompra) from visitantes group by sexo,ciudad

-- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
select AVG(montocompra) from visitantes group by ciudad

-- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas)
select COUNT(*) from visitantes  where mail is not null and mail <> 'no tiene' group by ciudad


------
select * from empleados

-- Cuente la cantidad de empleados agrupados por sección (5 filas)
select COUNT(*) from empleados group by seccion

-- Calcule el promedio de hijos por sección (5 filas)
select avg(cantidadhijos) from empleados group by seccion



-- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)
select AVG(sueldo) from empleados where cantidadhijos > 0 group by seccion