--Tipo de dato numerico
drop table if exists libros;
 
 create table libros(
  codigo int not null identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(10,2),
  cantidad smallint,
  primary key (codigo)
 );

 select * from libros
 -- Analicemos la inserción de datos numéricos.
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',25.6666, 260);
 -- Se redondea el campo precio por el valor 25.67.

 -- Intentamos ingresar un precio que supera el rango:
 insert into libros (titulo,autor,editorial, precio, cantidad)
  values('El aleph','Borges','Emece',120000000000.66, 260);
 -- aparece un mensaje de error y la instrucción no se ejecuta.

 -- Intentemos ingresar un valor mayor al permitido para el campo cantidad:
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',25000,100000);


  --Ejercicios
  drop table if exists cuentas;

 create table cuentas(
  numero int not null,
  documento char(8) not null,
  nombre varchar(30),
  saldo decimal(15,2),
  primary key (numero)
 );


   insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);

  select * from cuentas where saldo>4000
  select numero,saldo from cuentas where nombre = 'Juan Lopez'
  select * from cuentas where saldo<0
  select * from cuentas where numero >= 3000
  ------------
  drop table if exists empleados;

   create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),--máximo estimado 99999.99
  cantidadhijos smallint --no superará los 255
 );

  insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

  select * from empleados

   insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

  select * from empleados where sueldobasico <900
  select nombre from empleados where cantidadhijos >0