CREATE DATABASE RETO1
go
Use RETO1
go
create TABLE t(Numbers INT)
INSERT INTO t
SELECT 10 UNION ALL
SELECT 12 UNION ALL
SELECT 19 UNION ALL
SELECT 25 UNION ALL
SELECT 25 UNION ALL
SELECT 34 UNION ALL
SELECT 38

--SELECCIONA LA FILA MAS CERCANA 
select top 1 * from t  ORDER BY ABS(Numbers-11)