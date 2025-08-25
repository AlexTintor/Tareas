drop database PruebaCrecimiento
go
CREATE DATABASE PruebaCrecimiento
ON PRIMARY (
    NAME = 'PruebaCrecimiento_Data',
    FILENAME = 'C:\data1\PruebaCrecimiento.mdf',
    SIZE = 10MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = 'PruebaCrecimiento_Log',
    FILENAME = 'C:\data1\PruebaCrecimiento.ldf',
    SIZE = 5MB,
    FILEGROWTH = 5MB
);
GO

USE PruebaCrecimiento;
GO

CREATE TABLE Clientes (
    Id INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Edad INT
);
go 
-- Insertar 100,000 registros
INSERT INTO Clientes (Nombre, Ciudad, Edad)
SELECT TOP (100000)
    'Cliente ' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    'Ciudad ' + CAST(ABS(CHECKSUM(NEWID())) % 50 AS VARCHAR(10)),
    ABS(CHECKSUM(NEWID())) % 90 + 10
FROM sys.objects a CROSS JOIN sys.objects b;
go
DBCC SQLPERF(LOGSPACE);--permite ver el porcentaje de espacio del archivo usado.
--¿Qué archivo creció más (MDF o LDF)?

-- Actualizar todos los registros
UPDATE Clientes
SET Edad = Edad + 1;
go 
DBCC SQLPERF(LOGSPACE);
--¿Qué archivo creció más ahora?
-- Eliminar la mitad de los registros
DELETE FROM Clientes;
go 
DBCC SQLPERF(LOGSPACE);
go
SELECT name, recovery_model_desc 
FROM sys.databases 
WHERE name = 'PruebaCrecimiento';
go
