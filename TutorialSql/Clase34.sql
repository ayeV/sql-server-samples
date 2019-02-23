--Restriccion unique

 drop table if exists alumnos;

 create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8)
 );

 -- Agregamos una restricción "primary" para el campo "legajo":
 alter table alumnos
   add constraint PK_alumnos_legajo
   primary key(legajo);

 -- Agregamos una restricción "unique" para el campo "documento":
 alter table alumnos
   add constraint UQ_alumnos_documento
   unique (documento);

 -- Ingresamos algunos registros:
 insert into alumnos values('A111','Lopez','Ana','22222222');
 insert into alumnos values('A123','Garcia','Maria','23333333');
 -- Si intentamos ingresar un legajo o documento repetido, aparece un mensaje de error.

 -- Veamos las restricciones:
 select *
  from information_schema.table_constraints 
  where table_name = 'alumnos';
 -- Aparecen las dos restricciones creadas anteriormente.


 --Ejercicios
 create table remis(
  numero int identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );


 insert into remis(patente,marca,modelo) values('ABC123','Renault clio','1990');
 insert into remis(patente,marca,modelo) values('DEF456','Peugeot 504','1995');
 insert into remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
 insert into remis(patente,marca,modelo) values('GHI789','Fiat Duna','1995');
 insert into remis(patente,marca,modelo) values(null,'Fiat Duna','1995');

-- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará valores repetidos.
--No se puede porque hay valores duplicados.
alter table remis
add constraint UQ_remis_patente
unique(patente);

-- Elimine el registro con patente duplicada y establezca la restricción.
--Note que hay 1 registro con valor nulo en "patente".
delete from remis where marca = 'Peugeot 504'

alter table remis
add constraint UQ_remis_patente
unique(patente);

-- Intente ingresar un registro con patente repetida (no lo permite)
insert into remis(patente,marca,modelo) values('GHI789', 'Ford','1998')


-- Ingresar un registro con valor nulo para el campo "patente".
--Lo permite.
insert into remis(patente,marca,modelo) values(null, 'Ford','1998')


-- Muestre la información de las restricciones
 select *
  from information_schema.table_constraints 
  where table_name = 'remis';