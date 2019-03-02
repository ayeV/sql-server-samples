--70 - Secuencias (create sequence- alter sequence - nextval - drop sequence)

drop table if exists libros;
drop sequence if exists sec_codigolibros;

 create sequence sec_codigolibros
  minvalue 1000
  maxvalue 999999
  increment by 1;

 -- Creamos la tabla libros y asociamos el valor por defecto
 -- para el campo codigo el valor de la secuencia:
 create table libros(
  codigo bigint default nextval('sec_codigolibros'),
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );

 insert into libros(titulo,autor,editorial) values
  ('El aleph', 'Borges','Emece');
 insert into libros(titulo,autor,editorial) values
  ('Matematica estas ahi', 'Paenza','Nuevo siglo');

select * from libros;