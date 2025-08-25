CREATE DATABASE Ejemplo
ON PRIMARY
( NAME = Ejemplo,
FILENAME = 'C:\data\Ejemplo.mdf',
SIZE = 13mb,       
FILEGROWTH = 13 MB 
) 
LOG ON
( NAME =Ejemplo_log,
FILENAME = 'c:\data\Ejemplo_log.ldf' ,
SIZE = 1024kb ,  
FILEGROWTH = 10%
)
Go
use Ejemplo 
go
create table prueba
(
C1 int identity,
C2 char (8000) default 'hola'
)

GO
INSERT INTO prueba DEFAULT VALUES; 
go 10000
------------------------ejemplo 2 ----------
drop database ejemplo
go
CREATE DATABASE Ejemplo
ON PRIMARY
( NAME = Ejemplo,
FILENAME = 'C:\data\Ejemplo.mdf',
SIZE = 13mb,       
FILEGROWTH = 13 MB 
) 
LOG ON
( NAME =Ejemplo_log,
FILENAME = 'c:\data\Ejemplo_log.ldf' ,
SIZE = 5MB ,  
FILEGROWTH = 10%
)
Go
use Ejemplo 
go
create table prueba
(
C1 int identity,
C2 char (8000) default 'hola'
)

GO
INSERT INTO prueba DEFAULT VALUES; 
go 10000
