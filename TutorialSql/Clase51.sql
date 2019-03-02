--63 - Subconsultas (Exists y Not Exists)

 drop table if exists facturas;
 drop table if exists detalles; 
 
 create table facturas(
  numero int not null,
  fecha date,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem)
 );

 insert into facturas values(1200,'2018-01-15','Juan Lopez');
 insert into facturas values(1201,'2018-01-15','Luis Torres');
 insert into facturas values(1202,'2018-01-15','Ana Garcia');
 insert into facturas values(1300,'2018-01-20','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);

 -- Empleamos una subconsulta correlacionada con un operador "exists"
 -- en la cláusula "where" para devolver la lista de clientes que 
 -- compraron el artículo "lapiz":
 select cliente,numero
  from facturas as f
  where exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');

 -- Buscamos los clientes que NO han comprado el artículo "lapiz":
 select cliente,numero
  from facturas as f
  where not exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');

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

--3- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se 
--inscribieron en 'natacion'.
--3 registros.
select s.nombre
from socios as s
where exists 
(select * from inscriptos as i where s.numero = i.numerosocio and i.deporte = 'natacion')


--4- Busque los socios que NO se han inscripto en 'natacion' empleando "not exists".
--1 registro.
select s.nombre
from socios as s
where not exists 
(select * from inscriptos as i where s.numero = i.numerosocio and i.deporte = 'natacion')

--5- Muestre todos los datos de los socios que han pagado todas las cuotas.
--1 registro.
select *
from socios as s
where exists
(select * from inscriptos as i where s.numero = i.numerosocio and i.cuotas = 10)