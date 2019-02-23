--Restriccion check

 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2),
  primary key(codigo)
 );

 insert into libros (titulo,autor,editorial,preciomin,preciomay)
    values ('Aprenda PHP','Mario Molina','Siglo XXI', 48, 53);

-- Agregamos una restricción "check" para asegurar que los valores de los 
 -- campos correspondientes a precios no puedan ser negativos:
 alter table libros
  add constraint CK_libros_precios_positivo
  check (preciomin>=0 and preciomay>=0);

 -- Si intentamos ingresar un valor inválido para algún campo correspondiente
 -- al precio, que vaya en contra de la restricción, por ejemplo el valor "-15"
 -- aparecerá un mensaje de error indicando que hay conflicto con la restricción
 -- creada anteriormente y la inserción no se realiza.
 insert into libros (titulo,autor,editorial,preciomin,preciomay)
    values ('Python para todos','Rodriguez','Siglo XXI', -10, 40);

	--Ejercicios
	drop table if exists empleados
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento date,
  cantidadhijos smallint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

-- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
--sueldo
alter table empleados
add constraint CK_empleados_sueldos_positivo
check (sueldo>0);


 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

-- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el valor 5000
--La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.
alter table empleados
add constraint CK_empleados_sueldos_mayor_5000
check (sueldo<=5000);

-- Elimine el registro infractor y vuelva a crear la restricción
delete from empleados where sueldo = 6000

 alter table empleados
 add constraint CK_empleados_sueldo_maximo
 check (sueldo<=5000); 

-- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la fecha actual
alter table empleados
add constraint CK_empleados_fecha_max
check(fechanacimiento<getdate())

-- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.
alter table empleados
add constraint CK_empleados_hijos_max
check(cantidadhijos between 0 and 15)

-- Vea todas las restricciones de la tabla (5 filas)
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
where TABLE_NAME = 'empleados'

-- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
--Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".
insert into empleados values ('34444445','Carlos Perez','1981/10/03',0,'Contaduria',-15)

-- Intente agregar un registro con fecha de nacimiento futura.Mensaje de error.

-- Intente modificar un registro colocando en "cantidadhijos" el valor "21".Mensaje de error.