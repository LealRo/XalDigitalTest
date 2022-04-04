Use aerolinea; -- Para comenzar a trabajar en dicha Bd.

-- Tabla temporal, misma información que tabla "vuelos" sustituyendo id por nombres. 
-- Nos ayuda a evitar utilizar JOINS para futuras consultas. 

DROP TEMPORARY TABLE IF EXISTS mis_vuelos; -- En caso de existir la tabla eliminamos.

-- Se indican los campos que desea conservar.
CREATE TEMPORARY TABLE mis_vuelos SELECT 	aerolineas.nombre_aerolinea AS 'Aerolinea', 
											aeropuertos.nombre_aerolinea AS 'Aeropuerto', 
											movimientos.descripcion AS 'Movimiento', 
											vuelos.dia
	FROM vuelos INNER JOIN aeropuertos ON vuelos.id_aeropuerto = aeropuertos.id_aeropuerto 
				INNER JOIN aerolineas ON vuelos.id_aerolinea = aerolineas.id_aerolinea
                INNER JOIN movimientos ON vuelos.id_movimiento = movimientos.id_movimiento;
                
-- Vista de la nueva tabla temporal.
SELECT * FROM mis_vuelos;

-- P1. Nombre del aeropuerto que ha tenido mayor movimiento durante el año.
SELECT Aeropuerto, COUNT(Aeropuerto) AS 'Movimientos'-- Lista de Aeropuertos con sus respectivos movimientos.
	FROM mis_vuelos
		GROUP BY Aeropuerto
        ORDER BY Movimientos DESC;
        
-- De esta manera muestra unicamente los mayores, en este caso son dos con el mismo valor
SELECT Aeropuerto 
	FROM mis_vuelos
		GROUP BY Aeropuerto
		HAVING COUNT(*) = ( SELECT MAX(contador) AS 'Movimientos'
								FROM ( SELECT id_aeropuerto, COUNT(*) contador
										FROM vuelos
										GROUP BY id_aeropuerto
								) Q1
		) ;
 
 
 
-- P2. Nombre de aerolinea que ha realizado mayor número de vuelos durante el año.

SELECT Aerolinea, COUNT(Aerolinea) AS 'Vuelos'-- Lista de Aerolineas y sus respectivos vuelos.
	FROM mis_vuelos
		GROUP BY Aerolinea
        ORDER BY Vuelos DESC;

-- De esta manera muestra unicamente el mayore, en este caso son dos con el mismo valor
SELECT Aerolinea
	FROM mis_vuelos
		GROUP BY Aerolinea
		HAVING COUNT(*) = ( SELECT MAX(contador) 
								FROM ( SELECT id_aerolinea, COUNT(*) contador
										FROM vuelos
										GROUP BY id_aerolinea
								) Q2
		) ;
 
-- P3. Dia que se han tenido mayor número de vuelos.
SELECT dia, COUNT(dia) AS 'Vuelos'
	FROM mis_vuelos
		GROUP BY dia
        ORDER BY Vuelos DESC;
        -- LIMIT 1;
-- De esta manera muestra unicamente el mayor.
SELECT dia
	FROM mis_vuelos
		GROUP BY dia
		HAVING COUNT(*) = ( SELECT MAX(contador) 
								FROM ( SELECT dia, COUNT(*) contador
										FROM vuelos
										GROUP BY dia
								) Q3
		) ;
    
-- Aerolineas que tienen mas de 2 vuelos por dia
SELECT dia, Aerolinea, COUNT(*) AS 'Vuelos'
	FROM mis_vuelos u 
		GROUP BY dia, aerolinea
		HAVING COUNT(*)>2;
        

    
   



		
