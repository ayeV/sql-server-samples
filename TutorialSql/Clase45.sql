--54 - Restricciones foreign key en la misma tabla


 drop table if exists afiliados;

 create table afiliados(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  afiliadotitular int,
  primary key (documento),
  unique (numero)
 );

 -- Establecemos una restricci�n "foreign key" para asegurarnos que el n�mero de afiliado
 -- que se ingrese en el campo "afiliadotitular" exista en la tabla "afiliados":
 alter table afiliados
  add constraint FK_afiliados_afiliadotitular
  foreign key (afiliadotitular)
  references afiliados (numero);

 -- Ingresamos algunos registros:
 insert into afiliados(documento,nombre,afiliadotitular) values('22222222','Perez Juan',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('23333333','Garcia Maria',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('24444444','Lopez Susana',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('30000000','Perez Marcela',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('31111111','Morales Luis',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('32222222','Garcia Maria',2);

 -- El siguiente insert no se ejecuta porque el afiliadotitular no existe
 insert into afiliados(documento,nombre,afiliadotitular) values('55555555','Morales Lucas',10);
 
 -- Podemos eliminar un afiliado, siempre que no haya otro afiliado que haga referencia a �l
 -- en "afiliadotitular", es decir, si el "numero" del afiliado est� presente en alg�n registro
 -- en el campo "afiliadotitular":
 delete from afiliados where numero=1;

 --Ejercicios

 drop table if exists clientes
 drop table if exists provincias

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia int,
  primary key(codigo)
 );

 create table provincias(
  codigo int identity,
  nombre varchar(20),
  primary key(codigo)
 );

--En este ejemplo, el campo "codigoprovincia" de "clientes" es una clave for�nea, se emplea para 
--enlazar la tabla "clientes" con "provincias".

-- Intente agregar una restricci�n "foreign key" a la tabla "clientes" que haga referencia al campo 
--"codigo" de "provincias" (No se puede porque "provincias" no tiene restricci�n "primary key" "unique")
alter table clientes 
add constraint FK_clientes_codprovincia
foreign key(codigoprovincia)
references provincias(codigo)



-- Establezca una restricci�n "primary key" al campo "codigo" de "provincias"
 /*alter table provincias
 add constraint PK_provincias_codigo
  primary key (codigo);*/

-- Ingrese algunos registros para ambas tablas:
 

-- SET IDENTITY_INSERT provincias ON

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Luisa Lopez','Juarez 555','La Plata',6);
--Intente agregar la restricci�n "foreign key" del punto 2 a la tabla "clientes"
--No se puede porque hay un registro en "clientes" cuyo valor de "codigoprovincia" no existe en 
--"provincias".

-- Elimine el registro de "clientes" que no cumple con la restricci�n y establezca la restricci�n nuevamente.
 delete from clientes where codigoprovincia=6;
 alter table clientes
 add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo);
--- Intente agregar un cliente con un c�digo de provincia inexistente en "provincias".No se puede.

-- Intente eliminar el registro con c�digo 3, de "provincias".No se puede porque hay registros en "clientes" al cual hace referencia.

-- Elimine el registro con c�digo "4" de "provincias".
--Se permite porque en "clientes" ning�n registro hace referencia a �l.
delete from provincias where codigo = 4
-- Intente modificar el registro con c�digo 1, de "provincias".
--No se puede porque hay registros en "clientes" al cual hace referencia.
