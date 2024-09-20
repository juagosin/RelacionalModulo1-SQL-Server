--Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT  [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]

  where UnitPrice>=1

  --Listar las pistas de más de 4 minutos de duración ( 1 seg == 1000 milisegundos, 1 minuto == 60000, 4 minutos = 240000)
    SELECT  [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]

  where Milliseconds>240000

  --Listar las pistas que tengan entre 2 y 3 minutos de duración
      SELECT  [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]

  where Milliseconds between 120000 and 180000

  --Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
       SELECT  [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]

  where Composer like '%Mercury%'

  --Calcular la media de duración de las pistas (Track) de la plataforma
        SELECT  
      avg([Milliseconds]) as mediaMilisegundos    
  FROM [LemonMusic].[dbo].[Track]


--Listar los clientes (tabla Customer) de USA, Canada y Brazil
SELECT [CustomerId]
      ,[FirstName]
      ,[LastName]
      ,[Company]
      ,[Address]
      ,[City]
      ,[State]
      ,[Country]
      ,[PostalCode]
      ,[Phone]
      ,[Fax]
      ,[Email]
      ,[SupportRepId]
  FROM [LemonMusic].[dbo].[Customer]

  where Country in ('USA', 'Canada' , 'Brazil')

--Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen') 
--He puesto like en vez de = porque no se si queríais que tambien salieran las colaboraciones por ejemplo la que está con Bowie. Si solo queréis que salgan exclusivamente las de Queen sería poniento un Composer = 'Queen'
  SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]
  where Composer like '%Queen%'

  --Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
  SELECT  [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[MediaTypeId]
      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
      ,[Bytes]
      ,[UnitPrice]
  FROM [LemonMusic].[dbo].[Track]
  where Composer = 'Queen & David Bowie'

  --Listar las pistas de la playlist 'Heavy Metal Classic'
  /*Vemos que la play list indicada es la número 17*/
   Select Track.TrackId,Name, Composer from Track inner join
  PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId where PlaylistId = 17

  --Listar las playlist junto con el número de pistas que contienen
SELECT P.[PlaylistId]
      ,P.[Name],
	  count(PL.TrackId) as TrackNumber
  FROM [LemonMusic].[dbo].[Playlist] as P

  inner join   [LemonMusic].[dbo].[PlaylistTrack] as PL
  on P.PlaylistId = PL.PlaylistId

  group by   P.[PlaylistId],P.[Name]
  --Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT 
      Distinct(P.[Name])
	  
  FROM [LemonMusic].[dbo].[Playlist] as P

  inner join   [LemonMusic].[dbo].[PlaylistTrack] as PL
  on P.PlaylistId = PL.PlaylistId
  inner join  [LemonMusic].[dbo].[Track] as T
  on PL.TrackId = T.TrackId
  where T.Composer = 'AC/DC'
  group by  P.[Name]
  --Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT 
      Distinct(P.[Name]),
	  Count(T.TrackId) as Cuantas
	  
  FROM [LemonMusic].[dbo].[Playlist] as P

  inner join   [LemonMusic].[dbo].[PlaylistTrack] as PL
  on P.PlaylistId = PL.PlaylistId
  inner join  [LemonMusic].[dbo].[Track] as T
  on PL.TrackId = T.TrackId
  where T.Composer like '%Queen%'
  group by  P.[Name]
  --Listar las pistas que no están en ninguna playlist
 SELECT T.*
FROM [LemonMusic].[dbo].[Track] as T
LEFT JOIN [LemonMusic].[dbo].[PlaylistTrack] as PL ON T.TrackId = PL.TrackId
WHERE PL.TrackId IS NULL;
  --Listar los artistas que no tienen album
	SELECT  A.*
	FROM [LemonMusic].[dbo].Artist  as A
	LEFT JOIN [LemonMusic].[dbo].Album as AL ON A.ArtistId = AL.ArtistId
WHERE AL.ArtistId IS NULL;
  /*Listar los artistas con el número de albums que tienen
Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums*/
	SELECT  A.Name, Count(AL.AlbumId)
	FROM [LemonMusic].[dbo].Artist  as A
	LEFT JOIN [LemonMusic].[dbo].Album as AL ON A.ArtistId = AL.ArtistId
	GROUP BY A.Name