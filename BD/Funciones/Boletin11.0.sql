--1. Crea una funci�n inline que nos devuelva el n�mero de estaciones que ha recorrido cada tren en un determinado periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros.

SELECT * FROM LM_Recorridos

SET DATEFORMAT ymd
GO

CREATE FUNCTION NumeroEstaciones(@principio datetime, @fin datetime)
RETURNS TABLE AS
RETURN (SELECT COUNT(estacion) AS [N�mero de estaciones], Tren 
			FROM LM_Recorridos
			WHERE Momento BETWEEN @principio AND @fin
			GROUP BY Tren
		)
GO

--Declarar variables
DECLARE @principio datetime
DECLARE @fin datetime

--Dar valores
SET @principio = '2017-02-25'
SET @fin = '2017-02-27'

SELECT * FROM NumeroEstaciones(@principio, @fin)

--2. Crea una funci�n inline que nos devuelva el n�mero de veces que cada usuario ha entrado en el metro en un periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros.

--SELECT * FROM LM_Viajes

SET DATEFORMAT ymd
GO

CREATE FUNCTION EntradasUsuario(@momentoEntrada DATETIME, @momentoSalida DATETIME)
RETURNS TABLE AS
RETURN (SELECT COUNT(MomentoEntrada) AS [Veces que entra], IDPasajero
			FROM LM_Viajes
			WHERE MomentoEntrada >= @momentoEntrada AND MomentoSalida <= @momentoSalida
			GROUP BY IDPasajero
		)
GO

--Declaro las variables
DECLARE @momentoEntrada DATETIME
DECLARE @momentoSalida DATETIME

--Damos valores a las variables
SET @momentoEntrada = '2017-02-26' 
SET @momentoSalida = '2017-02-28'

SELECT * FROM EntradasUsuario(@momentoEntrada, @momentoSalida)


--3. Crea una funci�n inline a la que pasemos la matr�cula de un tren y una fecha de inicio y fin y nos devuelva una tabla
--con el n�mero de veces que ese tren ha estado en cada estaci�n, adem�s del ID, nombre y direcci�n de la estaci�n.

SELECT * FROM LM_Trenes
SELECT * FROM LM_Recorridos
SELECT * FROM LM_Estaciones

CREATE FUNCTION VecesEstacion(@matricula char(7), @principio DATETIME, @fin DATETIME)
RETURNS TABLE AS
RETURN (SELECT COUNT(recorridos.estacion) AS [Veces que a pasado], estaciones.ID, estaciones.Denominacion, estaciones.Direccion
			FROM LM_Trenes AS trenes
			INNER JOIN LM_Recorridos AS recorridos
			ON trenes.ID = recorridos.Tren
			INNER JOIN LM_Estaciones AS estaciones
			ON recorridos.estacion = estaciones.ID
			WHERE trenes.Matricula = @matricula AND recorridos.Momento BETWEEN @principio AND @fin
			GROUP BY estaciones.ID, estaciones.Denominacion, estaciones.Direccion
		)
GO

--Declaro las variables
DECLARE @matricula char(7)
DECLARE @principio DATETIME
DECLARE @fin DATETIME

--Damos valores a las variables
SET @matricula = '0100FLZ'
SET @principio = '2017-02-26' 
SET @fin = '2017-03-1'

SELECT * FROM VecesEstacion(@matricula, @principio, @fin)

--4. Crea una funci�n inline que nos diga el n�mero de personas que han pasado por una estacion en un periodo de tiempo.
--Se considera que alguien ha pasado por una estaci�n si ha entrado o salido del metro por ella.
--El principio y el fin de ese periodo se pasar�n como par�metros.

--5. Crea una funci�n inline que nos devuelva los kil�metros que ha recorrido cada tren en un periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros.

--6. Crea una funci�n inline que nos devuelva el n�mero de trenes que ha circulado por cada l�nea en un periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros. 
--Se devolver� el ID, denominaci�n y color de la l�nea.

--7. Crea una funci�n inline que nos devuelva el tiempo total que cada usuario ha pasado en el metro en un periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros.
--Se devolver� ID, nombre y apellidos del pasajero.
--El tiempo se expresar� en horas y minutos.