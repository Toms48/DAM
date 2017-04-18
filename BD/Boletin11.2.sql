--Ejercicio 1
--Escribe un procedimiento que cancele un pasaje y las tarjetas de embarque asociadas.
--Recibir� como par�metros el ID del pasaje.

CREATE PROCEDURE Cancelacion (@IDPasaje Int) AS
BEGIN
	BEGIN TRANSACTION

		DELETE FROM AL_Tarjetas
			WHERE Numero_Pasaje = @IDPasaje

		DELETE FROM AL_Vuelos_Pasajes
			WHERE Numero_Pasaje = @IDPasaje

		DELETE FROM AL_Pasajes
			WHERE Numero = @IDPasaje

	COMMIT TRANSACTION
END
GO

EXECUTE Cancelacion 0
GO

SELECT * FROM AL_Pasajes
GO

--Ejercicio 2
--Escribe un procedimiento almacenado que reciba como par�metro el ID de un pasajero y
--devuelva en un par�metro de salida el n�mero de vuelos diferentes que ha tomado ese pasajero.

SELECT * FROM AL_Vuelos_Pasajes
GO

ALTER PROCEDURE ContarVuelos (@IDPasajero char(9), @NumeroVuelos int OUTPUT) AS
	BEGIN

		SET @NumeroVuelos = (SELECT COUNT(Codigo_Vuelo) AS [N�mero de vuelos]
								FROM AL_Pasajes as P
								INNER JOIN AL_Vuelos_Pasajes AS vp
								ON Numero = Numero_Pasaje
								WHERE P.ID_Pasajero = @IDPasajero)

	END
GO

--Declarar variables
declare @NumeroVuelos int
declare @IDPasajero char(9) = 'A003'

--Ejecutar 
EXECUTE ContarVuelos @IDPasajero, @NumeroVuelos OUTPUT

PRINT 'N�mero de vuelos: ' + CAST(@NumeroVuelos as varchar)

--Ejercicio 3
--Escribe un procedimiento almacenado que reciba como par�metro el ID de un pasajero y dos fechas y
--nos devuelva en otro par�metro (de salida) el n�mero de horas que ese pasajero ha volado durante ese intervalo de fechas.

SELECT * FROM AL_Pasajeros
SELECT * FROM AL_Vuelos
GO

SET DATEFORMAT ymd
GO

ALTER PROCEDURE HorasDeVuelo (@IDPasajero char(9), @FechaSalida smalldatetime, @FechaLlegada smalldatetime, @HorasVolando int OUTPUT ) AS
	BEGIN
			SET @HorasVolando = (SELECT (SUM(DATEDIFF(MINUTE,v.Salida,v.Llegada))/60) AS [Horas]
									FROM AL_Pasajes AS p
									INNER JOIN AL_Vuelos_Pasajes AS vp
									ON p.Numero = vp.Numero_Pasaje
									INNER JOIN AL_Vuelos AS v
									ON vp.Codigo_Vuelo = v.Codigo
									WHERE p.ID_Pasajero = @IDPasajero AND v.Salida = @FechaSalida AND v.Llegada = @FechaLlegada)
	END
GO

--Ejercicio 4
--Escribe un procedimiento que reciba como par�metro todos los datos de un pasajero y un n�mero de vuelo y realice el siguiente proceso:
--En primer lugar, comprobar� si existe el pasajero. Si no es as�, lo dar� de alta.
--A continuaci�n comprobar� si el vuelo tiene plazas disponibles (hay que consultar la capacidad del avi�n) y
--en caso afirmativo crear� un nuevo pasaje para ese vuelo.

--Ejercicio 5
/*Escribe un procedimiento almacenado que cancele un vuelo y reubique a sus pasajeros en otro.
Se ocupar�n los asientos libres en el vuelo sustituto. Se comprobar� que ambos vuelos realicen el mismo recorrido.
Se borrar�n todos los pasajes y las tarjetas de embarque y se generar�n nuevos pasajes.
No se generar�n nuevas tarjetas de embarque.
El vuelo a cancelar y el sustituto se pasar�n como par�metros.
Si no se pasa el vuelo sustituto, se buscar� el primer vuelo inmediatamente posterior al cancelado que realice el mismo recorrido.*/

--Ejercicio 6
/*Escribe un procedimiento al que se pase como par�metros un c�digo de un avi�n y un momento (dato fecha-hora) y nos escriba un mensaje que indique d�nde se encontraba ese avi�n en ese momento.
El mensaje puede ser "En vuelo entre los aeropuertos de NombreAeropuertoSalida y NombreaeropuertoLlegada� si el avi�n estaba volando en ese momento, o "En tierra en el aeropuerto NombreAeropuerto� si no est� volando.
Para saber en qu� aeropuerto se encuentra el avi�n debemos consultar el �ltimo vuelo que realiz� antes del momento indicado.
Si se omite el segundo par�metro, se tomar� el momento actual.*/