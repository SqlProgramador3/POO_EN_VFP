IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'POO_VFP')
	BEGIN
		CREATE DATABASE POO_VFP;
END
GO

USE POO_VFP;

GO
CREATE TABLE tblUsuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    Cedula VARCHAR(50) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
);

DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    INSERT INTO tblUsuarios (Cedula, FullName)
    VALUES (
        -- Generar una cédula aleatoria
        CONVERT(VARCHAR(50), ABS(CHECKSUM(NEWID())) % 1000000000), 

        -- Generar un nombre completo aleatorio
        (SELECT TOP 1 FirstName + ' ' + LastName 
         FROM (VALUES
             ('John', 'Doe'), ('Jane', 'Smith'), ('Michael', 'Johnson'),
             ('Emily', 'Davis'), ('Daniel', 'Miller'), ('Emma', 'Garcia'),
             ('Matthew', 'Martinez'), ('Olivia', 'Hernandez'), ('William', 'Lopez'),
             ('Sophia', 'Gonzalez'), ('James', 'Wilson'), ('Ava', 'Anderson'),
             ('Alexander', 'Thomas'), ('Isabella', 'Taylor'), ('Benjamin', 'Moore')
         ) AS Names (FirstName, LastName)
         ORDER BY NEWID()
        )
    );

    SET @i = @i + 1;
END;

CREATE PROCEDURE spGetUserByCedula
    @cedula INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT FullName
    FROM tblUsuarios
    WHERE Cedula = @cedula;
END
GO

EXEC spGetUserByCedula @cedula = '170959609';

DROP PROCEDURE spGetUserByCedula

SELECT * FROM tblUsuarios;