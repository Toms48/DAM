
SELECT ID,Palabra
  FROM Palabras
  WHERE Palabra LIKE 'p[ai]%'

SELECT ID,Palabra
  FROM Palabras
  WHERE LEFT (Palabra,2) IN ('pa', 'pi')

-- Usamos un SELECT para insertar filas
-- Antes
SELECT ID,Palabra
  FROM Palabras2
  WHERE LEFT (Palabra,2) IN ('pa', 'pi')

-- Insertamos
INSERT INTO Palabras2 (Palabra)
	SELECT Palabra -- Quitamos el ID
	  FROM Palabras
	  WHERE LEFT (Palabra,2) IN ('pa', 'pi')

-- Después
SELECT ID,Palabra
  FROM Palabras2
  WHERE LEFT (Palabra,2) IN ('pa', 'pi')

-- Ahora con INTO y una tabla temporal
SELECT  ID AS Identificador,Palabra As contenido INTO #Palabrillas
  FROM Palabras2
  WHERE LEFT (Palabra,2) IN ('pa', 'pi')

-- Esta tabla está en tempdb (Base de datos del sistema) y solo es accesible desde la conexión que la ha creado
SELECT * FROM #Palabrillas