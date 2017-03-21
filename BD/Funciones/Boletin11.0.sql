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

CREATE FUNCTION VecesEstacion(@matricula char(7), @principio DATETIME, @fin DATETIME)
RETURNS TABLE AS
RETURN ()

SELECT *
	FROM LM_Trenes AS trenes
	INNER JOIN LM_Recorridos
	ON 

--4. Crea una funci�n inline que nos diga el n�mero de personas que han pasado por una estacion en un periodo de tiempo.
--Se considera que alguien ha pasado por una estaci�n si ha entrado o salido del metro por ella.
--El principio y el fin de ese periodo se pasar�n como par�metros.

--5. Crea una funci�n inline que nos devuelva los kil�metros que ha recorrido cada tren en un periodo de tiempo.
--El principio y el fin de ese periodo se pasar�n como par�metros.