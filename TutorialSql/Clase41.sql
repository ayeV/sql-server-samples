--48 - Combinaciones cruzadas (cross join)
drop table if exists comidas;
 drop table if exists postres;
 
 create table comidas(
  codigo int identity,
  nombre varchar(30),
  precio decimal(4,2),
  primary key(codigo)
 );

 create table postres(
  codigo int identity,
  nombre varchar(30),
  precio decimal(4,2),
  primary key(codigo)
 );

 insert into comidas(nombre,precio) values('ravioles',5);
 insert into comidas(nombre,precio) values('tallarines',4);
 insert into comidas(nombre,precio) values('milanesa',7);
 insert into comidas(nombre,precio) values('cuarto de pollo',6);

 insert into postres(nombre,precio) values('flan',2.5);
 insert into postres(nombre,precio) values('porcion torta',3.5);

 -- El restaurante quiere combinar los registros de ambas tablas 
 -- para mostrar los distintos menúes que ofrece.
 -- Lo hacemos usando un "cross join":
 select c.nombre as platoprincipal,
  p.nombre as postre,
  c.precio+p.precio as total
  from comidas as c
  cross join postres as p;

  --Ejercicios
   create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

--La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
--masculino. Use un "cross join" (12 registros)
select m.nombre, v.nombre
from mujeres as m
cross join varones as v



-- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 
--registros)
select m.nombre, v.nombre
from mujeres as m
cross join varones as v
where m.edad > 40 and v.edad > 40

-- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 
--registros)
select m.nombre, v.nombre
from mujeres as m
cross join varones as v
where m.edad - v.edad between -10 and 10

-----------------------------------------------------------------------------------------------------------
 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar(30),
  primary key (documento)
 );

 create table tareas(
  codigo int identity,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 );

 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas(domicilio,descripcion,horario) 
   values('Colon 1111','vigilancia exterior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas(domicilio,descripcion,horario)
   values('Peru 345','vigilancia interior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Avellaneda 890','vigilancia interior','PM');

-- La empresa quiere que todos sus empleados realicen todas las tareas. Realice una "cross join" (20 registros)
select g.nombre, t.descripcion
from guardias as g
cross join tareas as t


-- En este caso, la empresa quiere que todos los guardias de sexo femenino realicen las tareas de 
--"vigilancia interior" y los de sexo masculino de "vigilancia exterior". Realice una "cross join" 
--con un "where" que controle tal requisito (10 registros)
select g.nombre,g.sexo, t.descripcion
from guardias as g
cross join tareas as t
where (g.sexo = 'f' and t.descripcion = 'vigilancia interior') or (g.sexo = 'm' and t.descripcion = 'vigilancia exterior')