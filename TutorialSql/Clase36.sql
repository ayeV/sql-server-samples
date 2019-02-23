--41 - Típos de índices (create y drop)

 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );

 -- Creamos un índice común por el campo editorial:
 create index I_libros_editorial on libros(editorial);

 -- Ahora crearemos un índice único por los campos titulo y editorial:
 create unique index I_libros_tituloeditorial on libros(titulo,editorial);

 -- Borramos los dos índices que acabamos de crear:
  drop index libros.I_libros_editorial;
  drop index libros.I_libros_tituloeditorial;

 -- 42 - Cláusulas limit y offset del comando select

 drop table if exists libros;
 
 create table libros(
  codigo int identity,
  titulo varchar(50) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  primary key (codigo)
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
 insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
 insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
 insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
 insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',36.40);
 insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);

  --Esto es para postgres
 -- Para recuperar 4 libros desde el registro cero tipeamos:
select top(4) * from  libros

 -- Para recuperar 4 libros a partir del registro 5:
 --select * from libros limit 4 offset 5;
 select top (4) * from libros
 where codigo>=5
 -- Si colocamos solo el limit, éste indica el máximo número de registros
 -- a retornar, comenzando desde 0:
 --select * from libros limit 8;

 -- Mostrar los tres primeros registro ordenados por código:
 --select * from libros order by codigo limit 3;
 select top(3) *from libros order by codigo 