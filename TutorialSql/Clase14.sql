--Truncate table
/*La sentencia "truncate table" vac�a la tabla (elimina todos los registros) y vuelve a crear la tabla con la misma estructura.
La diferencia con "drop table" es que esta sentencia borra la tabla, "truncate table" la vac�a.
La diferencia con "delete" es la velocidad, es m�s r�pido "truncate table" que "delete" 
(se nota cuando la cantidad de registros es muy grande) ya que �ste borra los registros uno a uno.*/

 drop table if exists libros;
 
 create table libros(
  codigo int not null identity,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );

 insert into libros (titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (titulo,autor,editorial)
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros (titulo,autor,editorial)
  values('Cervantes y el quijote','Borges','Paidos');
 insert into libros (titulo,autor,editorial)
  values('Matematica estas ahi', 'Paenza', 'Paidos');
 insert into libros (titulo,autor,editorial)
  values('El aleph', 'Borges', 'Emece');

 -- Eliminemos todos los registros con "delete":
 delete from libros;

 -- Veamos el resultado:
 select * from libros;
 -- La tabla ya no contiene registros.

 -- Ingresamos un nuevo registro:
 insert into libros (titulo,autor,editorial)
  values('Antolog�a poetica', 'Borges', 'Emece');

 -- Veamos el resultado:
 select * from libros;
 -- Para el campo "codigo" se guard� el valor 6 porque el valor
 -- m�s alto de ese campo, antes de eliminar todos los registros era "5".

 -- Ahora vaciemos la tabla:
 truncate table libros;

 -- Veamos qu� sucede si ingresamos otro registro sin valor para el c�digo:
 insert into libros (titulo,autor,editorial)
  values('Antolog�a poetica', 'Borges', 'Emece');
 -- Vemos que la secuencia de "codigo" contin�a.

 -- Ejecutamos entonces:
 select * from libros;