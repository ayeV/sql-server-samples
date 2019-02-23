 --Primary key
 drop table if exists usuarios;

 -- Creamos la tabla definiendo el campo "nombre" como clave primaria:
 create table usuarios(
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
 );

 -- Al campo "nombre" no lo definimos "not null", pero al establecerse como clave primaria,
 -- PostgreSQL lo convierte en "not null", veamos que en la columna "is_nullable" aparece "NO":
 select table_name,column_name,data_type,character_maximum_length,is_nullable 
  from information_schema.columns 
  where table_name = 'usuarios';

 -- Ingresamos algunos registros:
 insert into usuarios (nombre, clave)
  values ('juanperez','Boca');
 insert into usuarios (nombre, clave)
  values ('raulgarcia','River');

 select * from usuarios;
 
  -- Recordemos que cuando un campo es clave primaria, sus valores no se repiten. 
    -- Intentamos ingresar un valor de clave primaria existente: 
 insert into usuarios (nombre, clave)
  values ('juanperez','payaso');
    -- aparece un mensaje de error y la sentencia no se ejecuta.  
  
 -- Cuando un campo es clave primaria, sus valores no pueden ser nulos.
 -- Intentamos ingresar el valor "null" en el campo clave primaria:
 insert into usuarios (nombre, clave)
  values (null,'payaso');
-- aparece un mensaje de error y la sentencia no se ejecuta. 

/* Si realizamos alguna actualización, PostgreSQL controla que los valores para el campo
 establecido como clave primaria no estén repetidos en la tabla.
 Intentemos actualizar el nombre de un usuario colocando un nombre existente:*/
 update usuarios set nombre='juanperez'
   where nombre='raulgarcia';
 
 --Ejercicios

 drop table if exists libros
 create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 );

 insert into libros (codigo,titulo,autor,editorial)
  values (1,'El aleph','Borges','Emece');
 insert into libros (codigo,titulo,autor,editorial)
  values (2,'Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

  select * from libros

  insert into libros(codigo,titulo,autor,editorial)
  values (1,'pepe','Borges','Planeta')

  -------