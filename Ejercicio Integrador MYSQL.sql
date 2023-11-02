USE nba;

/* CANDADO A */

#Posición = 2

SELECT COUNT(Asistencias_por_partido)
FROM estadisticas
WHERE Asistencias_por_partido = (
		SELECT MAX(Asistencias_por_partido)
		FROM estadisticas);
        
#Clave = 14043

SELECT SUM(peso)
FROM jugadores j
INNER JOIN equipos e ON j.Nombre_equipo = e.Nombre
WHERE j.posicion LIKE '%C%' AND e.Conferencia = 'East';

/*CANDADO B */

#Posición = 3

SELECT COUNT(jugador)
FROM estadisticas e
INNER JOIN jugadores j ON e.jugador = j.codigo
WHERE e.asistencias_por_partido > (
	SELECT COUNT(codigo)
    FROM jugadores j
    WHERE Nombre_equipo = 'Heat');
    
#Clave = 3480

SELECT COUNT(codigo)
FROM partidos
WHERE temporada LIKE '%99%';

/* CANDADO C */

#Posicion = 1

SELECT ROUND(((COUNT(codigo) / (
    SELECT COUNT(codigo)
	FROM jugadores
	WHERE peso >= 195)) + 0.9945))
FROM jugadores j
INNER JOIN equipos e ON j.Nombre_equipo = e.Nombre
WHERE Procedencia = 'Michigan' AND e.Conferencia = 'West';

#Clave = 631

SELECT FLOOR(AVG(Puntos_por_partido)+COUNT(Asistencias_por_partido)+SUM(Tapones_por_partido))
FROM estadisticas e
INNER JOIN jugadores j ON e.jugador=j.codigo
INNER JOIN equipos eq ON j.Nombre_equipo = eq.Nombre
WHERE division='Central';

/* CANDADO D */

#Posición = 4

SELECT ROUND(Tapones_por_partido)
FROM estadisticas e
JOIN jugadores j ON e.Jugador = j.codigo
WHERE j.Nombre='Corey Maggette' AND e.temporada='00/01';

#Clave = 191

SELECT FLOOR(SUM(Puntos_por_partido))
FROM estadisticas e
INNER JOIN jugadores j ON e.Jugador=j.codigo
WHERE j.Procedencia='Argentina';