/*Question 6*/
SELECT ar.name AS "artist_name",COUNT(*) AS "num_tracks"
    FROM track t
    JOIN album al ON t.albumid = al.albumid
    JOIN artist ar ON al.artistid = ar.artistid
GROUP BY "artist_name"
    HAVING COUNT(t.name) > 50 AND NOT LOWER(ar.name) IN ('various artists','the office','lost')
ORDER BY "num_tracks" DESC, "artist_name";
 
/*Question 7*/ 
SELECT al.title AS "album_title",ar.name AS "artist_name",t.name AS "track_name",mt.name AS "media_type",'$'|| t.unitprice AS "unit_price"
  FROM Track t 
  JOIN Album al ON t.albumid = al.albumid 
  JOIN Artist ar ON al.artistid = ar.artistid 
  JOIN MediaType mt ON t.mediatypeid = mt.mediatypeid 
WHERE
  CASE
    WHEN LOWER(mt.name) LIKE '%audio%' AND t.unitprice != 0.99 THEN TRUE
    WHEN LOWER(mt.name) LIKE '%video%' AND t.unitprice != 1.99 THEN TRUE
  END
ORDER BY t.trackid;
