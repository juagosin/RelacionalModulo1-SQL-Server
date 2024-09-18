# RelacionalModulo1-SQL-Server

Introducción
El laboratorio de este módulo se compone de 3 bloques:

Básico 1: Restaurar una BBDD y crear una serie de consultas para recuperar información
Básico 2: Modelado relacional.
Extra (opcional): Crear la estructura del modelado anterior en un proyecto de base de datos. Crear perfiles de publicación para diferentes entornos.
Básico 1
Vamos a restaurar la base de datos de LemonMusic, una plataforma musical con información sobre canciones, playlists, artistas, etc.

Para restaurar la base de datos puedes utilizar uno de los siguientes métodos:

Lanzar el siguiente script desde SQL Server Management / Azure Data Studio (creará la base de datos, tablas y datos): Create LemonMusic database.sql
Restaurar a partir del siguiente backup: LemonMusic.bak
Consultas
Crear un fichero consultas.script.sql y resolver las siguientes consultas (copiar el enunciado de la consulta como comentario sobre la SELECT):

Listar las pistas (tabla Track) con precio mayor o igual a 1€
Listar las pistas de más de 4 minutos de duración
Listar las pistas que tengan entre 2 y 3 minutos de duración
Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
Calcular la media de duración de las pistas (Track) de la plataforma
Listar los clientes (tabla Customer) de USA, Canada y Brazil
Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')
Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
Listar las pistas de la playlist 'Heavy Metal Classic'
Listar las playlist junto con el número de pistas que contienen
Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
Listar las pistas que no están en ninguna playlist
Listar los artistas que no tienen album
Listar los artistas con el número de albums que tienen
Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums
Extras (opcional)
Crear un fichero consultas-extra.script.sql y resolver las siguientes consultas (copiar el enunciado de la consulta como comentario sobre la SELECT):

Listar las pistas ordenadas por el número de veces que aparecen en playlists de forma descendente
Listar las pistas más compradas (la tabla InvoiceLine tiene los registros de compras)
Listar los artistas más comprados
Listar las pistas que aún no han sido compradas por nadie
Listar los artistas que aún no han vendido ninguna pista