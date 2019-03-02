drop table if exists empleado
drop table if exists departamento

create table empleado(
codigo int,
nombre varchar(50),
edad smallint,
oficio varchar(20),
direccion varchar(30),
fecha_alt date,
salario float,
comision int,
depto_nro smallint,
primary key(codigo)
);

insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (1,'Rocha Vargas Hector',27,'Vendedor','Leon','1983/12/05',1200,0,40);
insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (2,'Lopez Hernandez Julio',27,'Analista','Chinandega','1992/07/14',1300,1500,20);

insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (3,'Esquivel Jose',31	,'director','Juigalpa','1981/06/5',16700,1200,30);

insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (4,'Delgado Carmen',37,'Vendedor','Leon','1983/03/02',13400,0,40);

insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (5,'Castillo Monte Luis',17,'Vendedor','Masaya','1982/08/02',16309,1000,40);
insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (6,'esquivel leonel Alfonso',26,'Presidente','Nagarote','1981/09/12',15000,0,30);
insert into empleado(codigo,nombre,edad,oficio,direccion,fecha_alt,salario,comision,depto_nro) values (7,'Perez Luis',32,'Empleado','Managua','1980/03/02',16890,0,10);


create table departamento(
depto_nro smallint,
nombre_dpto varchar(20),
localizacion varchar(20),
primary key(depto_nro)
);

insert into departamento(depto_nro,nombre_dpto,localizacion) values (10,'Desarrollo software','El coyolar');
insert into departamento(depto_nro,nombre_dpto,localizacion) values (20,'Analisis sistema','Guadalupe');
insert into departamento(depto_nro,nombre_dpto,localizacion) values (30,'Contabilidad','Subtiava');
insert into departamento(depto_nro,nombre_dpto,localizacion) values (40,'Ventas','san Felipe');
insert into departamento(depto_nro,nombre_dpto,localizacion) values (0,' ',' ');

--Nombres de los empleados ordenados descendente
select * from empleado order by nombre desc


--Datos de empleados que son vendedores
select nombre,oficio,dept.localizacion
from empleado as emp
join departamento as dept
on emp.depto_nro = dept.depto_nro
where emp.oficio = 'Vendedor'

--Nombres de empleados que terminan en o
select nombre
from empleado
where nombre like '%o'

--Seleccionar nombre, oficio,y salario de empleados que trabajan en leon
select nombre, oficio, salario
from empleado where empleado.direccion = 'Leon'

--Seleccionar nombre, salario y localidad de empleados que ganan entre 10.000 y 13.000
select emp.nombre,emp.salario,dept.localizacion
from empleado as emp
join departamento as dept
on emp.depto_nro = dept.depto_nro
where emp.salario between 10000 and 13000

--Mostrar los dptos con mas de 5 empleados
select e.nombre
from empleado as e
 join departamento as d
 on e.depto_nro = d.depto_nro
 group by e.nombre
 having count (d.depto_nro) >5

 --mostrar nombre salario y nombre de dpto de los empleados que tengan el mismo oficio que leonel alfonso esquivel
 select nombre,salario,departamento.nombre_dpto
 from empleado, departamento
 where empleado.depto_nro = departamento.depto_nro 
 and oficio = (select oficio from empleado where nombre = 'esquivel leonel alfonso')

 --mostrar nombre, salario y nombre de depto de los empleados que tengan el mismo oficio que castillo monts luis y no tengan comision
 select nombre, salario, nombre_dpto
 from empleado,departamento
 where empleado.depto_nro = departamento.depto_nro
 and oficio= (select oficio from empleado where nombre = 'Castillo Monte Luis')
 and comision = 0

 --mostrar los empleados que trabajan en contabilidad order by name
 select emp.codigo,emp.comision,emp.depto_nro,emp.direccion, emp.nombre
 from empleado as emp
 join departamento as dep
 on emp.depto_nro = dep.depto_nro 
 where dep.nombre_dpto = 'Contabilidad'
 order by emp.nombre 

 --nombre de los emp que trabajan en leon cuyo oficio sea analista o empleado
 select nombre
 from empleado 
 where empleado.direccion = 'Leon' and empleado.oficio in ('Analista','empleado')

 --calcular el promedio de los salarios
 select avg(salario) as promedio
 from empleado

 --Cual es el max salario de los empleados del dpto 10?
 select
 max(salario)
 from empleado
where empleado.depto_nro = 10

--Calcular salario minimo de los empleados de Ventas
select
min(salario) as salarioMin
from empleado as e
join departamento as d
on e.depto_nro = d.depto_nro 
where d.nombre_dpto = 'Ventas'

--Cuantos empleados hay en el dpto nro 10?
select 
COUNT(*) from empleado
where empleado.depto_nro = 10

--Cuantos empleados hay en Ventas?
select 
COUNT(*) from empleado as e
join departamento as d
on e.depto_nro = d.depto_nro
where d.nombre_dpto = 'Ventas'

--Calcular el nro de emp que no tienen comision
select
COUNT(*) from empleado where empleado.comision = 0

--mostrar los nombres que empiezan con A
select nombre
from empleado where nombre like 'A%'

--mostrar el num de empleados de cada dept
select d.nombre_dpto,
COUNT(*) as cantEmp
from empleado as e
join departamento as d
on e.depto_nro = d.depto_nro
group by d.nombre_dpto

--Para cada oficio obtener la suma de salarios
select oficio,
sum(salario) as sumasalarios
from empleado 
group by oficio
