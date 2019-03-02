--67 - Subconsulta (insert)

drop table if exists alumnos;
 drop table if exists aprobados;
 
 create table alumnos(
  documento char(8) not null,
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento)
 );

 create table aprobados(
  documento char(8) not null,
  nota decimal(4,2),
  primary key(documento)
 );

 insert into alumnos values('30000000','Ana Acosta',8);
 insert into alumnos values('30111111','Betina Bustos',9);
 insert into alumnos values('30222222','Carlos Caseros',2.5); 
 insert into alumnos values('30333333','Daniel Duarte',7.7);
 insert into alumnos values('30444444','Estela Esper',3.4);

 -- Ingresamos registros en la tabla "aprobados" seleccionando
 -- registros de la tabla "alumnos":
 insert into aprobados 
  select documento,nota
   from alumnos
   where nota>=4;

 -- Veamos si los registros se han cargado:
 select * from aprobados;

 --Ejercicios
 drop table if exists clientes;
 drop table if exists facturas;


  create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha date,
  codigocliente int not null,
  total decimal(6,2),
  primary key(numero)
 );

 insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
 insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
 insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');
 insert into clientes(nombre,domicilio) values('Susana Molina','San Martin 555');

 insert into facturas values(1200,'2017-01-15',1,300);
 insert into facturas values(1201,'2017-01-15',2,550);
 insert into facturas values(1202,'2017-01-15',3,150);
 insert into facturas values(1300,'2017-01-20',1,350);
 insert into facturas values(1310,'2017-01-22',3,100);

--3- El comercio necesita una tabla llamada "clientespref" en la cual quiere almacenar el nombre y 
--domicilio de aquellos clientes que han comprado hasta el momento más de 500 pesos en mercaderías. 
--Créela la tabla:
 create table clientespref(
  nombre varchar(30),
  domicilio varchar(30)
 );





--4- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y 
--"facturas".
insert into clientespref
select nombre, domicilio
from clientes where codigo in
(select codigocliente
from clientes as cl
join facturas as f
on cl.codigo = f.codigocliente 
group by codigocliente
having sum(total) >500)


--5- Vea los registros de "clientespref":
select * from clientespref