drop database log_def
go
--objetivo--marcar error al llenar el archivo log.

CREATE DATABASE log_def
ON PRIMARY
( NAME = mydb,
FILENAME = 'C:\data\log_defa3.mdf',
SIZE = 13mb,       --valor inicial 
FILEGROWTH = 13 mb --va a crecer de 13 en 13 mb y como es valor grande crece pocas veces
--MAxsize=50mb     --al poner esta opcion se define un limite si no se pone es indefinido
) 
LOG ON
( NAME =mydb_log,
FILENAME = 'c:\data\log_defa3.ldf' ,
SIZE = 1024kb ,  --al poner un tamaño pequeno se llenara pronto
FILEGROWTH = 10%--y ocasionara que el archivo crezca varias
--maxsize=3mb     --veces. Al no poner el maxsize no se va a llenar.. 
)
Go
use log_def --Se pone en uso la base de datos y se crea una tabla
go
create table Chunktable1
(
C1 int identity,
C2 char (8000)  default 'holas'
)
go
--Se insertan 90 mb aproximandamete.
insert into ChunkTable1 default values; 
go 15000
--verificar el tamaño del archivo LOG 
----------------------------

drop database log_def2
go


CREATE DATABASE log_def2
ON PRIMARY
( NAME = mydb2,
FILENAME = 'C:\data\log_defa200.mdf',
SIZE = 13mb,  --valor inicial 
FILEGROWTH = 3 mb) ---va a crecer de 13 en 13 mb y como es valor grande crece pocas veces
--Maxsize=50mb  --al poner esta opcion se define un limite si no se pone es indefinido

LOG ON
( NAME =mydb_log2,
FILENAME = 'c:\data\log_defa200.ldf' ,
SIZE = 3mb, --al poner un tamaño grande el archivo crece poco.
FILEGROWTH = 20%,
maxsize=4mb) --al poner el maxsize  pequeño se llena y no se pueden 
Go			 --realizar mas transacciones
use log_def2
go 
create table Chunktable1
(
C1 int identity,
C2 char (8000)  default 'holas'
)
go
--Se insertan 90 mb aproximandamete.
insert into ChunkTable1 default values; 
go 15000
