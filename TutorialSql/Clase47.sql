--59 - Subconsultas como expresi�n

 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into libros(titulo,autor,editorial,precio) 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',10.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',10.00);

 -- Obtenemos el t�tulo, precio de un libro espec�fico y 
 -- la diferencia entre su precio y el m�ximo valor:
 select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';

 -- Mostramos el t�tulo y precio del libro m�s costoso:
 select titulo,autor, precio
  from libros
  where precio=
   (select max(precio) from libros);

 -- Actualizamos el precio del libro con m�ximo valor:
 update libros set precio=45
  where precio=
   (select max(precio) from libros);

  -- Eliminamos los libros con precio menor:
 delete from libros
  where precio=
   (select min(precio) from libros);

   --Ejercicios

   drop table if exists alumnos
    create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento)
 );

 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);

--3- Obtenga todos los datos de los alumnos con la nota m�s alta, empleando subconsulta.
--2 registros.

select documento, nombre, nota
from alumnos
where nota = (select max(nota) from alumnos)

--4- Realice la misma consulta anterior pero intente que la consulta interna retorne, adem�s del 
--m�ximo valor de precio, el t�tulo.
--Mensaje de error, porque la lista de selecci�n de una subconsulta que va luego de un operador de 
--comparaci�n puede incluir s�lo un campo o expresi�n (excepto si se emplea "exists" o "in").



--5- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
--promedio.
--3 registros.


 select alumnos.*,
 (select avg(nota) from alumnos)-nota as diferencia
  from alumnos
  where nota<
   (select avg(nota) from alumnos);

--6- Cambie la nota del alumno que tiene la menor nota por 4.
--1 registro modificado.
update   alumnos set nota= 4
where nota = (select min(nota) from alumnos)

--7- Elimine los alumnos cuya nota es menor al promedio.
--3 registros eliminados.
delete from alumnos
where nota <(select avg(nota) from alumnos)