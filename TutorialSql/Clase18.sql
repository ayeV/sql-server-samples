--valores default

drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint default 0,
 primary key(codigo)
 );

 insert into libros (titulo,editorial,precio)
  values('Java en 10 minutos','Paidos',50.40);
 -- PostgreSQL ingresará el registro con el siguiente valor de la secuencia
 -- en "codigo", con el título, editorial y precio ingresados,
 -- en "autor" colocará "Desconocido" y en cantidad "0":

 select * from libros;

 -- Si ingresamos un registro sin valor para el campo "precio", 
 -- que admite valores nulos, se ingresará "null" en ese campo:
 insert into libros (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');

 select * from libros;

 -- Visualicemos la estructura de la tabla:
 select *
  from information_schema.columns 
  where table_name = 'libros';

 -- La columna "column_default", muestra el valor por defecto de cada campo.
 -- Podemos emplear "default" para dar el valor por defecto a algunos campos:
 insert into libros (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);
 select * from libros;

 -- Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:

 insert into libros default values;
 select * from libros;
 -- La sentencia anterior almacenará un registro con los valores predeterminados
 -- para cada uno de sus campos.

 -- Que un campo tenga valor por defecto no significa que no admita valores nulos,
 -- puede o no admitirlos. Podemos ingresar el valor "null" en el campo "cantidad":
 insert into libros (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);

 select * from libros;

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

 select * from visitantes

  select *
  from information_schema.columns 
  where table_name = 'visitantes'

   insert into visitantes (nombre, domicilio, montocompra)
  values ('Susana Molina','Colon 123',59.80);
 insert into visitantes (nombre, edad, ciudad, mail)
  values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 select * from visitantes;
 insert into visitantes(nombre,domicilio,ciudad,montocompra)
 values('Juan Perez','Av als 50','Bs As',default);