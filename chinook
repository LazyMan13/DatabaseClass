


SELECT a.name AS artist_name,
        count(track.name) AS num_tracks
  FROM track
INNER JOIN
  (SELECT artist.artistid ,
          artist.name,
          albumid
    FROM artist
    INNER JOIN album
    ON artist.artistid = album.albumid) AS a
    ON track.albumid = a.albumid
GROUP BY a.name
HAVING num_tracks > 50
ORDER BY num_tracks, artist_name


SELECT albumid AS album
  FROM track


SELECT firstname, lastname, RIGHT(phone,4) AS phone
  FROM customer;

SELECT firstname, lastname, SUBSTR(phone,length(phone)-3) AS phone
  FROM customer;

SELECT name, '$' || trunc(unitprice * 1.25,2) AS Increased_Price
  FROM track;

SELECT '$' || ROUND(AVG(unitprice),2) AS avg_price
  FROM track;

SELECT MIN(unitprice),MAX(unitprice)
  FROM track;

SELECT count(trackid)
  FROM track
WHERE mediatypeid <> 3;

SELECT 'MUSIC ' || COUNT(*) AS "Total Music Tracks"
  FROM track t JOIN mediatype m
  ON (t.mediatypeid = m.mediatypeid)
  WHERE m.mediatypeid IN
  (SELECT mediatypeid FROM mediatype WHERE UPPER(name) LIKE '%AUDIO%');

SELECT count(trackid)
  FROM track
WHERE mediatypeid = 3;

SELECT 'VIDEO ' || COUNT(*) AS "Total Video Tracks"
  FROM track t JOIN mediatype m
  ON (t.mediatypeid = m.mediatypeid)
  WHERE m.mediatypeid IN
  (SELECT mediatypeid FROM mediatype WHERE UPPER(name) LIKE '%VIDEO%');


SELECT t.name AS "Title Name", g.name AS "Genre Name", '$' ||
  CASE
    WHEN UPPER(g.name) LIKE 'ROCK' THEN TRUNC(t.unitprice * 1.3, 2)
    WHEN UPPER(g.name) LIKE 'OPERA' THEN TRUNC(t.unitprice * 1.1, 2)
    WHEN UPPER(g.name) LIKE 'METAL' THEN TRUNC(t.unitprice * 1.25, 2)
    WHEN UPPER(g.name) LIKE 'BLUES' THEN TRUNC(t.unitprice * 1.5, 2)
    ELSE TRUNC(t.unitprice, 2)
  END AS new_price
  FROM track t JOIN genre g
  ON (t.genreid = g.genreid)
ORDER BY "Genre Name";

