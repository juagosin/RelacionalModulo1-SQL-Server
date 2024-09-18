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