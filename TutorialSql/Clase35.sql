--Eliminar restricciones (alter table - drop constraint)

 drop table if exists libros;
 
 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
 );

 -- Definimos una restricci�n "primary key" para nuestra tabla "libros"
 --para asegurarnos que cada libro tendr� un c�digo diferente y �nico:
 alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

 -- Definimos una restricci�n "check" para asegurarnos que el precio
 -- no ser� negativo:
 alter table libros
  add constraint CK_libros_precio
  check (precio>=0);

 -- Vemos las restricciones:
 select *
  from information_schema.table_constraints 
  where table_name = 'libros';
 -- Aparecen 2 restricciones, 1 "check" y 1 "primary key".

 -- Eliminamos la restricci�n "PK_libros_codigo":
 alter table libros
  drop constraint PK_libros_codigo;

 -- Vemos si se elimin�:
 select *
  from information_schema.table_constraints 
  where table_name = 'libros';

