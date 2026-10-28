/* =====================================================================
   Grados_y_Titulos.sql  ·  Azure SQL Database  ·  Semana 05
   Crea dbo.Grados y dbo.Titulos (relación 1:N), inserta datos de
   ejemplo ficticios y consulta la relación.
   - Se puede ejecutar varias veces: no duplica tablas ni registros.
   - No contiene credenciales ni elimina datos.
   Antes de ejecutar: conéctate a la base GradosYTitulos (Options).
   ===================================================================== */
SET NOCOUNT ON;
GO

-- 0) Verifica la base elegida (debe decir GradosYTitulos)
SELECT DB_NAME() AS BaseActual;
GO

-- 1) Tabla Grados
IF OBJECT_ID(N'dbo.Grados', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Grados
    (
        IdGrado     INT IDENTITY(1,1) NOT NULL
                    CONSTRAINT PK_Grados PRIMARY KEY,
        Nombre      NVARCHAR(80)  NOT NULL
                    CONSTRAINT UQ_Grados_Nombre UNIQUE,
        Descripcion NVARCHAR(200) NULL
    );
END;
GO

-- 2) Tabla Titulos (clave foránea hacia Grados)
IF OBJECT_ID(N'dbo.Titulos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Titulos
    (
        IdTitulo     INT IDENTITY(1,1) NOT NULL
                     CONSTRAINT PK_Titulos PRIMARY KEY,
        Nombre       NVARCHAR(140) NOT NULL
                     CONSTRAINT UQ_Titulos_Nombre UNIQUE,
        FechaEmision DATE NULL,
        IdGrado      INT NOT NULL
                     CONSTRAINT FK_Titulos_Grados
                     FOREIGN KEY REFERENCES dbo.Grados (IdGrado)
    );
END;
GO

-- 3) Datos de ejemplo (ficticios)
IF NOT EXISTS (SELECT 1 FROM dbo.Grados WHERE Nombre = N'Bachiller')
    INSERT INTO dbo.Grados (Nombre, Descripcion)
    VALUES (N'Bachiller', N'Grado académico de pregrado (ejemplo didáctico)');

IF NOT EXISTS (SELECT 1 FROM dbo.Grados WHERE Nombre = N'Maestría')
    INSERT INTO dbo.Grados (Nombre, Descripcion)
    VALUES (N'Maestría', N'Grado académico de posgrado (ejemplo didáctico)');

INSERT INTO dbo.Titulos (Nombre, FechaEmision, IdGrado)
SELECT N'Título Profesional en Ingeniería Informática', '2025-12-15', g.IdGrado
FROM dbo.Grados AS g
WHERE g.Nombre = N'Bachiller'
  AND NOT EXISTS (SELECT 1 FROM dbo.Titulos
                  WHERE Nombre = N'Título Profesional en Ingeniería Informática');

INSERT INTO dbo.Titulos (Nombre, FechaEmision, IdGrado)
SELECT N'Maestría en Gestión de Datos', '2026-06-20', g.IdGrado
FROM dbo.Grados AS g
WHERE g.Nombre = N'Maestría'
  AND NOT EXISTS (SELECT 1 FROM dbo.Titulos
                  WHERE Nombre = N'Maestría en Gestión de Datos');
GO

-- 4) Resultado 1: títulos con su grado
SELECT g.Nombre AS Grado, t.Nombre AS Titulo, t.FechaEmision
FROM dbo.Grados  AS g
JOIN dbo.Titulos AS t ON t.IdGrado = g.IdGrado
ORDER BY g.Nombre, t.Nombre;

-- 5) Resultado 2: cantidad de títulos por grado
SELECT g.Nombre AS Grado, COUNT(t.IdTitulo) AS CantidadTitulos
FROM dbo.Grados AS g
LEFT JOIN dbo.Titulos AS t ON t.IdGrado = g.IdGrado
GROUP BY g.Nombre
ORDER BY g.Nombre;
GO
