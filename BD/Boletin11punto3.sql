/*La empresa de log�stica (transportes y algo m�s) TransLeo tiene una base de datos con la
informaci�n de los env�os que realiza. Hay una tabla llamada TL_PaquetesNormales en la que se
guardan los datos de los paquetes que pueden meterse en una caja normal. Las cajas normales
son paralelep�pedos de base rectangular. Las columnas alto, ancho y largo, de tipo entero,
contienen las dimensiones de cada paquete en cent�metros.*/

-- COLUMNA				TIPO				COMENTARIO							NULOS
---------------------------------------------------------------------------------------
-- codigo				int					Es la clave							No
-- alto					int														No
-- ancho				int														No
-- largo				int														No
-- codigoFregoneta		int					FK del vehiculo que lo entrega		S�
-- fechaEntrega			smalldatetime		Eso									S�


--1. Crea un funci�n fn_VolumenPaquete que reciba el c�digo de un paquete y nos devuelva su volumen.
--El volumen se expresa en litros (dm3) y ser� de tipo decimal(6,2).

SELECT * FROM TL_PaquetesNormales

ALTER FUNCTION fn_VolumenPaquete (@codigo int)
RETURNS DECIMAL (6,2) AS
BEGIN
	RETURN (SELECT ROUND((Alto*Ancho*Largo)*0.001, 1)
				FROM TL_PaquetesNormales
				WHERE Codigo = @codigo
			)
END
GO

--Declarar
DECLARE @codigo int

--Dar valores
SET @codigo = '600'

SELECT DBO.fn_VolumenPaquete (@codigo) AS [Volumen Paquete]


--2. Los paquetes normales han de envolverse. Se calcula que la cantidad de papel necesaria
--   para envolver el paquete es 1,8 veces su superficie. Crea una funci�n fn_PapelEnvolver
--   que reciba un c�digo de paquete y nos devuelva la cantidad de papel necesaria para
--   envolverlo, en metros cuadrados.

SELECT * FROM TL_PaquetesNormales

ALTER FUNCTION fn_PapelEnvolver (@codigo int)
RETURNS TABLE AS
RETURN (SELECT ((2*(Ancho*Alto) + 2*(Ancho*Largo) + 2*(Largo*Alto)) * 1.8) * 0.0001 AS [Superficie]
			FROM TL_PaquetesNormales
			WHERE Codigo = @codigo
		)
GO

--Declarar
DECLARE @codigo int

--Dar valores
SET @codigo = '600'

SELECT * FROM fn_PapelEnvolver (@codigo)


--3. Crea una funci�n fn_OcupacionFregoneta a la que se pase el c�digo de un veh�culo y una fecha
--	 y nos indique cu�l es el volumen total que ocupan los paquetes que ese veh�culo entreg� en el d�a en cuesti�n.
--	 Usa las funciones de fecha y hora para comparar s�lo el d�a, independientemente de la hora.

SELECT * FROM TL_PaquetesNormales

SET DATEFORMAT ymd
GO

ALTER FUNCTION fn_OcupacionFregoneta (@codigoFregoneta int, @fechaEntrega DATE)
RETURNS TABLE AS
RETURN (SELECT (Alto*Ancho*Largo) AS [Volumen total]
		  FROM TL_PaquetesNormales
		  WHERE @codigoFregoneta = codigoFregoneta AND DAY(@fechaEntrega) = DAY(fechaEntrega))
GO

--Declarar
DECLARE @codigoFregoneta int
DECLARE @fechaEntrega DATE

--Dar valores
SET @codigoFregoneta = '1'
SET @fechaEntrega = '2012-01-20'

--Ejecutar
SELECT * FROM fn_OcupacionFregoneta (@codigoFregoneta, @fechaEntrega)
GO



--4. Crea una funci�n fn_CuantoPapel a la que se pase una fecha y nos diga la cantidad total
--   de papel de envolver que se gast� para los paquetes entregados ese d�a. Trata la fecha
--   igual que en el anterior.

--Declarar
DECLARE @fechaEntrega DATE

--Dar valores
SET @fechaEntrega = '2015-04-01'

--Ejecutar
SELECT * FROM fn_CuantoPapel (@fechaEntrega)
GO

--   fechas (inicio y fin). Si el inicio y fin son iguales, calcular� la cantidad gastada ese d�a. Si
--   el fin es anterior al inicio devolver� 0.

SELECT * FROM TL_PaquetesNormales
	
--Declarar
DECLARE @fechaInicio DATE
DECLARE @fechaFin DATE

--Dar valores
SET @fechaInicio = '2012-01-20'
SET @fechaFin = '2013-03-14'

--Ejecutar
SELECT * FROM fn_CuantoPapelv2 (@fechaInicio, @fechaFin)
GO


--6. Crea una funci�n fn_Entregas a la que se pase un rango de fechas y nos devuelva una
--   tabla con los c�digos de los paquetes entregados y los veh�culos que los entregaron entre
--   esas fechas.